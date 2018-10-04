<%--
  Created by IntelliJ IDEA.
  User: 热带雨林
  Date: 2018/10/5
  Time: 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<html>
<head></head>
<body style="font-size:30px;">
<form action="fileprocess.do" method="post" enctype="multipart/form-data">
    username:<input name="username"/><br/>
    phone:<input type="file" name="file1"/><br/>
    <input type="submit" value="提交"/>
</form>
</body>
</html>
