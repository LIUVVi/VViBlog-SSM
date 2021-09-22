<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>vvi's blog</title>
    <link rel="stylesheet" href="">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome-4.7.0/css/font-awesome.min.css">

</head>
<body>
    <div class="header">
        <div class="show-menu">
            <i id="fa-bars" class="fa fa-bars"></i>
        </div>
        <ul class="nav">
            <li><a class="active" href="${pageContext.request.contextPath}/1"><i class="fa fa-home fa-fw"></i>首页</a></li>
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
                            <li><a href="${pageContext.request.contextPath}/userinfo">信息</a></li>
                            <li><a href="${pageContext.request.contextPath}/singOut">退出</a></li>
                        </ul>
                    </li>
                    <li class="myhead-mobile"><a href="${pageContext.request.contextPath}/userinfo"><i class="fa fa-user fa-fw"></i>信息</a></li>
                    <li class="myhead-mobile"><a href="${pageContext.request.contextPath}/singOut"><i class="fa fa-sign-out fa-fw"></i>退出</a></li>
                </c:otherwise>
            </c:choose>
        </ul>

        <div class="header-content">
            <div class="header-text">
                <h1>VVi'S blog</h1>
                <h2>我越是孤独，越是没有朋友，越是没有支持，我就得越尊重我自己。</h2>
                <h3>--简爱</h3>
            </div>
        </div>
    </div>

    <div class="main">
        <c:forEach items="${articles}" var="a">
            <div class="ar">
                <h1>${a.title}</h1>
                <div class="ar-summary">
                    ${a.summary}...
                </div>
                <ul class="ar-info">
                    <li class="ar-info-text"><i class="fa fa-calendar-o  mr-2"></i>${ fn:substring(a.create_time ,0,10)}</li>
                    <li class="ar-info-text"><i class="fa fa-user-o "></i> ${a.author}</li>
                    <li class="ar-info-text"><i class="fa fa-eye "></i> ${a.watch}</li>
                    <li class="ar-info-text"><i class="fa fa-heart-o "></i> ${a.star}</li>
                    <li class="more"><a href="${pageContext.request.contextPath}/articleContent/${a.article_id}">展开阅读</a></li>
                </ul>
            </div>
        </c:forEach>
                <ul class="pagination">
                    <li style="margin-left: 0px" class="page-item <c:if test="${!page.hasPreviousPage}">disabled</c:if>">
                        <a class="page-link" href="${pageContext.request.contextPath}/${page.prePage}" tabindex="-1">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <%-- 计算begin、end --%>
                    <c:choose>
                        <%-- 如果总页数不足10页，那么把所有的页数都显示出来！ --%>
                        <c:when test="${page.pages <= 10 }">
                            <c:set var="begin" value="1" />
                            <c:set var="end" value="${page.pages }" />
                        </c:when>
                        <c:otherwise>
                            <%-- 当总页数>10时，通过公式计算出begin和end --%>
                            <c:set var="begin" value="${page.pageNum-5 }" />
                            <c:set var="end" value="${page.pageNum+4 }" />
                            <%-- 头溢出 --%>
                            <c:if test="${begin < 1 }">
                                <c:set var="begin" value="1" />
                                <c:set var="end" value="10" />
                            </c:if>
                            <%-- 尾溢出 --%>
                            <c:if test="${end > page.pages }">
                                <c:set var="begin" value="${page.pages - 9 }" />
                                <c:set var="end" value="${page.pages }" />
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                    <%-- 循环遍历页码列表 --%>
                    <c:forEach var="i" begin="${begin }" end="${end }">
                        <c:choose>
                            <c:when test="${i eq page.pageNum }">
                                <li class="page-item page-active">
                                    <a class="page-link" href="#">${i }</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/${i}">${i }</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <li class="page-item <c:if test="${!page.hasNextPage }">disabled</c:if>">
                        <a class="page-link" href="${pageContext.request.contextPath}/${page.nextPage}">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
        </div>
    <img id="top" src="${pageContext.request.contextPath}/static/images/top.png" alt="加载失败">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/common.js"></script>
    <%@ include file="../footer/footer.jsp"%>
    <script src="https://unpkg.com/scrollreveal@4.0.0/dist/scrollreveal.min.js"></script>
    <script>


        var config = {
            reset: true,   // 滚动鼠标时，动画开关(默认是false没有打开鼠标滚动的动画开关)
            distance: '100px',
            origin: 'bottom', // 动画开始的方向
            duration: 1000,   // 动画持续时间
            delay: 0, // 延迟
            rotate: {x:0, y:0, z:0},  // 过度到0的初始角度
            opacity: 0, // 初始透明度  (0.2到1的效果)
            scale:1,       //缩放
            easing: 'ease-in-out', //动画效果// 缓动'ease', 'ease-in-out'，'linear'...
        };
        window.sr = ScrollReveal();
        sr.reveal('.ar',config);
        sr.reveal('.pagination', config);

       /* $(window).resize(function(){
            if($(window).width()>=721){
                $(".nav").show();
                console.log("721");
            }
        });*/


    </script>
</body>
</html>
