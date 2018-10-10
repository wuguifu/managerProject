<%--
  Created by IntelliJ IDEA.
  User: WGF
  Date: 2018/9/22
  Time: 8:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path; %>




<html>
<head>
   <title>login</title>

        <script src="/common/jquery-2.0.3.min.js"></script>
        <link href="/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="/bootstrap-3.3.7/dist/js/bootstrap.js"></script>
        <link rel="stylesheet" href="/css/style.css">
        </head>
<body>
<div class="container">
    <div class="form row">
        <div class="form-horizontal col-md-offset-3" id="login_form">
            <h3 class="form-title">LOGIN</h3>
            <div class="col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" type="text" placeholder="Username" id="username" name="username" autofocus="autofocus" maxlength="20"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" type="password" placeholder="Password" id="password" name="password" maxlength="8"/>
                </div>
                <div class="form-group">
                    <label class="checkbox">
                        <input type="checkbox" name="remember" value="1"/>记住我
                    </label>
                </div>
                <div class="form-group col-md-offset-9">
                    <button type="submit" class="btn btn-success pull-right" name="submit">登录</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("button:submit").on("click",function () {
        var submit = {};
        submit["username"]=$("#username").val();
        submit["password"]=$("#password").val();
        var url ="/view/validateLogin";
        $.post(url,submit,function (data) {
            if(typeof(data.flag) == 'undefined'){
                alert("login fail");
                return;
            }
            if(data.flag == true){
                window.location.href="/view/homepage";
            }else{
                alert("login fail");
            }
        });
    })

</script>
</body>
</html>
