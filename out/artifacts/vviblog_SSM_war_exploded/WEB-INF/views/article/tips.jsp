<%--
  Created by IntelliJ IDEA.
  User: vvi
  Date: 2019/8/20
  Time: 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>错误提示</title>
</head>
<body>
<script>
    <c:if test="${not empty loginmsg}">
        alert("${loginmsg}");
        location.href = "${pageContext.request.contextPath}/login";
    </c:if>

    <c:if test="${not empty activationsucc}">
        alert("${activationsucc}");
        location.href = "${pageContext.request.contextPath}/login";
    </c:if>

    <c:if test="${not empty singupsucc}">
        alert("${singupsucc}");
        location.href = "${pageContext.request.contextPath}/login";
    </c:if>

    <c:if test="${not empty singupfail}">
        alert("${singupfail}");
        location.href = "${pageContext.request.contextPath}/register";
    </c:if>

    <c:if test="${not empty addsucc}">
        alert("${addsucc}");
        location.href = "${pageContext.request.contextPath}/userList/1";
    </c:if>

    <c:if test="${not empty addfail}">
    alert("${addfail}");
    location.href = "${pageContext.request.contextPath}/userList/1";
    </c:if>
</script>
</body>
</html>
