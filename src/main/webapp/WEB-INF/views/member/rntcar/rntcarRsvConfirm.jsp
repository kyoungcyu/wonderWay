<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.4.min.js"></script>

<head>
<title>Wonderway-렌트카</title>
<script type="text/javascript">
$(function(){
	
	$("#btnPdf").on('click',function(){
		  var element = $("#pdfSection")[0];
		  var options = {
		        scale: 2, // 해상도 조정을 위한 스케일 값
		        useCORS: true,
		        allowTaint : true,
		    };
			html2canvas(element,options).then(function(canvas) {

	                // 캔버스를 이미지로 변환
	                var imgData = canvas.toDataURL('image/png');
						

	                var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
	                var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
	                var imgHeight = canvas.height * imgWidth / canvas.width;
	                var heightLeft = imgHeight;

	                var doc = new jsPDF('p', 'mm');
	                var position = 0;
					

	                
	                // 첫 페이지 출력
	                doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
	                heightLeft -= pageHeight;

	                // 한 페이지 이상일 경우 루프 돌면서 출력
	                while (heightLeft >= 20) {
	                    position = heightLeft - imgHeight;
	                    doc.addPage();
	                    doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
	                    heightLeft -= pageHeight;
	                }

	                // 파일 저장
	                doc.save('Woderway_reserve.pdf');

	            })
		            
		
// 		var mainSection = document.getElementById('main');
// 		var serializer = new XMLSerializer();
// 		var html = serializer.serializeToString(mainSection);
// 		console.log(  html )

		
// 		fetch('/pdf/getHtml', {
// 			  method: 'POST',
// 			  headers: {
// 			    'Content-Type': 'text/html',
// 			    'X-CSRF-TOKEN': '${_csrf.token}'

// 			  },
// 			  body: html
// 			})
// 			  .then(function(response) {
// 			    if (response.ok) {
// 			      return response.text();
// 			    } else {
// 			      // 요청이 실패함
// 			      throw new Error('Request failed');
// 			    }
// 			  })
// 			  .then(function(data) {
// 			    // 응답 처리
// 			    console.log(data);
// 			  })
// 			  .catch(function(error) {
// 			    // 에러 처리
// 			    console.error(error);
// 			  });
		
		
	})
})



</script>

</head>

<body>
<main>


<!-- =======================
Main content START -->
<section class="pt-4">
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-xl-8 mx-auto">

				<div id="pdfSection" class="card shadow">
					<!-- Image -->
					<img src="${carImg}" class="rounded-top" alt=""/>

					<!-- Card body -->
					<div class="card-body text-center p-4">
						<!-- Title -->
						<h1 class="card-title fs-3">🎊 예약 완료! 🎊</h1>
						<p class="lead mb-3">결제가 완료되었습니다</p>

						<!-- Second title -->
						<h5 class="text-primary mb-4">${rsvNm}</h5>

						<!-- List -->
						<div class="row justify-content-between text-start mb-4">
							<div class="col-lg-5">
								<ul class="list-group list-group-borderless">
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="bi bi-vr fa-fw me-2"></i>예약 ID:</span>
										<span class="h6 fw-normal mb-0">${rsvId}</span>
									</li>
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="bi bi-wallet2 fa-fw me-2"></i>예약자:</span>
										<span class="h6 fw-normal mb-0">${buyerNm}</span>
									</li>
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="bi bi-person fa-fw me-2"></i>자동차보혐:</span>
										<span class="h6 fw-normal mb-0">${hinsrNm}</span>
									</li>
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="bi bi-currency-dollar fa-fw me-2"></i>결제 금액:</span>
										<fmt:formatNumber var="fmtedPayPr" value="${payPr}" pattern="#,###,###"/>
										<span class="h6 fw-normal mb-0">${fmtedPayPr}원</span>
									</li>
								</ul>
							</div>

							<div class="col-lg-5">
								<ul class="list-group list-group-borderless">
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="bi bi-calendar fa-fw me-2"></i>픽업날짜:</span>
										<span class="h6 fw-normal mb-0">${rRsvSt}</span>
									</li>
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="bi bi-calendar fa-fw me-2"></i>반납날짜:</span>
										<span class="h6 fw-normal mb-0">${rRsvEd}</span>
									</li>
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="bi bi-people fa-fw me-2"></i>업체:</span>
										<span class="h6 fw-normal mb-0">${busiNm}</span>
									</li>
								</ul>
							</div>
						</div>

						<!-- Button -->
						<div class="d-sm-flex justify-content-sm-end d-grid">
							<!-- Download button -->
							<a id="btnPdf" class="btn btn-primary mb-0"><i class="bi bi-file-pdf me-2"></i>PDF 다운</a>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</section>
<!-- =======================
Main content START -->

</main>
</body>
