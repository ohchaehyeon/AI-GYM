import React from 'react';
import { useDispatch } from 'react-redux';
import { Link } from 'react-router-dom';

function ConfigCourseFirst() {
    return (
        <div>
            <p>코스 운동 설정</p>
            <button>초급</button>
            <button>중급</button>
            <button>고급</button>
            <button>사용자 지정</button>
            <Link to='/configCourseSecond'>
                <button>확인</button>
            </Link>
        </div>
    )
}

export default ConfigCourseFirst