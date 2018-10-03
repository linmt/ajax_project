<%--
  Created by IntelliJ IDEA.
  User: 热带雨林
  Date: 2018/10/2
  Time: 23:22
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="utf-8"
        contentType="text/html;charset=utf-8" %>
<html>
<head>
    <script type="text/javascript" src="js/prototype-1.6.0.3.js">
    </script>
    <script type="text/javascript" src="js/my.js">
    </script>
    <script type="text/javascript">
        function showNumber(){
            var xhr = getXhr();
            xhr.open('get','getNumber.do?' + Math.random(),true);
            xhr.onreadystatechange=function(){
                if(xhr.readyState == 4 &&
                    xhr.status == 200){
                    var txt = xhr.responseText;
                    $('d1').innerHTML = txt;
                }
            };
            xhr.send(null);
        }
    </script>
</head>
<body style="font-size:30px;">
<a href="javascript:;"
   onclick="showNumber();">点这儿</a>
<div id="d1"></div>
</body>
</html>
