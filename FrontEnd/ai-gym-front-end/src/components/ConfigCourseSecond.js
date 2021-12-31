import React from 'react';
import { Link } from 'react-router-dom';

function ConfigCourseSecond() {
    return (
        <div>
            <p>팔굽혀펴기</p>
            <input type="number"></input>
            <p>윗몸일으키기</p>
            <input type="number"></input>
            <p>런지</p>
            <input type="number"></input>
            <p>스쿼트</p>
            <input type="number"></input>
            <Link to='/exerciseStart'>
                <button>확인</button>
            </Link>
        </div>
    )
}

export default ConfigCourseSecond