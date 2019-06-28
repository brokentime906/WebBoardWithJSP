<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>바뀐ㅇ거맞냐</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 되어잇지 않습니다 로그인해주세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 되어잇지 않습니다 로그인해주세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
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
	 			<a class="navbar-brand" href="main.jsp">세희야 사랑해</a>
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
	 			<form method="post" action="updateAction.jsp?bbsID=<%=bbsID %>">
	 				<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
		 				<thead>
		 					<tr>
		 						<th colspan="2" style="background-color: #eeeeee;text-align:center;">글 수정</th>
		 					</tr>
		 				</thead>
		 				<tbody>
		 					<tr>
		 						<td><input type="text" class="form-control" name="bbsTitle" value="<%= bbs.getBbsTitle() %>"></td>
		 					</tr>
		 					<tr>
		 						<td><textarea class="form-control"  name="bbsContent" maxlength="2048" style="height:350px;"><%=bbs.getBbsContent() %></textarea></td>
		 					</tr>
		 				</tbody>
		 				
	 				</table>
	 				<input onclick="return confirm('수정 진짜 할거야?')" type="submit" class="btn btn-primary pull-right" value="수정"> 
	 			</form>
	 			
	 		</div>
	 	</div>
	 		
	 	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	 	<script src="js/bootstrap.js"></script>
</body>
</html>


























