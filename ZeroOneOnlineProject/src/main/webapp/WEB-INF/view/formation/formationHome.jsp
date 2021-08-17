<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/includeTags.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{
		list-style:none;
		text-decoration:none;
		margin: 0;
		padding:0;
	}
	#wrap{
		width: 100%;
	}
	#top{
		display: block;
    	clear: both;
   	 	content: "";
    	float: left;
    	width: 70%;
    	box-sizing: border-box;
	}
	#search_bar{
		
		height: 100px;
    	
	}
	#team_fm{
		height: 1400px;
   	 	background-image:url("../images/stra6_fifa.jpg");
   	 	background-repeat:no-repeat;
   	 	background-size:cover;
   	 	background-position: center center;
    	float: left;
   	 	width: 100%;
	}
	#squad_list{
		width: 30%;
  	  	float: right;
   	 	height: 1500px;
    	background-color: #2B1640;
    	opacity:0.8;
    	border-left: 3px solid black;
    	box-sizing: border-box;
    
	}
	#squad_list > a {
		color:white;
	}
	
	.buttonSelector > button {
		width: 50px;
		height: 50px;
	}
	
	.list_tb {
		margin-top: 30px;
		margin-left: 20px;
		color:	#f5fffa;
	}
	
	/* input[type="button" i] {
		color : red;
	} */
	
	
	
	.btnMaker{position:relative;}
	.btnMaker>div{width:170px;}
	.card_back{position:relative; z-index:1;}/*카드백그라운드*/
	.card_back>img{width:100%;}
	.btnMaker>div>p{position:absolute; top:64px; left:20px;z-index:2;}/* 선수 사진 */
	
	
	
	/*카드버튼*/
	.card_Btn{position:absolute; bottom:37px; left:40px; z-index:3;}
	
	/*사진 */
	.positionNum1 {position:absolute;bottom:550px;left:300px;}
	.positionNum2 {position:absolute;bottom:550px;left:600px;}
	.positionNum3 {position:absolute;bottom:550px;left:900px;}
	.positionNum4 {position:absolute;bottom:250px;left:350px;}
	.positionNum5 {position:absolute;bottom:250px;left:650px;}
	.positionNum6 {position:absolute;bottom:250px;left:950px;}
	.positionNum7 {position:absolute;bottom:-100px;left:250px;}
	.positionNum8 {position:absolute;bottom:-100px;left:500px;}
	.positionNum9 {position:absolute;bottom:-100px;left:750px;}
	.positionNum10 {position:absolute;bottom:-100px;left:1000px;}
	.positionNum11 {position:absolute;bottom:-300px;left:650px;}
	
	/* 사진전체 */
	#positionNum1Maker {position:absolute;bottom:500px;left:300px;}
	#positionNum2Maker {position:absolute;bottom:500px;left:580px;}
	#positionNum3Maker {position:absolute;bottom:500px;left:900px;}
	#positionNum4Maker {position:absolute;bottom:50px;left:300px;}
	#positionNum5Maker {position:absolute;bottom:50px;left:580px;}
	#positionNum6Maker {position:absolute;bottom:50px;left:900px;}
	#positionNum7Maker {position:absolute;bottom:-100px;left:200px;}
	#positionNum8Maker {position:absolute;bottom:-100px;left:400px;}
	#positionNum9Maker {position:absolute;bottom:-100px;left:600px;}
	#positionNum10Maker {position:absolute;bottom:-100px;left:800px;}
	#positionNum11Maker {position:absolute;bottom:-200px;left:500px;}
	
	/* 국기 */
	
	
	/* 선수정보 */
	#pler_view > table {
		position:absolute;
		
		z-index:5;
		background-color: black;
	}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div id="wrap">
		<div id="top"> 
			<div id="search_bar">
				<form action="searchedPl">
					<input type="search" name="plerName" value="${err2 }">
					<input type="submit" value="검색">
				
				</form>
				
				<form action="addPlayer">
					${dto.plerName } ${err } ${alreadyErr }
					<input type="submit" value="내 팀에 틍록">
					<input type="hidden" name="plerName" value="${dto.plerName }">
					<input type="hidden" name="plerPosition" value="${dto.plerPosition }">
					<input type="hidden" name="plerAbility" value="${dto.plerAbility }">
					<input type="hidden" name="plerSalary" value="${dto.plerSalary }">
					<input type="hidden" name="plerPrice" value="${dto.plerPrice }">
				</form>
			</div>


			<!-- 포메이션  -->
			<div id="notice_content">
				<div id="team_fm">
					<div id="forma_top">
						포메이션 &nbsp;&nbsp;&nbsp;&nbsp;구단가치 총급여  
					</div>
				<div class="buttonSelector">			
					<form action="#" >
					<c:forEach items="${listFor }" var="name">
					<table>		
						<tr>
							<td class="btnMaker" id="${name.positionNum }Maker">
								<div>
									<div class="card_back">
										<img src="../images/21TOTN.png">												
									</div>
									<p><input type="image" alt="왜없내" src="../player/upload/${name.plerImage.split(',')[0] }" class="${name.positionNum }img" ></p>
									<p class="flag" style="z-index: 2;"><input type="image" alt="국기" src="../player/upload/${name.plerImage.split(',')[1] }" class="${name.positionNum }flag"  style="width:45px;height: 42px;position:absolute; top: 90px;left: -13px;"></p>
									<div class="card_Btn">
										<button onclick="playerView('${name.plerName}')" class="${name.plerName}">선수정보</button>							
										<button onclick="sel('${name.positionNum }')">방출</button>
									</div>
								</div>
								<!-- 선수 상세 -->
								<div id="pler_view"></div>															
							</td>
							<td>		
								<input type="hidden" value="${name.positionNum }" class="${name.positionNum }">
							</td>
						<tr>
						<c:set value="${cnt = cnt + 1 }" var="cnt" />	
					</table>
					</c:forEach>
					</form>
					<span style="color: white;">
						총인원 ${cnt } <br>
						
						
						<%-- 	${plForList.playerDTO.plerPrice} --%>
							
						
					</span>
				<div class="button_for_i">
					<c:forEach var="i" begin="1" end="11">				
						<input type="button" class="positionNum${i }" id="positionNum${i }" name="positionNum${i }" value="선수${i }" onclick="run(${i })"><br>
					</c:forEach>
				</div>		
				</div>
			</div>
			
		</div> 
	</div>	


			<!-- 선수단  -->
			<div id="squad_list">
				<div class="list_tb">
					<h2>선수단</h2>
					<form:form action="formationRegist" name="frmJoin" method="get" modelAttribute="formationCommand">	
						<input type="hidden" name="plerName" >
						<input type="hidden" name="positionNum" >	
						
					</form:form>
					<table border="1">					
							<tr><td>선수이름</td><td>포지션</td><td>스탯</td><td>주급</td><td>방출</td><td>등록</td></tr>
							<c:forEach items="${list }" var="list" varStatus="cnt">
								<tr>
									<td>${list.plerName }</td>
									<td>${list.plerPosition }</td>
									<td>${list.plerAbility }</td>
									<td>${list.plerSalary }</td>
									<td><a href="squadDel?plerName=${list.plerName }">방출하기</a></td>
									<td><input type="button" value="등록" onclick="aaa('${list.plerName }')"></td>
								</tr>
							</c:forEach>		
						<%-- <c:if test="${list.memId == null }">
							선수단이 없습니다 
						</c:if> --%>
					</table>	
				</div>				
			</div>
	</div>


<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.js"></script>
<script type="text/javascript">
/* AJAX */
function playerView(name) {
	/* location.href = 'plerDetailView?plerName=' +name; */
	$.ajax({
		type : "post",
		url : "plerDetailView",
		data : "html",
		data : "plerName=" + name,
		success : 
			function(result) {
			$("#pler_view").html(result);
		},
		error: 
			function() {
			alert("에러!");
			return;
		}
	});
}

/* JS */	
 


	
const selector1 = document.getElementById(document.querySelector('.positionNum1').value);
const selector2 = document.getElementById(document.querySelector('.positionNum2').value);
const selector3 = document.getElementById(document.querySelector('.positionNum3').value);
const selector4 = document.getElementById(document.querySelector('.positionNum4').value);
const selector5 = document.getElementById(document.querySelector('.positionNum5').value);
const selector6 = document.getElementById(document.querySelector('.positionNum6').value);
const selector7 = document.getElementById(document.querySelector('.positionNum7').value);
const selector8 = document.getElementById(document.querySelector('.positionNum8').value);
const selector9 = document.getElementById(document.querySelector('.positionNum9').value);
const selector10 = document.getElementById(document.querySelector('.positionNum10').value);
const selector11 = document.getElementById(document.querySelector('.positionNum11').value); 

	bbb();
	//데이터 있는 포지션 hidden 만들기
	function bbb() {		

		for(let i=1; i<12; i++) {
			if(eval('selector'+i) != null){
		    	eval('selector'+i).style.visibility='hidden';	 
			
		}
	}
	}

	//버튼생성 
	function run(array) {
		frmJoin.positionNum.value="positionNum"+array;		
	}

	//hidden에 값넣고 전송 
	function aaa(event) {
		frmJoin.plerName.value = event;
		frmJoin.submit();	
		
	}
	
	
	function sel(aaa){
		
		const del = confirm("방출 하시겠습니까?"); 
		if(del){
			location.href = 'forDel?positionNum='+ aaa;
			
		}
	}
    
	
	
	 
	
	/* 팝업
		function pop() {
	    	window.open("https://blog.naver.com/hyoyeol/70184157539","naver","width =600, height = 600")
	    } 
	*/


        
        
        
/* document.getElementById('btn1').style.visibility='hidden'; */        
/*
function erchk() {
        if (document.getElementById("but").value == "") {
            alert("내용을 입력해주세요");
            return false;
  }else
   document.frmButton.submit();
        const numSelect = document.querySelector(".buttonSelector")
        const checkBoxTd = document.querySelector(".checkBoxTd");
        const chbox = document.querySelector(".chbox");



function regist() {
    numSelect.addEventListener('click', e => {
    	const chb = document.createElement("input");
        chb.type="checkbox";
        checkBoxTd.appendChild(chb);
        chb.className = 'chbox';
        chb.name='chbox';
        chb.value='Y';
       
    });
} 
 */
 
</script>

</body>
</html>