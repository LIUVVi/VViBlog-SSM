<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome-4.7.0/css/font-awesome.min.css">
    <style>
        .tips{
            font-size: 0.8rem;
            text-align: left;
            margin-top: 10px;
            margin-left: 20px;
        }
        .succ{
            color: #4cd77d;
        }
        .erro{
            color: #d70000;
        }
    </style>
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
        <li><a href="${pageContext.request.contextPath}/login"><i class="fa fa-sign-in fa-fw"></i>登录</a></li>
        <li><a class="active" href="${pageContext.request.contextPath}/register"><i class="fa fa-map-signs fa-fw"></i>注册</a></li>
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

    <form action="${pageContext.request.contextPath}/signUp" method="post">
        <input id="username" class="input" name="username" required autofocus type="text" placeholder="用户名"><br>
        <p id="unametips" class="tips" style="text-align: left"></p>
        <input id="password" class="input" name="password" required type="password" placeholder="密码"><br>
        <p id="pwdtips" class="tips" style="text-align: left"></p>
        <input id="repassword"class="input" name="repassword" required type="password" placeholder="确认密码"><br>
        <p id="repwdtips" class="tips" style="text-align: left"></p>
        <input id="email" class="input" name="email" type="email" required placeholder="邮箱">
        <p id="emailtips" class="tips" style="text-align: left"></p>
        <input id="btn-reg" class="btn-login" type="submit" value="立即注册">
    </form>
</div>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/common.js"></script>
<script>
    var usernameflag = false;
    var passwordflag = false;
    var repasswordflag = false;
    var emailfalg = false;
    $(document).ready(function () {

        /*验证用户名*/
        $("#username").blur(function () {
            var re=/^[A-Za-z0-9\u4e00-\u9fa5]{4,14}$/;
            var val = $(this).val();
            if(val=="") {
                usernameflag = false;
                $(this).focus();
                $("#unametips").html("<span class='erro'><i class='fa fa-close'></i> 用户名不能为空</span>");
            }else{
                if(!re.test(val)){
                    usernameflag = false;
                    $(this).focus();
                    $("#unametips").html("<span class='erro'><i class='fa fa-close'></i> 用户名由4-14位数字字母或汉字组成</span>");
                }else{
                    $.ajax({
                        //请求方式
                        type : "GET",
                        //请求的媒体类型
                        contentType: "application/json;charset=UTF-8",
                        //请求地址
                        url : "${pageContext.request.contextPath}/isUserExist/"+val,
                        //请求成功
                        success : function(msg) {
                            if(msg == "用户名已存在"){
                                usernameflag = false;
                                $("#username").focus();
                                $("#unametips").html("<span class='erro'><i class='fa fa-close'></i> 用户名已存在</span>");
                            }else{
                                usernameflag = true;
                                $("#unametips").html("<span class='succ'><i class='fa fa-check'></i> 用户名可用</span>");
                            }
                        },
                        //请求失败，包含具体的错误信息
                        error : function(e){
                            console.log(e.status);
                            console.log(e.responseText);
                        }
                    });
                }
            }
        })

        /*验证密码*/
        $("#password").blur(function () {
            var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z0-9]{6,18}$/;
            var val = $(this).val();
            if(val=="") {
                passwordflag = false;
                $(this).focus();
                $("#pwdtips").html("<span class='erro'><i class='fa fa-close'></i> 密码不能为空</span>");
            }else{
                if(!re.test(val)){
                    passwordflag = false;
                    $(this).focus();
                    $("#pwdtips").html("<span class='erro'><i class='fa fa-close'></i> 密码6-18位，必须包含大小写字母和数字，不能使用特殊字符</span>");
                }else{
                    passwordflag = true;
                    $("#pwdtips").html("<span class='succ'><i class='fa fa-check'></i> 密码可用</span>");
                }
            }
        })

        /*验证确认密码*/
        $("#repassword").blur(function () {
            var val = $(this).val();
            if($("#password").val() != val){
                repasswordflag = false;
                $("#repwdtips").html("<span class='erro'><i class='fa fa-close'></i> 两次密码不一致</span>");
            }else{
                repasswordflag = true;
                $("#repwdtips").html("<span class='succ'><i class='fa fa-check'></i> 两次密码一致</span>");
            }
        })

        /*验证邮箱*/
        $("#email").blur(function () {
            var re = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
            var val = $(this).val();
            if(val=="") {
                emailfalg = false;
                $(this).focus();
                $("#emailtips").html("<span class='erro'><i class='fa fa-close'></i> 邮箱不能为空</span>");
            }else {
                if(!re.test(val)){
                    emailfalg = false;
                    $(this).focus();
                    $("#emailtips").html("<span class='erro'><i class='fa fa-close'></i> 邮箱无效</span>");
                }else{
                    emailfalg = true;
                    $("#emailtips").html("<span class='succ'><i class='fa fa-check'></i> 邮箱可用</span>");
                }
            }
        })


        /*防止表单重复提交*/
        $("#btn-reg").click(function () {
            if(usernameflag&&passwordflag&&repasswordflag&&emailfalg){
                this.disabled=true;
                this.parentNode.submit();
            }else{
                alert("请检查信息是否填写正确");
                return false;
            }
        })
    })


</script>
</body>
</html>
