<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>

<sec:authentication property="principal.memVO" var="memVO" />

<section class="pt-0">
	<div class="container">
		<!-- Hero banner START -->
		<div class="row">
			<div class="col-12">
				<!-- Card START -->
				<div class="card card-body bg-primary justify-content-center text-center px-4 px-sm-5 pt-6 pt-md-8 pb-8" style="background-image: url(assets/images/element/bg-pattern.png); background-position: center center; background-repeat: no-repeat; background-size: cover;">
					<!-- Title -->
					<h1 class="fs-2 text-white mb-4">${inquiry.brdTt}</h1>
				</div>
			</div>
		</div>
		<!-- Hero banner END -->

		<!-- Article single START -->
		<div class="row mt-n8">
			<div class="col-11 mx-auto">
			
				<div class="card shadow">
					<!-- Card header START -->
					<div class="card-header p-3">
						<!-- Update and author -->
						<ul class="nav nav-divider">
							<li class="nav-item">작성일시 : <fmt:formatDate value="${inquiry.frstDt}" pattern="yyyy-MM-dd HH:mm:ss" /></li>
							<li class="nav-item">작성자 : ${inquiry.frstWrtr}</li>
							<input type="hidden" name="brdId" value="${inquiry.brdId}"/>
							<c:if test="${memId == inquiry.frstWrtr}">
								<li class="nav-item" style="margin-left: auto;">
									<a class="btn btn-sm btn-primary mb-0" href="/member/csc/inquiryModify?brdId=${inquiry.brdId}" style="color: white;">수정</a>
									<a class="btn btn-sm btn-danger mb-0" href="#" onclick="inqDelete('${inquiry.brdId}')" style="color: white;">삭제</a>
								</li>
							</c:if>
						</ul>
					</div>
					<!-- Card header END -->

					<!-- Card body START -->
					<div class="card-body p-4">
						${inquiry.brdCntn}
					</div>
					<!-- Card body END -->
					
					<div class="card-footer border-0 p-4 pt-0">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<form:form modelAttribute="cmtVO" id="cmtWrite" action="/member/tripBoard/cmtWrite?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" >
									<div class="collapse show" id="collapseComment" style="margin-bottom: 10px;">
										<div class="d-flex mt-3">
											<textarea class="form-control mb-0" id="comment" placeholder="답변을 작성해주세요" rows="2" spellcheck="false" name="cmtCntn"></textarea>
						  							<input type="hidden" class="form-control" name="${cmtWr}" id="cmtWr" value="<sec:authentication property="principal.username"/>" /> 
						  							<input type="hidden" class="form-control" name="${brdVO.brdId}" id="brdId" /> 
						  							<input type="hidden" class="form-control" name="cmtDt" id="cmtDt"  />
						  							<input type="hidden" class="form-control" name="repCmtId" id="repCmtId"  />
						  							<input type="hidden" class="form-control" name="repLevel" id="repLevel" />
											<button class="btn btn-sm btn-primary ms-2 px-4 mb-0 flex-shrink-0" id="commentButton">
												<i class="fas fa-paper-plane fs-5"></i>
											</button>
										</div>
									</div>
								<sec:csrfInput />
							</form:form>
							<sec:csrfInput/>
						</sec:authorize>
						
					</div>
				</div>
			</div>
		</div>
		<!-- Article single END -->
	</div>
</section>

<!-- 댓글창 -->
<div class="container">
	<div class="row">
	<!-- 댓글 조회 시작 -->
		<c:forEach var="cmtVO" items="${cmtList}" varStatus="stat">
			<div class="col-lg-10 mx-auto">
				<!-- Avatar and info -->
				<div class="d-flex align-items-center">
					<!-- Avatar -->
					<div class="avatar avatar-xl me-2 flex-shrink-0">
						<img class="avatar-img rounded-circle" src="/resources/booking/assets/images/avatar/user.png"
							alt="avatar" style="width: 50%; height: 50%;">
						<h8>${cmtVO.cmtWr}</h8>
						</br> <input type="hidden" name="cmtId" value="${cmtVO.cmtId}" />

					</div>
					<!-- Info -->
					<div class="ms-4"></div>
					<div class="col-md-8 col-xxl-9">
						<fmt:formatDate var="cmtDt" value="${cmtVO.cmtDt}" pattern="yyyy-MM-dd HH:mm:ss" />
						<h15 class="mb-1">${cmtDt}</h15>
						<p>${cmtVO.cmtCntn}</p>
					</div>


					<!-- 댓글작성자와 현재 사용자가 일치하는 경우에만 버튼 표시  -->
					<!-- Button -->
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.memVO" var="memVO" />
						<c:if test="${memVO.memId==cmtVO.cmtWr}">
						
							<div class="d-flex justify-content-between align-items-center"
								style="margin-left: auto;">
								<!-- 수정 -->
								<a href="#update-lg" id="cmtUpdate" class="text-primary-hover open-modal" onclick="cmtUpdate('${cmtVO.cmtId}')"
									data-bs-toggle="modal" data-bs-target="#cmtUpdateModal">
									<i class="fa-regular fa-pen-to-square"
									style="color: #969696;"></i>&nbsp;
								</a>

								<!-- 삭제 -->
								<a href="#" onclick="cmtDelete('${cmtVO.cmtId}')" class="text-primary-hover cmtDelete" >
									<i class="bi bi-trash3 me-1"></i>
								</a>
							</div>
						</c:if>
					</sec:authorize>
				</div>
			</div>
		</c:forEach>
	<!-- 댓글 조회 끝 -->
	</div>
</div>
<!-- 댓글 창 끝 -->


<!-- 수정: 글 수정하기 -->
<div class="modal fade cmtUpdateModal" id="cmtUpdateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">댓글 수정하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="reprt" modelAttribute="cmtVO" action="/member/tripBoard/tripDetail?${_csrf.parameterName}=${_csrf.token}" method="post">
          <div class="row">
            <div class="col-md-12">
              <div class="md-9">
                <label for="recipient-name" class="col-form-label">내용</label></br> 
                <label>
                  <textarea class="form-control" id="message-text1" name="cmtCntn" style="height: 200px;"></textarea>
                </label>
              </div>
            </div>
          </div>
          <sec:csrfInput />
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="update">수정하기</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
function inqDelete(brdId) {
	let object = {"brdId": brdId };
	
	// 확인 대화상자를 표시하여 사용자의 응답을 확인합니다.
	if (confirm("삭제하시겠습니까?")) {
		$.ajax({
			url: "/member/csc/inquiryDelete",
			contentType: "application/json;charset=utf-8",
			data: JSON.stringify(object),
			type: "post",
			beforeSend: function (xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function (result) {
				console.log("result : " + result);
				if (result == "success") {
					window.location.href = "/member/csc/inquiry";
				} else {
					alert("실패 메시지");
				}
			},
			error: function () {
				alert("요청을 처리하는 동안 오류가 발생했습니다");
			}
		});
	}
}
$(function () {
	
	$('#commentButton').on('click', function() {
		var brdId = "${inquiry.brdId}";
		var memId = "${memVO.memId}";
		var comment = $("#comment").val();
		if(comment == ""){
			alert("댓글 내용을 입력해주세요");
			return;
		}
		var data = {
			"brdId" : brdId,
			"memId" : memId,
			"cmtCntn" : comment,
		};
		$.ajax({
			url : "/member/tripBoard/cmtWrite",
			contentType:"application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "post",
			dataType: "text",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				if (result == "success") {
					$("#comment").val("");

				}else {
					alert("답변 등록에 실패하였습니다.");
				}
			}
		});
		
		var data = {
			"brdId" : brdId
		};
		$.ajax({
			url : "/admin/brd/inquiryAnswer",
			contentType:"application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "post",
			dataType: "text",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				if (result == "success") {
					alert("답변 등록되었습니다.")
					location.reload();
				}else {
					alert("답변 등록에 실패하였습니다.");
				}
			}
		});
	});
});


//댓글, 대댓글 수정하기
function cmtUpdate(cmtId){
	$('#update').on( 'click', function() {
		var brdId = "${inquiry.brdId}";
		var cmtCntn = document.getElementById("message-text1").value;
		var cmtDt =$("input[name='cmtIdUpdate']").val();
		console.log("brdId : " + brdId);
		if (cmtCntn == ""){
			alert("내용을 작성해주세요");
			return;
		}
		var data = {
			"brdId" : brdId,
			"cmtId" : cmtId,
			"cmtCntn" : cmtCntn
		}; 
		$.ajax({
			url : "/member/tripBoard/cmtUpdate",
			contentType : "application/json",
			data : JSON.stringify(data),
			type : "POST",
			dataType : "text",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			},
			success : function(result) {
				if (result == "success") {
					alert("수정성공");
					location.reload();
					// 작성해 놓은 댓글 삭제
					$("#comment").val("");
				}
			}
		}); 
	});
}

//댓글, 대댓글 삭제하기
function cmtDelete(cmtId){
	$('.cmtDelete').on( 'click', function() { 
		var brdId = $("input[name='brdId']").val();
		console.log(brdId)
		console.log(cmtId);
		var data = {
			"brdId" : brdId,
			"cmtId" : cmtId
		}
		console.log(data)
		$.ajax({
			url : "/member/tripBoard/cmtDelete",
			contentType : "application/json",
			data : JSON.stringify(data),
			type : "POST",
			dataType : "text",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			},
			success : function(result) {
				if (result == "success") {
					alert("삭제 성공했습니다.")
					location.reload();
				}

			}

		});
	});	
	
}



//댓글  관련 토글
$(document).ready(function() {
//대댓글 버튼에 클릭 이벤트를 바인딩합니다.
$(document).on("click", ".repToggle .u_cbox_btn_reply", function() {
// 대댓글을 감싸는 부모 요소의 클래스
var toggleClass = ".repToggle";

// 대댓글의 인덱스 찾기
var index = $(this).closest(toggleClass).index();

// 대댓글의 토글 상태 배열
var toggleStates = [];

// 모든 대댓글의 토글 상태를 false로 설정
$(toggleClass).each(function() {
  toggleStates.push(false);
});

// 대댓글의 토글 상태 토글하기
toggleStates[index] = !toggleStates[index];

// 토글 상태에 따라 대댓글 표시/숨김 처리
$(toggleClass).each(function(i) {
  if (toggleStates[i]) {
    $(this).find('.repContent').show();
    $(this).find('.repForm').show();
  } else {
    $(this).find('.repContent').hide();
    $(this).find('.repForm').hide();
  }
});
});
});
</script>



