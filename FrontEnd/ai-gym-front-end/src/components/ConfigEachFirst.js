import React from 'react';
import { useDispatch } from 'react-redux';
import { Link } from 'react-router-dom';

function ConfigEachFirst() {
    return (
        <div>
            <p>개별 운동 설정</p>
            <button>팔굽혀펴기</button>
            <button>윗몸일으키기</button>
            <button>런지</button>
            <button>스쿼트</button>
            <Link to='/configEachSecond'>
                <button>확인</button>
            </Link>
        </div>
    )
}

export default ConfigEachFirst