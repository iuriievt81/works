// Phaser
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


var game = new Phaser.Game(config);

// settings game
var car;
var obstacles;
var bonuses;
var score = 0;
var lives = 3;
var scoreText;
var livesText;
var speed = 250;  
var obstacleSpeed = 200; 
var lastObstacleTime = 0; 
var lastBonusTime = 0; 
var gameStarted = false;
var startButton;


function preload() {
    this.load.image('car', '/src/sets/Formula 1 car red.png');
    this.load.image('track', '/src/sets/Toon Road Texture.png');
}


function create() {
    
    this.add.image(400, 300, 'track');

    
    startButton = this.add.text(350, 250, 'Start Game', {
        fontSize: '32px',
        fill: '#fff',
        backgroundColor: '#000',
        padding: { x: 10, y: 10 }
    }).setInteractive();

    startButton.on('pointerdown', startGame, this);

    
    scoreText = this.add.text(16, 16, 'Score: 0', { fontSize: '32px', fill: '#fff' });

    
    livesText = this.add.text(650, 16, 'Lives: 3', { fontSize: '32px', fill: '#fff' });
}


function startGame() {
    startButton.setVisible(false);

    
    car = this.physics.add.image(400, 500, 'car');
    car.setCollideWorldBounds(true);
    car.setScale(0.15);

   
    this.cursors = this.input.keyboard.createCursorKeys();

    
    obstacles = this.physics.add.group();
    bonuses = this.physics.add.group();

    
    this.physics.add.collider(car, obstacles, hitObstacle, null, this);
    this.physics.add.overlap(car, bonuses, collectBonus, null, this);

    
    this.time.addEvent({
        delay: 1000, 
        callback: updateGameSpeed, 
        callbackScope: this,
        loop: true
    });

    gameStarted = true;
}


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


function collectBonus(car, bonus) {
    score += 10;
    bonus.destroy();

    scoreText.setText('Score: ' + score);
}


function updateGameSpeed() {
    if (score >= 50 && score < 600) {
        obstacleSpeed = 200 + (Math.floor(score / 50) * 0.5); 
    } else if (score >= 600 && score < 700) {
        obstacleSpeed = 400; 
    } else if (score >= 700 && score < 800) {
        obstacleSpeed = 800; 
    } else if (score >= 800) {
        obstacleSpeed = 1600; 
    }
}


function update() {
    if (!gameStarted) return;

   
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

    
    if (this.time.now - lastObstacleTime > Phaser.Math.Between(1500, 2500)) {
        var newObstacle = obstacles.create(Phaser.Math.Between(100, 700), 0, 'obstacle');
        newObstacle.setScale(0.3);
        newObstacle.setVelocityY(obstacleSpeed);
        newObstacle.setTint(0xff0000); 
        lastObstacleTime = this.time.now;
    }

   
    if (this.time.now - lastBonusTime > Phaser.Math.Between(5000, 7000)) {
        var newBonus = bonuses.create(Phaser.Math.Between(100, 700), 0, 'bonus');
        newBonus.setDisplaySize(50, 50); 
        newBonus.setVelocityY(250);
        newBonus.setTint(0x00ff00); 
        lastBonusTime = this.time.now;
    }
}


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
