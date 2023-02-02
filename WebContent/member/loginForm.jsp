<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 되어있는 상태인지 확인
	String loginId = (String)session.getAttribute("loginId"); // 오브젝트
	if(loginId != null){
		//로그인된 상태일때
		System.out.println("로그인 상태");
		response.sendRedirect("loginSuccess.jsp");
	}
	
	// 로그인 값 처음 초기화
	String checked ="";
	String userid ="";
	Cookie[] cookie = request.getCookies();
	
	// 쿠키 설정 쿠키가 있으면	
	if(cookie != null && cookie.length > 0){
		for(int i=0;i<cookie.length;i++){
			if(cookie[i].getName().equals("remember")){
				checked = "checked";
				userid = cookie[i].getValue();
			}
		}
	}
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="LoginProc.jsp" method="post">
		<input type="text" name="userid" placeholder="아이디" value="<%= userid %>"> <br />
		<input type="password" name="userpw" placeholder="비밀번호"><br />
		아이디 기억하기 <input type="checkbox" name="remember" value="chR" <%= checked %>>
		<input type="submit" value="로그인">
	</form>
</body>
</html>

