document.addEventListener("DOMContentLoaded", function () {
    const faqItems = document.querySelectorAll('.faq-item');
  
    faqItems.forEach(item => {
      const question = item.querySelector('.faq-question');
      question.addEventListener('click', () => {
        // Закрытие всех других вопросов
        faqItems.forEach(innerItem => {
          if (innerItem !== item) {
            innerItem.classList.remove('active');
          }
        });
  
        // Переключение активного состояния
        item.classList.toggle('active');
      });
    });
  });
  