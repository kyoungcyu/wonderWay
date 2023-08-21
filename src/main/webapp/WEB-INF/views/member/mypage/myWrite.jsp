<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>


<script type="text/javascript">
	$(function() {
		$(".sort").on("change", function() {
			this.form.submit();
		});
	
		$(".nav-link").on(
				"click",
				function() {
					$("input[name=currentTab]").val(
							$(this).attr("href").substring(1))
				})
	
		console.log("---------->>> ", $(
				"a[href='#${param.currentTab}']").get(0))
		// 	$(".nav-link a").each(function(i,v){
		// 		$(this).removeClass("active");
		// 		$(this).attr("aria-selected", false);
		// 	})
	
		// 	$("a[href='${param.currentTab}']").addClass("active");
		// 	$("a[href='${param.currentTab}']").attr("aria-selected", true);
		$("a[href='#${param.currentTab}']").get(0).click();

	})
</script>
<!-- Main content START -->
<div class="col-12 col-xl-9 ps-xl-5">

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
			<h4 class="card-header-title" id="testtesttest">나의 작성글</h4>
		</div>

		<!-- Card body START -->
		<div class="card-body p-0">

			<!-- Tabs -->
			<ul class="nav nav-tabs nav-bottom-line nav-responsive nav-justified">
				<li class="nav-item"><a class="nav-link mb-0 active"
					data-bs-toggle="tab" href="#tab-1"><i
						class="bi bi-briefcase-fill fa-fw me-1"></i>여행후기</a></li>
				<li class="nav-item"><a class="nav-link mb-0"
					data-bs-toggle="tab" href="#tab-2"><i
						class="bi bi-x-octagon fa-fw me-1"></i>질문답변</a></li>
				<li class="nav-item"><a class="nav-link mb-0"
					data-bs-toggle="tab" href="#tab-3"> <i
						class="bi bi-patch-check fa-fw me-1"></i>상품리뷰
				</a></li>
				<li class="nav-item"><a class="nav-link mb-0"
					data-bs-toggle="tab" href="#tab-4"><i
						class="bi bi-patch-check fa-fw me-1"></i>댓글</a></li>
			</ul>

			<!-- 탭 4개 내용 div -->
			<div class="tab-content p-1 p-sm-1" id="nav-tabContent">

				<!-- 탭1 -->
				<div class="tab-pane fade show active" id="tab-1">
					<!-- 나의 작성글 리뷰  -->
					<!-- Reviews1  START -->
					<div class="col-12">

						<form action="/member/mypage/myWrite?currentPage=${pNo}"
							class="row g-3 align-items-center">
							<input type="hidden" name="currentTab"
								value="${param.currentTab}">

							<!-- Select - Sort by -->
							<div class="col-md-6 col-lg-2">
								<select class="form-select js-choice sort"
									aria-label=".form-select-sm" name="sort">
									<option value="">Sort by</option>
									<option value="frstDt"
										<c:if test="${param.sort=='frstDt'}">selected</c:if>>최근순</option>
									<option value="brdLike"
										<c:if test="${param.sort=='brdLike'}">selected</c:if>>인기순</option>
									<option value="inqCnt"
										<c:if test="${param.sort=='inqCnt'}">selected</c:if>>조회순</option>
								</select>
							</div>

							<!-- Empty column for spacing -->
							<div class="col-md-6 col-lg-6"></div>

							<!-- Search input -->
							<div class="col-md-6 col-lg-4">
								<div
									class="rounded position-relative d-flex justify-content-end">
									<input class="form-control bg-transparent" type="search"
										placeholder="검색어를 입력해주세요" name="keyword"
										value="${param.keyword}" aria-label="Search">
									<button
										class="bg-transparent p-2 border-0 text-primary-hover text-reset"
										type="submit" value="검색">
										<i class="fas fa-search fs-6"></i>
									</button>
								</div>
							</div>
						</form>



						<!-- Card body START -->
						<div class="card-body">
							<div class="table-responsive border-0">
								<table
									class="table align-middle p-0 mb-0 table-hover table-shrink">
									<!-- Table head -->
									<thead class="table-light text-center">
										<tr>
											<!-- 												<th scope="col" class="border-0 rounded-start"> -->
											<!-- 													<input type="checkbox" class="mb-0 text-center" name="xxx" value="yyy"> -->
											<!-- 												</th> -->
											<th colspan='6' scope="col" class="border-0">제목</th>
											<th colspan='3' scope="col" class="border-0">작성일</th>
											<th scope="col" class="border-0">조회수</th>
											<th scope="col" class="border-0 rounded-end">좋아요</th>
										</tr>
									</thead>

									<!-- Table body START -->
									<tbody class="border-top-0 text-center">
										<c:forEach var="myWriteList1" items="${myWriteList1}"
											varStatus="stat">
											<!-- Table item -->
											<tr>
												<!-- 													<td> -->
												<!-- 													<input type="checkbox" class="mb-0 text-center" name="xxx" value="yyy"> -->
												<!-- 													</td> -->
												<td colspan='6'>
													<div class="mb-0 text-center" style="font-size: 15px;">
														<a
															href="/member/tripBoard/tripDetail?brdId=${myWriteList1.brdId}">${myWriteList1.brdTt}</a>
													</div>
												</td>
												<fmt:formatDate var="frstDt" value="${myWriteList1.frstDt}"
													pattern="yyyy/MM/dd HH:mm:ss" />
												<td colspan='3'><div class="mb-0 fw-light text-center"
														style="font-size: 15px;">${frstDt}</div></td>
												<td>
													<div class="mb-0 fw-light text-center"
														style="font-size: 15px;">${myWriteList1.inqCnt}</div>
												</td>
												<td>
													<div class="mb-0 fw-light text-center"
														style="font-size: 15px;">${myWriteList1.brdLike}</div>
												</td>
											</tr>

										</c:forEach>
									</tbody>
									<!-- Table body END -->
								</table>
							</div>
							<!-- Hotel room list END -->
						</div>
						<!-- Card body END -->

						<!-- 페이징처리 -->
						<div class="card-footer pt-0 mt-3">
							<!-- Pagination and content -->
							<div
								class="d-sm-flex justify-content-sm-between align-items-sm-center">
								<!-- Content -->
								<c:set var="endRow"
									value="${qnaPage.currentPage * qnaPage.size}" />
								<c:set var="startRow" value="${endRow - (qnaPage.size - 1)}" />
								<c:set var="total" value="${qnaPage.total}" />
								<c:if test="${endRow>total}">
									<c:set var="endRow" value="${total}" />
								</c:if>
								<p class="mb-sm-0 text-center text-sm-start">Showing
									${startRow} to ${endRow} of ${total} entries</p>
								<!-- Pagination -->
								<nav class="mb-sm-0 d-flex justify-content-center"
									aria-label="navigation">
									<ul
										class="pagination pagination-sm pagination-primary-soft mb-0 ">
										<li
											class="page-item <c:if test='${qnaPage.startPage < 6}'>disabled</c:if>"
											id="dataTable_previous"><a class="page-link"
											href="/member/mypage/myWrite?currentPage=${qnaPage.startPage-5}&sort=${param.sort}&keyword=${param.keyword}&currentTab=${param.currentTab}"
											aria-controls="dataTable" data-dt-idx="0" tabindex="-1">Prev</a>
										</li>
										<c:forEach var="pNo" begin="${qnaPage.startPage}"
											end="${qnaPage.endPage}">
											<li
												class="page-item <c:if test='${param.currentPage eq pNo}'>active</c:if>">
												<a
												href="/member/mypage/myWrite?currentPage=${pNo}&sort=${param.sort}&keyword=${param.keyword}&currentTab=${param.currentTab}"
												aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0"
												class="page-link">${pNo}</a>
											</li>
										</c:forEach>
										<li
											class="page-item <c:if test='${qnaPage.endPage == qnaPage.totalPages}'>disabled</c:if>"
											id="dataTable_next"><a class="page-link"
											href="/member/mypage/myWrite?currentPage=${qnaPage.startPage+5}&sort=${param.sort}&keyword=${param.keyword}&currentTab=${param.currentTab}"
											aria-controls="dataTable" data-dt-idx="7" tabindex="-1">Next</a>
										</li>
									</ul>
								</nav>
							</div>
						</div>
						<!-- 페이징처리 END -->
					</div>
				</div>
				<!-- 나의 작성글 리뷰 끝 -->




				<!-- 탭2 나의 작성글 내역 - 여행후기 글 -->
				<div class="tab-pane fade" id="tab-2">
					<div class="col-12">
						<form action="/member/mypage/myWrite?currentPage2=${pNo}"
							class="row g-3 align-items-center">
							<input type="hidden" name="currentTab"
								value="${param.currentTab}">

							<!-- Select - Sort by -->
							<div class="col-md-6 col-lg-2">
								<select class="form-select js-choice sort"
									aria-label=".form-select-sm" name="sort">
									<option value="">Sort by</option>
									<option value="frstDt"
										<c:if test="${param.sort=='frstDt'}">selected</c:if>>최근순</option>
									<option value="brdLike"
										<c:if test="${param.sort=='brdLike'}">selected</c:if>>인기순</option>
									<option value="inqCnt"
										<c:if test="${param.sort=='inqCnt'}">selected</c:if>>조회순</option>
								</select>
							</div>

							<!-- Empty column for spacing -->
							<div class="col-md-6 col-lg-6"></div>

							<!-- Search input -->
							<div class="col-md-6 col-lg-4">
								<div
									class="rounded position-relative d-flex justify-content-end">
									<input class="form-control bg-transparent" type="search"
										placeholder="검색어를 입력해주세요" name="keyword"
										value="${param.keyword}" aria-label="Search">
									<button
										class="bg-transparent p-2 border-0 text-primary-hover text-reset"
										type="submit" value="검색">
										<i class="fas fa-search fs-6"></i>
									</button>
								</div>
							</div>
						</form>

						<!-- Card body START -->
						<div class="card-body">
							<div class="table-responsive border-0">
								<table
									class="table align-middle p-0 mb-0 table-hover table-shrink">
									<!-- Table head -->
									<thead class="table-light text-center">
										<tr>
											<!-- 												<th scope="col" class="border-0 rounded-start"><input type="checkbox" class="mb-0 text-center" name="xxx" value="yyy"></th> -->
											<th colspan='6' scope="col" class="border-0">제목</th>
											<th colspan='3' scope="col" class="border-0">작성일</th>
											<th scope="col" class="border-0">조회수</th>
											<th scope="col" class="border-0 rounded-end">좋아요</th>
										</tr>
									</thead>

									<!-- Table body START -->
									<tbody class="border-top-0 text-center">
										<c:forEach var="myWriteList2" items="${myWriteList2}"
											varStatus="stat">
											<!-- Table item -->
											<tr>
												<!-- 													<td> -->
												<!-- 														<div class="mb-0 text-center" style="font-size:15px;"><input type="checkbox" class="mb-0 text-center" name="xxx" value="yyy"> -->
												<!-- 														</div> -->
												<!-- 													</td> -->
												<td colspan='6'>
													<div class="mb-0 text-center" style="font-size: 15px;">
														<a
															href="/member/qnaBoard/qnaDetail?brdId=${myWriteList2.brdId}">${myWriteList2.brdTt}</a>
													</div>
												</td>
												<fmt:formatDate var="frstDt" value="${myWriteList2.frstDt}"
													pattern="yyyy/MM/dd HH:mm:ss" />
												<td colspan='3'><div class="mb-0 fw-light text-center"
														style="font-size: 15px;">${frstDt}</div></td>
												<td>
													<div class="mb-0 fw-light text-center"
														style="font-size: 15px;">${myWriteList2.inqCnt}</div>
												</td>
												<td>
													<div class="mb-0 fw-light text-center"
														style="font-size: 15px;">${myWriteList2.brdLike}</div>
												</td>
											</tr>

										</c:forEach>
									</tbody>
									<!-- Table body END -->
								</table>
							</div>
							<!-- Hotel room list END -->
						</div>
						<!-- Card body END -->

						<!-- 페이징처리 -->
						<div class="card-footer pt-0 mt-3">
							<!-- Pagination and content -->
							<div
								class="d-sm-flex justify-content-sm-between align-items-sm-center">
								<!-- Content -->
								<c:set var="endRow"
									value="${qnaPage2.currentPage * qnaPage2.size}" />
								<c:set var="startRow" value="${endRow - (qnaPage2.size - 1)}" />
								<c:set var="total2" value="${qnaPage2.total}" />
								<c:if test="${endRow>total2}">
									<c:set var="endRow" value="${total2}" />
								</c:if>
								<p class="mb-sm-0 text-center text-sm-start">Showing
									${startRow} to ${endRow} of ${total2} entries</p>
								<!-- Pagination -->
								<nav class="mb-sm-0 d-flex justify-content-center"
									aria-label="navigation">
									<ul
										class="pagination pagination-sm pagination-primary-soft mb-0 ">
										<li
											class="page-item <c:if test='${qnaPage2.startPage < 6}'>disabled</c:if>"
											id="dataTable_previous"><a class="page-link"
											href="/member/mypage/myWrite?currentPage2=${qnaPage2.startPage-5}&sort=${param.sort}&keyword=${param.keyword}&currentTab=${param.currentTab}"
											aria-controls="dataTable" data-dt-idx="0" tabindex="-1">Prev</a>
										</li>
										<c:forEach var="pNo" begin="${qnaPage2.startPage}"
											end="${qnaPage2.endPage}">
											<li
												class="page-item <c:if test='${param.currentPage2 eq pNo}'>active</c:if>">
												<a
												href="/member/mypage/myWrite?currentPage2=${pNo}&sort=${param.sort}&keyword=${param.keyword}&currentTab=${param.currentTab}"
												aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0"
												class="page-link">${pNo}</a> <!-- 									<a --> <%-- 									href="/member/mypage/myWrite?currentPage2=${pNo}&sort=${param.sort}&keyword=${param.keyword}&currentTab=${param.currentTab}" --%>
												<%-- 									aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0" --%>
												<%-- 									class="page-link">${pNo}</a> --%>
											</li>
										</c:forEach>
										<li
											class="page-item <c:if test='${qnaPage2.endPage == qnaPage2.totalPages}'>disabled</c:if>"
											id="dataTable_next"><a class="page-link"
											href="/member/mypage/myWrite?currentPage2=${qnaPage2.startPage+5}&sort=${param.sort}&keyword=${param.keyword}&currentTab=${param.currentTab}"
											aria-controls="dataTable" data-dt-idx="7" tabindex="-1">Next</a>
										</li>
									</ul>
								</nav>
							</div>
						</div>
						<!-- 페이징 처리 END -->






					</div>
				</div>
				<!-- 질문답변 끝 -->


				<!-- 3.리뷰 조회  START -->
				<div class="tab-pane fade" id="tab-3">
					<div class="bg-mode shadow p-4 rounded overflow-hidden">

						<!-- Review START -->
						<div class="row">
							<div class="col-12">
								<div class="card border rounded-3">

									<!-- Card body START -->
									<c:forEach var="myWriteListReview" items="${myWriteListReview}"
										varStatus="stat">
										<div class="card-body">
											<div class="bg-light rounded p-3">
												<!-- Review item START -->

												<div class="d-sm-flex justify-content-between">
													<!-- Avatar image -->
													<div class="d-sm-flex align-items-center mb-3">
														<!-- Title -->
														<div>
															<h6 class="m-0">${myWriteListReview.busiNm}</h6>
															<fmt:formatDate var="rvwDt"
																value="${myWriteListReview.rvwDt}"
																pattern="yyyy/MM/dd HH:mm:ss" />
															<span class="me-3 small">${rvwDt}</span>
														</div>
													</div>

													<!-- Review star -->
													<c:if test="${myWriteListReview.rvwStar > 0}">
														<ul class="list-inline mb-2 mb-sm-0">
															<c:forEach var="i" begin="1" end="5">
																<c:choose>
																	<c:when test="${i <= myWriteListReview.rvwStar}">
																		<li class="list-inline-item me-0"><i
																			class="fas fa-star text-warning"></i></li>
																	</c:when>
																	<c:otherwise>
																		<c:if test="${i <= myWriteListReview.rvwStar + 0.5}">
																			<li class="list-inline-item me-0"><i
																				class="fas fa-star-half-alt text-warning"></i></li>
																		</c:if>
																		<c:if test="${i > myWriteListReview.rvwStar + 0.5}">
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																		</c:if>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
														</ul>
													</c:if>



												</div>

												<!-- Content -->
												<p>${myWriteListReview.rvwCntn}</p>

												<!-- Image -->
												<div class="row g-4">
													<div class="col-4 col-sm-3 col-lg-2">
														<a href="assets/images/category/hotel/4by3/07.jpg"
															data-glightbox data-gallery="gallery"> <img
															src="assets/images/category/hotel/4by3/07.jpg"
															class="rounded" alt="">
														</a>
													</div>

													<div class="col-4 col-sm-3 col-lg-2">
														<a href="assets/images/category/hotel/4by3/08.jpg"
															data-glightbox data-gallery="gallery"> <img
															src="assets/images/category/hotel/4by3/08.jpg"
															class="rounded" alt="">
														</a>
													</div>
												</div>

<!-- <!--사진 첨부 --> 
<%-- <c:if test="${myWriteListReview.attachVO.attachDeVOList.get(0).savePath != null}"> --%>
<!--   <div class="card-body px-0 pb-0" id="div01"> -->
<!--     <div class="row g-4"> -->
<%--       <c:forEach items="${myWriteListReview.attachVO.attachDeVOList.get(0).savePath}" var="imagePath"> --%>
<!--         <div class="col-md-4" id="div01Img"> -->
<%--           <img src="/resources/upload/rvw${imagePath}"> --%>
<!--         </div> -->
<%--       </c:forEach> --%>
<!--     </div> -->
<!--   </div> -->
<%-- </c:if> --%>
<!--     사진첨부 END -->


	<!-- Image -->
								<div class="row g-4">
									<c:if test="${myWriteListReview.attachVO.attachDeVOList!=null}">
										<c:forEach var="attachDeVOList" items="${myWriteListReview.attachVO.attachDeVOList}" varStatus="stat">
											<div class="col-4 col-sm-3 col-lg-2">
												<img src="/resources/upload/rvw${attachDeVOList.savePath}"
													class="rounded" alt="/resources/upload/rvw${attachDeVOList.savePath}">
												
											</div>
										</c:forEach>
									</c:if>
								</div>
								
								
								
								




												<!-- Buttons and collapse -->
												<div class="mt-3">
													<!-- Buttons -->
													<div
														class="d-flex justify-content-between align-items-center">
														<a class="btn btn-sm btn-primary-soft mb-0"
															data-bs-toggle="collapse" href="#collapseComment"
															role="button" aria-expanded="false"
															aria-controls="collapseComment"> <i
															class="bi bi-reply me-1"></i>사장님 댓글 보기
														</a>
														<div>
															<a href="#reviewModal" data-bs-toggle="modal"
																data-bs-target="#reviewModal"
																style="margin-right: 10px;"
																class="btn btn-primary-soft btn-sm mx-2 qUpdate"
																id="qUpdate"
																onclick="qUpdate('${myWriteListReview.rsvId}')">수정</a>
															<button type="button"
																class="btn btn-primary-soft btn-sm mx-2 qDelete"
																id="qDelete"
																onclick="qDelete('${myWriteListReview.rsvId}')">삭제</button>
														</div>
													</div>
													<!-- collapse textarea -->
													<div class="collapse show" id="collapseComment">
														<div class="d-flex mt-3">
															<textarea class="form-control mb-0"
																placeholder="사장님의 한마디" rows="2" spellcheck="false"
																readOnly> ${myWriteListReview.rvwCmt} </textarea>
														</div>
													</div>
												</div>
												<!-- Review item END -->
											</div>

										</div>
										<hr />
									</c:forEach>




								</div>
							</div>
							<!-- Review END -->
						</div>

						<!-- 페이징처리 -->
						<div class="card-footer pt-0 mt-3">
							<!-- Pagination and content -->
							<div
								class="d-sm-flex justify-content-sm-between align-items-sm-center">
								<!-- Content -->
								<c:set var="endRow"
									value="${qnaPage3.currentPage * qnaPage3.size}" />
								<c:set var="startRow" value="${endRow - (qnaPage3.size - 1)}" />
								<c:set var="total3" value="${qnaPage3.total}" />
								<c:if test="${endRow>total3}">
									<c:set var="endRow" value="${total3}" />
								</c:if>
								<p class="mb-sm-0 text-center text-sm-start">Showing
									${startRow} to ${endRow} of ${total3} entries</p>
								<!-- Pagination -->
								<nav class="mb-sm-0 d-flex justify-content-center"
									aria-label="navigation">
									<ul
										class="pagination pagination-sm pagination-primary-soft mb-0 ">
										<li
											class="page-item <c:if test='${qnaPage3.startPage < 6}'>disabled</c:if>"
											id="dataTable_previous"><a class="page-link"
											href="/member/mypage/myWrite?currentPage3=${qnaPage3.startPage-5}&sort=${param.sort}&keyword=${param.keyword}&currentTab=${param.currentTab}"
											aria-controls="dataTable" data-dt-idx="0" tabindex="-1">Prev</a>
										</li>
										<c:forEach var="pNo" begin="${qnaPage3.startPage}"
											end="${qnaPage3.endPage}">
											<li
												class="page-item <c:if test='${param.currentPage3 eq pNo}'>active</c:if>">
												<a
												href="/member/mypage/myWrite?currentPage3=${pNo}&sort=${param.sort}&keyword=${param.keyword}&currentTab=${param.currentTab}"
												aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0"
												class="page-link">${pNo}</a> <!-- 									<a --> <%-- 									href="/member/mypage/myWrite?currentPage2=${pNo}&sort=${param.sort}&keyword=${param.keyword}&currentTab=${param.currentTab}" --%>
												<%-- 									aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0" --%>
												<%-- 									class="page-link">${pNo}</a> --%>
											</li>
										</c:forEach>
										<li
											class="page-item <c:if test='${qnaPage3.endPage == qnaPage3.totalPages}'>disabled</c:if>"
											id="dataTable_next"><a class="page-link"
											href="/member/mypage/myWrite?currentPage3=${qnaPage3.startPage+5}&sort=${param.sort}&keyword=${param.keyword}&currentTab=${param.currentTab}"
											aria-controls="dataTable" data-dt-idx="7" tabindex="-1">Next</a>
										</li>
									</ul>
								</nav>
							</div>
						</div>
						<!-- 페이징 처리 END -->


					</div>
				</div>
				<!-- 3.리뷰 조회 끝  START -->

				<!-- 탭4 나의 작성글 내역 - 댓글-->
				<div class="tab-pane fade" id="tab-4">
					<div class="container vstack gap-4">

						<!-- Card body START -->
						<div class="card-body">
							<!-- Activity item START -->
							<c:forEach var="myWriteListCmt" items="${myWriteListCmt}"
								varStatus="stat">
								<div
									class="d-sm-flex justify-content-between align-items-center">
									<div class="d-flex align-items-sm-center me-4 ms-sm-0">
										<!-- Title -->
										<div class="ms-3">
											<c:choose>
												<c:when test="${myWriteListCmt.brdKnd eq 'D01'}">
													<div>
														<a class="text-primary"
															href="/member/tripBoard/tripDetail?brdId=${myWriteListCmt.brdId}">${myWriteListCmt.cmtCntn}</a>
													</div>
												</c:when>
												<c:when test="${myWriteListCmt.brdKnd eq 'D02'}">
													<div>
														<a class="text-primary"
															href="/member/qnaBoard/qnaDetail?brdId=${myWriteListCmt.brdId}">${myWriteListCmt.cmtCntn}</a>
													</div>
												</c:when>
											</c:choose>
											<fmt:formatDate var="cmtDt" value="${myWriteListCmt.cmtDt}"
												pattern="yyyy/MM/dd HH:mm:ss" />
											<small>${cmtDt}</small>
											<div>
												<small class="fw-light m-0" style="color: black;">${myWriteListCmt.brdTt}</small>
											</div>
										</div>
									</div>
									<!-- Buttons -->
									<div class="d-flex gap-2 mt-2 mt-sm-0">
										<a href="javascript:void(0)"
											class="btn btn-sm btn-danger-soft cmtDelete"><i
											class="bi bi-trash"></i></a>
									</div>
								</div>
								<!-- Activity item END -->

								<hr>
								<!-- Divider -->
							</c:forEach>
						</div>
						<!-- Card body END -->

						<!-- 페이징처리 -->
						<div class="card-footer pt-0 mt-3">
							<!-- Pagination and content -->
							<div
								class="d-sm-flex justify-content-sm-between align-items-sm-center">
								<!-- Content -->
								<c:set var="endRow"
									value="${qnaPage4.currentPage * qnaPage4.size}" />
								<c:set var="startRow" value="${endRow - (qnaPage4.size - 1)}" />
								<c:set var="total4" value="${qnaPage4.total}" />
								<c:if test="${endRow>total4}">
									<c:set var="endRow" value="${total4}" />
								</c:if>
								<p class="mb-sm-0 text-center text-sm-start">Showing
									${startRow} to ${endRow} of ${total4} entries</p>
								<!-- Pagination -->
								<nav class="mb-sm-0 d-flex justify-content-center"
									aria-label="navigation">
									<ul
										class="pagination pagination-sm pagination-primary-soft mb-0 ">
										<li
											class="page-item <c:if test='${qnaPage4.startPage < 6}'>disabled</c:if>"
											id="dataTable_previous"><a class="page-link"
											href="/member/mypage/myWrite?currentPage4=${qnaPage4.startPage-5}&sort=${param.sort}&keyword=${param.keyword}&currentTab=${param.currentTab}"
											aria-controls="dataTable" data-dt-idx="0" tabindex="-1">Prev</a>
										</li>
										<c:forEach var="pNo" begin="${qnaPage4.startPage}"
											end="${qnaPage4.endPage}">
											<li
												class="page-item <c:if test='${param.currentPage4 eq pNo}'>active</c:if>">
												<a
												href="/member/mypage/myWrite?currentPage4=${pNo}&sort=${param.sort}&keyword=${param.keyword}&currentTab=${param.currentTab}"
												aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0"
												class="page-link">${pNo}</a>
											</li>
										</c:forEach>
										<li
											class="page-item <c:if test='${qnaPage4.endPage == qnaPage4.totalPages}'>disabled</c:if>"
											id="dataTable_next"><a class="page-link"
											href="/member/mypage/myWrite?currentPage4=${qnaPage4.startPage+5}&sort=${param.sort}&keyword=${param.keyword}&currentTab=${param.currentTab}"
											aria-controls="dataTable" data-dt-idx="7" tabindex="-1">Next</a>
										</li>
									</ul>
								</nav>
							</div>
						</div>
						<!-- 페이징처리 END -->
					</div>

				</div>
			</div>
		</div>
	</div>
</div>



<!-- 리뷰 수정모달 -->
<form>
	<div class="modal fade" id="reviewModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">리뷰 작성하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">상품명 </label> <input
								type="text" class="form-control" id="busiNm" name="busiNm"
								readOnly>
						</div>

						<div class="mb-3">
							<label for="message-text" class="col-form-label">별점 </label> <select
								id="rvwStar"
								class="form-select js-choice border-0 z-index-9 bg-transparent">
								<option value="">선택하세요</option>
								<option id="rvwStar" value="5">★★★★★</option>
								<option id="rvwStar" value="4">★★★★☆</option>
								<option id="rvwStar" value="3">★★★☆☆</option>
								<option id="rvwStar" value="2">★★☆☆☆</option>
								<option id="rvwStar" value="1">★☆☆☆☆</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">리뷰내용 </label>
							<textarea class="form-control" id="message-text" name='rvwCntn'></textarea>
						</div>


						<div class="mb-3">
							<label for="message-text" class="col-form-label" name='attachId'>첨부파일
								: </label> <input class="form-control"
								name="attachVOList[0].attachDeVOList[0].picture" type="file"
								id="image" accept="image/gif, image/jpeg, image/png">
							<p class="small mb-0 mt-2">
								<b>주의 :</b> Only JPG, JPEG, and PNG. Our suggested dimensions
								are 600px * 450px.
							</p>
							<!-- 이미지 미리보기 -->
							<div style="display: hidden"></div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary myReview">수정하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 리뷰 수정모달 끝 -->

	<script type="text/javascript">
		$(function() {
			$(".cmtDelete").on("click", function() {
			});
		});

		function qUpdate(data) {

		}
		
		function qDelete(data) {
			var rsvId = data;
			console.log("data" + data);
			var dd = {
				"rsvId" : data
			}
				$.ajax({
					url : "/member/mypage/myRvwDelete",
					data :data,
					type : "post",
					dataType : "text",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}",
								"${_csrf.token}");
					},
					success : function(result) {
						if (result > 0) {
							
							alert("정상적으로 삭제되었습니다.");
							location.reload();
						}
					}
				})

		}
	</script>