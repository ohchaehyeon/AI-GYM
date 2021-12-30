import React from 'react';
import { Link } from 'react-router-dom';

function Home() {
    let b1_text = "운동 종류 선택"
    let b2_text = "목표 설정"
    let b3_text = "운동 코스"
    let b4_text = "운동 시작"
    return (
        <div>
            <p>AI-GYM</p>
            <button>{b1_text}</button>
            <button>{b2_text}</button>
            <button>{b3_text}</button>
            <Link to="/start">
                <button>{b4_text}</button>
            </Link>
        </div>
    )
}

export default Home;