<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin/index.css">
    <style>

    </style>
</head>
<body>
    <div class="aside">
        <div class="top-box">
            <div class="head-box">
                <img src="${pageContext.request.contextPath}/static/images/head/head.jpg" alt="">
            </div>
            <a class="sing-out" href="${pageContext.request.contextPath}/singOut">
                <i class="fa  fa-sign-out fa-lg"></i><br/><span style="font-size: 12px;margin-top: 5px;display:inline-block">退出</span>
            </a>



        </div>
        <ul class="menu-box">
            <li >
                <a class="showosclose" href="javascript:void(0)">文章管理<i class="fa  fa-minus-square-o fa-lg ml-3"></i></a>
                <ul class="son-menu-box">
                    <li class="opentab" id="menutab-0" value="0"><a href="#tab-0">发布文章</a></li>
                    <li class="opentab" id="menutab-1" value="1"><a href="#tab-1">文章列表</a></li>
                    <li class="opentab" id="menutab-2" value="2"><a href="#tab-2">友情链接</a></li>
                </ul>
            </li>
            <li>
                <a class="showosclose" href="javascript:void(0)">用户管理<i class="fa  fa-minus-square-o fa-lg ml-3"></i></a>
                <ul class="son-menu-box">
                    <li class="opentab" id="menutab-3" value="3"><a href="#tab-3">用户列表</a></li>
                    <li class="opentab" id="menutab-4" value="4"><a href="#tab-4">用户评论</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="main">

        <div class="tabbable" id="tabs">
            <!-- Tab标签列表 -->
            <ul class="mnav" id="myTab">
                <li value="0" id="tab-0">
                    <a class="showtab"  href="#tab-content-0">
                        <i class="fa  fa-edit fa-lg"></i>
                        <span>发布文章</span>
                    </a>
                    <i data-value="0" class="fa  fa-window-close fa-lg ml-4"></i>
                </li>
                <li value="1" id="tab-1">
                    <a class="showtab" href="#tab-content-1">
                        <i class="fa  fa-list-alt fa-lg"></i>
                        <span>文章列表</span>
                    </a>
                    <i class="fa  fa-window-close fa-lg ml-4"></i>
                </li>
                <li value="2" id="tab-2">
                    <a class="showtab" href="#tab-content-2">
                        <i class="fa  fa-link fa-lg"></i>
                        <span>友情链接</span>
                    </a>
                    <i class="fa  fa-window-close fa-lg ml-4"></i>
                </li>
                <li value="3" id="tab-3">
                    <a class="showtab" href="#tab-content-3">
                        <i class="fa  fa-user-circle-o fa-lg"></i>
                        <span>用户列表</span>
                    </a>
                    <i class="fa  fa-window-close fa-lg ml-4"></i>
                </li>
                <li value="4" id="tab-4">
                    <a class="showtab" href="#tab-content-4">
                        <i class="fa  fa-comments-o fa-lg"></i>
                        <span>用户评论</span>
                    </a>
                    <i class="fa  fa-window-close fa-lg ml-4"></i>
                </li>
            </ul>
            <!-- 显示内容列表，和Tab标签列表一一对应 -->
            <div class="tab-content">
                <div class=" " id="tab-content-0">
                    　<iframe id="iframepage0" name="iframepage1" width="100%" frameborder="0" src="${pageContext.request.contextPath}/articlePost" height="100%"></iframe>
                </div>
                <div class=" " id="tab-content-1">
                    　<iframe id="iframepage1" name="iframepage2" width="100%" frameborder="0" src="${pageContext.request.contextPath}/articleList/1" height="100%"></iframe>
                </div>
                <div class=" " id="tab-content-2">
                    　<iframe id="iframepage2" name="iframepage3" width="100%" frameborder="0" src="${pageContext.request.contextPath}/friendLinkList/1" height="100%"></iframe>
                </div>
                <div class=" " id="tab-content-3">
                    　<iframe id="iframepage3" name="iframepage4" width="100%" frameborder="0" scrolling="no" src="${pageContext.request.contextPath}/userList/1" height="100%"></iframe>
                </div>
                <div class=" " id="tab-content-4">
                    　<iframe id="iframepage4" name="iframepage5" width="100%" frameborder="0" scrolling="no" src="${pageContext.request.contextPath}/commentList/1" height="100%"></iframe>
                </div>

            </div>
        </div>
    </div>

<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function(){

            $(".showosclose").click(function(){
                $(this).parent().children(".son-menu-box").animate({
                    opacity:'1',
                    height:'toggle',
                });
                $(this).children("i").toggleClass("fa-plus-square-o");
            });


            $(".opentab").click(function () {
                var v = this.value;
                $("#tab-"+v).show(300);
                for(var i=0;i<$(".opentab").length;i++){
                    if(i==v){
                        $("#tab-content-"+i).show();
                        $("#tab-"+i).addClass("active");
                    }else{
                        $("#tab-content-"+i).hide();
                        $("#tab-"+i).removeClass("active");
                    }
                }
            })
            
            $(".fa-window-close").click(function () {
                var v = $(this).parent().attr("value");
                $("#tab-content-"+v).hide();
                $(this).parent().hide(300);
            })

            $(".showtab").click(function () {
                var v = $(this).parent().attr("value");
                console.log(v);
                for(var i=0;i<$(".showtab").length;i++){
                    if(i==v){
                        $("#tab-content-"+i).show();
                        $("#tab-"+i).addClass("active");
                    }else{
                        $("#tab-content-"+i).hide();
                        $("#tab-"+i).removeClass("active");
                    }
                }
            })
        });
    </script>
</body>
</html>
