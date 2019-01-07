<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>

    <link href="/common-homepage/bootstrap.css" rel="stylesheet">
    <link href="/common/common/font-awesome.min.css" rel="stylesheet"/>
    <link href="/css/common/bootstrap-select.css" rel="stylesheet"/>
    <link href="/css/common/bootstrap-table.css" rel="stylesheet"/>

    <script src="/common/jquery-2.0.3.min.js"></script>
    <script src="/bootstrap-3.3.7/dist/js/bootstrap.js"></script>
    <script src="/js/common/bootstrap-table.js"></script>
    <script type="text/javascript" src="/common/jquery-ui.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
        .theme_0 {
            color: white;
            font-family: 黑体;
            font-size: 20px;
            text-align: left;
            width: 100%;
            height: 30px;
            background: #737373;
        }
    </style>
    <title>版本显示页面</title>
</head>
<body>
<div>
    <div id="assignTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="content">
            <div class="theme_0" style="text-align: center;">
                <div style="height: 2px;"></div>
                <div colspan=2 align=center>
                    <div>&nbsp;&nbsp;&nbsp;数&nbsp;&nbsp;据&nbsp;&nbsp;表&nbsp;&nbsp;管&nbsp;&nbsp;理&nbsp;&nbsp;表</div>
                </div>
            </div>
            <div style="height: 18px;"></div>
            <div align=center>
                <button class="btn btn-success" id="btnAdd" data-toggle="modal"
                        data-target="#modal-group-add" class="btn btn-default">新增表
                </button>
            </div>
            <div style="height: 20px;"></div>
            <!-- 查询框 -->
            <div id="search_main">
                <form action="" id="searchForm">
                    <div class="form-inline">
                        <div class="form-group">
                            <label>数据库</label> <input class="form-control" name="dbName"
                                                                      placeholder="输入数据库查询..." id="dbName"
                                                                      onkeypress="enterSearch(event);"/>
                            <label>区域</label> <input class="form-control" name="area"
                                                                     placeholder="输入区域查询..." id="area"
                                                                     onkeypress="enterSearch(event);"/>
                            <label>表名</label> <input class="form-control" name="tableName"
                                                                     placeholder="输入表名查询..." id="tableName"
                                                                     onkeypress="enterSearch(event);"/>
                        </div>
                    </div>
                </form>
            </div>

            <div style="width: 98%">
                <table id="table-js"></table>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        var oTable = new TableInit();
        oTable.Init();
    });
    var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#table-js').bootstrapTable({
                url: '/Interface/GetData',         //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: false,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                pageSize: 10,                       //每页的记录行数（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                contentType: "application/x-www-form-urlencoded",
                strictSearch: true,
                showColumns: true,                  //是否显示所有的列
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                height: 700,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "no",                     //每一行的唯一标识，一般为主键列
                showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [
                    {
                        field: 'ID',
                        title: 'ID'
                    }, {
                        field: 'Name',
                        title: '名字'
                    }, {
                        field: 'Sex',
                        title: '性别'
                    },
                    {
                        field: 'operate',
                        title: '操作',
                        formatter: operateFormatter //自定义方法，添加操作按钮
                    },
                ],
                rowStyle: function (row, index) {
                    var classesArr = ['success', 'info'];
                    var strclass = "";
                    if (index % 2 === 0) {//偶数行
                        strclass = classesArr[0];
                    } else {//奇数行
                        strclass = classesArr[1];
                    }
                    return {classes: strclass};
                },//隔行变色
            });
            init();

        };
        function init() {
            $("div.search").empty();
            $("div.search").append($("#search_main"));
        }


        //得到查询的参数
        oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                limit: params.limit,   //页面大小
                offset: params.offset
            };
            return temp;
        };
        return oTableInit;
    };


    function operateFormatter(value, row, index) {//赋予的参数
        return [
            '<a class="btn active disabled" href="#">编辑</a>',
            '<a class="btn active" href="#">档案</a>',
            '<a class="btn btn-default" href="#">记录</a>',
            '<a class="btn active" href="#">准入</a>'
        ].join('');
    }
</script>
</html>