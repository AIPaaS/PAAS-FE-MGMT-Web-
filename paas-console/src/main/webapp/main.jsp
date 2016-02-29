<%@ page contentType="text/html; charset=utf-8"%>


<%
String ContextPath = request.getContextPath();
String url = ContextPath+"/dispatch/mc/00";
//request.getRequestDispatcher("/sso/client/auth/verifyLogin").forward(request, response);
response.sendRedirect(url);
%>