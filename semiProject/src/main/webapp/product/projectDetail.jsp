<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.Productcontainer{
	display: grid;
	grid-template-areas:
		"   a    main    b   "

}
.blank
{
background-color:gray;
}
#mainimg
{
grid-area: a;
}
</style>

<div class="Productcontainer">
	<div class="blank" id="mainimg">A</div>
	<div class="blank">A</div>
	<div class="blank">A</div>
     <div class="blank">A</div>
</div>