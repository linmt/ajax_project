<%--
  Created by IntelliJ IDEA.
  User: 热带雨林
  Date: 2018/10/3
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<html>
<head>
    <script type="text/javascript" src="js/my.js"></script>
    <script type="text/javascript" src="js/prototype-1.6.0.3.js"></script>

    <script type="text/javascript">
        function showCities(){
            var xhr = getXhr();
            //var uri="getCities.do?province="+document.getElementById("s1").value;
            var uri="getCities.do?province="+$('s1').value;
            xhr.open("get",encodeURI(uri),true);
            xhr.onreadystatechange=function(){
                if(xhr.readyState == 4 && xhr.status == 200){
                    var txt = xhr.responseText;
                    var arr = txt.split(';');
                    $('s2').innerHTML = '';
                    for(i = 0;i < arr.length;i ++){
                        var cities = arr[i];
                        var city = cities.split(',');
                        var op = new Option(city[0],city[1]);
                        $('s2').options[i] = op;
                    }
                }
            };
            xhr.send(null);
        }
    </script>
</head>
<body style="font-size:30px;">
<select id="s1" style="width:120px;" onchange="showCities();">
    <option value="bj">北京</option>
    <option value="sd">山东</option>
    <option value="hn">湖南</option>
</select>
<select style="width:120px;" id="s2">
</select>
</body>
</html>
