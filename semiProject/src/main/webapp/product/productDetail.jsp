<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.Productcontainer {
	display: grid;
	grid-template-areas: "  a    b    c   "
		"  detail    detail    detail   ";
	grid-template-columns: 80px 700px 1fr;
	grid-column-gap: 20px;
	grid-row-gap: 50px;
	margin-left: 150px;
	margin-right: 150px;
	margin-top: 20px;
	grid-template-rows: 800px 1fr;
	padding-bottom: 200px;
}

#sideimg {
	grid-area: a;
}

#mainimg {
	grid-area: b;
}

#product_text {
	grid-area: c;
	padding-left: 50px;
}

#product_detail {
	grid-area: detail;
	text-align: center;
}

#detailimg {
	witdh: 80px;
	height: 80px;
}

#product_text .buybut {
	background-color: black;
	color: white;
	width: 250px;
	height: 65px;
	margin-top: 50px;
}

#product_text .cartbut {
	background-color: white;
	width: 150px;
	height: 65px;
	margin-top: 50px;
}

#line {
	margin-top: 20px;
	margin-bottom: 20px;
	width: 100%;
	color: gray;
	align: "left";
	size: 1;
}

#menu_sel ul {
	width: 100%;
	display: flex;
	justify-content: center;
}

#menu_sel ul li {
	width: calc(33.33% - 40px);
	margin: 10px;
	padding: 10px;
	border: 1px solid #000;
	box-sizing: border-box;
}

.select {
	background-color: black;
	color: white;
}

.select a {
	color: white;
}

#mainimg #img_m {
	width: 700px;
}

.buyinfopage table {
	width: 100%;
	border: 1px solid #ddd;
	margin-bottom: 200px;
}

.buyinfopage table td {
	padding: 10px;
}

#select_num {
	width: 50px;
}

#num_div {
	float: right;
}

.table-hover {
	width: 70%;
	margin-bottom: 200px;
	position: absolute;
	left: 15%;
}

.table-hover th {
	background-color: gray;
	height: 40px;
	color: white;
}

.table-hover td {
	height: 30px;
	border: 1px solid brack;
}
</style>
<c:set var="cp" value="${ pageContext.request.contextPath}" />
<div class="Productcontainer">

	<!--상세이미지(작은이미지) -->
	<div class="blank" id="sideimg">
		<img src="${cp }/imagesPro/${img}" id="detailimg" onmouseover="changeimg(event)">
		<c:forEach var="imgs" items="${imgsList}">
			<img src="${cp }/imagesPro/${imgs}" id="detailimg" onmouseover="changeimg(event)">
			<br>
		</c:forEach>
	</div>
	<!--메인이미지 -->
	<div class="blank" id="mainimg">
		<img src="${cp }/imagesPro/${img}" id="img_m">
	</div>
	<!--제품 선택 -->
	<div class="blank" id="product_text">
		<div style="font: 80px;">
			<h1>${vo.pName }</h1>
		</div>
		<input type="hidden" value="${vo.pPrice }" id="price">
		<div id="pricediv"></div>
		<hr width=100% color="gray" align="left" size=1 id="line">
		<div>
			배송비

			<div style="font-size: 10px; float: right;">2,500[70,000 이상 구매시 배송비 무료]</div>
		</div>

		<div>
			사이즈
			<select style="width: 80%; float: right;" id="select_size" onchange="addproduct()">
				<option value="noselect">[필수] 옵션을 선택해주세요</option>
				<option value="noselect">------------------------------------</option>
				<c:forEach var="vo" items="${list}">
					<option value="${vo.pdNum}">${vo.proSize}</option>

				</c:forEach>

			</select>
			<div style="font-size: 5px; color: red;">위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다.</div>
		</div>
		<hr width=100% color="gray" align="left" size=1 id="line">
		<!-- 사이즈 선택시 해당 div에 추가 -->

		<div id="adddiv"></div>


		<table style="width: 100%">

			<tr>
				<td>
					<div style="font-size: 20px;">TOTAL</div>
				</td>
				<td>
					<div style="font-size: 20px; text-align: right;" id="total">0</div>
				</td>
			</tr>
		</table>



		<!-- 구매하기,장바구니 버튼 -->
		<div>
			<table>
				<tr>
					<td>
					<!-- 구매하기 파라미터 넘기는 form -->
						<form method="post" id="buyform" name="buyform" action="${cp}/toMyOrder?pNum=${ vo.pNum }">
			                 <!-- pdNum -->
			                  <input type="hidden" value="" id="pdNum" name="pdNum"> 
							 <!-- 구매수량 -->
							  <input type="hidden" value="0" id="num" name="num"> 
							  <!-- 총구매가격 -->
							  <input type="hidden" value="0" id="pricetotal" name="pricetotal"> 
							  <input type="submit" value="구매하기" class="buybut">
						</form>
					</td>
					<td>
						<form method="post" action="${cp }/cartinsert" id="addcart">
							<input type="hidden" value="${img}" name="mainimg">
							 <input type="hidden" value="${vo.pName }" id="name" name="pName"> 
							 <input type="hidden" value="0" id="num" name="num"> 
							 <input type="hidden" value="0" id="pricetotal" name="pricetotal"> 
							 <input type="button" value="장바구니" class="cartbut" onclick="addcart()">
						</form>
					</td>
				</tr>
			</table>



		</div>
	</div>
	<!-- 제품상세-->
	<div class="blank" id="product_detail">
		<div class="productpage" id="productpage">
			<div id="menu_sel">
				<ul>
					<li class="select"><a href="#product_detail">제품상세</a></li>
					<li><a href="#buyinfopage">결제정보</a></li>
					<li><a href="#reviewPage">제품리뷰</a></li>
				</ul>
				<hr width=100% color="gray" align="left" size=1>
				<br>
			</div>

			<div>${vo.pContent }<br>
				<c:forEach var="imgs" items="${imgsList}">
					<img src="${cp }/imagesPro/${imgs}" style="width: 700px;">
					<br>
				</c:forEach>
			</div>
		</div>
		<!-- 결제정보 보여주기용-->
		<div class="buyinfopage" id="buyinfopage">
			<div id="menu_sel">
				<ul>
					<li><a href="#product_detail">제품상세</a></li>
					<li class="select"><a href="#buyinfopage">결제정보</a></li>
					<li><a href="#reviewPage">제품리뷰</a></li>
				</ul>
				<hr width=100% color="gray" align="left" size=1>
				<br>
			</div>
			<table>
				<tr>
					<td style="background-color: gray; width: 100px;">결제안내</td>
					<td id="buyinfo">내용 뿌려주기</td>
				</tr>
				<tr>
					<td style="background-color: gray; width: 100px;">교환반품</td>
					<td>내용 뿌려주기</td>
				</tr>
			</table>
		</div>

		<!-- 리뷰 정보 가져오는 div-->
		<div class="reviewPage" id="reviewPage">
			<div id="menu_sel">
				<ul>
					<li><a href="#product_detail">제품상세</a></li>
					<li><a href="#buyinfopage">결제정보</a></li>
					<li class="select"><a href="#reviewPage">제품리뷰</a></li>
				</ul>
				<hr width=100% color="gray" align="left" size=1>
				<br>
			</div>

			<table class="table-hover">

				<tr class="table-secondary">
					<%--<th scope="col">리뷰글번호</th> --%>
					<th scope="col">리뷰 내용</th>
					<th scope="col">평점</th>
					<th scope="col">아이디</th>
					<th scope="col">작성일</th>
				</tr>

				<c:forEach var="revvo" items="${ rvlist }">
					<tr>
						<td scope="row">${ revvo.content }</td>
						<td scope="row">${ revvo.cScore }</td>
						<td scope="row">${ revvo.mid }</td>
						<td scope="row">${ revvo.cDate }</td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>
</div>
<!-- 
   총 구매 가격=id:pricetotal,name:pricetotal
   수량 =id:select_num,name:select_num
   
   
 -->

<script type="text/javascript">
	var flg = false;
	//이미지 변경 
	function changeimg(e) {
		let mainimg = document.getElementById("img_m");

		mainimg.setAttribute("src", e.target.src);

	}

	function changeprice(n) {
		//가격가져오기
		let price = document.getElementById("price").value;
		
		if (n > 1) {
			price * n;
			return (price * n).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

		} else {
			return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

		}

	}
	//선택시 div생성
	function addproduct() {
		var sel = document.getElementById("select_size").value;
		
		if(sel =="noselect"){
			return false;
		}
		if(flg){
			return false;
		}
		
		let div = document.getElementById("adddiv");
		//select value값 가져오기
		var select = document.getElementById("select_size");
		var select_size = select.options[select.selectedIndex].text;
		//pdnum값 가져오기
		
		var pdNum = document.getElementById("pdNum");
		pdNum.value=select.value;
		//div추가(사이즈 정보,가격정보,)
		let size_div = document.createElement("div");
		let num_div = document.createElement("div");
		let Price_div = document.createElement("div");
		Price_div.setAttribute("id", "Price_div");
		//이름가져오기
		let name = document.getElementById("name").value;
		//이름

		//input(수량선택)
		let select_num = document.createElement("input");
		num_div.setAttribute("id", "num_div");
		select_num.setAttribute("type", "number");
		select_num.setAttribute("id", "select_num");
		select_num.setAttribute("name", "select_num");
		select_num.setAttribute("min", "1");
		select_num.setAttribute("value", "1");
		//사이즈
		size_div.innerHTML = name;
		size_div.innerHTML += "<br>size : " + select_size;
		//가격
		select_num.setAttribute("id", "select_num");
		select_num.setAttribute("onchange", "addprice()");
		Price_div.innerHTML = changeprice(1);

		let line = document.createElement("hr");
		line.setAttribute("id", "line");

		div.appendChild(size_div);
		div.appendChild(num_div);
		num_div.appendChild(select_num);
		div.appendChild(Price_div);

		div.appendChild(line);
		flg = true;

		
		addprice();
	}
	function totalprice() {
		let Price_div = document.getElementById("Price_div").innerText;
		let total = document.getElementById("total");
		console.log(Price_div);
		console.log(total);
		total.innerText = Price_div;
	}
	function addprice() {
		let num = document.getElementById("select_num").value;
		let price = document.getElementById("price").value;
		let Price_div = document.getElementById("Price_div");
		let pricetotal = document.getElementById("pricetotal");
		let addnum = document.getElementById("num");
		addnum.value = num;
		Price_div.innerHTML = changeprice(num);
		pricetotal.value = price * num;
		totalprice();
	}

	window.onload = function() {
		let pricediv = document.getElementById("pricediv");
		pricediv.innerHTML = changeprice(1);
	}
	var xhr = null;
	window.onload = function getData() {
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = callback;
		xhr.open('get', '../product/buyinfo.xml', true);
		xhr.send();
	}
	function callback() {

		console.log("callback..." + xhr.readyState);
		//xhr.status == 200 :응답이 성공적인 경우
		if (xhr.readyState == 4 && xhr.status == 200) {
			//let xml = xhr.responseText;
			let xml = xhr.responseText;//응답결과를 XML DOM객체로 얻어오기
			let div = document.getElementById("buyinfo");
			div.innerHTML = xml;
		}
	}
	function addcart(){

		
		var theForm = document.buyform;
		theForm.action = "${cp}/cartinsert";
		document.getElementById("buyform").submit();
		
		if(xhr.readyState==4 && xhr.status==200){
			alert("장바구니담기성공");
			let xml=xhr.responseXML;
			//let exist=xml.getElementsByTagName("exist")[0].textContent;
			
			if(confirm("쇼핑을 계속하시겠습니까?")){
				let span=document.getElementById("계속");
			}else{
				span.innerHTML="장바구니이동";
			}
			/*			let span=document.getElementById("계속");
 			if(exist=='true'){
				span.innerHTML="쇼핑계속하기";
			}else{
				span.innerHTML="장바구니이동";
			}*/
 		}
	}
</script>