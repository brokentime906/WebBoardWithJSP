<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "bbs.BbsDAO" %>




<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width" initial-scale="1" charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<title>바뀐ㅇ거맞냐</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID =  Integer.parseInt(request.getParameter("bbsID") );
		}
		if(bbsID == 0 ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		int pageNumber= 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber= Integer.parseInt(request.getParameter("pageNumber"));
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		
		
	%>
	 	<nav class="navbar navbar-default">
	 		<div class="navbar-header">
	 			<button type="button"  class="navbar-toggle collapsed"
	 					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
	 					aria-expanded="true
	 					">
	 					<span class="icon-bar"></span>
	 					<span class="icon-bar"></span>
	 					<span class="icon-bar"></span>
	 			</button>
	 			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
	 		</div>
	 		
	 		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	 			<ul class="nav navbar-nav">
	 				<li  class="active"><a href="main.jsp">메인</a></li>
	 				<li><a href="bbs.jsp">게시판</a></li>			
	 			</ul>
	 			<%
	 				if(userID ==null){
	 			%>
	 				<ul class="nav navbar-nav navbar-right">
	 			<li class="dropdown">
	 				<a href="#" class="dropdown-toggle" data-toggle="dropdown"
	 					role="button" aria-haspopup="true" aria-expanded="false">
	 					접속하기<span class="caret"></span></a>
	 					<ul class="dropdown-menu">
	 						<li><a href="login.jsp">로그인</a>
	 						<li><a href="join.jsp">회원가입</a>
	 					</ul>
	 			</ul>
	 			<%		
	 				} else{
	 			%>
	 				<ul class="nav navbar-nav navbar-right">
	 			<li class="dropdown">
	 				<a href="#" class="dropdown-toggle" data-toggle="dropdown"
	 					role="button" aria-haspopup="true" aria-expanded="false">
	 					회원관리<span class="caret"></span></a>
	 					<ul class="dropdown-menu">
	 						<li><a href="logoutAction.jsp">로그아웃</a>
	 						<li><a href="nothing.jsp">정보수정 아직 안만듬</a>
	 					</ul>
	 			</ul>
	 			<%		
	 				}
	 			%>
	 			
	 		</div>
	 	</nav>
	 	
	 	<div class="container">
	 		<div class="row">	 			
	 				<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
		 				<thead>
		 					<tr>
		 						<th colspan="1" style="background-color: #eeeeee;text-align:center;">게시판 글 보기</th>
		 					</tr>
		 				</thead>
		 				<tbody>
		 					<tr>
		 						<td style="width:20%;">글 제목</td>
		 						<td colspan="2"><%= bbs.getBbsTitle() %> </td>
		 					</tr>
		 					<tr>
		 						<td >작성자</td>
		 						<td colspan="2"><%= bbs.getUserID() %> </td>
		 					</tr>
		 					
		 					<tr>
		 						<td>작성 일자</td>
	 							<td><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13)+"시 " +bbs.getBbsDate().substring(14,16)+"분 "%></td>
		 					</tr>
		 					
		 					<tr>
		 						<td>글 내용</td>
		 						<td colspan="2" style="min-height:200px; text-align: left;"><%= bbs.getBbsContent() %> </td>
		 					</tr>
		 				</tbody>
		 				
	 				</table>		
	 				<a href="bbs.jsp?pageNumber=<%= pageNumber %>" class="btn btn-primary">게시판으로 가기</a>
	 				<%
	 					if(userID != null && userID.equals(bbs.getUserID())){
	 				%>
	 					<a onclick="return confirm('수정 진짜 할거야?')"href="update.jsp?bbsID=<%=bbs.getBbsID() %>" class="btn btn-primary ">수정</a>
	 					<a onclick="return confirm('삭제 진짜 할거야?')" href="deleteAction.jsp?bbsID=<%=bbs.getBbsID() %>" class="btn btn-primary ">삭제</a>
	 				<%
	 					}
	 				%>
	 		</div>
	 	</div>
	 		
	 	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	 	<script src="js/bootstrap.js"></script>
</body>
</html>


























