<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
  /* page-loading */
  #loading {
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    position: fixed;
    display: none; /* Initially hidden */
    z-index: 99;
    text-align: center;
    opacity : 0.8;
    background: #e4e4e4;
  }

  #loading > img {
    position: absolute;
    top: 36%;
    left: 45%;
    z-index: 100;
  }

  #loading > p {
    position: absolute;
    top: 70%;
    left: 50%;
    z-index: 101;
    font-size: 30px;
  }
</style>

<script type="text/javascript">
  $(function () {
    $("#btn").on("click", function () {
      // Show loading image
      $("#loading").show();

      // Simulate loading for 2 seconds
      setTimeout(function () {
        // Hide loading image
        $("#loading").hide();

        // Submit the form
        $("#frm").submit();
      }, 1000);
    });
  });
</script>

<section class="pt-0">
  <div class="container">
    <!-- Background image -->
    <div class="rounded-3 p-3 p-sm-5"
      style="background-image: url(/resources/booking/assets/images/rcmSty.jpg); background-position: center center; background-repeat: no-repeat; background-size: cover;">
      <!-- Banner title -->
      <div class="row my-2 my-xl-5">
        <div class="col-md-8 mx-auto">
          <h1 class="text-center text-white">회원 맞춤 숙소 추천</h1>
        </div>
      </div>

      <form class="bg-mode shadow rounded-3 position-relative p-4 pe-md-5 pb-5 pb-md-4 mb-4" id="frm">
        <div class="row g-4 align-items-center">
          <!-- 위치 -->
          <div class="col-lg-6">
            <div class="form-control-border form-control-transparent form-fs-md d-flex">
              <!-- Icon -->
              <i class="bi bi-geo-alt fs-3 me-2 mt-2"></i>
              <!-- Select input -->
              <div class="flex-grow-1">
                <label class="form-label">위치</label>
                <select name="loc" class="form-select js-choice">
                  <option value="">위치 선택</option>
                  <option value="서울" <c:if test="${param.loc eq '서울'}">selected</c:if>>서울</option>
                  <option value="부산" <c:if test="${param.loc eq '부산'}">selected</c:if>>부산</option>
                  <option value="제주" <c:if test="${param.loc eq '제주'}">selected</c:if>>제주</option>
                  <option value="경기" <c:if test="${param.loc eq '경기'}">selected</c:if>>경기</option>
                  <option value="인천" <c:if test="${param.loc eq '인천'}">selected</c:if>>인천</option>
                  <option value="강원" <c:if test="${param.loc eq '강원'}">selected</c:if>>강원</option>
                  <option value="경남" <c:if test="${param.loc eq '경상'}">selected</c:if>>경상</option>
                  <option value="전라" <c:if test="${param.loc eq '전라'}">selected</c:if>>전라</option>
                  <option value="충청" <c:if test="${param.loc eq '충청'}">selected</c:if>>충청</option>
                </select>
              </div>
            </div>
          </div>

          <!-- 숙소 유형 -->
          <div class="col-lg-6">
            <div class="form-control-border form-control-transparent form-fs-md d-flex">
              <!-- Icon -->
              <i class="fa fa-hotel fs-3 me-2 mt-2"></i>
              <!-- Select input -->
              <div class="flex-grow-1">
                <label class="form-label">숙소 유형</label>
                <select name="acmdCode" class="form-select js-choice">
                  <option value="">숙소 유형 선택</option>
                  <option value="A01" <c:if test="${param.acmdCode eq 'A01'}">selected</c:if>>호텔</option>
                  <option value="A02" <c:if test="${param.acmdCode eq 'A02'}">selected</c:if>>모텔</option>
                  <option value="A03" <c:if test="${param.acmdCode eq 'A03'}">selected</c:if>>리조트</option>
                  <option value="A04" <c:if test="${param.acmdCode eq 'A04'}">selected</c:if>>게스트하우스</option>
                  <option value="A05" <c:if test="${param.acmdCode eq 'A05'}">selected</c:if>>펜션</option>
                </select>
              </div>
            </div>
          </div>
        </div>
        <!-- Button -->
        <div class="btn-position-md-middle">
          <a id="btn" class="icon-lg btn btn-round btn-primary mb-0">
            <i class="bi bi-search fa-fw"></i>
          </a>
        </div>
      </form>
    </div>
  </div>
</section>

  <section class="pt-0">
    <div class="container">
      <div class="row">
      <table class="table align-middle p-4 mb-0 table-hover table-shrink">
		<!-- Table head -->
		<thead class="table-light">
			<tr>
				<th scope="col" class="border-0 rounded-start text-center">업체명</th>
				<th scope="col" class="border-0 text-center">위치</th>
				<th scope="col" class="border-0 text-center rounded-end">별점</th>
			</tr>
		</thead>
		<c:forEach var="busiVO" items="${busiVO}" varStatus="stat">
			<tbody class="border-top-0">
				<!-- Table item -->
				<tr>
					<td><h6><a href="/member/acm/detail/${busiVO.busiId}">${busiVO.busiNm}</a></h6></td>
					<td>${busiVO.busiLoc}</td>
					<td><i class="fa-solid fa-star text-warning ms-1"></i>${busiVO.busiScr}</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
      </div>
      <!-- Row END -->
    </div>
  </section>

<!-- Loading image -->
<div id="loading">
  <img src="/resources/booking/assets/images/ai.gif">
  <p>AI 추천 중..</p>
</div>
