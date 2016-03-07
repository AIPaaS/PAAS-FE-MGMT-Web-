<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="com.binary.core.util.BinaryUtils"%>

<%
String ContextPath = request.getContextPath();
String url = (String)request.getAttribute("integration_url");
%>

<jsp:include page="/layout/jsp/integration_head.jsp"></jsp:include>



<iframe id="if_integration" frameborder='0' width='100%' src=""></iframe>


<jsp:include page="/layout/jsp/footer.jsp"></jsp:include>
<script type="text/javascript">
function autoAdaptPageSize() {
	var outside = 50;
	$("#content-wrapper").css("min-height",($(window).height()-outside)+"px");
	$("#if_integration").css("height", ($(window).height()-outside-outside-5)+"px");
}
function init() {
	var url = "<%=url%>";
	if(url.indexOf('?')<0) url += "?1=1";
	url += "&ParentLeftWidth="+$("#nav-col").width()+"&ParentHeaderHeight="+$("#header-navbar").height();
	$("#if_integration").prop("src", url);
	autoAdaptPageSize();
	$(window).bind("resize", function() {
		autoAdaptPageSize();
	});
}
</script>