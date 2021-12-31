import React, { useCallback, useEffect, useRef, useState } from 'react';
import Webcam from 'react-webcam';

const videoConstraints = {
    width: 800,
    height: 450,
    facingMode: "user"
}

function ExerciseScreen() {
    const webcamRef = useRef(null)

    useEffect(() => {
        setInterval(() => {
            //스크린샷을 찍어서 imageSrc에 저장한다.
            const imageSrc = webcamRef.current.getScreenshot()
            console.log(imageSrc)
        }, 500)
    })

    return (
        <div>
            <Webcam
                audio={false}
                width={800}
                height={450}
                ref={webcamRef}
                screenshotFormat='image/png'
                videoConstraints={videoConstraints}
            />
        </div>
    )
}

export default ExerciseScreen;