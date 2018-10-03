<%--
  Created by IntelliJ IDEA.
  User: 热带雨林
  Date: 2018/10/2
  Time: 23:27
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<html>
<head>
    <style>
        .tips{
            color:red;
        }
    </style>
    <script type="text/javascript" src="js/my.js">
    </script>
    <script type="text/javascript">
        function check_uname(){
            //step1,获得ajax对象
            var xhr = getXhr();
            //step2,使用ajax对象发请求
            var uri = 'check_uname.do?uname='+$F('username');
            //用encodeURI编码
            xhr.open('get',encodeURI(uri),true);
            //xhr.open('get',uri,true);
            xhr.onreadystatechange=function(){
                if(xhr.readyState == 4){
                    if(xhr.status == 200){
                        //step4,处理服务器返回的数据
                        var txt = xhr.responseText;
                        //innerHTML: 读取或者修改节点的
                        //html内容。
                        $('uname_msg').innerHTML=txt;
                    }else{
                        $('uname_msg').innerHTML='检查用户名出错';
                    }
                }
            };
            xhr.send(null);
        }
        //发送post请求
        function check_uname2(){
            //step1,获得ajax对象
            var xhr = getXhr();
            //step2,使用ajax对象发送请求
            xhr.open('post','check_uname.do',true);
            xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
            xhr.onreadystatechange=function(){
                if(xhr.readyState == 4 && xhr.status == 200){
                    var txt = xhr.responseText;
                    $('uname_msg').innerHTML = txt;
                }
            };
            xhr.send('uname=' + $F('username'));
        }
    </script>
</head>
<body style="font-size:30px;">
<form action="regist.do" method="post">
    <fieldset>
        <legend>注册</legend>
        用户名:<input id="username" name="username" onblur="check_uname();"/>
        <span class="tips" id="uname_msg"></span><br/>
        密码:<input type="password" name="pwd"/><br/>
        <input type="submit" value="提交"/>
    </fieldset>
</form>
</body>
</html>
