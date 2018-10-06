<%--
  Created by IntelliJ IDEA.
  User: 热带雨林
  Date: 2018/10/7
  Time: 1:04
  To change this template use File | Settings | File Templates.
--%>
<%@page pageEncoding="utf-8"
        contentType="text/html;charset=utf-8" %>
<html>
<head>
    <script type="text/javascript" src="js/jquery-1.4.3.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#loadNoteBtn").click(function () {
                $.ajax({
                    url:"/note.do",
                    type:"post",
                    dataType:"json",
                    success:function (result) {
                        for(var i=0;i<result.length;i++){
                            var id=result[i].id;
                            var name=result[i].name;
                            var s_li="<li>"+name+"</li>";
                            var $li=$(s_li);
                            $li.data("noteId",id);
                            $("#note_list").append($li);
                        }
                    }
                    
                });
            });
        });
    </script>
</head>
<body style="font-size:30px;">
<input id="loadNoteBtn" type="button" value="笔记列表">
<hr/>
<ul id="note_list"></ul>
</body>
</html>
