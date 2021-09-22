<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>友情链接</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/article/friendlink_list.css">
</head>
<body>
<div class="header">
    <div class="show-menu">
        <i id="fa-bars" class="fa fa-bars"></i>
    </div>
    <ul class="nav">
        <li><a href="${pageContext.request.contextPath}/1"><i class="fa fa-home fa-fw"></i>首页</a></li>
        <li><a href="${pageContext.request.contextPath}/ArchiveList"><i class="fa fa-bookmark fa-fw"></i>归档</a></li>
        <%--<li><a href="ss">心情</a></li>--%>
        <li><a href="${pageContext.request.contextPath}/FriendLinks"><i class="fa fa-link fa-fw"></i>友链</a></li>
        <li><a class="active" href="${pageContext.request.contextPath}/about"><i class="fa fa-info-circle fa-fw"></i>关于</a></li>
        <c:choose>
            <c:when test="${empty u}">
                <li><a href="${pageContext.request.contextPath}/login"><i class="fa fa-sign-in fa-fw"></i>登录</a></li>
                <li><a href="${pageContext.request.contextPath}/register"><i class="fa fa-map-signs fa-fw"></i>注册</a></li>
            </c:when>
            <c:otherwise>
                <li id="myhead">
                    <img id="head" src="${pageContext.request.contextPath}/${u.image_url}" alt="图片加载失败"/>
                    <ul id="head-menu">
                        <li><a href="">信息</a></li>
                        <li><a href="${pageContext.request.contextPath}/singOut">退出</a></li>
                    </ul>
                </li>
                <li class="myhead-mobile"><a href=""><i class="fa fa-user fa-fw"></i>信息</a></li>
                <li class="myhead-mobile"><a href="${pageContext.request.contextPath}/singOut"><i class="fa fa-sign-out fa-fw"></i>退出</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
    <div class="header-content">
        <div class="header-text">
            <h1>关于</h1>
        </div>
    </div>
</div>
<div class="main">
        <div class="links-box">
            这个人很懒，没有留下什么信息...
        </div>
</div>
<img id="top" src="${pageContext.request.contextPath}/static/images/top.png" alt="加载失败">
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/common.js"></script>
<script>

</script>


</body>
</html>
