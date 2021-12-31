import React, { useCallback, useEffect, useRef, useState } from 'react';
import Webcam from 'react-webcam';

const videoConstraints = {
    width: 800,
    height: 450,
    facingMode: "user"
}

function ExerciseScreen() {
    const webcamRef = useRef(null)
    //imgSrc에 png 데이터가 들어간다.
    const [imgSrc, setImgSrc] = useState(null)

    //이미지를 캡처하는 함수.
    const capture = useCallback(
        () => {
            const imageSrc = webcamRef.current.getScreenshot()
            setImgSrc(imageSrc)
        },
        [webcamRef, setImgSrc]
    )

    useEffect(() => {
        capture()
        console.log(imgSrc)
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