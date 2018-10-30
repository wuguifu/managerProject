<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- saved from url=(0058) -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="/common-homepage/bootstrap.css" rel="stylesheet">
    <link href="/common/common/font-awesome.min.css" rel="stylesheet"/>
    <link href="/common/common/typicons.min.css" rel="stylesheet"/>

    <style>
        html {
            -ms-text-size-adjust: 100%;
            -webkit-text-size-adjust: 100%;
        }

        body {
            font-family: 'Microsoft Yahei', '微软雅黑', '宋体', \5b8b\4f53, Tahoma, Arial, Helvetica, STHeiti;
            margin: 0;
        }

        .main-nav {
            margin-left: 1px;
        }

        .main-nav.nav-tabs.nav-stacked > li {
        }

        .main-nav.nav-tabs.nav-stacked > li > a {
            padding: 10px 8px;
            font-size: 12px;
            font-weight: 600;
            color: #4A515B;
            background: #E9E9E9;
            background: -moz-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #FAFAFA), color-stop(100%, #E9E9E9));
            background: -webkit-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
            background: -o-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
            background: -ms-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
            background: linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9');
            -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9')";
            border: 1px solid #D5D5D5;
            border-radius: 4px;
        }

        .main-nav.nav-tabs.nav-stacked > li > a > span {
            color: #4A515B;
        }

        .main-nav.nav-tabs.nav-stacked > li.active > a, #main-nav.nav-tabs.nav-stacked > li > a:hover {
            color: #FFF;
            background: #3C4049;
            background: -moz-linear-gradient(top, #4A515B 0%, #3C4049 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #4A515B), color-stop(100%, #3C4049));
            background: -webkit-linear-gradient(top, #4A515B 0%, #3C4049 100%);
            background: -o-linear-gradient(top, #4A515B 0%, #3C4049 100%);
            background: -ms-linear-gradient(top, #4A515B 0%, #3C4049 100%);
            background: linear-gradient(top, #4A515B 0%, #3C4049 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B', endColorstr='#3C4049');
            -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B', endColorstr='#3C4049')";
            border-color: #2B2E33;
        }

        #main-nav.nav-tabs.nav-stacked > li.active > a, #main-nav.nav-tabs.nav-stacked > li > a:hover > span {
            color: #FFF;
        }

        .main-nav.nav-tabs.nav-stacked > li {
            margin-bottom: 4px;
        }

        .nav-header.collapsed > span.glyphicon-chevron-toggle:before {
            content: "\e114";
        }

        .nav-header > span.glyphicon-chevron-toggle:before {
            content: "\e113";
        }

        footer.duomi-page-footer {
            background-color: white;
        }

        footer.duomi-page-footer .beta-message {
            color: #a4a4a4;
        }

        footer.duomi-page-footer .beta-message a {
            color: #53a2e4;
        }

        footer.duomi-page-footer .list-inline a, footer.authenticated-footer .list-inline li {
            color: #a4a4a4;
            padding-bottom: 30px;
        }

        footer.duomi-page-footer {
            background-color: white;
        }

        footer.duomi-page-footer .beta-message {
            color: #a4a4a4;
        }

        footer.duomi-page-footer .beta-message a {
            color: #53a2e4;
        }

        footer.duomi-page-footer .list-inline a, footer.authenticated-footer .list-inline li {
            color: #a4a4a4;
            padding-bottom: 30px;
        }

        /*********************************************自定义部分*********************************************/
        .secondmenu a {
            font-size: 12px;
            color: #4A515B;
            text-align: center;
            border-radius: 4px;
        }

        .secondmenu > li > a:hover {
            background-color: #6f7782;
            border-color: #428bca;
            color: #fff;
        }

        .secondmenu li.active {
            background-color: #6f7782;
            border-color: #428bca;
            border-radius: 4px;
        }

        .secondmenu li.active > a {
            color: #ffffff;
        }

        .navbar-static-top {
            background-color: #212121;
            margin-bottom: 5px;
        }

        .navbar-brand {
            background: url('') no-repeat 10px 8px;
            display: inline-block;
            vertical-align: middle;
            padding-left: 50px;
            color: #fff;
        }

        .navbar-brand:hover {
            color: #fff;
        }

        .collapse.glyphicon-chevron-toggle, .glyphicon-chevron-toggle:before {
            content: "\e113";
        }

        .collapsed.glyphicon-chevron-toggle:before {
            content: "\e114";
        }
    </style>
</head>

<body>
<div class="navbar navbar-duomi navbar-static-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#" id="logo">配置管理系统（流量包月）
            </a>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <ul id="main-nav" class="main-nav nav nav-tabs nav-stacked" style="">
                <li>
                    <a href="#">
                        <i class="glyphicon glyphicon-th-large"></i>
                        首页
                    </a>
                </li>
                <li>
                    <a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        客户管理
                        <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                    </a>
                    <ul id="customInfoSetting" class="nav nav-list secondmenu collapse" style="height: 0px;">
                        <li><a href="/view/customInfoCfgView" target="iframe_content"><i class="glyphicon glyphicon-user"></i>&nbsp;客户信息</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>
                        系统管理

                        <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                    </a>
                    <ul id="systemSetting" class="nav nav-list secondmenu collapse" style="height: 0px;">
                        <li><a href="/view/customInfoCfgView" target="iframe_content"><i class="glyphicon glyphicon-user"></i>&nbsp;用户管理</a></li>
                        <li><a href="/view/login" target="iframe_content"><i class="glyphicon glyphicon-th-list"></i>&nbsp;菜单管理</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-asterisk"></i>&nbsp;角色管理</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-edit"></i>&nbsp;修改密码</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;日志查看</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#configSetting" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-credit-card"></i>
                        配置管理
                        <span class="pull-right glyphicon  glyphicon-chevron-toggle"></span>
                    </a>
                    <ul id="configSetting" class="nav nav-list secondmenu collapse in">
                        <li><a href="#"><i class="glyphicon glyphicon-globe"></i>&nbsp;全局缺省配置</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-star-empty"></i>&nbsp;未开通用户配置</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-star"></i>&nbsp;退订用户配置</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-text-width"></i>&nbsp;试用用户配置</a></li>
                        <li><a href="#"><i class="glyphicon glyphicon-ok-circle"></i>&nbsp;开通用户配置</a></li>
                    </ul>
                </li>

                <li>
                    <a href="#" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-globe"></i>
                        分发配置
                        <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                    </a>
                    <ul id="disSetting" class="nav nav-list secondmenu collapse">
                        <li><a href="#"><i class="glyphicon glyphicon-th-list"></i>&nbsp;分发包配置</a></li>
                    </ul>
                </li>

                <li>
                    <a href="#" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-bold"></i>
                        字典配置
                        <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                    </a>
                    <ul id="dicSetting" class="nav nav-list secondmenu collapse">
                        <li><a href="#"><i class="glyphicon glyphicon-text-width"></i>&nbsp;关键字配置</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="glyphicon glyphicon-fire"></i>
                        关于系统
                        <span class="badge pull-right">1</span>
                    </a>
                </li>

            </ul>
        </div>
        <div class="col-md-10">
            这里是内容
            <iframe id="iframe_content" src="" frameborder="0"  name="iframe_content" scrolling = "no" style="width: 100%; min-height: 1043px"></iframe>
        </div>
    </div>
</div>

<script src="/common/jquery-2.0.3.min.js"></script>
<script src="/bootstrap-3.3.7/dist/js/bootstrap.js"></script>


</body>
</html>