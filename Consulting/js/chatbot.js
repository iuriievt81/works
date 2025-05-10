window.addEventListener("DOMContentLoaded", () => {
    setTimeout(() => {
      document.getElementById("chatbot-popup").classList.add("visible");
    }, 3000);
  });
  
  function openChat() {
    document.getElementById("chatbot-popup").classList.add("visible");
  }
  
  function closeChat() {
    document.getElementById("chatbot-popup").classList.remove("visible");
  }
  
  document.getElementById("open-chat-btn").addEventListener("click", openChat);
  document.getElementById("close-chat-btn").addEventListener("click", closeChat);
  