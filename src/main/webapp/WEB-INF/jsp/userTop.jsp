<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<span class="pull-right">
    <c:if test="${!empty user}">
        这是你的用户名:
        <a href="login">${user.nickname}</a>
        <a href="logout">退出</a>
    </c:if>
    <c:if test="${empty user}">
        你可以:
        <a href="login">登录</a>
        <a href="register">注册</a>
    </c:if>
</span>