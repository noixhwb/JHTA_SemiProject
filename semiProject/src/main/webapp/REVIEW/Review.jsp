<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Review.jsp</title>
	<style>
		* { margin:auto; }
		h1 {
		    font-size: 30px;
   		 	text-align: center;
    		border-bottom: 2px solid gray;
    		padding: 20px;
		}
		#product_pic, #product_detail { text-align: center; }
		table {
			border-top: 2px solid #444444;
			border-bottom: 2px solid #444444;
    		border-collapse: collapse;
  		}
  		th, td {
    		border-bottom: 1px solid #444444;
    		padding: 10px;
  		}
		#review_content { border: 2px solid grey; padding: 5px;}
		#review_submit { margin-top: 5px; display:block; }
		ul{ list-style:none; }
		span { font-size: 12px; }
		<!--
		.box-radio-input input[type="radio"]{ display:none; }
		.box-radio-input input[type="radio1"] + span{
		  display:inline-block;
		  background:none;
		  border:1px solid #dfdfdf;  
		  padding:0px 10px;
		  text-align:center;
		  height:35px;
		  line-height:33px;
		  font-weight:500;
		  cursor:pointer;
		}
		
		.box-radio-input input[type="radio1"]:checked + span{
		  border:1px solid #23a3a7;
		  background:#23a3a7;
		  color:#fff;
		}
		-->
	</style>
</head>
<body>
	<h1 style="text-align: center">리뷰 작성</h1>
	<div id="product">
		<div id="product_pic">
			<img src="images/hoddy.PNG">
		</div>
		<div id="product_detail">
			<ul>
				<li>제품명</li>
				<li>제품번호</li>
				<li>사이즈</li>
			</ul>
		</div>
	</div>
	<div id="cust_estm">
		<table>
			<tr>
				<th>품질</th>
				<td>
					<input type="radio" name="radio1" id="radio1-1">★★★★★
					<input type="radio" name="radio1" id="radio1-2">★★★★
					<input type="radio" name="radio1" id="radio1-3">★★★
					<input type="radio" name="radio1" id="radio1-4">★★
					<input type="radio" name="radio1" id="radio1-5">★
				<!-- 
					<label class="box-radio-input">
						<input type="radio" name="radio1" id="radio1-1">
						<span>별다섯</span>
					</label>
					<label class="box-radio-input">
						<input type="radio" name="radio1" id="radio1-2">
						<span>별넷</span>
					</label>
					<label class="box-radio-input">
						<input type="radio" name="radio1" id="radio1-3">
						<span>별셋</span>
					</label>
					<label class="box-radio-input">
						<input type="radio" name="radio1" id="radio1-4">
						<span>별둘</span>
					</label>
					<label class="box-radio-input">
						<input type="radio" name="radio1" id="radio1-5">
						<span>별하나</span>
					</label>
				 -->
				</td>
			</tr>
			<tr>
				<th>색상</th>
				<td>
					<input type="radio" name="radio2" id="radio2-1">밝아요
					<input type="radio" name="radio2" id="radio2-2">화면과같아요
					<input type="radio" name="radio2" id="radio2-3">어두워요
				</td>
			</tr>
			<tr>
				<th>사이즈</th>
				<td>
					<input type="radio" name="radio3" id="radio3-1">작아요
					<input type="radio" name="radio3" id="radio3-2">딱맞아요
					<input type="radio" name="radio3" id="radio3-3">커요
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<span>*200자 미만으로 작성해주세요</span> <br>
					<textarea rows="5" cols="50" id="review_content"></textarea>
				</td>
			</tr>
			<tr>
				<th>사진등록</th>
				<td>@@이건 할지말지..@@</td>
			</tr>
		</table>
		<input type="submit" value="리뷰등록" id="review_submit">
	</div>
</body>
</html>