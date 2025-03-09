import { useState } from 'react';

export default function AIChat() {
  const [input, setInput] = useState("");
  const [messages, setMessages] = useState([]);

  const sendMessage = async () => {
    if (!input.trim()) return;
    setMessages([...messages, { text: input, user: true }]);
    setInput("");
    
    // Запрос к AI API (заглушка)
    setTimeout(() => {
      setMessages([...messages, { text: input, user: true }, { text: "Это заглушка ответа AI", user: false }]);
    }, 1000);
  };

  return (
    <div className="p-4 border-t border-gray-700">
      <h2 className="text-xl mb-2">AI Чат</h2>
      <div className="h-40 overflow-auto border border-gray-600 p-2">
        {messages.map((msg, i) => (
          <p key={i} className={msg.user ? "text-right text-blue-400" : "text-left text-green-400"}>{msg.text}</p>
        ))}
      </div>
      <input
        value={input}
        onChange={(e) => setInput(e.target.value)}
        className="w-full p-2 mt-2 border border-gray-600"
        placeholder="Задай вопрос AI..."
      />
      <button onClick={sendMessage} className="bg-green-500 px-4 py-2 mt-2 rounded">Отправить</button>
    </div>
  );
}
