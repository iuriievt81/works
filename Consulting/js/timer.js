// Устанавливаем дату и время запуска
var launchDate = new Date("June 30, 2025 00:00:00").getTime();

// Обновляем таймер каждую секунду
var x = setInterval(function() {
  var now = new Date().getTime();
  var distance = launchDate - now;

  // Вычисляем время до запуска
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Отображаем результаты на странице
  document.getElementById("days").innerHTML = days;
  document.getElementById("hours").innerHTML = hours;
  document.getElementById("minutes").innerHTML = minutes;
  document.getElementById("seconds").innerHTML = seconds;

  // Если время вышло, показываем сообщение
  if (distance < 0) {
    clearInterval(x);
    document.querySelector(".coming-soon-content").innerHTML = "<h1>We are live now!</h1>";
  }
}, 1000);

