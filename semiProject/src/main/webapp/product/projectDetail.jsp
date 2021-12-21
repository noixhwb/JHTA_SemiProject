<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.Productcontainer {
	display: grid;
	grid-template-areas: 
	"  a    b    c   "
		"  detail    detail    detail   "
}

.blank {
	background-color: gray;
}

#sideimg {
	grid-area: a;

}

#mainimg {
	grid-area: b;
}

#product_text {
	grid-area: c;
}

#product_detail {
	grid-area: detail;
}
</style>

<div class="Productcontainer">
	<div class="blank" id="sideimg">이미지들</div>
	<div class="blank" id="mainimg">메인이미지</div>
	<div class="blank" id="product_text">제품명</div>
	<div class="blank" id="product_detail">제품명</div>
</div>