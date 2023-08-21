<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<title>Booking - Multipurpose Online Booking Theme</title>




<!-- Favicon -->
	<link rel="shortcut icon" href="/resources/booking/favicon.png">

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/bootstrap-icons/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/tiny-slider/tiny-slider.css">
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/glightbox/css/glightbox.css">
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/choices/css/choices.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/flatpickr/css/flatpickr.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/stepper/css/bs-stepper.min.css">
	

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/css/style.css">




<style>
.alarmDiv {
  position: absolute;
  animation: fadeInUp 1s;
  top: 90px;
  height: 40px;
  right: 0;
  border-style: outset;
  border-radius: 20px;
  width: 500px;
  z-index: 9999;
  font-size: 18px;
  
  line-height: 40px;
  text-align: center;
}

@keyframes fadeInUp {
    0% {
        opacity: 0;
        transform: translate3d(0, 100%, 0);
    }
    to {
        opacity: 1;
        transform: translateZ(0);
    }
}
 
</style>
 



</head>

<body>

	<main>

		<!-- Sidebar START -->
		<tiles:insertAttribute name="sidebar" />
		<!-- Sidebar END -->

		<!-- Page content START -->
		<div class="page-content">

			<!-- Top bar START -->
			<tiles:insertAttribute name="topbar" />
			<!-- Top bar END -->
			
			<!-- 실시간 알림 뜨는 창 -->
			<div id="alarmContainer">
<!-- 				<div class="alarmDiv">테스트 중입니다. 알람을 확인해보세요.</div> -->
			</div>

			<!-- Page main content START -->
			<tiles:insertAttribute name="body" />
			<!-- Page main content END -->
		</div>
	</main>

<!-- Back to top -->
<div class="back-top"></div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- Vendors -->
<script src="/resources/booking/assets/vendor/tiny-slider/tiny-slider.js"></script>
<script src="/resources/booking/assets/vendor/glightbox/js/glightbox.js"></script>
<script src="/resources/booking/assets/vendor/choices/js/choices.min.js"></script>
<script src="/resources/booking/assets/vendor/flatpickr/js/flatpickr.min.js"></script>

<!-- Bootstrap JS -->
<script src="/resources/booking/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- ThemeFunctions -->
<script src="/resources/booking/assets/js/functions.js"></script>
	


</body>
</html>