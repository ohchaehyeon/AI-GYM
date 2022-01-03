<!-- 날짜 : 2022.01.02
	 작성자 : 조진선
	 화면 : 메인화면 구현
     기능 : 운동 선택 및 결과 이동화면 구현
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Main Page</title>
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
 <!-- Portfolio Section-->
        <section class="page-section portfolio" id="portfolio">
            <div class="container">
            <div class="container d-flex align-items-center flex-column">
            	<img width="280px" height="110px" src="assets/img/portfolio/KTIcon.png" alt="..." />
             	<div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
             </div>
                <!-- Portfolio Grid Items-->
                <div class="row justify-content-center">
                    <!-- Portfolio Item 1-->
                    <div class="col-md-6 col-lg-5 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100" onclick="select('pushup')">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <img class="img-fluid" src="assets/img/portfolio/pushup.png" alt="..." />
                        </div>
                    </div>
                    <!-- Portfolio Item 2-->
                    <div class="col-md-6 col-lg-5 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100" onclick="select('squat')">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <img class="img-fluid" src="assets/img/portfolio/squat.png" alt="..." />
                        </div>
                    </div>
                    <!-- Portfolio Item 3-->
                    <div class="col-md-6 col-lg-5 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100" onclick="select('steam')">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <img class="img-fluid" src="assets/img/portfolio/steam.png" alt="..." />
                        </div>
                    </div>
                    <!-- Portfolio Item 4-->
                    <div class="col-md-6 col-lg-5 mb-5 mb-lg-0">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100" onclick="select('lunge')">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <img class="img-fluid" src="assets/img/portfolio/lunges.png" alt="..." />
                        </div>
                    </div>
                    
                    <p id=outData class="btn btn-primary btn-xl masthead-subheading font-weight-light mb-0">Graphic Artist - Web Designer - Illustrator</p>
                  
                   <button type="button" class="btn btn-primary btn-xl" id="btn" onclick="finish()">Finish</button>
                   
                </div>
            </div>
        </section>	
        
 <script>
  console.log('${data}');
 	/*var data = JSON.parse('${data}'); */
 
 	window.history.forward();
	function noBack() {
		window.history.forward();
	}

 	function select(item){
 	    location.href="/webcam?item="+item+"&data="+encodeURI('${data}');
 	}
 	
 	function finish(){
 	    location.href="/finish?data="+encodeURI('${data}');
 	}
 </script>
</body>
</html>