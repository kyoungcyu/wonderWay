<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>

<sec:authentication property="principal.memVO" var="memVO" />
<script type="text/javascript">
var checkLikeBrd = "${checkLikeBrd}";
//좋아요 버튼 클릭 시 실행되는 함수
$(function () {
	$('#good').on('click', function() {
        var memId = "${memId}";
        if (!memId) {
            alert("로그인 한 회원만 가능합니다.");
            location.href = "/member/sign/signIn";
        } else {
            var brdId = $("input[name='brdId']").val();
            let object = {"brdId":brdId, "memId":memId};

            if (checkLikeBrd == 0) {
                $.ajax({
                    url: "/member/tripBoard/likeBrd",
                    contentType: "application/json",
                    data: JSON.stringify(object),
                    type: "post",
                    dataType: "text",
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                    },
                    success: function (result) {
                        if (result == "success") {
                            location.reload();
                            //좋아요수 증가
                        } else {
                            alert("문제가 발생했습니다.");
                        }
                    }
                });
            } else {
                $.ajax({
                    url: "/member/tripBoard/dislikeBrd",
                    contentType: "application/json",
                    data: JSON.stringify(object),
                    type: "post",
                    dataType: "text",
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                    },
                    success: function (result) {
                        if (result == "success") {
                            location.reload();
                        } else {
                            alert("문제가 발생했습니다.");
                        }
                    }
                });
            }
        }
    });
});
</script>

<section class="pt-0">
	<div class="container">
		<!-- Hero banner START -->
		<div class="row">
			<div class="col-12">
				<!-- Card START -->
				<div class="card card-body bg-primary justify-content-center text-center px-4 px-sm-5 pt-6 pt-md-8 pb-8" style="background-image: url(assets/images/element/bg-pattern.png); background-position: center center; background-repeat: no-repeat; background-size: cover;">
					<!-- Title -->
					<h1 class="fs-2 text-white mb-4">${notice.brdTt}</h1>
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
							<li class="nav-item">작성일시 : <fmt:formatDate value="${notice.frstDt}" pattern="yyyy-MM-dd HH:mm:ss" /></li>
							<li class="nav-item">수정일시 : <fmt:formatDate value="${notice.lastDt}" pattern="yyyy-MM-dd HH:mm:ss" /></li>
							<li class="nav-item">조회수 : ${notice.inqCnt}</li>
							<li class="nav-item">작성자 : 관리자</li>
							<input type="hidden" name="brdId" value="${notice.brdId}"/>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li class="nav-item" style="margin-left: auto;"><a class="btn btn-sm btn-primary mb-0" href="/admin/brd/noticeModify?brdId=${notice.brdId}" style="color: white;">수정</a></li>
								<sec:csrfInput/>
							</sec:authorize>
						</ul>
					</div>
					<div class="card-header border-bottom  p-3">
						<!-- Update and author -->
						<ul class="nav nav-divider">
							<li class="nav-item">첨부파일 : <a href="/download?filename=/notice${savePath}">${fileName}</a>   [<fmt:formatNumber value="${fileSz}" pattern="#,###" /> KB]</li>
						</ul>
					</div>
					<!-- Card header END -->

					<!-- Card body START -->
					<div class="card-body p-4">
						${notice.brdCntn}
					</div>
					<!-- Card body END -->

					<!-- Card footer START -->
					<sec:authorize access="hasRole('ROLE_MEMBER')">
						<div class="card-body p-4">
							<div class="border p-3 rounded d-lg-flex align-items-center justify-content-between text-center">
							<!-- Title -->
								<h5 class="m-0">이 공지사항이 맘에 드시나요?</h5>
								<!-- Check buttons -->
								<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
									<!-- Yes button -->
									<input type="radio" class="btn-check" name="btnradio" id="btnradio1">
									<label class="btn btn-outline-light btn-sm mb-0" for="btnradio1" id="good"><i class="fa-solid fa-thumbs-up me-1"></i>${notice.brdLike}</label>
								</div>
							</div>
						</div>
						<sec:csrfInput/>
					</sec:authorize>
					<!-- Card footer END -->
					
					<div class="card-footer border-0 p-4 pt-0">
						<sec:authorize access="hasRole('ROLE_MEMBER') or hasRole('ROLE_ADMIN')">
							<form:form modelAttribute="cmtVO" id="cmtWrite" action="/member/tripBoard/cmtWrite?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" >
									<div class="collapse show" id="collapseComment" style="margin-bottom: 10px;">
										<div class="d-flex mt-3">
											<textarea class="form-control mb-0" id="comment" placeholder="댓글을 작성해주세요" rows="2" spellcheck="false" name="cmtCntn"></textarea>
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
				
				<div style="float: right;" id="repCmt" class="u_cbox_btn_reply u_cbox_btn_reply_on reply-text">
					<strong class="u_cbox_reply_txt">답 글</strong>
				</div>
			</div>
			
				<!-- 대댓글 기능 시작 -->
			<div class="repToggle">
				<div id="repToggle" class="repToggle" style="margin-left: 85px; width: calc(100% - 100px);">
				

					<!-- 대댓글 조회 -->
					<c:forEach var="repCmtList" items="${repCmtList}" varStatus="stat">
						<c:if test="${cmtVO.cmtId==repCmtList.repCmtId}">
							<div class="row Toggle">
								<div class="col-lg-10 mx-auto">
									<!-- 대댓글 내용 시작 -->
									<div class="d-flex align-items-center">
										<!-- 대댓글 작성자 프로필 사진, 아이디 -->
										<div class="avatar avatar-xl me-2 flex-shrink-0">
											<img class="avatar-img rounded-circle" src="/resources/booking/assets/images/avatar/user.png"
												alt="avatar" style="width: 50%; height: 50%;">
											<h8>${repCmtList.cmtWr}</h8>
											<br> <input type="hidden" name="cmtId" value="${repCmtList.cmtId}" />
										</div>
										<!-- Info -->
										<div class="ms-1">
											<div class="col-md-40">
												<fmt:formatDate var="cmtDt" value="${repCmtList.cmtDt}"
													pattern="yyyy-MM-dd HH:mm:ss" />
												<h15 class="mb-1">${cmtDt}</h15>
												<p>${repCmtList.cmtCntn}</p>
											</div>
										</div>
										
										<!-- 대댓글 수정, 삭제 -->
										<!-- Button -->
										<div class="ms-auto" style="margin-left: -400px; margin-right: -7px; display: flex;">
											<sec:authorize access="isAuthenticated()">
												<sec:authentication property="principal.memVO" var="memVO" />
												<c:if test="${memVO.memId==repCmtList.cmtWr}">
													<div class="text-primary-hover ms-2 d-flex align-items-center">
														<!-- 수정 -->
														<a href="#update-lg" id="cmtUpdate" class="text-primary-hover open-modal" onclick="cmtUpdate('${repCmtList.cmtId}')"
															data-bs-toggle="modal" data-bs-target="#cmtUpdateModal">
															<i class="fa-regular fa-pen-to-square"
															style="color: #969696;"></i>&nbsp;
														</a>
														<!-- 삭제 -->
														<a href="#" onclick="cmtDelete('${repCmtList.cmtId}')" class="text-primary-hover cmtDelete">
															<i class="bi bi-trash3 me-1"></i>
														</a>
													</div>
												</c:if>
											</sec:authorize>
										</div>
										<!-- 대댓글 수정, 삭제 끝 -->
									</div>
										<!-- 대댓글 내용 끝-->
								</div>
							</div>
						</c:if>
					</c:forEach>
					<!-- 대댓글 조회 끝 -->
					
					
					<!-- 대댓글 작성 시작 -->
					<div class="d-flex mt-3" style="margin-left: 90px; width: calc(100% - 170px);">

						<textarea class="form-control mb-0" id="repComment"
							placeholder="댓글을 작성해주세요" rows="2" spellcheck="false"
							name="cmtCntn"></textarea>
						<input type="hidden" class="form-control" name="cmtWrUpdate"
							id="cmtWr" value="<sec:authentication property="principal.username"/>" />
						<input type="hidden" class="form-control" name="brdIdRep"
							value="${brdVO.brdId}" id="brdId" /> <input type="hidden"
							class="form-control" name="cmtIdRep" id="cmtId"
							value="${cmtVO.cmtId}" /> <input type="hidden"
							class="form-control" name="cmtDtRep" id="cmtDt" /> <input
							type="hidden" class="form-control" name="repCmtId"
							id="repCmtId" value="${repCmtId}" />
						<button type="button"
							class="btn btn-sm btn-primary ms-2 px-4 mb-0 flex-shrink-0 repCommentButton"
							>
							<i class="fas fa-paper-plane fs-5"></i>
						</button>
					</div>
					<!-- 대댓글 작성 끝-->
					<hr class="dotted">
			</div>
			</div>
			<!-- 대댓글 기능 끝 -->
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
$(function () {
	$('#commentButton').on('click', function() {
		console.log("test");
		var brdId = "${notice.brdId}";
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
					alert("작성되었습니다.")
					location.reload();
					$("#comment").val("");

				}else {
					alert("등록에 실패하였습니다.");
				}
			}
		});
	});
});
//대댓글 작성하기
//답글 토글 기능
$(document).ready(function() {
	$(".u_cbox_btn_reply").click(function() {
  		var toggleElement = $(this).closest(".col-lg-10").next(".repToggle");
  		toggleElement.slideToggle('slow');
	});
});


//대댓글 작성하기
$(function() {
	$('.repCommentButton').on('click', function() {
		var brdId = $(this).prev().prev().prev().prev().val();
		var repCmtId = $(this).prev().prev().prev().val();
		var memId = "${memVO.memId}";
		var repComment = $(this).parent().children("textarea").val();
		var data = {
			"brdId" : brdId,
			"memId" : memId,
			"cmtCntn" : repComment,
			"repCmtId":repCmtId
		};
		//로그인한 회원만 가능하도록
		if (!memId) {
			alert("로그인 한 회원만 가능합니다.");
			location.href = "/member/sign/signIn";
		} else {
			if (comment.length !== 0) {
				$.ajax({
					url : "/member/tripBoard/replyWrite",
					contentType:"application/json;charset=utf-8",
					data : JSON.stringify(data),
					type : "post",
					dataType: "text",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result) {
						if (result == "success") {
							alert("작성되었습니다.")
							location.reload();
							$("#repComment").val("");

						}else {
							alert("등록에 실패하였습니다.");
						}
					}
				})
			} else{
				alert("내용을 입력해주세요.");
			}
		}
	});
});
	
//대댓글 수정하기 - 모달창 열기
document.addEventListener('DOMContentLoaded', function() {
	var openModalButtons = document.querySelectorAll('.open-modal');

	openModalButtons.forEach(function(button) {
		button.addEventListener('click', function() {
	    var modal = document.querySelector('.modal.fade.cmtUpdateModal');
	    modal.classList.add('show');
	    document.body.classList.add('modal-open');
	  });
	});
});


//댓글, 대댓글 수정하기
function cmtUpdate(cmtId){
	$('#update').on( 'click', function() {
		var brdId = "${notice.brdId}";
		var cmtCntn = document.getElementById("message-text1").value;
		var cmtDt =$("input[name='cmtIdUpdate']").val();
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
// 대댓글 버튼에 클릭 이벤트를 바인딩합니다.
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



