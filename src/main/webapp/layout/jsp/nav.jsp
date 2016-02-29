<%@ page contentType="text/html; charset=utf-8"%>

<%
String ContextPath = request.getContextPath();
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

<li class="hidden-xxs">
<a class="btn" href="<%=ContextPath%>/authority/logout" >
<i class="fa fa-power-off"></i>
</a>
</li>
</ul>
</div>
</div>

</header>