<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	 #wra{
	   display: grid;
	  grid-gap: 120px 8px;
	grid-template-columns: 1f 1f;
	grid-column-gap: 20px;
	grid-row-gap: 40px;

	margin-top: 20px;
	grid-template-rows: 1000px 1fr;
		grid-template-areas: "  a    a     "
		"  b   c "
		"  d   d "
		"  f   g ";
	
	 }
	 
	 #one {
	grid-area: a;
	device-width: 100%; height: 1000px;
	 cursor: pointer;
	}

	
	
	
	
	
	#five{
	height: 300px;
	cursor: pointer;
		grid-area: b;
		margin:50px ;
	}
	#six{
	 width:100%;  height:300px;
	 cursor: pointer;
	 	grid-area: c;
	 margin:50px ;
	}
	#box1{
	width:100%; height:80px;
	grid-area: d;
	}
	#f{
	width:100%; height:800px;
	grid-area: f;
	}
	#g{
	width:100%; height:800px;
	grid-area: g;
	margin-bottom: 100px;
	}
</style> 

<div id="wra">
		<div id="one"><img src="images/2.gif" width="100%" height="100%"></div>

	
		<div id="five"><img src="images/main5.png" width="100%" height="100%"></div>
	 	<div id="six"><img src="images/main6.png" width="100%" height="100%"> </div>

		<div id="box1">
		<h2 style="text-align: center;">베스트 초이스</h2>

		</div>
		<div id="f">
		<img src="images/3.gif" width="100%" height="100%">

		</div>
			<div id="g">
		<img src="images/2.jpg" width="100%" height="100%">
		</div>

</div>