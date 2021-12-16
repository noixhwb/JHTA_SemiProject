<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <script type="text/javascript">
   window.onload= function(){
            document.getElementById("aid").value = opener.document.getElementById("id").value;
        }
 
   </script>

<span>아이디는 사용가능한 아이디 입니다.~</span>
아이디  <input type="text" id="aid">

<input type="button" value="중복확인">