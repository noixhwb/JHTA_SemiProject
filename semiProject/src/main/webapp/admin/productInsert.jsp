<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.num {
	width: 50px;
}
.sel{
	display: none;
}
.productinertform{
	width: 60%;
	border-collapse: separate;
	padding-bottom: 200px;
	position: absolute;
	left: 350px;
}

.productinertform td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	border-color: black;
}

 .productinertform  #col
 {
 background-color: black;
 color:white;
 width: 100px;
 }

</style>
	<h1 style="text-align: center; padding-bottom: 20px;">제품 등록</h1>
<form method="post" action="${ pageContext.request.contextPath}/Home?spage=/admin/productInsert" enctype="multipart/form-data">

<table class="productinertform">
<tr>
<td id="col">대분류</td>
<td>	<!-- 카테고리 -->
	<select name="category" onchange="createoption(this)">
		<option value="1">---option을 선택해주세요---</option>
		<option value="상의">상의</option>
		<option value="하의">하의</option>
		<option value="아우터">아우터</option>
	</select>
	<br><p style="font-size:5px;color:red;">옵션을 선택해주세요</p>

</td>
</tr>

<tr>
<td id="col">소분류</td>
<td>
<!-- 하위카테고리 -->
	<div id="select_c">
					<input type="hidden" value="${requestScope.vo.cName}" id="hiddenCname" name="cName">
		<select id="selectcname" name="cname">
				<option>---option을 선택해주세요---</option>
				</select>
				<br><p style="font-size:5px;color:red;">옵션을 선택해주세요</p>
	</div>
</td>
</tr>
<tr>
<td id="col">제품명</td>
<td><!-- 제품명 -->
	<input type="text" name="pName"></td>
</tr>
<tr>
<td id="col">제품가격</td>
<td>	<!-- 제품가격 -->
	<input type="text" name="pPrice"></td>
</tr>
<tr>
<td id="col">제품상세설명</td>
<td>	<textarea rows="10" cols="50" name="pContent"></textarea></td>
</tr>
<tr>
<td id="col">제품사이즈 입력개수</td>
<td><input type="number" id="num2" class="num" min="0"> <input type="button" value="확인" onclick="createsize()"></td>
</tr>
<tr>
<td id="col">제품사이즈</td>
<td><div id="sizeBox"></div></td>
</tr>
<tr>
<td id="col">대표이미지</td>
<td><input type="file" name="file"><br></td>
</tr>
<tr>
<td id="col">상세이미지 업로드 개수</td>
<td>
<input type="number" id="num" class="num" min="0"> <input type="button" value="확인" onclick="createfilebox()">
</td>
</tr>
<tr>
<td id="col">상세이미지</td>
<td>	<div id="fileBox"></div></td>
</tr>
<tr>
<td colspan="4" style="text-align: right;"> <input type="submit" value="등록"></td>
</tr>
</table>
</form>

<script type="text/javascript">
	//사이즈 입력창 생성 함수
	function createsize() {
		let n = document.getElementById("num2").value;
		let sizeBox = document.getElementById("sizeBox");
		sizeBox.innerHTML="";
		for (var i = 0; i < n; i++) {
			sizeBox.innerHTML += "사이즈입력: ";
			let size = document.createElement("input");
			size.setAttribute("type", "text");
			size.setAttribute("name", "prosize");
			sizeBox.appendChild(size);
			sizeBox.innerHTML += "재고개수: ";
			let count = document.createElement("input");
			count.setAttribute("type", "text");
			count.setAttribute("name", "procount");
			sizeBox.appendChild(count);
			sizeBox.innerHTML += "<br>";
		}
	}
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
	//카테고리 선택
	function sel_category(e)
	{
		var category=e.value;
		let cName=document.getElementsByClassName("sel");
		for(var i=0;i<cName.length;i++)
			{

			if(category==cName[i].id){
				cName[i].style.display="block";
				cName[i].setAttribute("name", "cName")
			}else
			{
				cName[i].style.display="none";
				cName[i].setAttribute("name", "")
			}
			
			}
			
	}
	function createoption(e)
	{
		var category=e.value;
		let selectcname=document.getElementById("selectcname");
		if(category=="상의")
		{
			selectcname.options.length=1;
			let option1 =document.createElement("option");
			option1.text="니트";
			option1.value="니트";
			let option2 =document.createElement("option");
			option2.text="티셔츠";
			option2.value="티셔츠";
			selectcname.appendChild(option1);
			selectcname.appendChild(option2);
		}
		else if(category=="하의")
		{
			selectcname.options.length=1;
			let option1 =document.createElement("option");
			option1.text="슬랙스";
			option1.value="슬랙스";
			let option2 =document.createElement("option");
			option2.text="트레이닝";
			option2.value="트레이닝";
			selectcname.appendChild(option1);
			selectcname.appendChild(option2);
		}
		else if(category=="아우터")
		{
			selectcname.options.length=1;
			let option1 =document.createElement("option");
			option1.text="가디건";
			option1.value="가디건";
			let option2 =document.createElement("option");
			option2.text="코트";
			option2.value="코트";
			selectcname.appendChild(option1);
			selectcname.appendChild(option2);
		}
	}

	//div보여주는용
</script>


