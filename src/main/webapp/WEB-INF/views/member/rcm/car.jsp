<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style type="text/css">
.btn-primary {
  background-color: #2e8b57;
}

.btn-primary:hover {
  background-color: #fff;
  color: #2e8b57;
  border-color: #2e8b57;
}
</style>
</head>
<body>

<script type="text/javascript">
	function commend() {
		location.href="/member/rcm/carResult" ;
	}

</script>

<section class="pt-0">
	<div class="container">
		<!-- Background image -->
		<div class="rounded-3 p-3 p-sm-5" style="background-image: url(/resources/booking/assets/images/rntcar/car.png); background-position: center center; 
		background-repeat: no-repeat; background-size: 100% 100%; height: 400px;">
			<!-- Banner title -->
			<div class="row my-2 my-xl-5"> 
				<div class="col-md-8 mx-auto"> 
				</div>
			</div>

		</div>
			<form class="bg-mode shadow rounded-3 position-relative p-4 pe-md-5 pb-5 pb-md-4 mb-4" id="frm">
				<div class="row g-4 align-items-center">
				    <!-- 위치 -->
				    <div class="col-lg-6">
				        <div class="form-control-border form-control-transparent form-fs-md d-flex">
				            <!-- Icon -->
				            <!-- Select input -->
				            <div class="flex-grow-1">
				                <label class="form-label"></label>
				            </div>
				        </div>
				    </div>
				
				    <!-- 숙소 유형 -->
				    <div class="col-lg-6">
				        <div class="form-control-border form-control-transparent form-fs-md d-flex">
				            <!-- Icon -->
				            <!-- Select input -->
				            <div class="flex-grow-1 d-flex justify-content-end">
				                <div>
				                    <div class="text-end d-flex align-items-center" >
				                     <i class="fa fa-car fs-3 me-2 mt-2" style="height: 50px; color: #2e8b57;"></i>
				                        <button class="btn btn-primary" type="button" onclick="commend()" id="btn" >렌트카 추천받기</button>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
				</div> 
			</form>
	</div>
</section>
</body>