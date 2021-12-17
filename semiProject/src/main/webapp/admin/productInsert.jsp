<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.num {
	width: 50px;
}

.sel {
	display: none;
}

</style>

<form method="post" action="${ pageContext.request.contextPath}/Home?spage=/admin/productInsert" enctype="multipart/form-data">
	<h1>제품 등록</h1>
	<!-- 카테고리 -->
	<select name="category" onchange="sel_category(this)">
		<option value="1">상의</option>
		<option value="2">하의</option>
		<option value="3">아우터</option>
	</select>
	<br>
	<!-- 하위카테고리 -->
	<div id="select_c">
		<select name="cName" id="1" >
			<option value="니트">니트</option>
			<option value="티셔츠">티셔츠</option>
		</select>
		<select name="cName" id="2" class="sel">
			<option value="슬랙스">슬랙스</option>
			<option value="트레이닝">트레이닝</option>
		</select>
		<select name="cName" id="3" class="sel">
			<option value="코트">코트</option>
			<option value="가디건">가디건</option>
		</select>
	</div>
	<!-- 제품명 -->

	제품명:<input type="text" name="pName"><br>
	<!-- 제품가격 -->
	제품가격<input type="text" name="pPrice"><br>
	<!-- 제품상세 -->
	제품상세내용
	<textarea rows="10" cols="50" name="pContent"></textarea>
	<br>
	<!-- 제품사이즈 종류 -->

	사이즈 입력개수<input type="number" id="num2" class="num" min="0"> <input type="button" value="확인" onclick="createsize()">
	<div id="sizeBox"></div>


	<!-- 상세이미지 -->
	이미지 업로드 개수<input type="number" id="num" class="num" min="0"> <input type="button" value="확인" onclick="createfilebox()">
	<div id="fileBox"></div>

	<!-- 썸네일이미지 -->

	대표이미지<input type="file" name="file"><br> <input type="submit" value="전송">
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
		let cName=document.getElementsByName("cName");
		for(var i=0;i<cName.length;i++)
			{

			if(category==cName[i].id){
				cName[i].style.display="block";
			}else
			{
				cName[i].style.display="none";
			}
			
			}
			
	}

	//div보여주는용
</script>


