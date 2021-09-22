<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome-4.7.0/css/font-awesome.min.css">
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
        <li><a href="${pageContext.request.contextPath}/about"><i class="fa fa-info-circle fa-fw"></i>关于</a></li>
        <li><a class="active" href="${pageContext.request.contextPath}/login"><i class="fa fa-sign-in fa-fw"></i>登录</a></li>
        <li><a href="${pageContext.request.contextPath}/register"><i class="fa fa-map-signs fa-fw"></i>注册</a></li>
    </ul>

    <div class="header-content">
        <div class="header-text">
            <h1>VVi'S blog</h1>
            <h2>我越是孤独，越是没有朋友，越是没有支持，我就得越尊重我自己。</h2>
            <h3>--简爱</h3>
        </div>
    </div>
</div>
<div class="login">

    <form action="${pageContext.request.contextPath}/checkLogin" method="post">
        <input id="username" class="input" name="username" type="text" placeholder="用户名"><br/>
        <input id="password" class="input" name="password" type="password" placeholder="密码"><br/>

        <input id="btn-login" class="btn-login" type="submit" value="立即登录">
    </form>


</div>
<c:if test="${not empty msg}">
    <script>
        alert("${msg}");
    </script>
</c:if>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/common.js"></script>
<script>

    function checkUsername(){
        if($("#username").val().trim()==""){
            return false;
        }else {
            return true;
        }
    }

    function checkPassword(){
        if($("#password").val().trim()==""){
            return false;
        }else {
            return true;
        }
    }

    $(document).ready(function () {
        $("#btn-login").click(function () {
            if(checkUsername()&&checkPassword()){
                this.disabled=true;
                this.parentNode.submit();
            }else{
                alert("用户名或密码不能为空");
                return false;
            }
        })
    })
</script>

</body>
</html>
