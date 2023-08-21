<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>

<head>
<style type="text/css">
.loadImage{
	position: relative;
	opacity: 0.3;
}
#divImg01{
background-image: url(/resources/upload/imgAi/default.png); 
background-position: center; 
background-size: cover;
height:100%;
width:100%;
}
</style>

<script type="text/javascript">
$(function(){
	$(".loadImage").on("click", function(e) {
		var areaNum=$(this).find("div").attr("id")
		console.log(areaNum);
		$("#areaNum").val(areaNum);
		
	});
	
	
	
	var imageName="";
	
	
	$('#btnAiPhoto').click(function(){
	    event.preventDefault(); // 폼의 기본 동작 막기

		var formData= new FormData();
		var uploadedPhoto=$('#uploadedPhoto')[0].files[0];
		var strCsrf = $("input[name='_csrf']").val();

		if (!uploadedPhoto) {
		     alert("파일을 선택해주세요");
		     return;
		 }
		
		
		
		
		formData.append("uploadedPhoto",uploadedPhoto);
		formData.append("_csrf", strCsrf);
		
		$.ajax({
			type : "post",
			url : "/member/tripBoard/upload",
			data: formData,
			contentType : false,
		    processData : false, 
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			},
			success : function(result) {
				console.log(result)
				imageName=result
				$('#message').text("업로드 확인! 아래 실행버튼을 눌러주세요")
				$('#btnAi').prop("disabled",false)
			}
		});
		
		
		
	})
	
	$('#btnAi').click(function(){
		var areaNum=$("#areaNum").val()
		
		console.log(areaNum)
		
		var formData=new FormData()
		formData.append("imageName",imageName);
		formData.append("areaNum",areaNum);
		
		$.ajax({
			type : "post",
			url : "http://127.0.0.1:5000/ai.ajax",
			data: formData,
			contentType : false,
		    processData : false, 
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			},
			success : function(result) {
				alert(result)
				console.log(result)
			}
		});
		
	})
	
	$("#uploadedPhoto").on("change", handleImg);
	
	
	
	
	
	
})

function handleImg(e) {
			let files = e.target.files;
			let fileArr = Array.prototype.slice.call(files);
			let cnt = 1;

			fileArr.forEach(function(f) {
				//이미지 파일이 아닌 경우 이미지 미리보기 실패처리
				if (!f.type.match("image.*")) {
					alert("이미지 확장자만 가능합니다.");
					//함수 종료
					return;
				}

				let obj = $("#divImg0" + cnt);

				let reader = new FileReader();
				reader.onload = function(e) {

					obj.css("background-image", "url(" + e.target.result
							+ ")");
				}
				reader.readAsDataURL(f);

				console.log("cnt : " + cnt);

				cnt++;
			});//end forEach

}
		

</script>
</head>

<body>

<!-- **************** MAIN CONTENT START **************** -->
<main>
	
<!-- =======================
Page Banner START -->
<section class="position-relative py-8 py-sm-9" style="background-image:url(/resources/booking/assets/images/bg/aiphoto.jpg); background-position: center left; background-size: cover;">
	<!-- Background dark overlay -->
	<div class="bg-overlay bg-dark opacity-2"></div>
	<div class="container z-index-9 position-relative">
		<div class="row">
			<div class="m-auto text-center pb-xl-8">
				<h1 class="display-4 text-white mb-3">AI기술을 이용해서  <br/>여행사진을 새롭게 바꿔보세요</h1>
				<h5 class="text-white mb-3">사진에서 없애고 싶은 부분을 지울 수 있어요</h5>
			</div>
		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
Page Banner END -->

<!-- =======================
Main content START -->
<section class="position-relative z-index-1" style="top:-8rem;">
	<div class="container">
		<div class="row">
			<div class="col-lg-10 mx-auto">
				<div id="upload" enctype="multipart/form-data" class="vstack gap-4">

					<!-- Cab Detail START -->
					<div class="card shadow">
						<!-- Card header -->
						<div class="card-header border-bottom">
							<h5 class="mb-0">사진에서 물체 지우기</h5>
						</div>

						<!-- Card body -->
						<div class="card-body">
							<div class="row g-3">
								<!-- Car name -->
								<div class="col-md-12">
									<h6 >매뉴얼</h6>
									<ul class="list-unstyled form-label">
									  <li><b>1.</b> 수정을 원하는 사진을 업로드해주세요</li>
									  <li><b>2.</b> 지우고 싶은 부분이 있는 영역을 선택해주세요 </li>
									  <li><b>3.</b> 실행버튼을 눌러주세요</li>	
									</ul>
								</div>


								<!-- Upload image START -->
								<div class="col-12">
									<h6>사진을 업로드해주세요</h6>
									<input class="form-control" type="file" name="uploadedPhoto" id="uploadedPhoto" accept="image/gif, image/jpeg, image/png" />
									<div class="d-flex justify-content-between mt-2">
										<p class="small mb-0 mt-1"><b>주의사항: </b>JPG, JPEG, PNG 형식의 이미지 파일을 올려주세요</p>
										<p id="message" class="text-success mb-0 mt-1"></p>
										<button id="btnAiPhoto" class="btn btn-primary mb-0">업로드</button>
									</div>
									
								</div>
								
								
								<div class="col-6 pb-5" style="height:25rem;">
									<h6 class="mb-3">이미지 미리보기-지우고 싶은 영역을 선택해주세요</h6>
									<div id="divImg01" class="row g-2">
										<!-- Image -->
										<c:forEach begin="1" end="9" varStatus="stat">
											<div class="col-4 loadImage">
												<div id="${stat.count}"
													class="grids card card-grid-lg card-element-hover card-overlay-hover overflow-hidden">
												</div>
											</div>
										</c:forEach>
						
									</div>
								</div>
								
								<!-- Upload image START -->
								<div class="col-6">
									<h6>선택 영역 번호</h6>
									<input id="areaNum" class="form-control" type="text" name="areaNum" />
									
								</div>
							</div>
						</div>
					</div>
					<!-- Cab Detail END -->


					<!-- Button -->
					<div class="text-end">
						<a href="/member/tripBoard/tripPhotoTesting"> >시연영상 </a>
						<button onclick="javascript:history.back()" class="btn btn-secondary mb-0">뒤로가기</button>
						<button id="btnAi" class="btn btn-primary mb-0" disabled>실행</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- =======================
Main content END -->

</main>

</body>
</html>