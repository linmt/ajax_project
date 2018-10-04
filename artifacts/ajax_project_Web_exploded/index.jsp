<%--
  Created by IntelliJ IDEA.
  User: 热带雨林
  Date: 2018/10/1
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="utf-8" %>
<html>
<head>
    <script type="text/javascript">
        function getXhr() {
            var xhr = null;
            if (window.XMLHttpRequest) {
                //非ie浏览器
                xhr = new XMLHttpRequest();
            } else {
                //ie浏览器
                xhr = new ActiveXObject("Microsoft.XMLHttp");
            }
            return xhr;
        }
        function sendRequest() {
            var xhr=getXhr();
            //alert(xhr);
            //创建一个http请求
            //默认异步
            var uri="demo1.do?i="+document.getElementById("i").value;
            xhr.open("get",encodeURI(uri),true);
            //注册一个回调函数，请求处理时自动调用
            xhr.onreadystatechange=function () {
                //必须等到ajax对象获得了服务器返回的所有数据。
                if(xhr.readyState == 4&&xhr.status==200){
                    var txt = xhr.responseText;
                    //使用txt更新当前页面。
                    document.getElementById("i").value =txt;
                }
                //else {
                //    alert(xhr.readyState)
                //}
            };
            //发送http请求，如果是post，则要写键值对
            xhr.send(null);
            //alert(xhr.readyState);
        }
        function sendRequest2() {
            var xhr=getXhr();
            xhr.open("post","demo1.do",true);
            xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
            xhr.onreadystatechange=function () {
                if(xhr.readyState == 4 && xhr.status==200){
                    var txt = xhr.responseText;
                    document.getElementById("i").value =txt;
                }
            };
            xhr.send('i=' + document.getElementById("i").value);
        }
    </script>
</head>
<body>
    <a href="#" onclick="sendRequest() ">查看上证指数</a></br>
    <a href="javascript:sendRequest();">也是查看上证指数</a>
    <input type="text" id="i" value="默认值"/>
    <hr/>
    <table>
        <tr>
            <td>新闻标题</td><td>时间</td>
        </tr>
        <tr>
            <td>张杰演唱会</td><td>2011-10-1</td>
        </tr>
        <tr>
            <td>我的演唱会</td><td>2012-10-1</td>
        </tr>
    </table>
</body>
</html>
