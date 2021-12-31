import React from 'react';
import { Routes, Route } from 'react-router-dom';
import './App.css';
import ConfigCourseFirst from './components/ConfigCourseFirst';
import ConfigCourseSecond from './components/ConfigCourseSecond';
import ConfigEachFirst from './components/ConfigEachFirst';
import ConfigEachSecond from './components/ConfigEachSecond';
import ExerciseStart from './components/ExerciseStart';
import Home from './components/Home';


function App() {
  return (
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="configEachFirst" element={<ConfigEachFirst />} />
      <Route path="configCourseFirst" element={<ConfigCourseFirst />} />
      <Route path="configEachSecond" element={<ConfigEachSecond />} />
      <Route path="configCourseSecond" element={<ConfigCourseSecond />} />
      <Route path="exerciseStart" element={<ExerciseStart />} />
      <Route path="start" element={<ExerciseStart />} />
    </Routes>
    
  );
}

export default App;
