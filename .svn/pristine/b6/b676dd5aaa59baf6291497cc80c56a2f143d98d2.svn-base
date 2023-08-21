<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/font-awesome/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/splide-master/dist/css/splide.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/booking/assets/vendor/glightbox/css/glightbox.css">

<style>
.modal-dialog {
	max-width: 800px;
	max-height: 800px;
}

    .checkbox-container {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }
    
    .checkbox-container input[type="checkbox"] {
        order: -1;
        margin-right: 10px;
    }
input[type=checkbox]:checked + label:before{
    content: "\2714";
    text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);  
    font-size: 18px; 
    font-weight:600; 
    color: #fff;  
    background:#2f87c1;
    text-align: center;   
}
.card-img{
	width : 250px;
	height: 180px;
}
</style>



<!-- Main content START -->
<div class="col-lg-8 col-xl-9 ps-xl-5" >

	<!-- Offcanvas menu button -->
	<div class="d-grid mb-0 d-lg-none w-100">
		<button class="btn btn-primary mb-4" type="button"
			data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar"
			aria-controls="offcanvasSidebar">
			<i class="fas fa-sliders-h"></i> Menu
		</button>
	</div>

	<div class="card border bg-transparent">
		<!-- Card header -->
		<div class="card-header bg-transparent border-bottom">
			<h4 class="card-header-title">장바구니</h4>
		</div>
		<!-- Card body START -->
		<div class="card-body p-0">
			<!-- ======================= Tabs START -->
			<!-- Card body START -->
			<div class="card-body vstack gap-4">
				<div style="text-align: right;">
					<div class="form-check">
						<label class="form-check-label selectAll" for="selectAll">전체선택</label>
					</div>
					<!-- 삭제하기 버튼 -->
					<button class="btn btn-danger-soft mb-0 deleteButton" style="padding: 0.25rem 0.5rem; font-size: 0.875rem;">
						<i class="fas fa-trash me-2"></i>삭제하기
					</button>
				</div>
				<!-- 장바구니-->
				<div class="row g-2" id="divId">
					<c:forEach var="item" items="${itemList}" varStatus="stat">
						<div class="card border mb-4" style="margin-bottom: 20px;">
							<div class="card bg-transparent p-0">
							<div class="checkbox-container">
    						<input type="checkbox" name="xxx" value="${item.rmId}" class="checkbox">
								<div class="card-body p-4 mt-2">
									<div class="row g-2 g-sm-4">
										<!-- Image -->
										<div class="col-sm-4">
										<c:if test="${item.busiImg eq null}">
											<img src="/resources/booking/assets/images/category/hotel/4by3/04.jpg" class="card-img">
												
										</c:if>
										<c:if test="${item.busiImg != null}">
											<img src="/resources/upload/busi${item.busiImg}" class="card-img" alt="Card image">
										</c:if>
										</div>

										<!-- Card content -->
										<div class="col-sm-8">
											<div class="d-flex flex-column justify-content-between h-100">
												<!-- Title -->
												<h4 class="card-title mb-1">
													<a href="hotel-detail.html">${item.busiNm}</a>
												</h4>
												<div>
													<span>${item.rmNm} 룸</span> <span>${item.rmNum} 호</span>
												</div>
												<div>
													<!-- List -->
													<ul class="list-group list-group-borderless mb-0 mt-2 small">
														<li class="list-group-item d-flex p-0"><i
															class="far fa-calendar-alt me-2"></i> 체크인: ${item.rsvSt} - 체크아웃: ${item.rsvEd}</li>
													</ul>
												</div>
												<div style="margin-top: 20px; display: flex; align-items: center;">
												    <div style="margin-right: auto;">
												        <fmt:formatNumber pattern="#,###" value="${item.rmPr}" var="rmPr" type="number" />
												        <h4 class="card-title mb-1">${rmPr}원</h4>
												    </div>
												    <a href="/member/acm/detail/${item.busiId}" class="btn btn-primary-soft mb-0">
												        예약하기
												    </a>
												</div>
												
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</div>
					</c:forEach>
				</div>
				
				<!-- Counter END -->
			</div>
			<!-- Card body END -->
		</div>
	</div>
	</div>
	





	<!-- ======================= Tabs-content END -->

<script type="text/javascript">
$(document).ready(function() {
    $('.selectAll').click(function() {
      var checkboxes = $('input[type="checkbox"]');
      var isAllChecked = checkboxes.length === checkboxes.filter(':checked').length;
      checkboxes.prop('checked', !isAllChecked);
    });
    
    $('.deleteButton').click(function() {
        var checkedCheckboxes = $('input[type="checkbox"]:checked');
        var rmIds = [];
        checkedCheckboxes.each(function() {
            var rmId = $(this).val();
            rmIds.push(rmId);
            console.log(rmIds)
        });

        if (rmIds.length > 0) {
            $.ajax({
                url: '/member/mypage/cartList/deleteItem',
                type: 'POST',
                dataType: 'text',
                data: JSON.stringify(rmIds), // busiIds를 JSON 형태로 변환하여 전송
                contentType: 'application/json',
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function(response) {
                    location.reload();
                    checkedCheckboxes.closest('.cart-item').remove();
                },
                error: function(error) {
                    console.error('상품 삭제 실패:', error);
                }
            });
        }
    });
});
</script>


