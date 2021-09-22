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
    <form class="mt-5"  action="${pageContext.request.contextPath}/createArticle" method="post">
        <table class="table">
            <tbody>
            <tr>标题</tr>
            <tr><input name="title" class="form-control" type="text" placeholder="请输入标题"></tr>
            <tr>作者</tr>
            <tr><input name="author" class="form-control" type="text" placeholder="请输入作者"></tr>
            <tr>标签</tr>
            <tr><input name="tag" class="form-control" type="text" placeholder="请输入标签，多个标签用-连接"></tr>
            <tr>内容</tr>
            <tr>
                <textarea name="content" id="mytextarea">Hello, World!</textarea>
            </tr>
            <tr>
                <input class="btn btn-primary" type="submit" value="发布文章">
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
    tinymce.init({
        selector: '#mytextarea',
        language: 'zh_CN',
        language_url: '${pageContext.request.contextPath}/static/tinymce/langs/zh_CN.js',
        plugins: [
            'advlist autolink link image lists charmap print preview hr anchor pagebreak',
            'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
            'save table directionality emoticons template paste',
            'quickbars',
            'code',  // note the comma at the end of the line!
            'fullscreen',
            "codesample",
        ],
        mobile: {
            theme: 'mobile',
            plugins: [ 'autosave', 'lists', 'autolink' ],
            toolbar: [ 'undo', 'bold', 'italic', 'styleselect' ,'link' , 'unlink' , 'forecolor']
        },
        quickbars_insert_toolbar: 'quickimage quicktable',
        height: 560,
        toolbar1: "undo redo searchreplace | cut copy paste | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
        toolbar2: "codesample bullist numlist | outdent indent blockquote | link unlink anchor image media code codesample | inserttime preview | forecolor backcolor | table | hr removeformat | subscript superscript | charmap emoticons | print fullscreen | ltr rtl | spellchecker | visualchars visualblocks nonbreaking pagebreak restoredraft",
        menubar: false,
        toolbar_items_size: 'small',
        statusbar: false,

    });
</script>
</body>
</html>
