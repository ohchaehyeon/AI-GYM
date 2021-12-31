import React from 'react';
import { useDispatch } from 'react-redux';
import { Link } from 'react-router-dom';
import { configCourseExercise, configEachExercise } from '../features/configure/configureSlice';

function Home() {
    const dispatch = useDispatch()

    let b1_text = "개별 운동"
    let b2_text = "코스 운동"

    const setConfigEachExercise = () => {
        dispatch(configEachExercise())
    }

    const setConfigCourseExercise = () => {
        dispatch(configCourseExercise())
    }

    return (
        <div>
            <p>AI-GYM</p>
            <Link to='/configEachFirst'>
                <button onClick={setConfigEachExercise}>{b1_text}</button>
            </Link>
            <Link to='/configCourseFirst'>
                <button onClick={setConfigCourseExercise}>{b2_text}</button>
            </Link>
        </div>
    )
}

export default Home;