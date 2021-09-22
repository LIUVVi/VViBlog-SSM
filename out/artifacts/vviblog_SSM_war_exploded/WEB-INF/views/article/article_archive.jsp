<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>文章内容</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/article/article_archive.css">
</head>
<body>
<div class="header">
    <div class="show-menu">
        <i id="fa-bars" class="fa fa-bars"></i>
    </div>
    <ul class="nav">
        <li><a href="${pageContext.request.contextPath}/1"><i class="fa fa-home fa-fw"></i>首页</a></li>
        <li><a class="active" href="${pageContext.request.contextPath}/ArchiveList"><i class="fa fa-bookmark fa-fw"></i>归档</a></li>
        <%--<li><a href="ss">心情</a></li>--%>
        <li><a href="${pageContext.request.contextPath}/FriendLinks"><i class="fa fa-link fa-fw"></i>友链</a></li>
        <li><a href="${pageContext.request.contextPath}/about"><i class="fa fa-info-circle fa-fw"></i>关于</a></li>
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
            <h1>归档</h1>
        </div>
    </div>
</div>
<div class="main">
    <c:forEach items="${arch}" var="ar">
        <div class="links-box">
            <h1>${ar.year}(${ar.count})</h1>
                <c:forEach items="${ar.articles}" var="art">
                    <h4><a class="link" href="${pageContext.request.contextPath}/articleContent/${art.article_id}"><i class="fa fa-calendar-o"></i>&nbsp;&nbsp;${ fn:substring( art.create_time ,5,10)}&nbsp;&nbsp;${art.title}</a><br/></h4>
                </c:forEach>
        </div>
    </c:forEach>
</div>
<img id="top" src="${pageContext.request.contextPath}/static/images/top.png" alt="加载失败">
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/common.js"></script>
<script>

</script>


</body>
</html>
