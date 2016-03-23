<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="com.aic.paas.frame.cross.bean.DropRecord,com.aic.paas.frame.cross.bean.SysModuRes,com.aic.paas.frame.cross.bean.SysModu,com.aic.paas.frame.util.RequestKey,com.aic.paas.frame.cross.bean.ModuInfo,com.aic.paas.frame.cross.integration.AuthorityPreview,com.aic.paas.frame.util.MenuHtmlBuilder,com.binary.core.util.BinaryUtils,java.util.Enumeration,com.binary.framework.web.SessionKey,com.aic.paas.frame.cross.integration.PaasSsoLoginUser,java.util.List,java.util.ArrayList,java.util.Map,java.util.HashMap,com.binary.json.JSON,com.binary.framework.exception.ServiceException"%>


<%
String ContextPath = request.getContextPath();
PaasSsoLoginUser user = (PaasSsoLoginUser)session.getAttribute(SessionKey.SYSTEM_USER);
%>

<header class="navbar" id="header-navbar">
<div class="container">
<a id="logo" class="navbar-brand">
<img src="<%=ContextPath%>/layout/img/paas_console_logo.png" alt="" class="normal-logo logo-white"/>
</a>

<div class="nav-no-collapse pull-right" id="header-nav">
<ul class="nav navbar-nav pull-right">
<li class="mobile-search">
</li>
<li class="dropdown hidden-xs">

<ul class="dropdown-menu notifications-list">
<li class="pointer">
<div class="pointer-inner">
<div class="arrow"></div>
</div>
</li>

</ul>
</li>
<li class="dropdown hidden-xs">
<ul class="dropdown-menu notifications-list messages-list">
<li class="pointer">
</li>
</ul>
</li>

<li style="padding:15px 0px 0px 10px;">
<font style="color:white">
您好，<%=user.getLoginCode() %>
</font>
</li>

<li class="hidden-xxs">
<a class="btn" href="<%=ContextPath%>/authority/logout" >
<i class="fa fa-power-off"></i>
</a>
</li>
</ul>
</div>
</div>

</header>