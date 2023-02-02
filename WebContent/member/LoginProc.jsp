<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 되어있는 상태인지 확인
	String loginId = (String)session.getAttribute("loginId"); // 오브젝트
	if(loginId != null){
		//로그인된 상태일때
		System.out.println("로그인 상태2");
		response.sendRedirect("loginSuccess.jsp");
	}else{
		
		
		//1. 요청에서 파라미터 가져오기
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		String remember = request.getParameter("remember");
		
		System.out.println("userid : " + userid );
		System.out.println("userpw : " + userpw );
		System.out.println("remember : " + remember );
		
		//2. 아이디와 비밀번호가 같으면 로그인 성공으로 처리
			// - 아이디 기억하기 여부에 따라 쿠키를 생성하여 응답 (1시간 유지하는 쿠키)
		
		if(userid.equals(userpw)){
			System.out.println("로그인성공");
			
			session.setAttribute("loginId", userid); // 세션에 값 저장
			
			
			// 쿠키
			if(remember != null){
				//아이디 기억하기가 체크가 되어있으면
				Cookie rememberCookie = new Cookie("remember", userid); // 쿠키 배열 생성
				rememberCookie.setMaxAge(60*60);
				response.addCookie(rememberCookie); //서버에 쿠키저장
				System.out.println("아이디 쿠키 저장");
			}else{
				Cookie rememberCookie = new Cookie("remember", userid); // 쿠키 배열 생성
				rememberCookie.setMaxAge(0);
				response.addCookie(rememberCookie); //서버에 쿠키저장
				System.out.println("아이디 쿠키 삭제");
			}
			response.sendRedirect("loginSuccess.jsp");
			
		}else{
			System.out.println("로그인 실패");
			response.sendRedirect("loginSuccess.jsp");
		}
			
	}
%>