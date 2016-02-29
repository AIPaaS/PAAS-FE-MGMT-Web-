<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="com.aic.paas.frame.cross.bean.DropRecord,com.aic.paas.frame.cross.bean.SysModuRes,com.aic.paas.frame.cross.bean.SysModu,com.aic.paas.frame.util.RequestKey,com.aic.paas.frame.cross.bean.ModuInfo,com.aic.paas.frame.cross.integration.AuthorityPreview,com.aic.paas.frame.util.MenuHtmlBuilder,com.binary.core.util.BinaryUtils,java.util.Enumeration,com.binary.framework.web.SessionKey,com.aic.paas.frame.cross.integration.PaasSsoLoginUser,java.util.List,java.util.ArrayList,java.util.Map,java.util.HashMap,com.binary.json.JSON,com.binary.framework.exception.ServiceException"%>


<%
String ContextPath = request.getContextPath();
PaasSsoLoginUser user = (PaasSsoLoginUser)session.getAttribute(SessionKey.SYSTEM_USER);
ModuInfo info = (ModuInfo)request.getAttribute(RequestKey.DYNAMIC_MODUINFO_KEY);

if(user == null) {
	response.sendRedirect(ContextPath+"/index.jsp");
	return ;
}

if(info == null) {
	ServiceException exception = new ServiceException(" The current page is not found the corresponding module object ! ");
	request.setAttribute("exception", exception);
	request.getRequestDispatcher("/error.jsp").forward(request, response);
	return ;
}


Map<?,?> params = request.getParameterMap();
Map<Object,Object> attributes = new HashMap<Object,Object>();
Enumeration<?> enumeration = request.getAttributeNames();

while(enumeration.hasMoreElements()) {
	Object key = enumeration.nextElement();
	if(key==null || !(key instanceof String) || RequestKey.DYNAMIC_IGNORE_KEYS.contains(key)) continue ;
	attributes.put(key, request.getAttribute((String)key));
}

AuthorityPreview preview = user.getAuthorityPreview();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>亚信云 - PAAS管理</title>
<link rel="shortcut icon" href="<%=ContextPath%>/layout/img/favicon.png" type="image/x-png" />

<link rel="stylesheet" type="text/css" href="<%=ContextPath%>/frame/bootstrap/css/bootstrap.min.css"/>

<link rel="stylesheet" type="text/css" href="<%=ContextPath%>/frame/centaurus/css/libs/font-awesome.css"/>
<link rel="stylesheet" type="text/css" href="<%=ContextPath%>/frame/centaurus/css/libs/nanoscroller.css"/>
<link rel="stylesheet" type="text/css" href="<%=ContextPath%>/frame/centaurus/css/compiled/theme_styles.css"/>

<link rel="stylesheet" href="<%=ContextPath%>/frame/centaurus/css/libs/fullcalendar.css" type="text/css"/>
<link rel="stylesheet" href="<%=ContextPath%>/frame/centaurus/css/compiled/calendar.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="<%=ContextPath%>/frame/centaurus/css/libs/morris.css" type="text/css"/>
<link rel="stylesheet" href="<%=ContextPath%>/frame/centaurus/css/libs/daterangepicker.css" type="text/css"/>
<link rel="stylesheet" href="<%=ContextPath%>/frame/centaurus/css/libs/jquery-jvectormap-1.2.2.css" type="text/css"/>

<script src="<%=ContextPath%>/frame/jquery/jquery-1.11.3.min.js"></script>
<script src="<%=ContextPath%>/frame/jquery/jquery.tmpl.min.js"></script>
<script src="<%=ContextPath%>/frame/jquery/jquery.twbsPagination.min.js"></script>
<script src="<%=ContextPath%>/frame/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=ContextPath%>/frame/centaurus/js/scripts.js"></script>
<script src="<%=ContextPath%>/frame/centaurus/js/pace.min.js"></script>
<script src="<%=ContextPath%>/frame/centaurus/js/jquery.nanoscroller.min.js"></script>

<script src="<%=ContextPath%>/frame/js/util/CommonUtils.js"></script>
<script src="<%=ContextPath%>/frame/js/util/json2.js"></script>
<script src="<%=ContextPath%>/frame/js/util/RemoteService.js"></script>
<script src="<%=ContextPath%>/frame/js/util/PageRequest.js"></script>
<script src="<%=ContextPath%>/frame/js/util/ProjectUtils.js"></script>

<script type="text/javascript">
<%
out.print("var ContextPath = '"+ContextPath+"';");
out.print("var MODU = "+JSON.toString(info.getModu())+";");		//当前模块对象
out.print("var SU = {id:"+user.getId()+",userCode:\""+user.getUserCode()+"\",userName:\""+user.getUserName()+"\"};");		//登录用户
//out.print("var DROP = "+JSON.toString(info.getDropMap())+";");
out.print("var PRQ = new PageRequest({params:"+(params==null?"{}":JSON.toString(params))+",attributes:"+(attributes==null?"{}":JSON.toString(attributes))+"});");
out.print("var BASEFLAG_ERRORMSG=\"\";");
out.print("var BASEFLAG_COUNTER=1;");
out.print("var BaseDefaultStyleColor='black';");
out.print("var BaseDisabledStyleColor='gray';");
%>

</script>
</head>


<body class="pace-done theme-blue-gradient fixed-header fixed-leftmenu">


<div id="theme-wrapper">
<jsp:include page="/layout/jsp/nav.jsp"></jsp:include>
<div id="page-wrapper" class="container">
<div class="row">
<jsp:include page="/layout/jsp/menu.jsp"></jsp:include>
<div id="content-wrapper">
<div class="row">
<div class="col-lg-12">



