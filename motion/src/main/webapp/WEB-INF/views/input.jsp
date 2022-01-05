<!-- 날짜 : 2022.01.03
	 작성자 : 조진선
	 화면 : 사용자 지정 운동횟수 카운트 설정 화면 구현
     기능 : 사용자 지정 운동횟수 데이터 처리 구현
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Input Page</title>
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
<section class="page-section" id="contact">
            <div class="container">
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">운동 횟수 입력</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Contact Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- * * SB Forms Contact Form * *-->
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- This form is pre-integrated with SB Forms.-->
                        <!-- To make this form functional, sign up at-->
                        <!-- https://startbootstrap.com/solution/contact-forms-->
                        <!-- to get an API token!-->
                            <!-- Phone number input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="countInputBox" type="number" data-sb-validations="required" />
                            <label for="Count">Count</label>
                            <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
                        </div>
                        
                        <!-- Submit error message-->
                        <!---->
                        <!-- This is what your users will see when there is-->
                        <!-- an error submitting the form-->
                        <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                        <!-- Submit Button-->
                        <div class="row justify-content-center">
                          <button type="button" class="btn btn-primary btn-xl" id="btn" onclick="count()">Start</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
</body>
 <script>
    var item ='${item}';
    var data = JSON.parse('${data}');
    
 	window.history.forward();
	function noBack() {
		window.history.forward();
	}

 	function count(){
 		var inputCount = document.getElementById("countInputBox").value; 
 		
 		if (data.timerOn == 0){
 			data.timerOn = 1;
 			data.time = new Date().getTime()
 		}
 		if (inputCount ==null || inputCount == undefined || inputCount == ''){
 			alert('비정상적인 값 입니다');
 		} else if (inputCount<=0){
 			alert('0이상의 숫자만 입력이 가능합니다');
 		} else {
 			 location.href="/webcam?item="+item+"&inputCount="+inputCount+"&data="+encodeURI(JSON.stringify(data));
 		}
 	}
 </script>
</html>