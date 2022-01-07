<!-- 날짜 : 2022.01.02
	 작성자 : 조진선
	 화면 : webcam 화면구현
     기능 : 운동 선택 시 모델연동 및 모션인식에 따른 카운트 처리 구현
-->
<!-- 날짜 : 2022.01.03
	 작성자 : 오채현
	 화면 : webcam 화면구현
     기능 : 웹캠 화면에 gif 추가
--> 
<!-- 날짜 : 2022.01.04
	 작성자 : 김효석
	 화면 : webcam 사운드 구현
     기능 : 웹캠 화면에 audio 추가
--> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Webcam page</title>
<script src="https://unpkg.com/webcam-easy/dist/webcam-easy.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@3.11.0/dist/tf.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@tensorflow-models/posenet@2.2.2/dist/posenet.min.js"></script>

<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<style>
.our-container{
	display:flex;
	flex-direction: row;
	flex-wrap: nowrap;
	justify-content: space-around;
}
</style>
</head>
<body>
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
			<h2 id=headData
				class="page-section-heading text-center text-uppercase text-secondary mb-0">Sample</h2>
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<div class="row justify-content-center">
				<div class="our-container">
					<img id="gif" src="${gif}" border="0" width="350" height="560" style="padding-top: 330px">
					<video id="webcam" autoplay playsinline width="1000" height="600" style="padding-bottom: 30px;"></video>
				</div>
				<canvas hidden id="canvas" class="d-none"></canvas>
				<audio id="snapSound" preload="auto"></audio>

				<button type="button" class="btn btn-primary btn-xl" id="btn"
					onclick="select()">Back</button>
			</div>
		</div>
	</section>
</body>

<script>
	var nowAction = 'n';
	var headData = document.getElementById("headData");
	var inputCount = '${inputCount}';
	
	window.history.forward();
	function noBack() {
		window.history.forward();
	}

	const gif = document.getElementById("gif");

	const snapBtn = document.getElementById("btn-capture")

    const webcamElement = document.getElementById('webcam');
    const canvasElement = document.getElementById('canvas');
    const snapSoundElement = document.getElementById('snapSound');
    const webcam = new Webcam(webcamElement, 'user', canvasElement, snapSoundElement);
    const context = canvasElement.getContext("2d");
    webcam.start()
    .then(result =>{
       console.log("webcam started");
    })
    .catch(err => {
       console.log(err);
    });
    
	var item ='${item}';
    var data = JSON.parse('${data}');
    console.log(data);
    
    switch(item) {
    //pushup 모델 연동
    case "pushup":
    	document.write('<audio src="assets/sound/pushup.m4a" controls autoplay style="display:none"></audio>');
    	inputCount = parseInt(inputCount) + parseInt(data.pushupCount);
    	changeHeadData(data.pushupCount);
    	const startPushup = async function() {
        const model = await tf.loadLayersModel('./model/'+item+'/model.json'); 
        let img = tf.browser.fromPixels(webcamElement); 

        const picture = webcam.snap();
  	      row = []
  	      posenet.load().then(function (net) {
  	          const pose = net.estimateSinglePose(img, {
  	               flipHorizontal: false
  	           });
  	           return pose;
  	           }).then(function (pose) {
  	        	 for (var i = 0; i < pose.keypoints.length; i++) {
                     row.push(pose.keypoints[i].position.x / canvasElement.width)
                     row.push(pose.keypoints[i].position.y / canvasElement.height)
                     row.push(pose.keypoints[i].score)
                 }
                  row.push(pose.score)
  	                const enc_Data = tf.tensor([row])
  	                model.predict(tf.tensor([row])).array().then(array => {
  	                	var value1 = array[0][0]; //nothing
  	                	var value2 = array[0][1]; //action
  	                	var value3 = array[0][2]; //ready
  	                	
  	                	var arr = [value1, value2, value3];
						console.log(arr[0] +' '+  arr[1] + ' '+ arr[2])
  	                	
  	                	if(value2 > value1 && value2 > value3){
  	                		checkAction('a');
  	                	}else {
  	                		checkAction('r');
  	                	} 
  	                })
  	           })
  	           setTimeout(startPushup,2000); 
  	      }
    	setTimeout(startPushup,3000);
		break;
    //squat 모델 연동
    case "squat":
    	document.write('<audio src="assets/sound/squat.m4a" controls autoplay style="display:none"></audio>');
    	inputCount = parseInt(inputCount) + parseInt(data.squatCount);
    	changeHeadData(data.squatCount);
    	const startSquat = async function() {
        const model = await tf.loadLayersModel('./model/'+item+'/model.json'); 
        let img = tf.browser.fromPixels(webcamElement); 

        const picture = webcam.snap();
  	      row = []
  	      posenet.load().then(function (net) {
  	          const pose = net.estimateSinglePose(img, {
  	               flipHorizontal: false
  	           });
  	           return pose;
  	           }).then(function (pose) {
  	        	 for (var i = 0; i < pose.keypoints.length; i++) {
  	        		 row.push(pose.keypoints[i].position.x / canvasElement.width)
                     row.push(pose.keypoints[i].position.y / canvasElement.height)
                     row.push(pose.keypoints[i].score)
                 }
                  row.push(pose.score)
  	                const enc_Data = tf.tensor([row])
  	                model.predict(tf.tensor([row])).array().then(array => {
  	                	var value1 = array[0][0]; //nothing
  	                	var value2 = array[0][1]; //action
  	                	var value3 = array[0][2]; //ready
  	                	
  	                	var arr = [value1, value2, value3];
  	                	
  	                	console.log(arr[0] +' '+  arr[1] + ' '+ arr[2])
  	                	
  	                	if(value2 > value1 && value2 > value3){
  	                		checkAction('a');
  	                	}else {
  	                		
  	                		checkAction('r');
  	                	} 
  	                })
  	           })
  	           setTimeout(startSquat,2000); 
  	      }
    	setTimeout(startSquat,3000); 
    	break;
    //steam 모델 연동
    case "steam":
    	document.write('<audio src="assets/sound/steamengine.m4a" controls autoplay style="display:none"></audio>');
    	inputCount = parseInt(inputCount) + parseInt(data.steamCount);
    	changeHeadData(data.steamCount);
    	const startSteam = async function() {
        const model = await tf.loadLayersModel('./model/'+item+'/model.json'); 
        let img = tf.browser.fromPixels(webcamElement); 

        const picture = webcam.snap();
  	      row = []
  	      posenet.load().then(function (net) {
  	          const pose = net.estimateSinglePose(img, {
  	               flipHorizontal: false
  	           });
  	           return pose;
  	           }).then(function (pose) {
  	        	 for (var i = 0; i < pose.keypoints.length; i++) {
  	        		row.push(pose.keypoints[i].position.x / canvasElement.width)
                    row.push(pose.keypoints[i].position.y / canvasElement.height)
                    row.push(pose.keypoints[i].score)
                }
                 row.push(pose.score)
  	                const enc_Data = tf.tensor([row])
  	                model.predict(tf.tensor([row])).array().then(array => {
  	                	var value1 = array[0][0]; //nothing
  	                	var value2 = array[0][1]; //action
  	                	var value3 = array[0][2]; //ready
  	                	
  	                	var arr = [value1, value2, value3];
  	                	console.log(arr[0] +' '+  arr[1] + ' '+ arr[2])
  	                	if(value2 > value1 && value2 > value3){
  	                		checkAction('a');
  	                	}else {
  	                		checkAction('r');
  	                	} 
  	                })
  	           })
  	           setTimeout(startSteam,2000); 
  	      }
    	setTimeout(startSteam,3000); 
    	break;
    //lunge 모델 연동
    case "lunge":
    	document.write('<audio id="lunge-sound" src="assets/sound/lunge.m4a" controls autoplay style="display:none"></audio>');
    	inputCount = parseInt(inputCount) + parseInt(data.lungeCount);
    	changeHeadData(data.lungeCount);
    	const startLaunge = async function() {
        const model = await tf.loadLayersModel('./model/'+item+'/model.json'); 
        let img = tf.browser.fromPixels(webcamElement); 
        const picture = webcam.snap();
  	      row = []
  	      posenet.load().then(function (net) {
  	          const pose = net.estimateSinglePose(img, {
  	               flipHorizontal: false
  	           });
  	           return pose;
  	           }).then(function (pose) {
  	        	 for (var i = 0; i < pose.keypoints.length; i++) {
                     row.push(pose.keypoints[i].position.x / canvasElement.width)
                     row.push(pose.keypoints[i].position.y / canvasElement.height)
                     row.push(pose.keypoints[i].score)
                 }
                  row.push(pose.score)
  	                const enc_Data = tf.tensor([row])
  	                model.predict(tf.tensor([row])).array().then(array => {
  	           			var value1 = array[0][0]; //action
  	                	var value2 = array[0][1]; //nothing
  	                	var value3 = array[0][2]; //ready
  	                	
  	                	var arr = [value1, value2, value3];
  	              		console.log(arr[0] +' '+  arr[1] + ' '+ arr[2])
  	                	
  	                	if(value1 > value2 && value1 > value3){
  	                		checkAction('a');
  	                	}else { 
  	                		checkAction('r');
  	                	} 
  	                })
  	           })
  	           setTimeout(startLaunge,1000); 
  	      }
    	setTimeout(startLaunge,3000);
    	break;
    }

    //운동에 따른 count 처리 구현
   function checkAction(eventAction){
	   switch(item) {
		case "pushup":
			console.log('pushup nowAction : ' + nowAction + ' eventAction : '+ eventAction);
			if(nowAction != eventAction){
				if(nowAction == 'a' && eventAction == 'r'){
					nowAction = eventAction;
					data.pushupCount=data.pushupCount+1;
					console.log('pushup count +1');
					changeHeadData(data.pushupCount);
				} else {
					nowAction = eventAction;
				}
			}
			break;
		case "squat":
			console.log('squat nowAction : ' + nowAction + ' eventAction : '+ eventAction);
			if(nowAction != eventAction){
				if(nowAction == 'a' && eventAction == 'r'){
					nowAction = eventAction;
					data.squatCount=data.squatCount+1;
					console.log('squat count +1');
					changeHeadData(data.squatCount);
				} else {
					nowAction = eventAction;
				}
			}
			break;
		case "steam":
			console.log('steam nowAction : ' + nowAction + ' eventAction : '+ eventAction);
			if(nowAction != eventAction){
				if(nowAction == 'a' && eventAction == 'r'){
					nowAction = eventAction;
					data.steamCount=data.steamCount+1;
					console.log('steam count +1');
					changeHeadData(data.steamCount);
				} else {
					nowAction = eventAction;
				}
			}
			
			break;
		case "lunge":
			console.log('lunge nowAction : ' + nowAction + ' eventAction : '+ eventAction);
			if(nowAction != eventAction){
				if(nowAction == 'a' && eventAction == 'r'){
					nowAction = eventAction;
					data.lungeCount=data.lungeCount+1;
					console.log('lunge count +1');
					changeHeadData(data.lungeCount);
				} else {
					nowAction = eventAction;
				}
			}
			break;
	    }
   }
   
   function select(){
	    location.href="/mainBack?data="+encodeURI(JSON.stringify(data));
	}
   
   //카운트 완료 후 운동종료 알림 실행
   function changeHeadData(count){
	   headData.innerText=item + " : " + count +" 회";
	   if(inputCount == count) {
		   alert('운동 종료');
		  select();
	   }
   }
</script>
</html>