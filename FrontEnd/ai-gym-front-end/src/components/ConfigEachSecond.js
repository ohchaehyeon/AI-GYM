import React from 'react'
import { Link } from 'react-router-dom'

function ConfigEachSecond() {
    return (
        <div>
            <input type="number"></input>
            <Link to='/exerciseStart'>
                <button>확인</button>
            </Link>
        </div>
    )
}

export default ConfigEachSecond