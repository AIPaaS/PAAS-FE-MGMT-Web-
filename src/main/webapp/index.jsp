<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="com.binary.core.http.URLResolver,com.binary.core.lang.Conver,com.binary.core.util.BinaryUtils"%>

<%
String ContextPath = request.getContextPath();
String beforeUrl = request.getParameter("beforeUrl");
String url = ContextPath+"/authority/verifyLogin";
if(!BinaryUtils.isEmpty(beforeUrl) && beforeUrl.indexOf("index.jsp")<0) url += "?beforeUrl="+URLResolver.encode(beforeUrl);
//request.getRequestDispatcher("/sso/client/auth/verifyLogin").forward(request, response);
response.sendRedirect(url);
%>
