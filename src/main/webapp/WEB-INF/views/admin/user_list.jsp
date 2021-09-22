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
        .add-box{
            height: 430px;
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
        .avatar{
            width: 30px;
            height: 30px;
            border: 1px solid rgba(0,0,0,0.2);
            border-radius: 50%;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <button id="addlink" type="button" class="btn btn-primary float-right mt-2 mb-3 w-25">新增用户</button>
    <table class="table table-striped mt-5">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">头像</th>
            <th scope="col">用户名</th>
            <th scope="col">密码</th>
            <th scope="col">邮箱</th>
            <th scope="col">状态</th>
            <th scope="col">删除</th>
            <th scope="col">编辑</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="u">
            <tr>
                <th scope="row">${u.user_id}</th>
                <td><img class="avatar" src="${pageContext.request.contextPath}/${u.image_url}" alt="头像加载失败"></td>
                <td>${u.username}</td>
                <td>${u.password}</td>
                <td>${u.email}</td>
                <td>
                    <c:choose>
                        <c:when test="${u.status == 1}">
                            正常
                        </c:when>
                        <c:otherwise>
                            未激活
                        </c:otherwise>
                    </c:choose>
                </td>
                <td><i onclick="del(${u.user_id})" class="fa fa-trash-o fa-lg"></i></td>
                <td><a href="${pageContext.request.contextPath}/userEdit/${u.user_id}"><i class="fa fa-edit fa-lg"></i></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation example mt-2">

        <ul class="pagination justify-content-end">
            <p class="mr-2 mt-2">总共${page.total}条数据 共${page.pages}页</p>
            <li class="page-item <c:if test="${!page.hasPreviousPage}">disabled</c:if>">
                <a class="page-link" href="${pageContext.request.contextPath}/userList/${page.prePage}" tabindex="-1">
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
                            <a class="page-link" href="${pageContext.request.contextPath}/userList/${i}">${i }</a>
                        </li>
                    </c:otherwise>
                </c:choose>

            </c:forEach>


            <li class="page-item <c:if test="${!page.hasNextPage }">disabled</c:if>">
                <a class="page-link" href="${pageContext.request.contextPath}/userList/${page.nextPage}">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
    <div class="add-box info">
        <form action="${pageContext.request.contextPath}/addUser" method="post">
            <div class="form-group">
                <label>用户名</label>
                <input type="text" name="username" class="form-control" placeholder="请输入用户名">
            </div>
            <div class="form-group">
                <label>密码</label>
                <input type="text" name="password" class="form-control" placeholder="请输入密码">
            </div>
            <div class="form-group">
                <label>邮箱</label>
                <input type="text" name="email" class="form-control" placeholder="请输入邮箱">
            </div>
            <div class="form-group">
                <label>级别</label>
                <select name="level" class="form-control">
                    <option value="超级">超级用户</option>
                    <option value="普通" selected>普通用户</option>
                </select>
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
                url : "${pageContext.request.contextPath}/deleteUser/"+id,
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
