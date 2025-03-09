import Head from 'next/head';
import { motion } from 'framer-motion';
import Header from '../components/Header';
import FocusTimer from '../components/FocusTimer';
import AIChat from '../components/AIChat';

export default function Home() {
  return (
    <div className="min-h-screen bg-gray-900 text-white">
      <Head>
        <title>FocusAI</title>
      </Head>
      <Header />
      <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} className="container mx-auto p-4">
        <FocusTimer />
        <AIChat />
      </motion.div>
    </div>
  );
}
