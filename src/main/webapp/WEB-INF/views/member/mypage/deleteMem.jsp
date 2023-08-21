<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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

	<!-- Card START -->
	<div class="card border">
		<!-- Card header -->
		<div class="card-header border-bottom">
			<h4 class="card-header-title">회원 탈퇴</h4>
		</div>

		<!-- Card body START -->
		<div class="card-body">
			<h6>${data.memId}님 정말 탈퇴하시겠어요?</h6>
			<ul>
				<li>계정을 삭제하면  <span style="color: red; font-weight: bold;">${data.memId}</span> 님의 모든 정보가 삭제됩니다.</li>
				<li>탈퇴 후에는 작성하신 리뷰를 수정 혹은 삭제하실 수 없어요. 탈퇴 신청 전에 꼭 확인해주세요.</li>
			</ul>
			<div class="form-check form-check-md my-4">
				<input class="form-check-input" type="checkbox" value=""
					id="deleteaccountCheck"> <label class="form-check-label"
					for="deleteaccountCheck">회원 탈퇴 유의사항을 확인하였으며 동의합니다.</label>
			</div>
			<a href="/member/mypage/myInfo"class="btn btn-success-soft btn-sm mb-2 mb-sm-0">취소</a> 
			<button type="button" class="btn btn-danger btn-sm mb-0" id="deleteMem">회원탈퇴</button>
		</div>
		<!-- Card body END -->
	</div>
	<!-- Card END -->
</div>
<!-- Main content END -->

<script type="text/javascript">

$("#deleteMem").on('click', function() {
    if ($("#deleteaccountCheck").is(":checked")) {
        var confirmed = confirm("회원 탈퇴하시겠습니까?");
        var memId = "${data.memId}"; // 변수 memId를 적절한 방식으로 설정해주세요
        if (confirmed) {
            // 체크 박스가 체크된 경우
            console.log("삭제 가능");
            var data = {
                "memId": memId
            };
            
            
            $.ajax({
                url: "/member/mypage/deleteMemPost",
                contentType: "application/json",
                data: JSON.stringify(data),
                type: "post",
                dataType: "text",
                beforeSend : function (xhr) {
            		xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
            	},
                success: function(result) {
                    if (result == "success") {
                        alert("회원탈퇴 되었습니다.");
            	        var csrfToken = document.querySelector('input[name=_csrf]').value;
            	        
            	        var xhr = new XMLHttpRequest();
            	        xhr.open('POST', '/logout');
            	        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            	        xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
            	        xhr.onload = function() {
            	            if (xhr.status === 200) {
            	                location.href = "/member/main";
            	            } else {
            	                console.error('로그아웃 요청 중 오류 발생:', xhr.statusText);
            	            }
            	        };
            	        xhr.onerror = function() {
            	            console.error('로그아웃 요청 중 네트워크 오류 발생');
            	        };
            	        xhr.send();
                    } else{
                    	alert("오류가 발생했습니다. 다시 시도해주세요.");
                    }
                },
                error: function() {
                    alert("오류가 발생했습니다. 다시 시도해주세요.");
                }
            });
        } 
    } else {
        alert("회원 탈퇴 유의사항에 동의해주세요.");
    }
});



</script>
