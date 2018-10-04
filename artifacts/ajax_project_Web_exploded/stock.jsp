<%--
  Created by IntelliJ IDEA.
  User: 热带雨林
  Date: 2018/10/3
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
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
    <script type="text/javascript" src="js/prototype-1.6.0.3.js"></script>
    <script type="text/javascript" src="js/my.js"></script>
    <script type="text/javascript">
        function showStock(){
            setInterval(quoto,5000);
        }
        /*
         异步地向服务器发送请求，服务器返回json字符串(描述几
         支股票信息)，接下来，将json字符串转换成js对象组成的数组，
         然后遍历该数组，更新表格。
         */
        function quoto(){
            var xhr = getXhr();
            xhr.open('get','getStock.do?'+Math.random(),true);
            xhr.onreadystatechange=function(){
                if(xhr.readyState == 4 && xhr.status == 200){
                    //获得服务器返回的json字符串
                    var txt = xhr.responseText;
                    //json字符串转换成js对象组成的数组
                    var arr = txt.evalJSON();
                    var htmlContent = "";
                    for(i = 0;i < arr.length;i ++){
                        var s = arr[i];
                        htmlContent+="<tr><td>"+s.code+"</td><td>"+s.name
                            +"</td><td>"+s.price+"</td></tr>";
                    }
                    /*要注意,ie浏览器中，table,tr,tbody,thead,caption不能够使用
                      innerHTML属性赋值，如果要解决该问题，可以使用insertRow,
                      insertCell方法来插入行，或者使用一些框架(jQuery)。
                     */
                    //$('s1').innerHTML=htmlContent;
                    // 为什么这里不行？
                    document.getElementById('tb1').innerHTML = htmlContent;
                }
            };
            xhr.send(null);
        }
    </script>
</head>
<body style="font-size:30px;" onload="showStock();">
<div id="d1">
    <div id="d2">股票实时行情</div>
    <div id="d3">
        <table width="100%">
            <thead>
            <tr><td>代码</td><td>名称</td><td>报价</td></tr>
            </thead>
            <tbody id="tb1">
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
