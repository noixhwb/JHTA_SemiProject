<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>


	<form method="post" action="<%=request.getContextPath() %>/join">
   		 <h1>회원가입</h1>
    <table>
        <tr>
            <th>
                <p align="right">아이디</p>
            </th>
            <td><input type="text" name="mid"></td>
        </tr>
        
        <tr>
            <th>
                <p align="right">비밀번호</p>
            </th>
            <td><input type="password" name="mpwd"></td>
        </tr>
        
        <tr>
            <th>
                <p align="right">이름</p>
            </th>
            <td><input type="text" name="mname"></td>
        </tr>
        <tr>
            <th>
                <p align="right">주소</p>
            </th>
            <td><input type="text" name="maddr"></td>
        </tr>
        <tr>
            <th>
                <p align="right">연락처</p>
            </th>
            <td><input type="text" name="mphone"></td>
        </tr>
        <tr>
            <th>
                <p align="right">&nbsp;</p>
            </th>
            <td>
            <input type="submit" value="가입하기">
            <input type="reset" value="다시입력">
            </td>
        </tr>
    </table>
</form>

