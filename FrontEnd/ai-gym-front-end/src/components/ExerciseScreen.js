import React, { useCallback, useEffect, useRef, useState } from 'react';
import Webcam from 'react-webcam';
import PoseNet from 'react-posenet'
import * as tf from '@tensorflow/tfjs';
import { randomUniform } from '@tensorflow/tfjs';


const videoConstraints = {
    width: 800,
    height: 450,
    facingMode: "user"
}

function ExerciseScreen() {
    let net;
    const webcamRef = useRef(null);
    const webcamElement = webcamRef.current;

    const run = async () =>{

        net = await tf.loadLayersModel('http://localhost:8080/model/load');
        const webcam = await tf.data.webcam(webcamElement, {
            resizeWidth: 220,
            resizeHeight: 227,
          });
          while(true){
              let img = await webcam.capture();
            //   img = tf.expandDims(img,1);
            const net = await posenet.load();
              const result = await net.predict(img);
              console.log(result.dataSync);
            //   const result = await net.cl
row = []
tf.tensor(row).reshape
            //   console.log(result);
          }

    }
    // const webcamRef = useRef(null)

    useEffect(() => {
        // setInterval(() => {
        //     //스크린샷을 찍어서 imageSrc에 저장한다.
        //     const imageSrc = webcamRef.current.getScreenshot()
        //     console.log(imageSrc)
        // }, 500)
        run();
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