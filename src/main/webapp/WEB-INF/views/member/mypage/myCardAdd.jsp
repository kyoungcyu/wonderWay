<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>


<!-- Main content START -->
<div class="col-lg-8 col-xl-9 ps-xl-5">

	<!-- Offcanvas menu button -->
	<div class="d-grid mb-0 d-lg-none w-100">
		<button class="btn btn-primary mb-4" type="button"
			data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar"
			aria-controls="offcanvasSidebar">
			<i class="fas fa-sliders-h"></i> Menu
		</button>
	</div>

	<!-- Payment detail START -->
	<div class="card bg-transparent border">
		<!-- Card header -->
		<div class="card-header bg-transparent border-bottom">
			<h4 class="card-header-title">카드 추가</h4>
		</div>

		<div class="card-body">
			<form class="row text-start g-4">
				<!-- Card number -->
				<div class="col-12">
					<label class="form-label">카드 번호<span class="text-danger">*</span></label>
					<div class="position-relative">
						<input type="text" class="form-control"
							placeholder="xxxx xxxx xxxx xxxx"> <img
							src="/resources/booking/assets/images/element/visa.svg"
							class="w-40px position-absolute top-50 end-0 translate-middle-y me-2 d-none d-sm-block"
							alt="">
					</div>
				</div>
				<!-- Expiration Date -->
				<div class="col-md-6">
					<label class="form-label">유효 날짜<span class="text-danger">*</span></label>
					<div class="input-group">
						<input type="text" class="form-control" maxlength="2"
							placeholder="Month"> <input type="text"
							class="form-control" maxlength="4" placeholder="Year">
					</div>
				</div>
				<!-- Cvv code  -->
				<div class="col-md-6">
					<label class="form-label">CVV / CVC<span
						class="text-danger">*</span></label> <input type="text"
						class="form-control" maxlength="3" placeholder="xxx">
				</div>
				<!-- Card name -->
				<div class="col-12">
					<label class="form-label">카드 이름<span class="text-danger">*</span></label>
					<input type="text" class="form-control"
						aria-label="name of card holder" placeholder="Enter name">
				</div>
				<!-- Button -->
				<div class="col-12">
					<button class="btn btn-primary mb-0" id="addCard">추가하기</button>
				</div>
			</form>
		</div>



	</div>
	<!-- Add new card END -->

</div>
<!-- Card body END -->
</div>
<!-- Payment detail END -->

</div>
<!-- Main content END -->
