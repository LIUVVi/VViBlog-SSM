<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <style>
        .fa-trash-o {
            cursor: pointer;
        }
        .fa-trash-o:hover{
            color: #d70000;
        }

        .info{
            position: absolute;
            background-color: #ffffff;
            left: 50%;
            top: 40%;
            z-index: 999;
            transform: translate(-50%,-50%);
            width: 300px;
            padding: 20px;
            display: none;
            border-radius: 10px;
        }
        .change-box{
            height: 350px;
        }
        .add-box{
            height: 260px;
        }
        .mask{
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
            z-index: 998;
            top: 0;
            left: 0;
            position: absolute;
            display: none;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <button id="addlink" type="button" class="btn btn-primary float-right mt-2 mb-3 w-25">新增友链</button>
    <table class="table table-striped mt-5">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">昵称</th>
            <th scope="col">网址</th>
            <th scope="col">删除</th>
            <th scope="col">编辑</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${links}" var="l">
            <tr>
                <th scope="row">${l.friend_id}</th>
                <td>${l.friend_name}</td>
                <td>${l.link}</td>
                <td><i onclick="del(${l.friend_id})" class="fa fa-trash-o fa-lg"></i></td>
                <td><a onclick="getInfo(${l.friend_id})" href="javascript:void(0);"><i class="fa fa-edit fa-lg"></i></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation example mt-2">

        <ul class="pagination justify-content-end">
            <p class="mr-2 mt-2">总共${page.total}条数据 共${page.pages}页</p>
            <li class="page-item <c:if test="${!page.hasPreviousPage}">disabled</c:if>">
                <a class="page-link" href="${pageContext.request.contextPath}/friendLinkList/${page.prePage}" tabindex="-1">
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
                        <li class="page-item active">
                            <a class="page-link" href="#">${i }</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="${pageContext.request.contextPath}/friendLinkList/${i}">${i }</a>
                        </li>
                    </c:otherwise>
                </c:choose>

            </c:forEach>


            <li class="page-item <c:if test="${!page.hasNextPage }">disabled</c:if>">
                <a class="page-link" href="${pageContext.request.contextPath}/friendLinkList/${page.nextPage}">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="change-box info">
        <form action="${pageContext.request.contextPath}/editFriendLink" method="post">
            <input type="hidden" name="_method" value="PUT">
            <div class="form-group">
                <label for="friendId">ID</label>
                <input type="text" name="friend_id" class="form-control" id="friendId" readonly aria-describedby="emailHelp">
            </div>
            <div class="form-group">
                <label for="friendName">昵称</label>
                <input type="text" name="friend_name" class="form-control" id="friendName" aria-describedby="emailHelp" placeholder="Enter name">
            </div>
            <div class="form-group">
                <label for="link">网址</label>
                <input type="text" name="link" class="form-control" id="link" placeholder="Enter link">
            </div>
            <button type="submit" class="btn btn-primary w-50">修改</button><button type="button" class="btn btn-danger w-50 myclose">取消</button>
        </form>
    </div>

    <div class="add-box info">
        <form action="${pageContext.request.contextPath}/addFriendLink" method="post">
            <div class="form-group">
                <label>昵称</label>
                <input type="text" name="friend_name" class="form-control" aria-describedby="emailHelp" placeholder="Enter name">
            </div>
            <div class="form-group">
                <label>网址</label>
                <input type="text" name="link" class="form-control" placeholder="Enter link">
            </div>
            <button type="submit" class="btn btn-success w-50">添加</button><button type="button" class="btn btn-danger w-50 myclose">取消</button>
        </form>
    </div>

    <div class="mask"></div>
</div>



<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script>
    function del(id) {
        if(confirm("确实要删除吗？")){
            $.ajax({
                //请求方式
                type : "GET",
                //请求的媒体类型
                contentType: "application/json;charset=UTF-8",
                //请求地址
                url : "${pageContext.request.contextPath}/deleteFriendLink/"+id,
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
    }

    function getInfo(id) {
        $(".change-box").show();
        $(".mask").show();

        $.ajax({
            //请求方式
            type : "GET",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址
            url : "${pageContext.request.contextPath}/getFriendInfo/"+id,
            //返回类型
            dataType : "json",
            //请求成功
            success : function(data) {
                $.each(data,function(k,v){
                    if(k=="friend_id"){
                        document.getElementById("friendId").value=v;
                    }else if(k=="friend_name"){
                        document.getElementById("friendName").value=v;
                    }else{
                        document.getElementById("link").value=v;
                    }
                });
            },
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    }

    $(".myclose").click(function () {
        $(".change-box").hide();
        $(".add-box").hide();
        $(".mask").hide();
    })

    $("#addlink").click(function () {
        $(".add-box").show();
        $(".mask").show();
    })
</script>
</body>
</html>
