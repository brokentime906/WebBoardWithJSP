<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID=(String)session.getAttribute("userID");
		}
		int bbsID =0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(userID == null){
			/*//session.setAttribute("userID"\,//user.getUserID());*/
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		else{
			
			{
				BbsDAO bbsDAO = new BbsDAO();
				
				int result = bbsDAO.deleteBbs(bbsID);
				
				
				if (result ==-1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					//session.setAttribute("userID" ,user.getUserID());
					PrintWriter script = response.getWriter();
					script.println("<script>");
					//script.println("location.href='view.jsp?bbsID=" + bbs.getBbsID()+"'");
					script.println("location.href='bbs.jsp'");
					script.println("</script>");
				}
			}	
		}
				
	%>
</body>
</html>


























