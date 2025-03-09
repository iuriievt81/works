import { useState } from 'react';

export default function FocusTimer() {
  const [time, setTime] = useState(25 * 60);
  const [running, setRunning] = useState(false);

  return (
    <div className="text-center my-6">
      <h2 className="text-xl">Фокус-сессия</h2>
      <p className="text-4xl my-2">{Math.floor(time / 60)}:{time % 60 < 10 ? `0${time % 60}` : time % 60}</p>
      <button onClick={() => setRunning(!running)} className="bg-blue-500 px-4 py-2 rounded">
        {running ? "Стоп" : "Старт"}
      </button>
    </div>
  );
}
