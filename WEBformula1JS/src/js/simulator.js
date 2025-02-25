// Конфигурация Phaser
var config = {
    type: Phaser.AUTO,
    width: 800,
    height: 600,
    parent: 'game-container',
    scene: {
        preload: preload,
        create: create,
        update: update
    },
    physics: {
        default: 'arcade',
        arcade: {
            gravity: { y: 0 },
            debug: false
        }
    }
};

// Создание игры
var game = new Phaser.Game(config);

// Переменные игры
var car;
var obstacles;
var bonuses;
var score = 0;
var lives = 3;
var scoreText;
var livesText;
var speed = 250;  // Начальная скорость машины
var obstacleSpeed = 200; // Скорость падения препятствий
var lastObstacleTime = 0; // Время последнего появления препятствия
var lastBonusTime = 0; // Время последнего появления бонуса
var gameStarted = false;
var startButton;

// Функция загрузки ресурсов
function preload() {
    this.load.image('car', '/src/sets/Formula 1 car red.png');
    this.load.image('track', '/src/sets/Toon Road Texture.png');
}

// Функция создания игры
function create() {
    // Добавляем фон
    this.add.image(400, 300, 'track');

    // Кнопка Start
    startButton = this.add.text(350, 250, 'Start Game', {
        fontSize: '32px',
        fill: '#fff',
        backgroundColor: '#000',
        padding: { x: 10, y: 10 }
    }).setInteractive();

    startButton.on('pointerdown', startGame, this);

    // Текст счета
    scoreText = this.add.text(16, 16, 'Score: 0', { fontSize: '32px', fill: '#fff' });

    // Текст жизней
    livesText = this.add.text(650, 16, 'Lives: 3', { fontSize: '32px', fill: '#fff' });
}

// Функция начала игры
function startGame() {
    startButton.setVisible(false);

    // Создаем машину
    car = this.physics.add.image(400, 500, 'car');
    car.setCollideWorldBounds(true);
    car.setScale(0.15);

    // Управление
    this.cursors = this.input.keyboard.createCursorKeys();

    // Группы препятствий и бонусов
    obstacles = this.physics.add.group();
    bonuses = this.physics.add.group();

    // Столкновения
    this.physics.add.collider(car, obstacles, hitObstacle, null, this);
    this.physics.add.overlap(car, bonuses, collectBonus, null, this);

    // Ускорение игры со временем
    this.time.addEvent({
        delay: 1000, 
        callback: updateGameSpeed, 
        callbackScope: this,
        loop: true
    });

    gameStarted = true;
}

// Функция столкновения с препятствием
function hitObstacle(car, obstacle) {
    score -= 10;
    lives -= 1;
    obstacle.destroy();

    car.setPosition(400, 500);

    if (lives <= 0) {
        endGame();
    }

    scoreText.setText('Score: ' + score);
    livesText.setText('Lives: ' + lives);
}

// Функция сбора бонусов
function collectBonus(car, bonus) {
    score += 10;
    bonus.destroy();

    scoreText.setText('Score: ' + score);
}

// Увеличение скорости игры
function updateGameSpeed() {
    if (score >= 50 && score < 600) {
        obstacleSpeed = 200 + (Math.floor(score / 50) * 0.5); // Увеличиваем скорость на 0.5 каждые 50 очков
    } else if (score >= 600 && score < 700) {
        obstacleSpeed = 400; // Удваиваем скорость при достижении 600
    } else if (score >= 700 && score < 800) {
        obstacleSpeed = 800; // Удваиваем скорость при достижении 700
    } else if (score >= 800) {
        obstacleSpeed = 1600; // Удваиваем скорость при достижении 800
    }
}

// Основной игровой цикл
function update() {
    if (!gameStarted) return;

    // Управление машиной
    if (this.cursors.left.isDown) {
        car.setVelocityX(-speed); 
    } else if (this.cursors.right.isDown) {
        car.setVelocityX(speed); 
    } else {
        car.setVelocityX(0); 
    }

    if (this.cursors.up.isDown) {
        car.setVelocityY(-speed); 
    } else if (this.cursors.down.isDown) {
        car.setVelocityY(speed); 
    } else {
        car.setVelocityY(0); 
    }

    // Генерация препятствий
    if (this.time.now - lastObstacleTime > Phaser.Math.Between(1500, 2500)) {
        var newObstacle = obstacles.create(Phaser.Math.Between(100, 700), 0, 'obstacle');
        newObstacle.setScale(0.3);
        newObstacle.setVelocityY(obstacleSpeed);
        newObstacle.setTint(0xff0000); // Красный цвет для препятствия
        lastObstacleTime = this.time.now;
    }

    // Генерация бонусов
    if (this.time.now - lastBonusTime > Phaser.Math.Between(5000, 7000)) {
        var newBonus = bonuses.create(Phaser.Math.Between(100, 700), 0, 'bonus');
        newBonus.setDisplaySize(50, 50); // Размер бонуса
        newBonus.setVelocityY(250);
        newBonus.setTint(0x00ff00); // Ярко зеленый цвет для бонуса
        lastBonusTime = this.time.now;
    }
}

// Завершение игры
function endGame() {
    gameStarted = false;
    obstacles.clear(true, true);
    bonuses.clear(true, true);
    car.setPosition(400, 500);
    car.setVelocity(0, 0);
    scoreText.setText('Game Over! Final Score: ' + score);
    livesText.setText('Lives: 0');
    startButton.setVisible(true);
}
