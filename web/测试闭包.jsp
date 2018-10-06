<%--
  Created by IntelliJ IDEA.
  User: 热带雨林
  Date: 2018/10/5
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<html>
<head>
    <script type="text/javascript" src="js/jquery-1.4.3.js">
    </script>
    <script type="text/javascript">
        $(function(){
            function createFunctions(){
                var result = new Array();
                for (var i=0; i < 10; i++){
                    result[i] = function(){
                        return i;
                    };
                }
                return result;
            }
            var funcs = createFunctions();
            for (var i=0; i < funcs.length; i++){
                //console.log(funcs[i]());
                $('#tb1').append('<tr><td>' + funcs[i]() + '</td></tr>');
//                var s_opt='<option value="'+id+'">'+name+'</option>';
//                var $opt=$(s_opt);
//                $("#s1 option:selected").val();
            }
        });
    </script>
</head>
<body>
<table width="100%">
    <thead><tr><td>代码</td></tr></thead>
    <tbody id="tb1"></tbody>
</table>
</body>
</html>
