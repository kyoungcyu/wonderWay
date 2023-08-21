<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>


<!-- Favicon -->
<link rel="shortcut icon" href="/resources/booking/assets/images/favicon.ico">

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/font-awesome/css/all.min.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/flatpickr/css/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/stepper/css/bs-stepper.min.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/dropzone/css/dropzone.css">
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/choices/css/choices.min.css">

	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/bootstrap-icons/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/choices/css/choices.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/vendor/dropzone/css/dropzone.css">

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/booking/assets/css/style.css">

<!-- Theme CSS -->
<link rel="stylesheet" type="text/css" href="/resources/booking/assets/css/style.css">

<c:set var="now" value="<%=new Date()%>" />
<!-- **************** MAIN CONTENT START **************** -->
<main>

	<!-- =======================
Main banner START -->
	<section class="py-0">
		<div class="container">
			<!-- Title -->
			<div class="row g-4">
				<!-- Image -->
				<div class="col-12">
					<img src="/resources/booking/assets/images/blog/13.jpg"
						class="rounded-3">
				</div>
				<!-- Title and content -->
				<div
					class="col-11 col-lg-10 mx-auto position-relative mt-n5 mt-sm-n7 mt-md-n8">
					<div class="bg-mode shadow rounded-3 p-4">

						<div class="card border">
							<!-- Title -->
							<div class="card-header border-bottom">
								<h4 class="card-header-title">질문하기</h4>
							</div>


							<!-- Contact form START -->
							<div class="col-lg-12">
								<div class="card p-4">

									<!-- Card body START -->
									<div class="card-body p-0">
										<form:form modelAttribute="brdVO" id="frm01" action="/member/qnaBoard/qnaBoardWritePost"
											method="post" enctype="multipart/form-data" class="row g-4">
											<!-- 제목 -->
											<div class="col-md-12">
												<input type="hidden" id="brdKnd" name="brdKnd" value="D02" />
												<label class="form-label">질문 *</label> <input type="text"
													class="form-control" name="brdTt" id="brdTt" required/> <input
													type="hidden" class="form-control" name="brdId" id="brdId" />
												<input type="hidden" class="form-control" name="frstWrtr"
													id="frstWrtr"
													value="<sec:authentication property="principal.username"/>" />
												<input type="hidden" class="form-control" name="frstDt" />
												<input type="hidden" class="form-control" name="lastWrtr"
													id="lastWrtr"
													value="<sec:authentication property="principal.username"/>" />
												<input type="hidden" class="form-control" name="lastDt"
													id="lastDt" />

											</div>


											<!--내용 -->

											<div class="col-12">
												<label class="form-label">질문내용 *</label>
											</div>

											<div class="col-md-12">
												<textarea class="form-label" name="brdCntn" id="content" required></textarea>
											</div>
											
<!-- 											대표사진 -->
<!-- 											Thumbnail image -->
											<div class="col-12">
												<label class="form-label">파일 첨부하기</label>
												 <input class="form-control" name="attachVOList[0].attachDeVOList[0].picture" type="file" id="image" accept="image/gif, image/jpeg, image/png" multiple>
												<p class="small mb-0 mt-2">
													<b>주의 :</b> Only JPG, JPEG, and PNG. Our suggested dimensions are 600px * 450px.
												</p>
											</div>
											
											  <div id="div01"></div>
											  
											<!-- Button -->
											<div class="col-12 text-end" id="p2">
												<button type="button" class="btn btn-primary mb-0" id="back"
													onclick="javascript:location.href='/member/qnaBoard/qnaMain'">취소</button>
												<button type="button" class="btn btn-primary mb-0"
													id="registerOk">등록</button>
											</div>
											<sec:csrfInput />
										</form:form>
									</div>
									<!-- Card body END -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- =======================
Main banner END -->

	<!-- ======================= Blog content START -->
	<section>
		<div class="container">
			<div class="row"></div>
		</div>
	</section>
	<!-- ======================= Blog content END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- Back to top -->
<div class="back-top"></div>
<script src="/resources/booking/assets/vendor/dropzone/js/dropzone.js"></script>
<script type="text/javascript">
	
$(function(){
	CKEDITOR.replace('content', {
	});
	
	
// 	//이미지 미리보기 시작////////////////////////////////////////////////////////////////
// 	$("#file").on("change",handleImg);
	
// 	function handleImg(e){
// 		//let file = $("#file");
// 		//file[0].files;
// 		let files = e.target.files;
// 		let fileArr = Array.prototype.slice.call(files);
// 		//f:각각의 이미지 파일
// 		fileArr.forEach(function(f){
// 			//이미지가 아니면 멈춤
// 			if(!f.type.match("image.*")){
// 				alert("이미지만 가능합니다.");
// 				return;
// 			}
// 			let reader = new FileReader();
// 			//e : 리더가 이미지를 읽을 때 그 이벤트
// 			reader.onload = function(e){
// 				let img_html = "<img src ='" + e.target.result +  "'style = 'width:50%;'/>";
// 				$("#div01").append(img_html);
// 			}
// 			//다음 이미지 파일(f)을 읽기 위해 리더를 초기화
// 			reader.readAsDataURL(f);
// 		})
// 	}
// 	//이미지 미리보기 끝////////////////////////////////////////////////////////////////
	
	//ajax 파일 업로드 시작 ////////////////////////////////////////////////////////////
	//e:클릭 이벤트 자체
	
// 	$("#inputFile").on("click",function(e){
// 		//가상의 폼 생성(이미지들을 넣을 것임)
// 		let formData = new FormData();
// 		let inputFile = $("input[name='file']");
// 		//이미지 파일들을 files 오브젝트에 할당
// 		let files = inputFile[0].files;
		
// 		console.log("files : " + files);
		
// 		for(let i = 0; i<files.length; i++){
// 			//files[0] :
// 			// <input type ="file" name = "uploadFile"
// 			formData.append("uploadFile",files[i])
// 		}
// 		$.ajax({
// 			url:"/ajax/register06Post",
// 			processData:false,
// 			contentType:false,
// 			data:formData,
// 			type:"post",
// 			dataType:"json",
// 			success:function(result){
// 				console.log("result : " + JSON.stringify(result));
// 			}
// 		})
		
		
// 	});
	
	//ajax 파일 업로드 끝////////////////////////////////////////////////////////////
	
	$("#registerOk").on("click", function() {
		$("#frm01").submit();
	});
		
});

</script>
