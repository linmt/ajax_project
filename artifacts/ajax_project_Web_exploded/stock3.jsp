<%--
  Created by IntelliJ IDEA.
  User: 热带雨林
  Date: 2018/10/4
  Time: 0:14
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="utf-8"
        contentType="text/html;charset=utf-8" %>
<html>
<head>
    <style>
        #d1{
            width:500px;
            height:320px;
            background-color:black;
            margin-left:300px;
            margin-top:30px;
        }
        #d2{
            color:white;
            background-color:red;
            height:35px;
        }
        table{
            color:yellow;
            font-style:italic;
            font-size:24px;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.4.3.js">
    </script>
    <script type="text/javascript">
        $(function(){
            setInterval(quoto,5000);
        });
        function quoto(){
            $.post(
                'getStock.do',
                {'size':3},
                function(data){
                    //如果返回的是json字符串，该函数会自动将json字符串转换成js对象。
                    $('#tb1').empty();
                    for(i = 0;i < data.length;i ++){
                        var s = data[i];
                        $('#tb1')
                            .append('<tr><td>' + s.code
                                + '</td><td>' + s.name
                                + '</td><td>' + s.price
                                + '</td></tr>');
                    }
                },'json');
        }
    </script>
</head>
<body style="font-size:30px;">
<div id="d1">
    <div id="d2">股票实时行情</div>
    <div id="d3">
        <table width="100%">
            <thead>
            <tr>
                <td>代码</td>
                <td>名称</td>
                <td>报价</td>
            </tr>
            </thead>
            <tbody id="tb1">
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
