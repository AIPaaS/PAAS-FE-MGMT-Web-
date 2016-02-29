<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="com.binary.core.util.BinaryUtils"%>

<%
String ContextPath = request.getContextPath();
String url = (String)request.getAttribute("integration_url");
%>

<jsp:include page="/layout/jsp/integration_head.jsp"></jsp:include>



<iframe id="if_integration" frameborder='0' width='100%' src="<%=url%>"></iframe>


<jsp:include page="/layout/jsp/footer.jsp"></jsp:include>
<script type="text/javascript">
function autoAdaptPageSize() {
	var outside = 50;
	$("#content-wrapper").css("min-height",($(window).height()-outside)+"px");
	$("#if_integration").css("height", ($(window).height()-outside-outside-5)+"px");
}
function init() {
	autoAdaptPageSize();
	$(window).bind("resize", function() {
		autoAdaptPageSize();
	});
}
</script>