<%@ page import="javax.servlet.http.Cookie" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
         pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Login Success Page</title>
</head>
<body>
<%
  String userName = null;
  String user = null;
  String sessionID = null;

  // ???? ??????? ? ?????? ??????????? - ?????????????? ?? ??????? ?????
  if (session.getAttribute("user")==null){
    response.sendRedirect("login.html");
  } else{user = (String) session.getAttribute("user");}
  // ???????? ???????? ?? cookie
  Cookie[] cookies = request.getCookies();
  if(cookies !=null){
    for(Cookie cookie : cookies){
      if(cookie.getName().equals("user")) {userName = cookie.getValue();}
      if(cookie.getName().equals("JSESSIONID")){sessionID = cookie.getValue();}
    }
}else{
    sessionID = session.getId();
  }
  if(userName == null) response.sendRedirect("login.html");
%>
<h3>Hi <%=userName %>, Login successful. Your sessionID = <%=sessionID%>></h3>
<br>
Session attribute "user"= <%=user%>
<br>
<!-- need to encode all the URLs where we want session information to be passed -->
<a href="<%=response.encodeURL("CheckoutPage.jsp") %>">Checkout Page</a>
<form action="<%=response.encodeURL("LogoutServlet") %>" method="post">
  <input type="submit" value="Logout" >
</form>
</body>
</html>