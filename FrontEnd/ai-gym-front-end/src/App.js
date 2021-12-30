import React from 'react';
import { Routes, Route } from 'react-router-dom';
import './App.css';
import ExerciseStart from './components/ExerciseStart';
import Home from './components/Home';

function App() {
  return (
    
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="start" element={<ExerciseStart />} />
    </Routes>
    
  );
}

export default App;
