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


    </style>
</head>
<body>
<div class="container-fluid">
    <table class="table table-striped mt-5">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">回复id</th>
            <th scope="col">文章标题</th>
            <th scope="col">回复内容</th>
            <th scope="col">用户名</th>
            <th scope="col">删除</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${comments}" var="c">
            <tr>
                <th scope="row">${c.comment_id}</th>
                <td>${c.parent_id}</td>
                <td>${c.title}</td>
                <td>${c.content}</td>
                <td>${c.username}</td>
                <td><i onclick="del(${c.comment_id})" class="fa fa-trash-o fa-lg"></i></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation example mt-2">

        <ul class="pagination justify-content-end">
            <p class="mr-2 mt-2">总共${page.total}条数据 共${page.pages}页</p>
            <li class="page-item <c:if test="${!page.hasPreviousPage}">disabled</c:if>">
                <a class="page-link" href="${pageContext.request.contextPath}/commentList/${page.prePage}" tabindex="-1">
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
                            <a class="page-link" href="${pageContext.request.contextPath}/commentList/${i}">${i }</a>
                        </li>
                    </c:otherwise>
                </c:choose>

            </c:forEach>


            <li class="page-item <c:if test="${!page.hasNextPage }">disabled</c:if>">
                <a class="page-link" href="${pageContext.request.contextPath}/commentList/${page.nextPage}">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>


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
                url : "${pageContext.request.contextPath}/deleteComment/"+id,
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
</script>
</body>
</html>
