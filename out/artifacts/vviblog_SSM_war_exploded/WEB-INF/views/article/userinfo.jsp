<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户信息</title>
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
                <li class="myhead-mobile"><a class="active" disabled><i class="fa fa-user fa-fw"></i>信息</a></li>
                <li class="myhead-mobile"><a href="${pageContext.request.contextPath}/singOut"><i class="fa fa-sign-out fa-fw"></i>退出</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
    <div class="header-content">
        <div class="header-text">
            <h1>信息</h1>
        </div>
    </div>
</div>
<div class="main">
        <div class="links-box">
            <div class="user-head">
                <img  src="${u.image_url}" alt="头像加载失败">
            </div>
            <div class="user-info">
                <p>昵称：${u.username}</p>
                <p>邮箱：${u.email}</p>
                <p>状态：<c:choose>
                            <c:when test="${u.status == 1}">正常
                            </c:when>
                        </c:choose>
                </p>
                <input id="btn-change-pwd" type="button" value="修改密码">
            </div>
        </div>
        <div class="chang-pwd">
            <div>
                <input class="input-pwd" id="old-pwd" type="password" placeholder="旧密码" autofocus><br>
                <p class="oldpwdtips tips"><i class="fa fa-close"></i>密码错误</p>
                <input class="input-pwd mt-2" id="new-pwd" type="password" placeholder="新密码"><br>
                <p class="newpwdtips tips"><i class="fa fa-close"></i>密码6-18位，必须包含大小写字母和数字，不能使用特殊字符</p>
                <input class="input-pwd mt-2" id="new-pwd-yes" type="password" placeholder="确认密码"><br>
                <p class="newpwdyestips tips"><i class="fa fa-close"></i>两次密码不一致</p>
                <input class="btn-left" type="button" value="确认"><input id="btn-cancel" class="btn-right" type="button" value="取消">
            </div>
        </div>
</div>
<img id="top" src="${pageContext.request.contextPath}/static/images/top.png" alt="加载失败">
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/common.js"></script>
<script>
    $("#btn-change-pwd").click(function () {
        $(".chang-pwd").css({
            "display":"block",
            "opacity":"1", "width":"300px",
            "height":"auto", "border-radius":"10px"});
    })

    $("#btn-cancel").click(function () {
        $(".chang-pwd").css({

            "opacity":"0", "width":"100px",
            "height":"35px", "border-radius":"20px"});
    })

    var oldpwdflag = false;
    var newpwdflag = false;
    var newpwdyesflag = false;

    $("#old-pwd").on('blur', (function () {
        $.ajax({
            //请求方式
            type : "GET",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址
            url : "${pageContext.request.contextPath}/checkOldPwd/${u.username}/"+$(this).val(),
            //请求成功
            success : function(msg) {
                if (msg == "yes"){
                    $(".oldpwdtips").hide();
                    oldpwdflag = true;
                }else{
                    $(".oldpwdtips").show();
                    oldpwdflag = false;
                }
            },
            //请求失败，包含具体的错误信息
            error : function(){

            }
        });
    }))
    
    $("#new-pwd").on('blur', function () {
        var re=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z0-9]{6,18}$/
        var val = $(this).val();
        if(!re.test(val)){
            $(".newpwdtips").show();
            newpwdflag = false;
        }else {
            $(".newpwdtips").hide();
            newpwdflag = true;
        }
    })

    $("#new-pwd-yes").on('blur', (function () {
        var val = $(this).val();
        if($("#new-pwd").val() != val){
            $(".newpwdyestips").show();
            newpwdyesflag = false;
        }else{
            $(".newpwdyestips").hide();
            newpwdyesflag = true;
        }
    }))

    /*防止表单重复提交*/
    $(".btn-left").click(function () {
        if(oldpwdflag&&newpwdyesflag&&newpwdyesflag){
            $.ajax({
                //请求方式
                type : "GET",
                //请求的媒体类型
                contentType: "application/json;charset=UTF-8",
                //请求地址
                url : "${pageContext.request.contextPath}/changePwd/${u.username}/"+$("#new-pwd").val(),
                //请求成功
                success : function(msg) {
                    if (msg == "1"){
                        alert("密码修改成功！");
                        window.location.reload();
                    }else{
                        alert("密码修改失败！");
                        window.location.reload();
                    }
                },
                //请求失败，包含具体的错误信息
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        }else{
            alert("请检查信息是否填写正确");
            return false;
        }
    })


</script>
<style>
    .user-head{
        width: 90px;
        height: 90px;
        text-align: center;
        border-radius: 50%;
        margin: 0 auto;
        background-color: rgba(0,0,0,0.1);
    }
    .user-head>img{
        width: 80px;
        height: 80px;
        margin-top: 5px;
        border-radius: 50%;

    }
    .user-info{
        width: 270px;
        height: 140px;
        margin: 0 auto;
    }
    .user-info>p{
        color: #636363;
        margin-top: 10px;

    }
    .user-info>input{
        width: 100px;
        height: 35px;
        border: none;
        border-radius: 20px;
        outline: none;
        background-color: #22cf7a;
        color: white;
        left: 50%;
        transform: translateX(-50%);
        margin-top: 10px;
        cursor: pointer;
        transition: all 0.5s ease;
        z-index: 2;
        position: relative;
    }
    .user-info>input:hover{
        background-color: #26c668;
        transition: all 0.5s ease;
    }

    .chang-pwd{
        position: absolute;
        top: 216px;
        display: none;
        opacity: 0;
        left: 50%;
        transform:translateX(-50%);


        width: 100px;
        height: 35px;
        background-color: #22cf7a;
        border-radius: 20px;
        overflow: hidden;
        box-shadow: 0 0 10px 0 #00000059;
        transition: all 0.3s ease-in;
        z-index: 1;
    }
    .chang-pwd>div{
        width: 200px;
        margin: 55px auto;
        text-align: center;

    }


    .txt-center{
        text-align: center;
    }



    .input-pwd{
        width: 200px;
        padding: 5px;
        border: 1px solid #c3c3c3;
        border-radius: 20px;
        outline: none;
    }

    .btn-left, .btn-right{
        width: 80px;
        height: 30px;
        border: none;
        cursor: pointer;
        margin-top: 30px;
        outline: none;
    }

    .btn-left{
        border-radius: 5px 0 0 5px;
    }

    .btn-right{
        border-radius:0 5px 5px 0;
    }

    .mt-2{
        margin-top: 10px;
    }

    .tips{
        margin-left: 5px;
        margin-top: 10px;
        text-align: left;
        color: #ffffff;
        font-size: 12px;
        display: none;
    }

</style>
</body>
</html>
