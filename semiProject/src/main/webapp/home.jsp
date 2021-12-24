<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
	 #wra{
	   display: grid;
	  grid-gap: 120px 8px;
	
	 }
	 
	 #wra #one {
	 grid-column: 1;
	 grid-row:1;
	 width: 500px; height: 900px;
	 cursor: pointer;
	}
	 #two {
	  grid-column: 2;
	  grid-row:1;
	  width: 500px; height: 900px;
	  cursor: pointer;
	}
	
	 #three {
	  grid-column: 3;
	  grid-row:1;
	  width: 400px; height: 900px;
	  cursor: pointer;
	}
	
	 #four {
	  grid-column: 4;
	  grid-row:1;
	  width: 480px; height: 900px;
	cursor: pointer;
	}
	
	
	
	
	#five{
	height: 300px;
	cursor: pointer;
	grid-column: 1;
	grid-row:2;
	}
	#six{
	 width:100%;  height:300px;
	 cursor: pointer;
	 grid-column: 3;
	 grid-row:2;
	}
	#box1{
	width:100%; height:300px;
	 grid-column: 1/4;
	 grid-row:3;
	}




</style> 

<div id="wra">
		<div id="one"><img src="images/main1.png" width="100%" height="100%"></div>
		<div id="two"><img src="images/main2.png" width="100%" height="100%"></div>
		<div id="three"><img src="images/main3.png" width="100%" height="100%"></div>
		<div id="four"><img src="images/main4.png" width="100%" height="100%"></div>
	
		<div id="five"><img src="images/main5.png" width="100%" height="100%"></div>
	 	<div id="six"><img src="images/main6.png" width="100%" height="100%"> </div>

		<div id="box1">
		<h2>베스트 초이스</h2>
		</div>

</div>
 	