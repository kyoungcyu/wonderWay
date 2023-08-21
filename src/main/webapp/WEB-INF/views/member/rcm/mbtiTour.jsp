<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<style>
body {
	background-color: #FFF1F2;
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	height: 600px;
}

h1 {
	text-align: center;
	color: #333;
}

.question {
	margin-bottom: 20px;
}

.options {
	list-style-type: none;
	padding: 0;
}

.options li {
	margin-bottom: 10px;
}

.option-label {
	display: block;
	padding: 10px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	cursor: pointer;
}

.option-label:hover {
	background-color: #f9f9f9;
}

.buttons {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.button {
	padding: 10px 20px;
	background-color: #333;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.button:hover {
	background-color: #555;
}

.button:disabled {
	background-color: #ccc;
	cursor: not-allowed;
}

.result {
	margin-top: 20px;
	text-align: center;
	font-weight: bold;
	font-size: 18px;
}

#resultTable td {
  border: 1px solid;
  text-align: center;
  width: 300px;
  font-family: Arial, sans-serif;
  font-weight: bold;
  font-size: 18px;
}
#resultTable {
  border: 1px solid;
  text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<br/>
		<br/>	
		<h1>MBTI별 여행지 추천받기</h1>
		<br/>

		<div class="question">
			<span><h5>
					여행을 어디로가볼까 고민하고계신가요?<br/>나와 같은 엠비티아이에 맞는 여행지 추천받아보잣!
				</h5></span>
		</div>

		<!-- 나머지 질문들 -->

		<div class="question">
			<h5>(1/12)</h5>
			<h4>월-금 평일 매일 출근하는 회사원인 나..</h4>
			<ul class="options">
				<li><label class="option-label"> <input type="radio"
						name="q1" value="E"> 주중 회사(실내)였으니 주발엔 밖에나가야한다!!
				</label></li>
				<li><label class="option-label"> <input type="radio"
						name="q1" value="I"> 주중 회사(집밖)였으니 주말엔 집에서 쉬어야한다..
				</label></li>
			</ul>
		</div>

		<div class="question">
			<h5>(2/12)</h5>
			<h4>여행지에서 버스에 앉아서 창밖을 바라볼때 나는?</h4>
			<ul class="options">
				<li><label class="option-label"> <input type="radio"
						name="q2" value="N"> 이곳에서의 사는 사람들의 삶은 어떨까? 내가
						여기산다면?(상상의나래)
				</label></li>
				<li><label class="option-label"> <input type="radio"
						name="q2" value="S"> 풍경이쁘다 나가서 놀고싶다
				</label></li>
			</ul>
		</div>

		<div class="question">
			<h5>(3/12)</h5>
			<h4>친구가 여행지에서 지갑을 잃어버렸다! 내가 해줄말은?</h4>
			<ul class="options">
				<li><label class="option-label"> <input type="radio"
						name="q3" value="T"> 헐 현금 많이 들어있었어?
				</label></li>
				<li><label class="option-label"> <input type="radio"
						name="q3" value="F"> 괜찮아? 마음 안좋겠다..
				</label></li>
			</ul>
		</div>

		<div class="question">
			<h5>(4/12)</h5>
			<h4>기차시간까지 30분 남았다!</h4>
			<ul class="options">
				<li><label class="option-label"> <input type="radio"
						name="q4" value="J"> 도착해서 화장실갔다가 편의점갔다가 승강장내려가면 되겠다.
				</label></li>
				<li><label class="option-label"> <input type="radio"
						name="q4" value="P"> 아 많이 남았네~ (그러다 딱맞게 도착해서 엄청 뜀)
				</label></li>
			</ul>
		</div>
		<div class="question">
			<h5>(5/12)</h5>
			<h4>관광지에 예상보다 사람이 많다! 눈치게임 실패!</h4>
			<ul class="options">
				<li><label class="option-label"> <input type="radio"
						name="q5" value="E"> 이 사람들 중에 제일 신나게 놀아주겠어!
				</label></li>
				<li><label class="option-label"> <input type="radio"
						name="q5" value="I"> 가만히 있어도 에너지 고갈..
				</label></li>
			</ul>
		</div>
		<div class="question">
			<h5>(6/12)</h5>
			<h4>오늘은 소풍날! 처음으로 베이킹을 하려한다.</h4>
			<ul class="options">
				<li><label class="option-label"> <input type="radio"
						name="q6" value="N"> 계량을 해보지만... 뭐 비슷하게만 넣으면 비슷한맛 나겠지 ㅎㅎ
				</label></li>
				<li><label class="option-label"> <input type="radio"
						name="q6" value="S"> 베이킹은 정.량.계.측.
				</label></li>
			</ul>
		</div>
		<div class="question">
			<h5>(7/12)</h5>
			<h4>"OO아 나 너무 스트레스 받아서 떠나야겠어. 여행가자"</h4>
			<ul class="options">
				<li><label class="option-label"> <input type="radio"
						name="q7" value="T"> 조앗! 어디로?
				</label></li>
				<li><label class="option-label"> <input type="radio"
						name="q7" value="F"> 무슨일 있었어?
				</label></li>
			</ul>
		</div>

		<div class="question">
			<h5>(8/12)</h5>
			<h4>여행계획을 짤때 나는...</h4>
			<ul class="options">
				<li><label class="option-label"> <input type="radio"
						name="q8" value="J"> 11:00 공항 1층 7번출구 와이드 모바일 로밍센터 와이파이 수령
						<br /> 12:00 간단한 점심 후 3층 이스타항공 카운터 수속 .....(중략)
				</label></li>
				<li><label class="option-label"> <input type="radio"
						name="q8" value="P"> 비행기! 공항! 호텔! 밥! 이정도면 나 J 아니야??(뿌듯)
				</label></li>
			</ul>
		</div>
		<div class="question">
			<h5>(9/12)</h5>
			<h4>다가오는 연휴에 태풍으로 스케쥴 모두 취소!<br/>
			연휴 내내 집에만 있게 생겼다</h4>
			<ul class="options">
				<li><label class="option-label"> <input type="radio"
						name="q9" value="E"> 비맞아도 나갈래.. 집에만 있을수 없어.. 연휴인데ㅠㅠ
				</label></li>
				<li><label class="option-label"> <input type="radio"
						name="q9" value="I"> 너무 좋아 힐링타임~!
				</label></li>
			</ul>
		</div>
		<div class="question">
			<h5>(10/12)</h5>
			<h4>낯선 여행지에서의 로맨스를 그린 영화를 본다.</h4>
			<ul class="options">
				<li><label class="option-label"> <input type="radio"
						name="q10" value="N"> 와 아름다워.. 이런게 운명? 하지만 현실 롱디는 힘들겠지?
				</label></li>
				<li><label class="option-label"> <input type="radio"
						name="q10" value="S"> 남주(여주) 매력있다.. 배우 이름이 뭐지?(검색)
				</label></li>
			</ul>
		</div>
		<div class="question">
			<h5>(11/12)</h5>
			<h4>내가 좋아할 것 같다며 여행지에 데려온 내친구.</h4>
			<ul class="options">
				<li><label class="option-label"> <input type="radio"
						name="q11" value="T"> 나는 뭘 좋아할거라고 생각했을까?
				</label></li>
				<li><label class="option-label"> <input type="radio"
						name="q11" value="F"> 내 생각해서 데려왔다니 감동...
				</label></li>
			</ul>
		</div>
		<div class="question">
			<h5>(12/12)</h5>
			<h4>호텔로 갈 비행기(기차) 예약시에</h4>
			<ul class="options">
				<li><label class="option-label"> <input type="radio"
						name="q12" value="J"> 여행 계획에 *비행기(기차) 예약*이 있어서 놓칠일 없다.
				</label></li>
				<li><label class="option-label"> <input type="radio"
						name="q12" value="P"> 아맞다 아직 안했었네?..ㅎ
				</label></li>
			</ul>
		</div>

		<!-- 받아오나요: {"tourMbti":"ENTJ","tourId1":"라온레포츠","tourId2":"용평 나인골프클럽","tourId3":"2023 더현대 플로깅 with Green Friends"} -->
		
 		<div class="question">
 			<span id="resultText">
				<h4>결과 : 'mbti'</h4>
				<h5>'당신의  mbti'에 맞는 여행지는 이곳입니다.</h5></span>
			<table id="resultTable" border="1px">
				<tr>
					<td>  </td>
					<td>  </td>
					<td>  </td>
				</tr>
				<tr>
					<td> 해당이미지 (예정) </td>
					<td> 해당이미지 (예정) </td>
					<td> 해당이미지 (예정) </td>
				</tr>
				
			
			</table>
		</div>




		<div class="buttons">
			<button class="button prev-button" disabled>이전</button>
			<button class="button next-button" disabled>다음</button>
		</div>
	</div>

	<script>
        const questions = document.querySelectorAll('.question');
        const prevButton = document.querySelector('.prev-button');
        const nextButton = document.querySelector('.next-button');
        const resultDiv = document.querySelector('#result');
        let currentQuestionIndex = 0;

        function showQuestion(index) {
            questions.forEach(question => {
                question.style.display = 'none';
            });

            questions[index].style.display = 'block';

            if (index === 0) {
                prevButton.disabled = true;
                prevButton.hidden = true;
            } else if (index === 0){
            	
            } else {
                prevButton.disabled = false;
                prevButton.hidden = false;
            }

            if(index === 0){
            	nextButton.textContent = 'mbti검사하고 여행지 추천받기';
       		} else if (index === questions.length - 1) {
                nextButton.textContent = '처음으로 돌아가기';
            } else if (index === questions.length - 2) {
                nextButton.textContent = '결과보기';
            } else {
                nextButton.textContent = '다음';
            }
        }

        function showResult() {
        	
        	var E = 0;
        	var I = 0;
        	
        	var N = 0;
         	var S = 0;

         	var T = 0;
        	var F = 0;
        	
        	var P = 0;
        	var J = 0;
        	
        	var resultMbti = "";
        	
            const selectedOptions = document.querySelectorAll('input[type="radio"]:checked');
            
            for (i=0; i<selectedOptions.length; i++) {
            	console.log("selectedOptions : " + selectedOptions[i].value);
            	
            	if (selectedOptions[i].value == "E") {E++;}
            	else if (selectedOptions[i].value == "I") {I++;}

            	else if (selectedOptions[i].value == "N") {N++;}
            	else if (selectedOptions[i].value == "S") {S++;}
            	
            	else if (selectedOptions[i].value == "T") {T++;}
            	else if (selectedOptions[i].value == "F") {F++;}
            	
            	else if (selectedOptions[i].value == "P") {P++;}
            	else if (selectedOptions[i].value == "J") {J++;}
            	
			}
            if (E > I){
            	resultMbti += "E";
            }else{
            	resultMbti += "I";
            }
            
            if (N > S){
            	resultMbti += "N";
            }else{
            	resultMbti += "S";
            }
            
            if (T > F){
            	resultMbti += "T";
            }else{
            	resultMbti += "F";
            }
            
            if (P > J){
            	resultMbti += "P";
            }else{
            	resultMbti += "J";
            }
            
            
			console.log("resultMbti : "+ resultMbti);
			
			$.ajax({
				url:"/member/rcm/mbtiTourAjax",
				type:"get",
				data:"mbti="+resultMbti,
				dataType:"json",
				beforeSend : function (xhr) {
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(data){
					//받아오나요: {"tourMbti":"ENTJ","tourId1":"라온레포츠","tourId2":"용평 나인골프클럽","tourId3":"2023 더현대 플로깅 with Green Friends"}
					console.log("받아오나요: "+JSON.stringify(data));
					
					let h4Obj = $("#resultText").children("h4"); 
					let h5Obj = $("#resultText").children("h4").next(); 
					let tdFirObj = $("#resultTable tr:first-child td:first-child");
					let tdScdObj = $("#resultTable tr:first-child td:nth-child(2)");
					let tdThrObj = $("#resultTable tr:first-child td:nth-child(3)")
											
											
											
					h4Obj.html("결과 : '" + data.tourMbti + "'"); 
					h5Obj.html("'" + data.tourMbti + "'에 맞는 여행지는 이곳입니다."); 
					tdFirObj.html(data.tourId1); 
					tdScdObj.html(data.tourId2); 
					tdThrObj.html(data.tourId3);
					
				},
				error:function(e){
					
				}
			});
			
            selectedOptions.forEach(option => {
                const questionNumber = option.name.charAt(1);
                const selectedValue = option.value;
            });

        }

        function updateButtons() {
            const currentQuestion = questions[currentQuestionIndex];
            const selectedOption = currentQuestion.querySelector('input[type="radio"]:checked');

            if (selectedOption) {
                nextButton.disabled = false;
            } else {
                nextButton.disabled = true;
            }

            if (currentQuestionIndex === 0 || currentQuestionIndex === questions.length - 1) {
                nextButton.disabled = false;
            }
        }

        prevButton.addEventListener('click', () => {
            currentQuestionIndex--;
            showQuestion(currentQuestionIndex);
            updateButtons();
        });

        nextButton.addEventListener('click', () => {
            if (nextButton.textContent === '처음으로 돌아가기') {
            	currentQuestionIndex = 0;
                showQuestion(currentQuestionIndex);
                updateButtons();

            	
            } else if (nextButton.textContent === '결과보기') {
            	currentQuestionIndex++;
                showQuestion(currentQuestionIndex);
                updateButtons();
                showResult();
				
            	
            } else {
                currentQuestionIndex++;
                showQuestion(currentQuestionIndex);
                updateButtons();
            }
        });

        questions.forEach(question =>  {
            const options = question.querySelectorAll('input[type="radio"]');
            options.forEach(option =>  {
                option.addEventListener('change', updateButtons);
            });
        });

        showQuestion(currentQuestionIndex);
        updateButtons();
    </script>
</body>