<!-- 날짜 : 2022.01.02
	 작성자 : 조진선
	 화면 : 운동종료 후 나오는 화면 구현
     기능 : 운동횟수와 총 소모 칼로리 데이터 처리 구현
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Finish Page</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
<header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image-->
                <img class="masthead-avatar mb-5" src="assets/img/portfolio/KT.png" alt="..." />
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">Exercise Finish</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p id=outData class="masthead-subheading font-weight-light mb-0">Graphic Artist - Web Designer - Illustrator</p>
            </div>
            <audio src="assets/sound/exercise_finish.m4a" controls autoplay style="display:none"></audio>
        </header>
<script>
	window.history.forward();
	function noBack() {
		window.history.forward();
	}

	var data = JSON.parse('${data}');
	var outData = document.getElementById("outData");
	var nowTime = new Date().getTime() - data.time;
	outData.innerText="PushUp : "+data.pushupCount+ " 회\n"+
	"Squrt : "+data.squatCount+ " 회\n"+
	"SteamEngine : "+data.steamCount+ " 회\n"+
	"Lunge : "+data.lungeCount+ " 회\n" + "\n" +
	"총 소모 칼로리 : " + Math.floor(data.pushupCount*1.8 + data.squatCount*0.4 + data.steamCount*0.9 + data.lungeCount*0.2) +" kcal"+
	" 총 소요 시간 : " + Math.floor(nowTime/1000/60) + "분 "+ Math.floor(nowTime/1000%60) + "초";
	console.log(data.pushupCount);
</script>
</body>
</html>