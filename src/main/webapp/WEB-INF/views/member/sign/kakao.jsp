<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Title</title>
</head>
<body>
<li th:text="|인가코드 = ${code}|">code</li>
<li th:text="|유효토큰 = ${access_token}|">code</li>
<li th:text="|사용자정보 = ${userInfo}|">code</li>
<li th:text="|동의정보 = ${agreementInfo}|">code</li>
<a href="https://kauth.kakao.com/oauth/logout?client_id=f452e17a96f35fd7646268f22602e110&logout_redirect_uri=http://localhost/member/sign/do">로그아웃</a>
</body>
</html>