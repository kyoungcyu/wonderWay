<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>

</head>

<body>

<!-- **************** MAIN CONTENT START **************** -->
<main>
<!-- =======================
Main banner START -->
<section class="pt-0">
	<div class="container">
		<!-- Hero banner START -->
		<div class="row">
			<div class="col-12">
				<!-- Card START -->
				<div class="card card-body bg-primary justify-content-center text-center px-4 px-sm-5 pt-6 pb-8" style="background-image: url(/resources/booking/assets/images/element/bg-pattern.png); background-position: center center; background-repeat: no-repeat; background-size: cover;">
					<!-- Title -->
					<h1 class="fs-2 text-white mb-4">${insuVO.company} ${insuVO.insuNm}<br/>상품특징</h1>

				</div>
				<!-- Card END -->
			</div>
		</div>
		<!-- Hero banner END -->

		<!-- Topics START -->
		<div class="row g-4 mt-n8">
			<div class="col-10 col-lg-11 col-xl-10 mx-auto">
				<div class="row g-4">
					<div class="col-lg-4">
						<!-- Get started START -->
						<div class="card shadow h-100">
							<!-- Title -->
							<div class="card-header d-flex align-items-center pb-0">
								<i class="bi bi-emoji-smile fs-2 text-success me-2"></i>
								<h5 class="card-title mb-0">${insuVO.insuNm}의 특징1 </h5>
							</div>

							<!-- List START -->
							<div class="card-body pt-0">
								<ul class="nav flex-column">
									<li class="nav-item"><i class="fa-solid fa-angle-right text-primary pt-1 me-2"></i>${insuVO.features1 }</a></li>
								</ul>
							</div>
							<!-- List END -->
						</div> 
						<!-- Get started END --> 
					</div>

					<div class="col-lg-4">
						<!-- Account Setup START -->
						<div class="card shadow h-100">
							<!-- Title -->
							<div class="card-header border-0 d-flex align-items-center pb-0">
								<i class="bi bi-layers fs-2 text-warning me-2"></i>
								<h5 class="card-title mb-0">${insuVO.insuNm}의 특징2</h5>
							</div>
							<!-- List START -->
							<div class="card-body pt-0">
								<ul class="nav flex-column">
									<li class="nav-item"><a class="nav-link d-flex" href="help-detail.html"><i class="fa-solid fa-angle-right text-primary pt-1 me-2"></i>${insuVO.features2}</a></li>
								</ul>
							</div>
							<!-- List END -->
						</div>  
						<!-- Account Setup END -->
					</div>

					<div class="col-lg-4">
						<!-- Other Topics START -->
						<div class="card shadow h-100">
							<!-- Title -->
							<div class="card-header border-0 d-flex align-items-center pb-0">
								<i class="bi bi-info-circle fs-2 text-info me-2"></i>
								<h5 class="card-title mb-0">${insuVO.insuNm}의 특징3</h5>
							</div>

							<!-- List START -->
							<div class="card-body pt-0">
								<ul class="nav flex-column">
									<li class="nav-item"><a class="nav-link d-flex" href="help-detail.html"><i class="fa-solid fa-angle-right text-primary pt-1 me-2"></i>${insuVO.features3}</a></li>
								</ul>
							</div>
							<!-- List END -->
						</div>  
						<!-- Other Topics END -->
					</div>
				</div>	
			</div>
		</div>
		<!-- Topics END -->

	</div>
</section>
<!-- =======================
Main banner END -->


<!-- =======================
Compare listing START -->
<section>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Table START -->
				<div class="table-responsive-xl">
					<table class="table table-compare align-middle">
						<!-- Head START -->
							<thead class="align-top">
								<tr>
									<th scope="col" class="col-4">
										<p class="h4">종류별 보장내용</p>
									</th>
									
									<c:forEach var="insuDeVO" items="${insuDeVOList}" varStatus="stat">
									<th scope="col">
										<div class="card bg-transparent">
											<!-- Card body START -->
											<span class="h4 text-success mb-0">${insuDeVO.insuKnd }</span>
										</div>
									</th>
									</c:forEach> 

								</tr>
							</thead>
						<!-- Head END -->

						<!-- Body START -->
						<tbody class="border-top-0">
							<!-- Item -->
							<tr>
								<th scope="row"><span class="h6 mb-0">해외여행 중 상해사망</span></th>
								<c:forEach var="insuDeVO" items="${insuDeVOList}" varStatus="stat">
									<td>${insuDeVO.accDeath}</td>
								</c:forEach>
							</tr>

							<!-- Item -->
							<tr>
								<th scope="row"><span class="h6 mb-0">해외여행중 질병사망</span></th>
								
								<c:forEach var="insuDeVO" items="${insuDeVOList}" varStatus="stat">
									<td>${insuDeVO.disDeath}</td>
								</c:forEach>
							</tr>

							<!-- Item -->
							<tr>
								<th scope="row"><span class="h6 mb-0">해외 상해 의료비</span></th>
								<c:forEach var="insuDeVO" items="${insuDeVOList}" varStatus="stat">
									<td>${insuDeVO.accMedi}</td>
								</c:forEach>
							</tr>

							<!-- Item -->
							<tr>
								<th scope="row"><span class="h6 mb-0">해외질병의료비</span></th>
								<c:forEach var="insuDeVO" items="${insuDeVOList}" varStatus="stat">
									<td>${insuDeVO.disMedi}</td>
								</c:forEach>
							</tr>

							<!-- Item -->
							<tr>
								<th scope="row"><span class="h6 mb-0">해외 폭력상해피해 변호사선임비	</span></th>
								<c:forEach var="insuDeVO" items="${insuDeVOList}" varStatus="stat">
									<td>${insuDeVO.lawyer}</td>
								</c:forEach>
							</tr>

							<!-- Item -->
							<tr>
								<th scope="row"><span class="h6 mb-0">해외여행 중 휴대품손해(분실제외)</span></th>
								<c:forEach var="insuDeVO" items="${insuDeVOList}" varStatus="stat">
									<td>${insuDeVO.loss}</td>
								</c:forEach>
							</tr>

							<!-- Item -->
							<tr>
								<th scope="row"><span class="h6 mb-0">해외여행 중 배상책임</span></th>
								<c:forEach var="insuDeVO" items="${insuDeVOList}" varStatus="stat">
									<td>${insuDeVO.damages}</td>
								</c:forEach>
							</tr>

							<!-- Item -->
							<tr>
								<th scope="row"><span class="h6 mb-0">항공기 납치</span></th>
								<c:forEach var="insuDeVO" items="${insuDeVOList}" varStatus="stat">
									<td>${insuDeVO.hijacking}</td>
								</c:forEach>
							</tr>

							<!-- Item -->
							<tr>
								<th scope="row"><span class="h6 mb-0">해외여행 중 여권분실 후 재발급비용</span></th>
								<c:forEach var="insuDeVO" items="${insuDeVOList}" varStatus="stat">
									<td>${insuDeVO.passport}</td>
								</c:forEach>
							</tr>

							<!-- Item -->
							<tr>
								<th scope="row"><span class="h6 mb-0">해외여행 중 특정전염병 보장</span></th>
								<c:forEach var="insuDeVO" items="${insuDeVOList}" varStatus="stat">
									<td>${insuDeVO.infectious}</td>
								</c:forEach>
							</tr>
							<!-- Item -->
							<tr>
								<th scope="row"><span class="h6 mb-0">보험료</span></th>
								<c:forEach var="insuDeVO" items="${insuDeVOList}" varStatus="stat">
								<fmt:formatNumber var="totalFee" value="${insuDeVO.insuFee*daysDiffer}" pattern="#,###,###"/>
									<td>${totalFee}원</td>
								</c:forEach>
							</tr>

							<!-- Item -->
							<tr>
								<th scope="row"><span class="h6 mb-0"></span></th>
								<c:forEach var="insuDeVO" items="${insuDeVOList}" varStatus="stat">
								<form action="/member/insurance/reserveInsu" method="post">
									<td>
										<button type="submit" class="btn btn-sm btn-outline-primary mb-0">가입하기</button>
										<input type="hidden" name="prodId" value="${insuDeVO.prodId}">
									</td>
									<sec:csrfInput/>
								</form>
								</c:forEach>
								
							</tr>

						</tbody>
						<!-- Body END -->
					</table>
				</div>
				<!-- Table END -->
			</div>
		</div><!-- Row END -->
	</div>  
</section>
<!-- =======================
Compare listing END -->


<!-- =======================
Faqs START -->
<section class="pt-0 pt-lg-5">
	<div class="container">
		<!-- Title -->
		<div class="row">
			<div class="col-12 text-center mb-4">
				<h2 class="mb-0">기타 알아두실 사항</h2>
			</div>
		</div>

		<!-- Accordion START -->
		<div class="row">
			<div class="col-10 mx-auto">
				<div class="accordion accordion-icon accordion-bg-light" id="accordionExample2">
					<!-- Item -->
					<div class="accordion-item mb-3">
						<h6 class="accordion-header font-base" id="heading-1">
							<button class="accordion-button fw-bold rounded d-inline-block collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-1" aria-expanded="true" aria-controls="collapse-1">
								보험계약 체결전 유의사항
							</button>
						</h6>
						<!-- Body -->
						<div id="collapse-1" class="accordion-collapse collapse show" aria-labelledby="heading-1" data-bs-parent="#accordionExample2">
							<div class="accordion-body mt-3">
								<ol>
									<li>보험계약 청약시 보험상품명, 보험기간, 보험료납입기간, 피보험자 등을 반드시 확인하시고, 보험약관을 반드시 수령, 설명 받으시기 바랍니다.</li>
									<li>하나손해보험은 해당 상품에 대해 충분히 설명할 의무가 있으며, 가입자는 가입에 앞서 이에 대한 충분한 설명을 받으시기 바랍니다.</li>
									<li>보험계약 체결 전에 상품설명서와 약관을 반드시 읽어보시기 바랍니다.</li>
									<li>기존 보험계약을 해지하고 새로운 보험계약을 체결하는 경우 보험 인수가 거절되거나, 보험료가 인상될 수 있으며, 보장내용이 달라질 수 있으니 유의하시기 바랍니다.</li>
								</ol>
							</div>
						</div>
					</div>

					<!-- Item -->
					<div class="accordion-item mb-3">
						<h6 class="accordion-header font-base" id="heading-2">
							<button class="accordion-button fw-bold rounded d-inline-block collapsed d-block pe-5" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-2" aria-expanded="false" aria-controls="collapse-2">
								계약 전/후 알릴 의무
							</button>
						</h6>
						<!-- Body -->
						<div id="collapse-2" class="accordion-collapse collapse" aria-labelledby="heading-2" data-bs-parent="#accordionExample2">
							<div class="accordion-body mt-3">
								<ol>
									<li>계약자 또는 피보험자는 청약할 때 청약서에서 질문한 사항에 대하여 알고 있는 사실을 반드시 사실대로 알려야 합니다. 약관에 따라 알릴 의무 위반 시 계약이 해지되거나 보장이 제한될 수 있습니다.</li>
									<li>계약자 또는 피보험자는 보험계약을 맺은 후 보험약관에 정한 계약 후 알릴 의무 사항이 발생하였을 경우 회사에 지체없이 알려야 합니다. 그렇지 않을 경우 보험금 지급이 거절될 수 있습니다.</li>
								</ol>
							</div>
						</div>
					</div>

					<!-- Item -->
					<div class="accordion-item mb-3">
						<h6 class="accordion-header font-base" id="heading-3">
							<button class="accordion-button fw-bold collapsed rounded d-block pe-5" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-3" aria-expanded="false" aria-controls="collapse-3">
								보험금을 지급하지 아니하는 사유
							</button>
						</h6>
						<!-- Body -->
						<div id="collapse-3" class="accordion-collapse collapse" aria-labelledby="heading-3" data-bs-parent="#accordionExample2">
							<div class="accordion-body mt-3">
								<ol>
									<li>회사는 다음 중 어느 한가지로 보험금 지급사유가 발생한 때에는 보험금을 지급하지 않습니다.피보험자가 고의로 자신을 해친 경우. 다만, 피보험자가 심신상실 등으로 자유로운 의사결정을 할 수 없는 상태에서 자신을 해친 경우에는 보험금을 지급합니다.보험수익자가 고의로 피보험자를 해친 경우. 다만, 그 보험수익자가 보험금의 일부 보험수익자인 경우에는 다른 보험수익자에 대한 보험금은 지급합니다.계약자가 고의로 피보험자를 해친 경우피보험자의 임신, 출산(제왕절개를 포함합니다), 산후기. 단, 회사가 보장하는 보험금 지급사유와 보장개시일로부터 2년이 지난 후에 발생한 습관성 유산, 불임, 및 인공수정 관련 합병증으로 인한 경우에는 지급합니다.전쟁, 외국의 무력행사, 혁명, 내란, 사변, 폭동피보험자가 정당한 이유없이 입원기간 중 의사의 지시를 따르지 않거나 의사가 통원치료가 가능하다고 인정함에도 피보험자 본인이 자의적으로 입원하여 발생한 입원의료비피보험자가 정당한 이유없이 통원기간 중 의사의 지시를 따르지 않아 발생한 통원의료비
									<li>회사는 다른 약정이 없으면 피보험자가 직업, 직무 또는 동호회 활동목적으로 아래에 열거된 행위로 인하여 제3조(보험금의 지급사유)의 상해 관련 보험금 지급사유가 발생한 때에는 해당 보험금을 지급하지 않습니다.전문등반(전문적인 등산용구를 사용하여 암벽 또는 빙벽을 오르내리거나 특수한 기술, 경험, 사전훈련을 필요로 하는 등반을 말합니다), 글라이더 조종, 스카이다이빙, 스쿠버다이빙, 행글라이딩, 수상보트, 패러글라이딩모터보트, 자동차 또는 오토바이에 의한 경기, 시범, 흥행(이를 위한 연습을 포함합니다) 또는 시운전(다만, 공용도로상에서 시운전을 하는 동안 보험금 지급사유가 발생한 경우에는 보장합니다)선박승무원, 어부, 사공, 그밖에 선박에 탑승하는 것을 직무로 하는 사람이 직무상 선박에 탑승하고 있는 동안
								</ol>
							</div>
						</div>
					</div>

					<!-- Item -->
					<div class="accordion-item mb-3">
						<h6 class="accordion-header font-base" id="heading-4">
							<button class="accordion-button fw-bold collapsed rounded d-block pe-5" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-4" aria-expanded="false" aria-controls="collapse-4">
								청약철회 청구제도
							</button>
						</h6>
						<!-- Body -->
						<div id="collapse-4" class="accordion-collapse collapse" aria-labelledby="heading-4" data-bs-parent="#accordionExample2">
							<div class="accordion-body mt-3">
								<ol>
									<li><p>일반 금융소비자인 보험 계약자는 보험증권을 받은 날부터 15일 이내(청약을 한 날부터 30일 이내에 한함)에 청약을 철회할 수 있으며, 보험회사는 철회를 접수한 날부터 3영업일 이내에 납입한 보험료 전액을 돌려 드립니다. 단, 아래의 계약은 청약의 철회가 불가합니다.</p>
										<p>전문금융소비자가 체결한 보험 계약
										<br/>청약일부터 30일 초과
										<br/>보험기간(보장기간)이 90일 이내인 계약</p>
									</li>
									<li>【전문금융소비자】 보험계약에 관한 전문성, 자산규모 등에 비추어 보험계약에 따른 위험감수능력이 있는 자로서, 「금융소비자보호에 관한 법률」 제2조제9호에서 정하는 전문금융소비자인 계약자를 말합니다.</li>
								</ol>
							</div>
						</div>
					</div>

					<!-- Item -->
					<div class="accordion-item mb-3">
						<h6 class="accordion-header font-base" id="heading-5">
							<button class="accordion-button fw-bold collapsed rounded d-block pe-5" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-5" aria-expanded="false" aria-controls="collapse-5">
								위법계약 해지권
							</button>
						</h6>
						<!-- Body -->
						<div id="collapse-5" class="accordion-collapse collapse" aria-labelledby="heading-5" data-bs-parent="#accordionExample2">
							<div class="accordion-body mt-3">
								<ol>
									<li>계약자는 보험사가 설명의무 등을 위반하여 계약을 체결한 경우 계약체결일부터 5년을 초과하지 않는 범위 내에서 계약체결에 대한 회사의 위반사항을 안 날로부터 1년 이내에 계약해지요구서에 위반한 사실을 입증하는 서류를 첨부하여 서면 등으로 해당 계약의 해지를 요구할 수 있습니다.
								</ol>
							</div>
						</div>
					</div>

					<!-- Item -->
					<div class="accordion-item">
						<h6 class="accordion-header font-base" id="heading-6">
							<button class="accordion-button fw-bold collapsed rounded d-block pe-5" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-6" aria-expanded="false" aria-controls="collapse-6">
								예금자보호 및 상담/분쟁/신고 안내
							</button>
						</h6>
						<!-- Body -->
						<div id="collapse-6" class="accordion-collapse collapse" aria-labelledby="heading-6" data-bs-parent="#accordionExample2">
							<div class="accordion-body mt-3">
								<ol>
									<li><b>예금자보호안내</b>
										<p>이 보험계약은 예금자보호법에 따라 예금보험공사가 보호하되, 보호 한도는 본 보험회사에 있는 귀하의 모든 예금보호 대상 금융상품의 해약환급금(또는 만기시 보험금이나 사고보험금)에 기타지급금을 합하여 1인당 "최고 5천만원"이며, 5천만원을 초과하는 나머지 금액은 보호하지 않습니다. 다만, 보험계약자 및 보험료 납부자가 법인인 보험계약은 예금자보호법에 따라 예금보험공사가 보호하지 않습니다.</p>
									</li>
									<li>	
										<b>보험상담 및 분쟁해결 안내</b>
										<p>보험에 관한 불만상담 및 분쟁이 있을 때에는 먼저 당사로 연락하시고, 처리결과에 이의가 있으시면 민원 또는 분쟁조정 등을 신청하실 수 있습니다.
										하나손해보험 : 1566-3000, www.hanainsure.co.kr
										금융감독원 민원상담전화 : (국번없이)1332, www.fss.or.kr</p>
										
										<b>모집질서 확립 및 신고센터 안내</b>
										<p>보험계약과 관련한 보험모집질서 위반행위는 보험업법에 의해 처벌받을 수 있습니다.
										금융감독원 민원상담전화 : (국번없이)1332, www.fss.or.kr</p>
										
										<b>금융감독원 보험 범죄 신고센터 안내</b>
										<p>금융감독원 민원상담전화 : (국번없이)1332, www.fss.or.kr</p>
									</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Accordion END -->
	</div>
</section>
<!-- =======================
Faqs END -->


</main>

</body>
</html>