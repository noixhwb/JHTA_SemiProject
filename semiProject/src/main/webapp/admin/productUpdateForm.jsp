<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.product_detail {
	width: 60%;
	border-collapse: separate;
	padding-bottom: 200px;
	position: absolute;
	left: 350px;
}

.product_detail td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	border-color: black;
}

#detailimg {
	width: 200px;
}

.product_detail #col {
	background-color: black;
	color: white;
	width: 100px;
}
</style>
<!-- 제품상세페이지(관리자용) -->
<h1 style="text-align: center; padding-bottom: 50px;">제품수정페이지</h1>
<c:set var="cp" value="${ pageContext.request.contextPath}" />
<!-- 카테고리 -->
<div>
	<table class="product_detail">
		<!-- 카테고리 -->
		<tr>
			<td id="col">대분류</td>
			<td><select name="category" onchange="createoption(this)">
		<option value="1">---option을 선택해주세요---</option>
		<option value="상의">상의</option>
		<option value="하의">하의</option>
		<option value="아우터">아우터</option>
	</select>
	<br><p style="font-size:5px;color:red;">옵션을 선택해주세요</p>
	</td>
			<td id="col">소분류</td>
			<td>
				<input type="hidden" value="${requestScope.vo.cName}" id="hiddenCname">
				<select id="selectcname" name="cname">
				<option>---option을 선택해주세요---</option>
				</select>

			</td>
			<!-- 제품번호 -->
		</tr>
		<tr>
			<td id="col">제품번호</td>
			<td colspan="3">${requestScope.vo.pNum}
				<input type="hidden" value="${requestScope.vo.pNum}" name="pnum">
			</td>
		</tr>
		<!-- 제품명 -->
		<tr>
			<td id="col">제품명</td>
			<td colspan="3">
				<input type="text" value="${requestScope.vo.pName}" name="pName">
			</td>
		</tr>
		<!-- 제품 내용 -->
		<tr>
			<td id="col">내용</td>
			<td colspan="3">
				<textarea name="pContent">${requestScope.vo.pContent}</textarea>
			</td>
		</tr>
		<!-- 사이즈 개수 -->

		<c:forEach var="i" items="${list}">
			<tr>
				<td id="col">사이즈</td>
				<td>
					<input type="text" value="${i.proSize}" name="prosize">
				</td>
				<td id="col">재고량</td>
				<td>${i.proCount}</td>
			</tr>
		</c:forEach>

		<!-- 대표이미지 -->
		<tr>
			<td id="col">대표이미지</td>
			<td>
				<input type="file" name="file"><br>
			</td>
		</tr>
		<tr>
			<td id="col">상세이미지 업로드 개수</td>
			<td>
				<input type="number" id="num" class="num" min="0"> <input type="button" value="확인" onclick="createfilebox()">
			</td>
		</tr>
		<tr>
			<td id="col">상세이미지</td>
			<td>
				<div id="fileBox"></div>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align: right;">
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align: right;">
				<input type="button" value="수정"> <input type="button" value="삭제"> <input type="button" value="목록으로">
			</td>
		</tr>
	</table>

</div>

<script type="text/javascript">
//첨부파일 input 생성 함수
function createfilebox() {
	let n = document.getElementById("num").value;
	let fileBox = document.getElementById("fileBox");
	fileBox.innerHTML ="";
	for (var i = 0; i < n; i++) {
		fileBox.innerHTML += "파일번호" + (i+1);
		let file = document.createElement("input");
		file.setAttribute("type", "file");
		file.setAttribute("name", "files" + i);
		fileBox.appendChild(file);
		fileBox.innerHTML += "<br>";
	}
}
//사이즈추가 삭제

//카테고리값 소분류 select 생성
function createoption(e)
{
	var category=e.value;
	let selectcname=document.getElementById("selectcname");
	if(category=="상의")
	{
		selectcname.options.length=1;
		let option1 =document.createElement("option");
		option1.text="니트";
		let option2 =document.createElement("option");
		option2.text="티셔츠";
		selectcname.appendChild(option1);
		selectcname.appendChild(option2);
	}
	else if(category=="하의")
	{
		selectcname.options.length=1;
		let option1 =document.createElement("option");
		option1.text="슬랙스";
		let option2 =document.createElement("option");
		option2.text="트레이닝";
		selectcname.appendChild(option1);
		selectcname.appendChild(option2);
	}
	else if(category=="아우터")
	{
		selectcname.options.length=1;
		let option1 =document.createElement("option");
		option1.text="가디건";
		let option2 =document.createElement("option");
		option2.text="코트";
		selectcname.appendChild(option1);
		selectcname.appendChild(option2);
	}
}
</script>
