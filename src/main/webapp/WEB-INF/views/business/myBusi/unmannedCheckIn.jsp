<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Webestica.com">
<meta name="description"
	content="Booking - Multipurpose Online Booking Theme">


<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/choices/css/choices.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="/resources/booking/assets/vendor/choices/js/choices.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<script type="text/javascript">
	$(function() {
		var video = document.getElementById('video');
		var captureBtn = document.getElementById('capture');
		var canvas = document.createElement('canvas');
		var context = canvas.getContext('2d');
		var formData = new FormData();

		
		
	    $("#checkPrivacy1").change(function() {
			console.log("video element : " + video);
			
			if ($(this).is(':checked')) {
				video.style.display = 'block'; // 비디오 재생
				videoActive(video);
			} else {
				video.style.display = 'none'; // 비디오 일시 정지
				video.pause();
			}
	    });
	    
	    $("#btnCheckIn").on("click", function() {
	    	console.log("flag");
	    	return new Promise(function(resolve, reject) {
		    	function captureFrame() {
				    canvas.width = video.videoWidth;
				    canvas.height = video.videoHeight;
				    context.drawImage(video, 0, 0, canvas.width, canvas.height);
				    canvas.toBlob(function(blob) {
						formData.append('file', blob, 'login.jpg');
						formData.append('mem_id', document.getElementById('memId').value);
				        $.ajax({
				        	url: "http://127.0.0.1:5000/login.ajax",
							processData: false,
							contentType: false,
							data: formData,
							type: "POST",
							beforeSend : function (xhr) {
		    					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		    				},
							success: function(response) {
					        	console.log(response);
	 				        	if (response == 'success') {
						        	$.ajax({
						  			    url: "/business/myBusi/completeCheckIn",
						  			    data: {
						  			    	"memId" : document.getElementById('memId').value
						  			    },
						  			    type: "POST",
						  			  	beforeSend : function (xhr) {
					    					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
					    				},
						  			    success: function(response) {
						  			        console.log(response.checkIn);
						  			        let str = "";
						  			        if(response != null) {
							  			        str += `<li class="list-group-item mb-3"><span>고객명:</span><span class="h6 fw-normal ms-1 mb-0">\${response.memNm}</span></li>`;
							  			        str += `<li class="list-group-item mb-3"><span>고객명(영문):</span><span class="h6 fw-normal ms-1 mb-0">\${response.memEnm}</span></li>`;
							  			        str += `<li class="list-group-item mb-3"><span>예약 아이디:</span><span class="h6 fw-normal ms-1 mb-0">\${response.memId}</span></li>`;
							  			        str += `<li class="list-group-item mb-3"><span>객실 번호:</span><span class="h6 fw-normal ms-1 mb-0">\${response.rmNum}</span></li>`;
							  			        if(response.checkIn == '1') {
								  			        str += `<li class="list-group-item mb-3"><span>체크인 상태:</span><span class="badge bg-success bg-opacity-10 text-success">완료</span></li>`;
							  			        } else {
								  			        str += `<li class="list-group-item mb-3"><span>체크인 상태:</span><span class="badge bg-danger bg-opacity-10 text-danger">실패</span></li>`;
							  			        }
						  			        }
						  			        $("#rmInfo").html(str);
						  			    },
						  			    error: function(xhr, status, error) {
						  			        console.error(xhr, status, error);
						  			    }
						  			});//ajax끝
					        	} else {
						        	setTimeout(function() {
								        alert("체크인 실패. 다시 인식해주세요");
								    }, 1);
					        	}
					    	},
					    	error: function(xhr, status, error) {
					      		console.error(xhr, status, error);
					      	}
	            		});//ajax끝
	            		resolve();
		    		}, 'image/jpeg', 0.9);
		    	}
	   			captureFrame();   
			});
	    });
	});
	
	function videoActive(video) {
		navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream) {
			video.srcObject = stream;
			video.play();
	    });
	}
	
	function captureAndSend() {
	    
  	}
</script>
</head>

<body>

	<!-- **************** MAIN CONTENT START **************** -->
	<main>

		<!-- Page main content START -->
		<div class="page-content-wrapper p-xxl-4">

			<!-- Filters START -->
			<div class="col-lg-5">
				<h1 class="h3 mb-3 mb-sm-0">무인 체크인</h1>
				<a href="/business/myBusi/untactTesting">시연영상보기 &gt;</a>
			</div>
			
			<!-- 검색 -->
			<div class="d-flex align-items-center col-md-6 col-lg-2">
			</div>
			
			<!-- 기간 설정 -->
			<div class="d-flex align-items-center col-md-6 col-lg-3">
			</div>
			
			<!-- 정렬 -->
			<div class="col-md-6 col-lg-2">
			</div>
			<!-- Filters END -->

			<div class="p-3" style="position: relative;">
				<div class="d-md-flex justify-content-between align-items-center">
					<!-- Content -->
					<div>
					</div>
					<!-- Switch -->
					<div class="form-check form-switch form-check-md mb-0">
						<span>&#32;on/off</span>
						<input class="form-check-input" type="checkbox" id="checkPrivacy1">
					</div>
				</div>
			</div>
			
			<div class="row g-4">
				<div class="col-lg-3 div3" style="float: left; width: 50%;">
					<div class="card shadow">
						<div class="card-body"">
							<video id="video" width="400" height="440"></video>
						</div>
					</div>
				</div>
				<div class="col-lg-3 div3" style="float: left; width: 50%;">
					<div class="card shadow">
						<div class="card-header border-bottom" style="text-align: center;">
							<h5 class="card-header-title">예약 정보</h5>
						</div>
						<div class="card-body" style="text-align: center;">
							<div class="mb-3" >
								<label class="form-label">회원 ID</label>
								<input id="memId" type="text" class="form-control bg-transparent" style="width: 200px; margin-left: 170px;" value="" placeholder="Name">
							</div>
							<hr />
							<div class="mb-3">
								<label class="form-label">객실 정보</label>
								<div class="col-md-8" style="margin-left:90px;">
									<ul id="rmInfo" class="list-group list-group-borderless">
									</ul>
								</div>
							</div>
							<hr />
							<div class="d-flex justify-content-end mt-4">
								<button id="btnCheckIn" type="button" class="btn btn-sm btn-primary">체크인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Page main content END -->
	</main>
	<!-- **************** MAIN CONTENT END **************** -->
</body>
</html>