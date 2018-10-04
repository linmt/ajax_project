<%--
  Created by IntelliJ IDEA.
  User: 热带雨林
  Date: 2018/10/4
  Time: 1:33
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<html>
<head>
    <script type="text/javascript" src="js/jquery-1.4.3.js">
    </script>
    <script type="text/javascript">
        $(function(){
            $('.s1').click(
                function(){
                    var eId=$(this).parent().siblings().eq(0).text();
                    $(this).next().load('salary.do','eId='+eId);
                }
            );
        });
    </script>
</head>
<body>
<table cellpadding="0" cellspacing="0" width="50%" border="l">
    <tr><td>员工号</td><td>员工姓名</td><td>&nbsp;</td></tr>
    <tr>
        <td>T10001</td><td>张三 </td>
        <td><a href="javascript:;" class="s1">显示工资明细</a>
            <div></div>
        </td>
    </tr>
    <tr>
        <td>T10002</td><td>李四 </td>
        <td><a href="javascript:;" class="s1">显示工资明细</a>
            <div></div>
        </td>
    </tr>
</table>
</body>
</html>
