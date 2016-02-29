<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="com.aic.paas.frame.cross.bean.SysMenuNode,com.aic.paas.frame.cross.bean.DropRecord,com.aic.paas.frame.cross.bean.SysModuRes,com.aic.paas.frame.cross.bean.SysModu,com.aic.paas.frame.util.RequestKey,com.aic.paas.frame.cross.bean.ModuInfo,com.aic.paas.frame.cross.integration.AuthorityPreview,com.aic.paas.frame.util.MenuHtmlBuilder,com.binary.core.util.BinaryUtils,java.util.Enumeration,com.binary.framework.web.SessionKey,com.aic.paas.frame.cross.integration.PaasSsoLoginUser,java.util.List,java.util.ArrayList,java.util.Map,java.util.HashMap,com.binary.json.JSON,com.binary.framework.exception.ServiceException"%>


<%
String ContextPath = request.getContextPath();
PaasSsoLoginUser user = (PaasSsoLoginUser)session.getAttribute(SessionKey.SYSTEM_USER);
ModuInfo info = (ModuInfo)request.getAttribute(RequestKey.DYNAMIC_MODUINFO_KEY);

AuthorityPreview preview = user.getAuthorityPreview();
List<SysMenuNode> firsts = preview.getMenuChildNodes(0l);
String menuTreeHtml = MenuHtmlBuilder.buildMenuTreeHtml(ContextPath, firsts, info.getModu(), preview);
%>




<div id="nav-col">
<section id="col-left" class="col-left-nano">
<div id="col-left-inner" class="col-left-nano-content">
<div class="collapse navbar-collapse navbar-ex1-collapse" id="sidebar-nav">
<ul class="nav nav-pills nav-stacked">


<%=menuTreeHtml%>


</div>
</div>
</section>
</div>
