<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>文章内容</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/article/article_content.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/lightbox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/prism.css">
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
                <li class="myhead-mobile"><a href=""><i class="fa fa-user fa-fw"></i>信息</a></li>
                <li class="myhead-mobile"><a href="${pageContext.request.contextPath}/singOut"><i class="fa fa-sign-out fa-fw"></i>退出</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
    <div class="header-content">

        <div class="header-text">
            <h1>${arc.title}</h1>
            <h2>摘要：${summ}</h2>
            <h3>--${arc.author}</h3>
        </div>
        <ul class="ar-info">
            <li><i class="fa fa-calendar-o"></i> ${fn:substring(arc.create_time ,0,10)}</li>
            <li><i class="fa fa-commenting-o"></i> ${comnum}</li>
            <li><i class="fa fa-eye"></i> ${arc.watch}</li>
            <li><i class="fa fa-heart-o"></i> ${arc.star}</li>
        </ul>
    </div>
</div>
<div class="main">
    <div class="article-content">
        ${arc.content}
    </div>
    <div class="post-nav">
        <div class="post-prev post-nav-item">
            <c:if test="${not empty prevarc}">
                <a href="${pageContext.request.contextPath}/articleContent/${prevarc.article_id}">
                    <i class="fa fa-arrow-circle-left"></i>${prevarc.title}
                </a>
            </c:if>
        </div>
        <div class="post-next post-nav-item">
            <c:if test="${not empty nextarc}">
                <a href="${pageContext.request.contextPath}/articleContent/${nextarc.article_id}">${nextarc.title}
                    <i class="fa fa-arrow-circle-right"></i>
                </a>
            </c:if>
        </div>
    </div>
    <c:choose>
        <c:when test="${not empty u}">
            <div class="reply-box">
                    <div class="comm-text">
                        <textarea name="content" id="mytextarea" placeholder="快来评论吧..."></textarea>
                    </div>
                    <input id="btn-reply" class="btn-reply" type="button" value="立即评论">
            </div>
        </c:when>
        <c:otherwise>
            <div class="login-info"><p>要评论请先<a href="${pageContext.request.contextPath}/login">登录</a>或<a href="${pageContext.request.contextPath}/register">注册</a></p></div>
        </c:otherwise>
    </c:choose>

    <div class="comments-box">
        <input id="article-id" type="hidden" value="${arc.article_id}">
        <input id="user-id" type="hidden" value="${u.user_id}">
        <c:forEach items="${comments}" var="comr">
            <c:if test="${comr.parent_id == 0 and comr.reply_id == 0}">
                <div class="comroot">
                    <div class="comroot-left">
                        <a class="avatar" href=""><img src="${pageContext.request.contextPath}/${comr.image_url}" alt="头像加载失败"></a>
                    </div>
                    <div class="comroot-right">
                        <p>${comr.username}</p>
                        <p>${comr.content}</p>
                        <div class="comfoot">${comr.create_time}<a class="add-com" href="javascript:void(0);"><i class="fa fa-commenting fa-fw"></i>回复</a></div>

                        <div class="comson">
                            <c:forEach items="${comments}" var="coms">
                                <c:if test="${coms.parent_id == comr.comment_id and coms.reply_id == 0}">
                                    <div>
                                        <p class="add-coms">${coms.username}:${coms.content}</p>
                                        <div class="replyforcom hide" >
                                            <input id="comrr-comment-id" type="hidden" value="${comr.comment_id}">
                                            <input id="coms-comment-id" type="hidden" value="${coms.comment_id}">
                                            <div class="reply-head">回复 ${coms.username}
                                                <a class="post-coms float-right" href="javascript:void(0);">发布&nbsp;<i class="fa fa-send"></i></a>
                                                <a class="close-tab float-right" href="javascript:void(0);">关闭&nbsp;<i class="fa fa-window-close"></i></a>
                                            </div>
                                            <textarea class="replycomrcon" name="content" id="replycoms" placeholder="快来评论吧..."></textarea>
                                        </div>
                                    </div>
                                </c:if>
                                <c:forEach items="${comments}" var="comgs">
                                    <c:if test="${comgs.parent_id == comr.comment_id and comgs.reply_id == coms.comment_id}">
                                        <div>
                                            <p class="add-comgs">${comgs.username} 回复 ${coms.username}:${comgs.content}</p>
                                            <div class="replyforcom hide" >
                                                <input id="comrrr-comment-id" type="hidden" value="${comr.comment_id}">
                                                <input id="comgs-comment-id" type="hidden" value="${comgs.comment_id}">
                                                <div class="reply-head">回复 ${comgs.username}
                                                    <a class="post-comgs float-right" href="javascript:void(0);">发布&nbsp;<i class="fa fa-send"></i></a>
                                                    <a class="close-tab float-right" href="javascript:void(0);">关闭&nbsp;<i class="fa fa-window-close"></i></a>
                                                </div>
                                                <textarea class="replycomrcon" name="content" id="replycomgs" placeholder="快来评论吧..."></textarea>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="replyforcom hide" >
                        <input id="comr-comment-id" type="hidden" value="${comr.comment_id}">
                        <div class="reply-head">回复 ${comr.username}
                            <a class="post-com float-right" href="javascript:void(0);">发布&nbsp;<i class="fa fa-send"></i></a>
                            <a class="close-tab float-right" href="javascript:void(0);">关闭&nbsp;<i class="fa fa-window-close"></i></a>
                        </div>
                        <textarea class="replycomrcon" name="content" id="replycomr" placeholder="快来评论吧..."></textarea>
                    </div>
                </div>
            </c:if>
        </c:forEach>

    </div>
</div>
<img id="top" src="${pageContext.request.contextPath}/static/images/top.png" alt="加载失败">

<div class="mask"></div>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/common.js"></script>
<script src="${pageContext.request.contextPath}/static/js/lightbox.min.js"></script>
<%@ include file="../footer/footer.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/tinymce/tinymce.min.js"></script>
<script>
    lightbox.option({
        'resizeDuration': 200,
        'wrapAround': true,
        'disableScrolling':true,
        'fadeDuration':400,
        'maxHeight':750

    })

    var articleId = $("#article-id").val();
    var userId = $("#user-id").val();

    $('pre').addClass("line-numbers").css("white-space", "pre-wrap");
    $(document).ready(function(){
        var ims = $(".article-content img");
        $.each(ims,function () {
            var href = $(this).attr("src");
            $(this).wrap("<a href="+href+" data-lightbox='imagegroup'></a>");
        })

        $(".comson").each(function(){
            console.log($(this).html());
            if($(this).html().trim()==""){
                $(this).remove();
            }
        });

    });



    $(".add-com").click(function () {
        var flag = true;
        <c:if test="${empty u}">
            flag = false;
            alert("请先登录或注册！");
        </c:if>
        if(flag){
            $(this).parent().parent().siblings(".replyforcom").show().animate({
                bottom:'0'
            })
            $(".mask").show().animate({
                opacity:'1'
            })
        }
    })

    $(".add-coms").click(function () {
        var flag = true;
        <c:if test="${empty u}">
        flag = false;
        alert("请先登录或注册！");
        </c:if>
        if(flag){
            $(this).parent().children(".replyforcom").show().animate({
                bottom:'0'
            })
            $(".mask").show().animate({
                opacity:'1'
            },"200")
        }
    })

    $(".add-comgs").click(function () {
        var flag = true;
        <c:if test="${empty u}">
        flag = false;
        alert("请先登录或注册！");
        </c:if>
        if(flag){
            $(this).parent().children(".replyforcom").show().animate({
                bottom:'0'
            })
            $(".mask").show().animate({
                opacity:'1'
            },"200")
        }
    })

    $(".close-tab").click(function () {

        $(".mask").animate({
            opacity:'0.5'
        },"ease",function (e) {
            $(".mask").hide();
        })
        $(this).parent().parent().animate({
            bottom:'-300px'
        },"ease",function () {
            $(this).hide();
        })
    })

    /*争对文章回复*/
    $("#btn-reply").click(function () {
        var content =  $("#mytextarea").val();
        if(content.trim() == ""){
            alert("请填写回复内容！");
        }else {
            this.disabled=true;
            $.ajax({
                //请求方式
                type : "POST",
                //请求的媒体类型
                contentType: "application/json;charset=UTF-8",
                //请求地址
                url : "${pageContext.request.contextPath}/addComment",
                //向后端传输的数据
                data : JSON.stringify({
                    article_id : articleId,
                    user_id : userId,
                    content : content
                }),
                //请求成功
                success : function(msg) {
                    alert(msg);
                    location.reload();
                },
                //请求失败，包含具体的错误信息
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        }
    })

    /*争对父级评论回复*/
    $(".post-com").click(function () {
        var content =  $(this).parent().siblings("textarea").val();
        if(content.trim() == ""){
            alert("请填写回复内容！");
        }else {
            this.disabled=true;
            var parentId = $(this).parent().siblings("#comr-comment-id").val();
            $.ajax({
                //请求方式
                type : "POST",
                //请求的媒体类型
                contentType: "application/json;charset=UTF-8",
                //请求地址
                url : "${pageContext.request.contextPath}/addCommentSon",
                //向后端传输的数据
                data : JSON.stringify({
                    article_id : articleId,
                    user_id : userId,
                    parent_id : parentId,
                    content : content
                }),
                //请求成功
                success : function(msg) {
                    alert(msg);
                    location.reload();
                },
                //请求失败，包含具体的错误信息
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        }
    })

    /*争对子级评论回复*/
    $(".post-coms").click(function () {
        var content =  $(this).parent().siblings("textarea").val();
        if(content.trim() == ""){
            alert("请填写回复内容！");
        }else {
            this.disabled=true;
            var parentId = $(this).parent().siblings("#comrr-comment-id").val();
            var replyId = $(this).parent().siblings("#coms-comment-id").val();
            $.ajax({
                //请求方式
                type : "POST",
                //请求的媒体类型
                contentType: "application/json;charset=UTF-8",
                //请求地址
                url : "${pageContext.request.contextPath}/addCommentGSon",
                //向后端传输的数据
                data : JSON.stringify({
                    article_id : articleId,
                    user_id : userId,
                    parent_id : parentId,
                    reply_id : replyId,
                    content : content
                }),
                //请求成功
                success : function(msg) {
                    alert(msg);
                    location.reload();
                },
                //请求失败，包含具体的错误信息
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        }
    })

    /*争对三级评论回复*/
    $(".post-comgs").click(function () {
        var content =  $(this).parent().siblings("textarea").val();
        if(content.trim() == ""){
            alert("请填写回复内容！");
        }else {
            this.disabled=true;
            var parentId = $(this).parent().siblings("#comrrr-comment-id").val();
            var replyId = $(this).parent().siblings("#comgs-comment-id").val();
            $.ajax({
                //请求方式
                type : "POST",
                //请求的媒体类型
                contentType: "application/json;charset=UTF-8",
                //请求地址
                url : "${pageContext.request.contextPath}/addCommentGSon",
                //向后端传输的数据
                data : JSON.stringify({
                    article_id : articleId,
                    user_id : userId,
                    parent_id : parentId,
                    reply_id : replyId,
                    content : content
                }),
                //请求成功
                success : function(msg) {
                    alert(msg);
                    location.reload();
                },
                //请求失败，包含具体的错误信息
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        }
    })

</script>
<script src="${pageContext.request.contextPath}/static/js/prism.js"></script>

</body>
</html>
