<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>


<!-- Main content START -->
<div class="col-lg-8 col-xl-9">

	<!-- Offcanvas menu button -->
	<div class="d-grid mb-0 d-lg-none w-100">
		<button class="btn btn-primary mb-4" type="button"
			data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar"
			aria-controls="offcanvasSidebar">
			<i class="fas fa-sliders-h"></i> Menu
		</button>
	</div>

	<div class="vstack gap-4">
		<!-- Personal info START -->
		<div class="card border">
			<!-- Card header -->
			<div class="card-header border-bottom">
				<h4 class="card-header-title">내 프로필</h4>
			</div>

			<!-- Card body START -->
			<div class="card-body">
				<!-- Form START -->
				<div class="row g-3">
				<form class="row g-3">
					<!-- Profile photo -->
					<label class="form-label"><span class="text-danger"> 사진을 등록해주세요*</span></label>
					<div id="div01" >
						<span class="avatar avatar-xxl"> 
						<img class="avatar-img rounded-circle border border-white border-3 shadow" src="/resources/upload/mem${imgPath}" alt="">
						</span>
					</div>
							
					<div style="display: flex; justify-content: space-between;">
						<div class="filebox " >
							<label class="btn btn-sm btn-primary-soft mb-0" for="input_imgs" >사진 등록</label>
							<input class="form-control d-none" type="file" name="uploads" id="input_imgs" multiple />
							<button class="btn btn-sm btn-primary-soft mb-0" id="imgBtn" type="button">변경하기</button>
							<button type="button" class="btn btn-sm btn-info-soft mb-0"
									data-toggle="modal" data-target=".bd-faceReg-modal-lg">안면 인식 등록</button>
						</div>
						<div>
						</div>
						</div>					
					</form>
					
<!-- 					<div class ="col-6"> -->
<!-- 						<div class="col-9 text-end" > -->
<!-- 							<button type="button" class="btn btn-sm btn-info-soft" -->
<!-- 									data-toggle="modal" data-target=".bd-faceReg-modal-lg">안면 인식 등록</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
					
<!-- 					<div class="col-md-6"></div> -->
					<!-- 이름 -->
					<div class="col-md-12">
						<label class="form-label">이 름<span class="text-danger">*</span></label>
						<input type="text" class="form-control" value="${data.memNm}" id="memName"
							readonly>
					</div>
					<!-- 아이디 -->
					<div class="col-md-6">
						<label class="form-label">아이디<span class="text-danger">*</span></label>
						<input type="text" class="form-control" value="${data.memId}" id="memId"
							readonly>
					</div>
					<!-- 비밀번호 -->
					<div class="col-md-6">
						<label class="form-label">비밀번호<span class="text-danger">*</span><a href="/member/mypage/passModify" class="float-end d-none"> 변경</a></label>
						<input type="text" class="form-control" value="${data.memPw}" id="memPw"
							readonly>
					</div>
					<!-- 핸드폰 번호 -->
					<div class="col-md-6">
						<label class="form-label">핸드폰 번호<span class="text-danger">*</span></label>
						<input type="text" class="form-control" value="${data.memTel}" id="memTel"
							readonly>
					</div>
					<!-- 이메일 주소-->
					<div class="col-md-6">
						<label class="form-label">이메일<span class="text-danger">*</span></span><a href="/member/mypage/emailModify" class="float-end d-none"> 변경</a></label>
						<input type="text" class="form-control" value="${data.memEmail}" id="memEmail" readonly>
					</div>
					<!-- 영문이름 -->
					<div class="col-md-6" >
						<label class="form-label" >영문이름<span
							class="text-danger">*</span></label> <input type="text"
							class="form-control" value="${data.memEnm}"  id="memEnm"readonly>
					</div>
					<!-- 영문성 -->
					<div class="col-md-6" >
						<label class="form-label" >영문 성<span
							class="text-danger">*</span></label> <input type="text"
							class="form-control" value="${data.memFmnm}"  id="memFmnm"readonly>
					</div>
					
					<!-- Addr1 -->
					<div class="col-md-6"  >
						<label class="form-label" >주소<span class="text-danger">*</span></label>
						<input type="text" class="form-control" value="${data.memAddr1}" id="memAddr1"
							readonly>
					</div>
					<!-- Addr2-->
					<div class="col-md-6" >
						<label class="form-label" >상세주소<span class="text-danger">*</span></label>
						<input type="text" class="form-control" value="${data.memAddr2}" id="memAddr2"
							readonly>
					</div>
					<!-- Date of birth -->
					<div class="col-md-6">
						<label class="form-label">생년월일<span class="text-danger">*</span></label>
						<input type="text" class="form-control" value="<fmt:formatDate value="${data.memBir}" pattern="yyyy-MM-dd"/>"
							id="memBir"  placeholder="0000-00-00"
							readonly>
					</div>


					<!-- MBTI-->
					<div class="col-md-6" >
						<label class="form-label">MBTI<span class="text-danger">*</span></label>
						<input type="text" class="form-control"   id="memMbti" value="${data.memMbti}"
							readonly>
					</div>

					<!-- 일반Button -->
					<div class="col-12 text-end" id="p1">
						<button type="button" class="btn btn-primary mb-0" id="edit">수정하기</button>
					</div>
					<!-- 변경 Button -->
					<div class="col-12 text-end" id="p2" style="display: none;">
						<button type="button" class="btn btn-primary mb-0" id="back"
							onclick="javascript:location.href='/member/mypage/myInfo'">취소</button>
						<button type="button" class="btn btn-primary mb-0" id="ok">수정</button>
					</div>
				</div>
				<!-- Form END -->
			</div>
			<!-- Card body END -->
		</div>
		<!-- Personal info END -->
	</div>
	<!-- 얼굴인식 모달 -->
	<div class="modal fade bd-faceReg-modal-lg" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">안면 인식 등록</h5>
					<button type="button" class="btn" data-dismiss="modal"
						style="font-size: 1.5rem; font-weight: 700; line-height: 1; color: #000; text-shadow: 0 1px 0 #fff;"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div id="detailModal"><video id="video" width="640" height="480" autoplay ></video></div>
				</div>
				<div class="modal-footer">
					<button id="capture" type="button" class="btn btn-sm btn-success-soft">등록</button>
					<button type="button" class="btn btn-sm btn-dark-soft"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Main content END -->

<script type="text/javascript">


	$(function() {
		//변경 버튼 클릭 -> 변경 모드로 전환
		$("#edit").on("click", function() {
			//일반모드는 가리자
			$("#p1").css("display", "none");
			//변경모드
			$("#p2").css("display", "block");
			//readonly 속성제거
			//이미지 변경버튼 보이기
			$("#editImage").removeClass("d-none");
			$(".float-end").removeClass("d-none");
			$("#memAddr1").removeAttr("readOnly");
			$("#memAddr2").removeAttr("readOnly");
			$("#memBir").removeAttr("readOnly");
			$("#memEnm").removeAttr("readOnly");
			$("#memFmnm").removeAttr("readOnly");
			$("#memMbti").removeAttr("readOnly");
			//수정 안 되는 내용은 배경색 변경
			$("#memName").css("background-color", "#f2f2f2");
			$("#memId").css("background-color", "#f2f2f2");
			$("#memPw").css("background-color", "#f2f2f2");
			$("#memTel").css("background-color", "#f2f2f2");
			$("#memEmail").css("background-color", "#f2f2f2");
		});

		//안면인식
		var video = document.getElementById('video');
		var captureBtn = document.getElementById('capture');
		var canvas = document.createElement('canvas');
		var context = canvas.getContext('2d');
		var formData = new FormData();

		navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream) {
		video.srcObject = stream;
	    video.play();
	    }).catch(function(error) {
	    	console.error(error);
		});

		captureBtn.addEventListener('click', function() {
	    	captureBtn.innerText = "얼굴인식 및 데이터 만드는중..";
	    	captureAndSend();
		});
	

		function captureAndSend() {
			return new Promise(function(resolve, reject) {
				var count = 0;
				function captureFrame() {
					canvas.width = video.videoWidth;
					canvas.height = video.videoHeight;
	          		context.drawImage(video, 0, 0, canvas.width, canvas.height);
	          		canvas.toBlob(function(blob) {
						formData.append('file[]', blob, count + '.jpg');
	          	  		count++;
	          	  		console.log(count);
		          	  	if (count < 40) {
		          		  	setTimeout(captureFrame, 10);
		          	  	} else {
			          	  	$.ajax({
			      			    url: "/member/mypage/faceRegPost",
			      			    data: {
			      			    	"memId" : ""	
			      			    },
			      			    type: "POST",
			      			    contentType: 'application/json; charset=utf-8',
			      			  	beforeSend : function (xhr) {
			    					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			    				},
			      			    success: function(response) {
			      			        console.log("Log : " + response.memId + ", " + response.memNm);
			      			        captureBtn.innerText = "완료!";
			      			      	formData.append('mem_id', response.memId);
				            	  	formData.append('mem_name', response.memNm);
				            	  	
				            	  	$.ajax({
								  		url: "http://localhost:5000/capture.ajax",
								  		processData: false,
								  		contentType: false,
								  		data: formData,
								  		type: "POST",
								  		success: function(response) {
								  			console.log(response);
								  			captureBtn.innerText = "서버에 저장중..";
											alert("성공");								  			
								  			//ajax끝
								  		},
								  		error: function(xhr, status, error) {
								      		console.error(xhr, status, error);
										}
				                	});
			      			    },
			      			    error: function(xhr, status, error) {
			      			        console.error(xhr, status, error);
			      			    }
			      			});
		            	  	
		            	  	
		            	  	//ajax 끝
		                	resolve();
	            		}//if끝
	        		}, 'image/jpeg', 0.9);
	   			}
	   			captureFrame();
			});
	  	}
	});
	
	
$(function(){
	$("#ok").on("click",function(){
		
		console.log("눌렀다.");
		var memId= $("#memId").val();
		var memEnm = $("#memEnm").val();
		var memFmnm = $("#memFmnm").val();
		var memAddr1 = $("#memAddr1").val();
		var memAddr2 = $("#memAddr2").val();
		var memBir = $("#memBir").val();
		var memMbti = $("#memMbti").val();
		var memGen = $("#memGen").val();
		var memImg = $("#input_imgs").val();
		
		var data ={
				"memId":memId,
				"memEnm":memEnm,
				"memFmnm":memFmnm,
				"memAddr1":memAddr1,
				"memAddr2":memAddr2,
				"memBir":memBir,
				"memMbti":memMbti,
				"memGen":memGen,
				"memImg":memImg
		}
		
		$.ajax({
			url:"/member/mypage/updateMyInfo",
			data:JSON.stringify(data),
			type:"post",
			dataType:"text",
			contentType:"application/json;charset=utf-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			},
			success : function(result) {
				console.log("여기까지 왔다.");
				console.log("data: " + JSON.stringify(data));

				if(result >0){
					alert("성공적으로 변경되었습니다.");
					location.href="/member/mypage/myInfo"
					
				}else{
					alert("다시 입력해주세요.")
				}
				
			}
				
			
		});
		

});
});

$("#imgBtn").on("click",function() {
	const formdata = new FormData();
	
	let img =$("#input_imgs");
	formdata.append("uploads", img[0].files[0]);
//		let data ={
//			"busiImg" : img
//		}
	//console.log(data)
	$.ajax({
		type : "POST",
		url : "/member/mypage/updateImg",
		data : formdata,
		processData : false,
		contentType : false,
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}",
					"${_csrf.token}");
		},
		dataType : "text",
		
		success : function(data) {
			console.log(data)
			if(data >0){
				alert("프로필 사진을 등록하였습니다.");
				location.href="/member/mypage/myInfo"
				
			}else{
				alert("다시 입력해주세요.")
			}
			
				
		}
	})
	
});

	
$(function() {
	$("#input_imgs").on("change",handleImgFileSelect);
	//파라미터e : onchange 이벤트 객체
	function handleImgFileSelect(e){
		console.log("개똥이");
		//이벤트가 발생된 타겟 안에 들어있는 이미지 파일들을 가져와보자
		let files = e.target.files;
		//이미지가 여러개가 있을 수 있으므로 이미지들을 분리해서 배열로 만듦
		let fileArr = Array.prototype.slice.call(files);
		let cnt = 1;
		//파일 타입의 배열 반복. f : 배열 안에 들어있는 각각의 이미지 파일 객체
		fileArr.forEach(function(f){
			//이미지 파일이 아닌 경우 이미지 미리보기 실패처리
			if(!f.type.match("image.*")){
				alert("이미지 확장자만 가능합니다.");
				return;
			}
			
			let reader = new FileReader();
			reader.onload = function(e){
				$("#div01 img").attr("src", e.target.result);
			}
			console.log(e.target.result);
			reader.readAsDataURL(f);
			
			console.log("cnt : " + cnt);
			
			cnt++;
		});//end forEach
		
	}
	
	
});
	
//

</script>