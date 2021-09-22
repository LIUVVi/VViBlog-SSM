<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title></title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
    <form class="mt-5"  action="${pageContext.request.contextPath}/editUser" method="post">
        <input type="hidden" name="_method" value="PUT">
        <table class="table">
            <tbody>
            <tr>ID</tr>
            <tr><input name="user_id" class="form-control" type="text" value="${user.user_id}" readonly></tr>
            <tr>用户名</tr>
            <tr><input name="username" class="form-control" type="text" value="${user.username}" ></tr>
            <tr>密码</tr>
            <tr><input name="password" class="form-control" type="text" value="${user.password}" ></tr>
            <tr>级别</tr>
            <tr>
                <select name="level" class="form-control">
                    <c:choose>
                        <c:when test="${user.level == '超级'}">
                            <option value="超级" selected>超级用户</option>
                            <option value="普通">普通用户</option>
                        </c:when>
                        <c:otherwise>
                            <option>
                                <option value="超级" >超级用户</option>
                                <option value="普通" selected>普通用户</option>
                            </option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </tr>
            <tr>状态</tr>
            <tr>
                <select name="status" class="form-control">
                    <c:choose>
                        <c:when test="${user.status == '1'}">
                            <option value="1" selected>正常</option>
                            <option value="0">未激活</option>
                        </c:when>
                        <c:otherwise>
                            <option>
                            <option value="1" >正常</option>
                            <option value="0" selected>未激活</option>
                            </option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </tr>
            <tr>邮箱</tr>
            <tr><input name="email" class="form-control"  type="text" value="${user.email}"></tr>
            <tr>
                <input class="btn btn-primary mt-2" type="submit" value="确认修改"> <input class="btn-cancel btn btn-danger mt-2 ml-2" type="button" value="取消修改">
            </tr>
            </tbody>
        </table>
    </form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/popper.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/tinymce/tinymce.min.js"></script>

<script>
    $(".btn-cancel").click(function () {
        window.history.back(-1);
    })
</script>
</body>
</html>
