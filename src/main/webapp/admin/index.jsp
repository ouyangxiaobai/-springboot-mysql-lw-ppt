<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String BASE = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/";
    String PATH = request.getContextPath();
    String SPATH = PATH + "/static";
    String LPATH = SPATH + "/lib";
    String TPATH = SPATH + "/theme";
    String TDPATH = TPATH + "/default";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>疫情网课教学平台后台管理系统</title>
    <link rel="stylesheet" href="<%=PATH %>/assets/layui/css/layui.css">
    <script src="<%=PATH %>/assets/js/jquery-3.2.1.js"></script>
    <style>
        .layui-logo11 {
            font-weight: bold;
            font-size: 24px;
            color: #ffffff;

            margin-right: 20px;
            top: 0;

            height: 100%;
            line-height: 60px;
            text-align: center;
        }
    </style>
</head>
<body>

<ul class="layui-nav layui-bg-green" lay-filter="nav-menu-top">
    <c:choose>
        <c:when test="${sessionAdmin.admin_issystem==1}">
            <li class="layui-nav-item"><a href="javascript:;">人员管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="javascript:;">教师管理</a>
                    </dd>
                    <dd>
                        <a href="javascript:;">学生列表</a>
                    </dd>
                </dl>
            </li>


        </c:when>

    </c:choose>


    <li class="layui-nav-item"><a href="javascript:;"> 课程章节</a>
        <dl class="layui-nav-child">
            <dd>
                <a href="javascript:;">课程列表</a>
            </dd>
            <dd>
                <a href="javascript:;">章节列表</a>
            </dd>
        </dl>
    </li>
    <li class="layui-nav-item layui-this"><a href="javascript:;">签到列表</a></li>
    <li class="layui-nav-item"></li>


    <li class="layui-nav-item"><a href="javascript:;">测评列表</a></li>
    <li class="layui-nav-item"><a href="javascript:;">答疑回复</a></li>
    <li class="layui-nav-item"><a href="javascript:;">作业管理</a></li>


    <li class="layui-nav-item"><a href="javascript:;">
        <c:choose>
            <c:when test="${sessionAdmin.admin_issystem==1}">
                <b>管理员</b>
            </c:when>
            <c:otherwise>

                <b>教师</b>

            </c:otherwise>
        </c:choose>


        ${sessionAdmin.admin_name}
    </a>
        <dl class="layui-nav-child">
            <dd>
                <a href="javascript:;">修改密码</a>
            </dd>
            <dd>
                <a href="javascript:;">退出登录</a>
            </dd>
        </dl>
    </li>
</ul>


<ul class="  layui-layout-right">
    <div class="layui-logo11">疫情网课教学平台后台管理</div>


</ul>
<div class="layui-row">
    <div class="layui-col-md3">
        <div class="layui-form-item" style="margin-top: 20px; padding-left: 20px; margin-bottom: 10px;">
            <div class="layui-input-block" style="margin-left: 0px;">
                <input type="text" name="search_input_1" lay-verify="required" placeholder="请输入学生姓名" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-col-md4">
        <button class="layui-btn btn-chapter-search"
                style="margin-top: 20px; margin-right: 5px; margin-bottom: 10px; margin-right: 20px;">
            <i class="layui-icon">&#xe615;</i> 搜索
        </button>
        <button class="layui-btn btn-data-add"
                style="margin-top: 20px; margin-right: 20px; margin-bottom: 10px; display: none;">
            <i class="layui-icon">&#xe608;</i> 添加
        </button>
    </div>
</div>
<div id="sign-table-div">
    <table id="sign-table" lay-filter="sign-filter"></table>
</div>
<div id="course-table-div">
    <table id="course-table" lay-filter="course-filter"></table>
</div>
<div id="chapter-table-div">
    <table id="chapter-table" lay-filter="chapter-filter"></table>
</div>
<div id="exam-table-div">
    <table id="exam-table" lay-filter="exam-filter"></table>
</div>
<div id="question-table-div">
    <table id="question-table" lay-filter="question-filter"></table>
</div>
<div id="homework-table-div">
    <table id="homework-table" lay-filter="homework-filter"></table>
</div>
<div id="admin-table-div">
    <table id="admin-table" lay-filter="admin-filter"></table>
</div>
<div id="user-table-div">
    <table id="user-table" lay-filter="user-filter"></table>
</div>
<!-- 通用表格行选项 -->
<script type="text/html" id="common-table-bar">
    <a class="layui-btn layui-btn-sm" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-sm" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
</script>

<!-- 测评表格行选项 -->
<script type="text/html" id="exam-table-bar">
    <a class="layui-btn layui-btn-sm" lay-event="detail">查看学生答题</a>
    <a class="layui-btn layui-btn-sm" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
</script>


<!-- 章表格行选项 -->
<script type="text/html" id="chapter-table-bar">
    <a class="layui-btn layui-btn-sm" lay-event="detail">查看章节教学视频和内容</a>
    <a class="layui-btn layui-btn-sm" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
</script>

<!-- 作业表格行选项 -->
<script type="text/html" id="homework-table-bar">
    <a class="layui-btn layui-btn-sm" lay-event="detail">查看学生作业列表</a>
    <a class="layui-btn layui-btn-sm" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
</script>


<script type="text/html" id="common-table-delete-bar">
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
</script>

<script type="text/html" id="common-table-edit-bar">
    <a class="layui-btn layui-btn-sm" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
</script>

<script type="text/html" id="user-score-table-edit-bar">
    <a class="layui-btn layui-btn-sm" lay-event="score">评分</a>
    <a class="layui-btn layui-btn-sm" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
</script>


<script type="text/html" id="question-table-edit-bar">
    <a class="layui-btn layui-btn-sm" lay-event="reback">回复</a>
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
</script>


<script type="text/html" id="admin-table-bar">
    {{#  if(d.admin_issystem == 1){ }}
    超级管理不可编辑/删除
    {{#  } else { }}
    <a class="layui-btn layui-btn-sm" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
    {{#  } }}

</script>


<script type="text/html" id="common-table-detail-bar">
    <a class="layui-btn layui-btn-sm" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
</script>


<script type="text/html" id="delete-table-detail-bar">
    <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
</script>
<script type="text/html" id="admin-type-field">
    {{#  if(d.admin_issystem == 1){ }}
    是
    {{#  } else { }}
    否
    {{#  } }}
</script>


<script type="text/html" id="chapter-head-field">
    {{#  if(d.chapter_head !== undefined){ }}
    <a href="<%=PATH%>/{{d.chapter_head}}" class="layui-table-link">{{d.chapter_head}}</a>
    {{#  } else { }}

    {{#  } }}
</script>
<script type="text/html" id="user-info-field">
    <img src="<%=PATH%>/{{d.user_head}}" class="layui-nav-img">{{d.user_name}}
</script>


<script type="text/html" id="user-score-field">
    {{#  if(d.user_score < 60){ }}
    <div style="color:#F00">{{d.user_score}}</div>
    {{#  } else { }}
    <div>{{d.user_score}}</div>
    {{#  } }}
</script>


<script type="text/html" id="chapter-head-field">
    {{#  if(d.chapter_head !== undefined){ }}
    <a href="<%=PATH%>/{{d.chapter_head}}" class="layui-table-link">{{d.chapter_head}}</a>
    {{#  } else { }}

    {{#  } }}
</script>


<script src="<%=PATH%>/assets/layui/layui.js"></script>
<!-- <script src="assets/layui/layui.all.js"></script> -->

<script type="text/javascript">


    (function ($) {
        // 签到数据列表配置项
        var sign_option = {
            elem: '#sign-table' // 指定原始表格元素选择器（推荐id选择器）
            ,
            id: 'sign-table-id',
            url: '<%=PATH%>/sign/queryPageList.do',
            even: true // 开启隔行背景
            ,
            method: 'post',
            page: true,
            limits: [5, 10, 15, 20, 50],
            limit: 5 // 默认采用5

            , height: 'full-145',
            loading: true,
            request: {
                pageName: 'start' // 页码的参数名称，默认：page
                ,
                limitName: 'limit' // 每页数据量的参数名，默认：limit
            },
            where: {
                isweb: 1
            },
            cols: [[ // 标题栏
                {
                    field: 'user_name',
                    title: '学生',

                    sort: true,
                    templet: '#user-info-field'
                }, {
                    field: 'sign_datetime',
                    title: '签到时间',

                    sort: true
                }, {
                    fixed: 'right',
                    title: '操作',

                    align: 'center',
                    toolbar: '#delete-table-detail-bar'
                } // 这里的toolbar值是模板元素的选择器
            ]]
            // 设置表头
        };
        // 课程数据列表配置项
        var course_option = {
            elem: '#course-table' // 指定原始表格元素选择器（推荐id选择器）
            ,
            id: 'course-table-id',
            url: '<%=PATH%>/course/queryPageList.do',
            even: true // 开启隔行背景
            ,
            method: 'post',
            page: true,
            limits: [5, 10, 15, 20, 50],
            limit: 5 // 默认采用5
            , height: 'full-145',
            loading: true,
            request: {
                pageName: 'start' // 页码的参数名称，默认：page
                ,
                limitName: 'limit' // 每页数据量的参数名，默认：limit
            },
            where: {
                isweb: 1
            },
            cols: [[ // 标题栏
                /*{
                    field : 'chapter_id',
                    title : 'ID',
                     sort : true,
                    fixed : 'left'
                }*/, {
                    field: 'course_name',
                    title: '课程名称',
                    sort: true
                }, {
                    field: 'course_head',
                    title: '课程封面',
                    sort: true
                }, {
                    fixed: 'right',
                    title: '操作',
                    align: 'center',
                    toolbar: '#common-table-edit-bar'
                } // 这里的toolbar值是模板元素的选择器
            ]]
            // 设置表头
        };
        // 章节数据列表配置项
        var chapter_option = {
            elem: '#chapter-table' // 指定原始表格元素选择器（推荐id选择器）
            ,
            id: 'chapter-table-id',
            url: '<%=PATH%>/chapter/queryPageList.do',
            even: true // 开启隔行背景
            ,
            method: 'post',
            page: true,
            limits: [5, 10, 15, 20, 50],
            limit: 5 // 默认采用5
            , height: 'full-145',
            loading: true,
            request: {
                pageName: 'start' // 页码的参数名称，默认：page
                ,
                limitName: 'limit' // 每页数据量的参数名，默认：limit
            },
            where: {
                isweb: 1
            },
            cols: [[ // 标题栏
                /*{
                    field : 'chapter_id',
                    title : 'ID',
                     sort : true,
                    fixed : 'left'
                }*/, {
                    field: 'chapter_name',
                    title: '章名称',
                    sort: true
                }, {
                    field: 'chapter_head',
                    title: '章封面',
                    sort: true
                }, {
                    fixed: 'right',
                    title: '操作',
                    align: 'center',
                    toolbar: '#chapter-table-bar'
                } // 这里的toolbar值是模板元素的选择器
            ]]
            // 设置表头
        };
        // 测评列表数据列表配置项
        var exam_option = {
            elem: '#exam-table' // 指定原始表格元素选择器（推荐id选择器）
            ,
            id: 'exam-table-id',
            url: '<%=PATH%>/exam/queryPageList.do',
            even: true // 开启隔行背景
            ,
            method: 'post',
            page: true,
            limits: [5, 10, 15, 20, 50],
            limit: 5 // 默认采用5
            , height: 'full-145',
            loading: true,
            request: {
                pageName: 'start' // 页码的参数名称，默认：page
                ,
                limitName: 'limit' // 每页数据量的参数名，默认：limit
            },
            where: {
                isweb: 1
            },
            cols: [[ // 标题栏
                {
                    field: 'exam_title',
                    title: '标题',
                    sort: true
                }, {
                    field: 'chapter_name',
                    title: '课程章节',
                    sort: true
                }, {
                    field: 'exam_publish_datetime',
                    title: '发布时间',
                    sort: true
                }, {
                    fixed: 'right',
                    title: '操作',
                    align: 'center',
                    toolbar: '#exam-table-bar'
                } // 这里的toolbar值是模板元素的选择器
            ]]
            // 设置表头
        };
        // 问题数据列表配置项
        var question_option = {
            elem: '#question-table' // 指定原始表格元素选择器（推荐id选择器）
            ,
            id: 'question-table-id',
            url: '<%=PATH%>/question/queryPageList.do',
            even: true // 开启隔行背景
            ,
            method: 'post',
            page: true,
            limits: [5, 10, 15, 20, 50],
            limit: 5 // 默认采用5
            , height: 'full-145',
            loading: true,
            request: {
                pageName: 'start' // 页码的参数名称，默认：page
                ,
                limitName: 'limit' // 每页数据量的参数名，默认：limit
            },
            where: {
                isweb: 1
            },
            cols: [[ // 标题栏
                {
                    field: 'chapter_name',
                    title: '课程章节',
                    sort: true
                }, {
                    field: 'question_ask',
                    title: '提问内容',
                    sort: true
                }, {
                    field: 'question_ask_datetime',
                    title: '提问时间',
                    sort: true
                }, {
                    field: 'question_answer',
                    title: '回复内容',
                    sort: true,
                    templet: '#question-status-field'
                }, {
                    field: 'question_answer_datetime',
                    title: '回复时间',
                    sort: true
                }, {
                    fixed: 'right',
                    title: '操作',
                    align: 'center',
                    toolbar: '#question-table-edit-bar'
                } // 这里的toolbar值是模板元素的选择器
            ]]
            // 设置表头
        };
        // 作业数据列表配置项
        var homework_option = {
            elem: '#homework-table' // 指定原始表格元素选择器（推荐id选择器）
            ,
            id: 'homework-table-id',
            url: '<%=PATH%>/homework/queryPageList.do',
            even: true // 开启隔行背景
            ,
            method: 'post',
            page: true,
            limits: [5, 10, 15, 20, 50],
            limit: 5 // 默认采用5
            , height: 'full-145',
            loading: true,
            request: {
                pageName: 'start' // 页码的参数名称，默认：page
                ,
                limitName: 'limit' // 每页数据量的参数名，默认：limit
            },
            where: {
                isweb: 1
            },
            cols: [[ // 标题栏
                {
                    field: 'section_name',
                    title: '课程章节',
                    sort: true
                }, {
                    field: 'homework_title',
                    title: '标题',
                    sort: true
                }, {
                    field: 'homework_content',
                    title: '内容',
                    sort: true
                }, {
                    field: 'homework_publish_datetime',
                    title: '发布时间',
                    sort: true
                }, {
                    fixed: 'right',
                    title: '操作',
                    align: 'center',
                    toolbar: '#homework-table-bar'
                } // 这里的toolbar值是模板元素的选择器
            ]]
            // 设置表头
        };

        // 管理员/教师数据列表配置项
        var admin_option = {
            elem: '#admin-table' // 指定原始表格元素选择器（推荐id选择器）
            ,
            id: 'admin-table-id',
            url: '<%=PATH%>/admin/queryPageList.do',
            even: true // 开启隔行背景
            ,
            method: 'post',
            page: true,
            limits: [5, 10, 15, 20, 50],
            limit: 5 // 默认采用5
            , height: 'full-145',
            loading: true,
            request: {
                pageName: 'start' // 页码的参数名称，默认：page
                ,
                limitName: 'limit' // 每页数据量的参数名，默认：limit
            },
            where: {
                isweb: 1
            },
            cols: [[ // 标题栏
                {
                    field: 'admin_name',
                    title: '账号',
                    sort: true
                }, {
                    field: 'admin_password',
                    title: '密码',
                    sort: true
                }, {
                    field: 'admin_issystem',
                    title: '是否管理员',
                    sort: true,
                    templet: '#admin-type-field'
                }, {
                    fixed: 'right',
                    title: '操作',
                    align: 'center',
                    toolbar: '#admin-table-bar'
                } // 这里的toolbar值是模板元素的选择器
            ]]
            // 设置表头
        };

        // 用户数据列表配置项
        var user_option = {
            elem: '#user-table' // 指定原始表格元素选择器（推荐id选择器）
            ,
            id: 'user-table-id',
            url: '<%=PATH%>/user/queryPageList.do',
            even: true // 开启隔行背景
            ,
            method: 'post',
            page: true,
            limits: [5, 10, 15, 20, 50],
            limit: 5 // 默认采用5
            , height: 'full-145',
            loading: true,
            request: {
                pageName: 'start' // 页码的参数名称，默认：page
                ,
                limitName: 'limit' // 每页数据量的参数名，默认：limit
            },
            where: {
                isweb: 1
            },
            cols: [[ // 标题栏
                {
                    field: 'user_name',
                    title: '用户名称',
                    sort: true,
                    templet: '#user-info-field'
                }, {
                    field: 'user_phone',
                    title: '手机号',
                    sort: true
                }, {
                    field: 'user_address',
                    title: '地址',
                    sort: true
                }, {
                    field: 'user_score',
                    title: '综合评分(60以下红色)',
                    sort: true,
                    templet: '#user-score-field'
                }, {
                    fixed: 'right',
                    title: '操作',
                    align: 'center',
                    toolbar: '#user-score-table-edit-bar'
                } // 这里的toolbar值是模板元素的选择器
            ]]
            // 设置表头
        };

        var ItemType = '';

        // 主方法
        layui.use(['element', 'table', 'layer', 'form'], function () {

            var table = layui.table, element = layui.element, layer = layui.layer, form = layui.form;

            form.render('select');

            var messageType = '';

            // 监听导航点击
            element.on('nav(nav-menu-top)', function (elem) {
                ItemType = elem.text();
                $('input[name="search_input_1"]').val('');
                switch (elem.text()) {
                    case '签到列表':
                        setSignView();
                        break;
                    case '课程列表':
                        setCourseView();
                        break;
                    case '章节列表':
                        setSectionView();
                        break;
                    case '测评列表':
                        setExamView();
                        break;
                    case '答疑回复':
                        setQuestionView();
                        break;
                    case '作业管理':
                        setHomeworkView();
                        break;
                    case '教师管理':
                        setAdminView();
                        break;
                    case '学生列表':
                        setUserView();
                        break;
                    case '修改密码':
                        layer.open({
                            type: 2,
                            title: '修改密码',
                            area: ['500px', '280px'],
                            offset: '50px',
                            content: '<%=PATH%>/admin/edit', // 新的页面地址
                            end: function (index, layero) {
                                table.reload('admin-table-id', {
                                    where: {
                                        isweb: 1,
                                        admin_name_like: $('input[name="search_input_1"]').val()
                                    }
                                    // 设定异步数据接口的额外参数
                                });
                                return false;
                            }
                        });
                        break;
                    case '退出登录':
                        layer.confirm('确定退出?', function (index) {
                            $.ajax({
                                url: '<%=PATH%>/admin/logout.do',
                                data: {},
                                type: 'post',
                                success: function (result) {
                                    layer.close(index);
                                    window.location.href = '/platform';
                                }
                            });

                        });
                        break;
                }

            });

            /* 签到列表 */
            table.render(sign_option);
            /*课程列表 */
            table.render(course_option);
            /* 章节列表 */
            table.render(chapter_option);
            /* 测评列表列表 */
            table.render(exam_option);
            /* 问题列表 */
            table.render(question_option);
            /* 作业列表 */
            table.render(homework_option);
            /* 管理员/教师列表 */
            table.render(admin_option);
            /* 用户列表 */
            table.render(user_option);

            ItemType = '章节列表';

            $('#chapter-table-div').hide();
            $('#course-table-div').hide();
            $('#exam-table-div').hide();
            $('#question-table-div').hide();
            $('#homework-table-div').hide();
            $('#admin-table-div').hide();
            $('#user-table-div').hide();

            // 签到工具栏
            table.on('tool(sign-filter)', function (obj) { // 注：tool是工具条事件名，test是table原始容器的属性
                // lay-filter="对应的值"
                var data = obj.data; // 获得当前行数据
                var layEvent = obj.event; // 获得 lay-event 对应的值
                var tr = obj.tr; // 获得当前行 tr 的DOM对象

                if (layEvent === 'del') { // 删除
                    layer.confirm('确定删除?', function (index) {
                        $.ajax({
                            url: '<%=PATH%>/sign/delete.do',
                            data: {
                                id: data.id
                            },
                            type: 'post',
                            success: function (result) {
                                if (result.success) {
                                    layer.msg(result.msg || '删除成功');
                                    obj.del(); // 删除对应行（tr）的DOM结构，并更新缓存
                                } else {
                                    layer.msg(result.msg || '删除失败');
                                }
                            }
                        });
                        layer.close(index);
                    });
                }
            });

            // 章节工具栏
            table.on('tool(chapter-filter)', function (obj) { // 注：tool是工具条事件名，test是table原始容器的属性
                // lay-filter="对应的值"
                var data = obj.data; // 获得当前行数据
                var layEvent = obj.event; // 获得 lay-event 对应的值
                var tr = obj.tr; // 获得当前行 tr 的DOM对象

                if (layEvent === 'del') { // 删除
                    layer.confirm('确定删除?', function (index) {
                        $.ajax({
                            url: '<%=PATH%>/chapter/delete.do',
                            data: {
                                id: data.chapter_id
                            },
                            type: 'post',
                            success: function (result) {
                                if (result.success) {
                                    layer.msg(result.msg || '删除成功');
                                    obj.del(); // 删除对应行（tr）的DOM结构，并更新缓存
                                } else {
                                    layer.msg(result.msg || '删除失败');
                                }
                            }
                        });
                        layer.close(index);
                    });
                } else if (layEvent === 'edit') { // 编辑
                    layer.open({
                        type: 2,
                        title: '章编辑',
                        area: ['800px', '500px'],
                        offset: '10px',
                        scrollbar: true,
                        maxmin: true,
                        anim: 1,
                        content: '<%=PATH%>/chapter/edit?id=' + data.chapter_id, // 新的页面地址
                        end: function (index, layero) {
                            table.reload('chapter-table-id', {
                                where: {
                                    isweb: 1,
                                    chapter_name_like: $('input[name="search_input_1"]').val()
                                }
                                // 设定异步数据接口的额外参数
                            });
                            return false;
                        }
                    });
                } else if (layEvent === 'detail') { // 查看
                    layer.open({
                        type: 2,
                        title: '章节详情',
                        area: ['800px', '500px'],
                        offset: '30px',
                        content: '<%=PATH%>/section/index?chapter_id=' + data.chapter_id // 新的页面地址
                    });
                }
            });
            // 课程工具栏
            table.on('tool(course-filter)', function (obj) { // 注：tool是工具条事件名，test是table原始容器的属性
                // lay-filter="对应的值"
                var data = obj.data; // 获得当前行数据
                var layEvent = obj.event; // 获得 lay-event 对应的值
                var tr = obj.tr; // 获得当前行 tr 的DOM对象

                if (layEvent === 'del') { // 删除
                    layer.confirm('确定删除?', function (index) {
                        $.ajax({
                            url: '<%=PATH%>/course/delete.do',
                            data: {
                                id: data.course_id
                            },
                            type: 'post',
                            success: function (result) {
                                if (result.success) {
                                    layer.msg(result.msg || '删除成功');
                                    obj.del(); // 删除对应行（tr）的DOM结构，并更新缓存
                                } else {
                                    layer.msg(result.msg || '删除失败');
                                }
                            }
                        });
                        layer.close(index);
                    });
                } else if (layEvent === 'edit') { // 编辑
                    layer.open({
                        type: 2,
                        title: '课程编辑',
                        area: ['800px', '500px'],
                        offset: '10px',
                        scrollbar: true,
                        maxmin: true,
                        anim: 1,
                        content: '<%=PATH%>/course/edit?id=' + data.course_id, // 新的页面地址
                        end: function (index, layero) {
                            table.reload('course-table-id', {
                                where: {
                                    isweb: 1,
                                    course_name_like: $('input[name="search_input_1"]').val()
                                }
                                // 设定异步数据接口的额外参数
                            });
                            return false;
                        }
                    });
                }
            });
            // 测评列表工具栏
            table.on('tool(exam-filter)', function (obj) { // 注：tool是工具条事件名，test是table原始容器的属性
                // lay-filter="对应的值"
                var data = obj.data; // 获得当前行数据
                var layEvent = obj.event; // 获得 lay-event 对应的值
                var tr = obj.tr; // 获得当前行 tr 的DOM对象

                if (layEvent === 'del') { // 删除
                    layer.confirm('确定删除?', function (index) {
                        $.ajax({
                            url: '<%=PATH%>/exam/delete.do',
                            data: {
                                id: data.exam_id
                            },
                            type: 'post',
                            success: function (result) {
                                if (result.success) {
                                    layer.msg(result.msg || '删除成功');
                                    obj.del(); // 删除对应行（tr）的DOM结构，并更新缓存
                                } else {
                                    layer.msg(result.msg || '删除失败');
                                }
                            }
                        });
                        layer.close(index);
                    });
                } else if (layEvent === 'edit') { // 编辑
                    layer.open({
                        type: 2,
                        title: '考卷编辑',
                        area: ['800px', '500px'],
                        offset: '10px',
                        scrollbar: true,
                        maxmin: true,
                        anim: 1,
                        content: '<%=PATH%>/exam/edit?id=' + data.exam_id, // 新的页面地址
                        end: function (index, layero) {
                            table.reload('exam-table-id', {
                                where: {
                                    isweb: 1,
                                    exam_title_like: $('input[name="search_input_1"]').val()
                                }
                                // 设定异步数据接口的额外参数
                            });
                            return false;
                        }
                    });
                } else if (layEvent === 'detail') { // 查看
                    layer.open({
                        type: 2,
                        title: '测评详情',
                        area: ['800px', '500px'],
                        offset: '30px',
                        content: '<%=PATH%>/exam/result/index?exam_id=' + data.exam_id // 新的页面地址
                    });
                }
            });

            // 问题信息工具栏
            table.on('tool(question-filter)', function (obj) { // 注：tool是工具条事件名，test是table原始容器的属性
                // lay-filter="对应的值"
                var data = obj.data; // 获得当前行数据
                var layEvent = obj.event; // 获得 lay-event 对应的值
                var tr = obj.tr; // 获得当前行 tr 的DOM对象

                if (layEvent === 'del') { // 删除
                    layer.confirm('确定删除?', function (index) {
                        $.ajax({
                            url: '<%=PATH%>/question/delete.do',
                            data: {
                                id: data.question_id
                            },
                            type: 'post',
                            success: function (result) {
                                if (result.success) {
                                    layer.msg(result.msg || '删除成功');
                                    obj.del(); // 删除对应行（tr）的DOM结构，并更新缓存
                                } else {
                                    layer.msg(result.msg || '删除失败');
                                }
                            }
                        });
                        layer.close(index);
                    });
                } else if (layEvent === 'reback') { // 回复
                    layer.open({
                        type: 2,
                        title: '答疑回复',
                        area: ['800px', '300px'],
                        offset: '50px',
                        scrollbar: true,
                        maxmin: true,
                        anim: 1,
                        content: '<%=PATH%>/question/reback?id=' + data.question_id, // 新的页面地址
                        end: function (index, layero) {
                            table.reload('question-table-id', {
                                where: {
                                    isweb: 1,
                                    chapter_name_like: $('input[name="search_input_1"]').val()
                                }
                                // 设定异步数据接口的额外参数
                            });
                            return false;
                        }
                    });
                }
            });

            // 作业信息工具栏
            table.on('tool(homework-filter)', function (obj) { // 注：tool是工具条事件名，test是table原始容器的属性
                // lay-filter="对应的值"
                var data = obj.data; // 获得当前行数据
                var layEvent = obj.event; // 获得 lay-event 对应的值
                var tr = obj.tr; // 获得当前行 tr 的DOM对象

                if (layEvent === 'del') { // 删除
                    layer.confirm('确定删除?', function (index) {
                        $.ajax({
                            url: '<%=PATH%>/homework/delete.do',
                            data: {
                                id: data.homework_id
                            },
                            type: 'post',
                            success: function (result) {
                                if (result.success) {
                                    layer.msg(result.msg || '删除成功');
                                    obj.del(); // 删除对应行（tr）的DOM结构，并更新缓存
                                } else {
                                    layer.msg(result.msg || '删除失败');
                                }
                            }
                        });
                        layer.close(index);
                    });
                } else if (layEvent === 'edit') { // 编辑
                    layer.open({
                        type: 2,
                        title: '作业编辑',
                        area: ['800px', '500px'],
                        offset: '10px',
                        scrollbar: true,
                        maxmin: true,
                        anim: 1,
                        content: '<%=PATH%>/homework/edit?id=' + data.homework_id, // 新的页面地址
                        end: function (index, layero) {
                            table.reload('homework-table-id', {
                                where: {
                                    isweb: 1,
                                    chapter_name_like: $('input[name="search_input_1"]').val(),
                                    chapter_author_like: $('input[name="search_input_2"]').val(),
                                    user_name_like: $('input[name="search_input_3"]').val()
                                }
                                // 设定异步数据接口的额外参数
                            });
                            return false;
                        }
                    });
                } else if (layEvent === 'detail') { // 查看
                    layer.open({
                        type: 2,
                        title: '学生提交作业',
                        area: ['800px', '500px'],
                        offset: '10px',
                        scrollbar: true,
                        maxmin: true,
                        anim: 1,
                        content: '<%=PATH%>/homework/answer/index?homework_id=' + data.homework_id
                    });
                }
            });

            // 管理员列表信息工具栏
            table.on('tool(admin-filter)', function (obj) { // 注：tool是工具条事件名，test是table原始容器的属性
                // lay-filter="对应的值"
                var data = obj.data; // 获得当前行数据
                var layEvent = obj.event; // 获得 lay-event 对应的值
                var tr = obj.tr; // 获得当前行 tr 的DOM对象

                if (layEvent === 'del') { // 删除
                    layer.confirm('确定删除?', function (index) {
                        $.ajax({
                            url: '<%=PATH%>/admin/delete.do',
                            data: {
                                id: data.admin_name
                            },
                            type: 'post',
                            success: function (result) {
                                if (result.success) {
                                    layer.msg(result.msg || '删除成功');
                                    obj.del(); // 删除对应行（tr）的DOM结构，并更新缓存
                                } else {
                                    layer.msg(result.msg || '删除失败');
                                }
                            }
                        });
                        layer.close(index);
                    });
                } else if (layEvent === 'edit') { // 编辑
                    layer.open({
                        type: 2,
                        title: '教师修改(仅密码)',
                        area: ['500px', '280px'],
                        offset: '50px',
                        scrollbar: true,
                        maxmin: true,
                        anim: 1,
                        content: '<%=PATH%>/admin/edit?id=' + data.admin_name, // 新的页面地址
                        end: function (index, layero) {
                            table.reload('admin-table-id', {
                                where: {
                                    isweb: 1,
                                    admin_name_like: $('input[name="search_input_1"]').val()
                                }
                                // 设定异步数据接口的额外参数
                            });
                            return false;
                        }
                    });
                }
            });

            // 用户列表信息工具栏
            table.on('tool(user-filter)', function (obj) { // 注：tool是工具条事件名，test是table原始容器的属性
                // lay-filter="对应的值"
                var data = obj.data; // 获得当前行数据
                var layEvent = obj.event; // 获得 lay-event 对应的值
                var tr = obj.tr; // 获得当前行 tr 的DOM对象

                if (layEvent === 'del') { // 删除
                    layer.confirm('确定删除?', function (index) {
                        $.ajax({
                            url: '<%=PATH%>/user/delete.do',
                            data: {
                                id: data.user_id
                            },
                            type: 'post',
                            success: function (result) {
                                if (result.success) {
                                    layer.msg(result.msg || '删除成功');
                                    obj.del(); // 删除对应行（tr）的DOM结构，并更新缓存
                                } else {
                                    layer.msg(result.msg || '删除失败');
                                }
                            }
                        });
                        layer.close(index);
                    });
                } else if (layEvent === 'edit') { // 编辑
                    layer.open({
                        type: 2,
                        title: '用户信息修改',
                        scrollbar: true,
                        maxmin: true,
                        anim: 1,
                        area: ['800px', '550px'],
                        offset: '30px',
                        content: '<%=PATH%>/user/edit?id=' + data.user_id, // 新的页面地址
                        end: function (index, layero) {
                            table.reload('user-table-id', {
                                where: {
                                    isweb: 1,
                                    user_name_like: $('input[name="search_input_1"]').val()
                                }
                                // 设定异步数据接口的额外参数
                            });
                            return false;
                        }
                    });
                } else if (layEvent === 'score') { // 评分
                    layer.open({
                        type: 2,
                        title: '用户综合评分',
                        scrollbar: true,
                        maxmin: true,
                        anim: 1,
                        area: ['600px', '300px'],
                        offset: '30px',
                        content: '<%=PATH%>/user/score?id=' + data.user_id, // 新的页面地址
                        end: function (index, layero) {
                            table.reload('user-table-id', {
                                where: {
                                    isweb: 1,
                                    user_name_like: $('input[name="search_input_1"]').val()
                                }
                                // 设定异步数据接口的额外参数
                            });
                            return false;
                        }
                    });
                }
            });

            // 发布按钮事件
            $('.btn-data-add').click(function () {
                if (ItemType === '章节列表') {
                    layer.open({
                        type: 2,
                        title: '发布章',
                        area: ['800px', '500px'],
                        offset: '10px',
                        scrollbar: true,
                        maxmin: true,
                        anim: 1,
                        content: '<%=PATH%>/chapter/add', // 新的页面地址
                        end: function (index, layero) {
                            table.reload('chapter-table-id', {
                                where: {
                                    isweb: 1,
                                    chapter_name_like: $('input[name="search_input_1"]').val()
                                }
                                // 设定异步数据接口的额外参数
                            });
                            return false;
                        }
                    });
                } else if (ItemType === '课程列表') {
                    layer.open({
                        type: 2,
                        title: '发布课程',
                        area: ['800px', '500px'],
                        offset: '10px',
                        scrollbar: true,
                        maxmin: true,
                        anim: 1,
                        content: '<%=PATH%>/course/add', // 新的页面地址
                        end: function (index, layero) {
                            table.reload('course-table-id', {
                                where: {
                                    isweb: 1,
                                    course_name_like: $('input[name="search_input_1"]').val()
                                }
                                // 设定异步数据接口的额外参数
                            });
                            return false;
                        }
                    });
                } else if (ItemType === '作业管理') {
                    layer.open({
                        type: 2,
                        title: '发布作业',
                        area: ['700px', '400px'],
                        offset: '10px',
                        scrollbar: true,
                        maxmin: true,
                        anim: 1,
                        content: '<%=PATH%>/homework/add', // 新的页面地址
                        end: function (index, layero) {
                            table.reload('homework-table-id', {
                                where: {
                                    isweb: 1,
                                    admin_name_like: $('input[name="search_input_1"]').val()
                                }
                                // 设定异步数据接口的额外参数
                            });
                            return false;
                        }
                    });
                } else if (ItemType === '测评列表') {
                    layer.open({
                        type: 2,
                        title: '发布考卷',
                        area: ['700px', '400px'],
                        offset: '10px',
                        scrollbar: true,
                        maxmin: true,
                        anim: 1,
                        content: '<%=PATH%>/exam/add', // 新的页面地址
                        end: function (index, layero) {
                            table.reload('exam-table-id', {
                                where: {
                                    isweb: 1,
                                    exam_title_like: $('input[name="search_input_1"]').val()
                                }
                                // 设定异步数据接口的额外参数
                            });
                            return false;
                        }
                    });
                } else if (ItemType === '教师管理') {
                    layer.open({
                        type: 2,
                        title: '添加教师',
                        area: ['700px', '400px'],
                        offset: '10px',
                        scrollbar: true,
                        maxmin: true,
                        anim: 1,
                        content: '<%=PATH%>/admin/add', // 新的页面地址
                        end: function (index, layero) {
                            table.reload('admin-table-id', {
                                where: {
                                    isweb: 1,
                                    admin_name_like: $('input[name="search_input_1"]').val()
                                }
                                // 设定异步数据接口的额外参数
                            });
                            return false;
                        }
                    });
                }
            });
            // 搜索数据
            $('.btn-chapter-search').click(function () {
                if (ItemType === '签到列表') {
                    table.reload('sign-table-id', {
                        where: {
                            isweb: 1,
                            user_name_like: $('input[name="search_input_1"]').val()
                        }
                        // 设定异步数据接口的额外参数
                    });
                } else if (ItemType === '课程列表') {
                    table.reload('course-table-id', {
                        where: {
                            isweb: 1,
                            course_name_like: $('input[name="search_input_1"]').val()
                        }
                        // 设定异步数据接口的额外参数
                    });
                } else if (ItemType === '章节列表') {
                    table.reload('chapter-table-id', {
                        where: {
                            isweb: 1,
                            chapter_name_like: $('input[name="search_input_1"]').val()
                        }
                        // 设定异步数据接口的额外参数
                    });
                } else if (ItemType === '测评列表') {
                    table.reload('exam-table-id', {
                        where: {
                            isweb: 1,
                            exam_title_like: $('input[name="search_input_1"]').val()
                        }
                        // 设定异步数据接口的额外参数
                    });
                } else if (ItemType === '答疑回复') {
                    table.reload('question-table-id', {
                        where: {
                            isweb: 1,
                            question_ask_like: $('input[name="search_input_1"]').val()
                        }
                        // 设定异步数据接口的额外参数
                    });
                } else if (ItemType === '作业管理') {
                    table.reload('homework-table-id', {
                        where: {
                            isweb: 1,
                            homework_title_like: $('input[name="search_input_1"]').val()
                        }
                        // 设定异步数据接口的额外参数
                    });
                } else if (ItemType === '教师管理') {
                    table.reload('admin-table-id', {
                        where: {
                            isweb: 1,
                            admin_name_like: $('input[name="search_input_1"]').val()
                        }
                        // 设定异步数据接口的额外参数
                    });
                } else if (ItemType === '学生列表') {
                    table.reload('user-table-id', {
                        where: {
                            isweb: 1,
                            user_name_like: $('input[name="search_input_1"]').val()
                        }
                        // 设定异步数据接口的额外参数
                    });
                }
            });

            // 签到视图设置
            function setSignView() {
                $('input[name="search_input_1"]').show();
                $('input[name="search_input_1"]').attr('placeholder', "请输入学生姓名");
                $('.btn-data-add').hide();
                $('#sign-table-div').show();
                $('#chapter-table-div').hide();
                $('#course-table-div').hide();
                $('#question-table-div').hide();
                $('#homework-table-div').hide();
                $('#admin-table-div').hide();
                $('#user-table-div').hide();
                table.reload('sign-table-id', {
                    where: {
                        isweb: 1,
                        user_name_like: $('input[name="search_input_1"]').val()
                    }
                    // 设定异步数据接口的额外参数
                });
            }

            // 课程视图设置
            function setCourseView() {
                $('input[name="search_input_1"]').show();
                $('input[name="search_input_1"]').attr('placeholder', "请输入课程标题");
                $('.btn-data-add').show();
                $('#chapter-table-div').hide();
                $('#course-table-div').show();
                $('#sign-table-div').hide();
                $('#question-table-div').hide();
                $('#homework-table-div').hide();
                $('#admin-table-div').hide();
                $('#user-table-div').hide();
                table.reload('course-table-id', {
                    where: {
                        isweb: 1,
                        course_name_like: $('input[name="search_input_1"]').val()
                    }
                    // 设定异步数据接口的额外参数
                });
            }

            // 章节视图设置
            function setSectionView() {
                $('input[name="search_input_1"]').show();
                $('input[name="search_input_1"]').attr('placeholder', "请输入章节标题");
                $('.btn-data-add').show();
                $('#chapter-table-div').show();
                $('#sign-table-div').hide();
                $('#question-table-div').hide();
                $('#homework-table-div').hide();
                $('#admin-table-div').hide();
                $('#user-table-div').hide();
                $('#course-table-div').hide();
                table.reload('chapter-table-id', {
                    where: {
                        isweb: 1,
                        section_name_like: $('input[name="search_input_1"]').val()
                    }
                    // 设定异步数据接口的额外参数
                });
            }

            // 测评列表视图设置
            function setExamView() {
                $('input[name="search_input_1"]').show();
                $('input[name="search_input_1"]').attr('placeholder', "请输入考卷标题");
                $('.btn-data-add').show();
                $('#exam-table-div').show();
                $('#chapter-table-div').hide();
                $('#sign-table-div').hide();
                $('#question-table-div').hide();
                $('#homework-table-div').hide();
                $('#admin-table-div').hide();
                $('#user-table-div').hide();
                $('#course-table-div').hide();
                table.reload('chapter-table-id', {
                    where: {
                        isweb: 1,
                        section_name_like: $('input[name="search_input_1"]').val()
                    }
                    // 设定异步数据接口的额外参数
                });
            }

            // 问题视图设置
            function setQuestionView() {
                $('.btn-data-add').hide();
                $('input[name="search_input_1"]').show();
                $('input[name="search_input_1"]').attr('placeholder', "请输入问题标题");
                $('#question-table-div').show();
                $('#chapter-table-div').hide();
                $('#exam-table-div').hide();
                $('#admin-table-div').hide();
                $('#sign-table-div').hide();
                $('#homework-table-div').hide();
                $('#user-table-div').hide();
                $('#course-table-div').hide();
                table.reload('question-table-id', {
                    where: {
                        isweb: 1,
                        chapter_name_like: $('input[name="search_input_1"]').val()
                    }
                    // 设定异步数据接口的额外参数
                });
            }

            // 作业视图设置
            function setHomeworkView() {
                $('.btn-data-add').show();
                $('input[name="search_input_1"]').show();
                $('input[name="search_input_1"]').attr('placeholder', "请输入作业标题");
                $('#homework-table-div').show();
                $('#question-table-div').hide();
                $('#sign-table-div').hide();
                $('#exam-table-div').hide();
                $('#chapter-table-div').hide();
                $('#admin-table-div').hide();
                $('#user-table-div').hide();
                $('#course-table-div').hide();
                table.reload('homework-table-id', {
                    where: {
                        isweb: 1,
                        homework_title_like: $('input[name="search_input_1"]').val()
                    }
                    // 设定异步数据接口的额外参数
                });
            }

            // 管理员/教师视图设置
            function setAdminView() {
                $('.btn-data-add').show();
                $('input[name="search_input_1"]').show();
                $('input[name="search_input_1"]').attr('placeholder', "请输入管理员账号");
                $('#admin-table-div').show();
                $('#exam-table-div').hide();
                $('#question-table-div').hide();
                $('#homework-table-div').hide();
                $('#sign-table-div').hide();
                $('#chapter-table-div').hide();
                $('#user-table-div').hide();
                $('#course-table-div').hide();
                table.reload('admin-table-id', {
                    where: {
                        isweb: 1,
                        admin_name_like: $('input[name="search_input_1"]').val()
                    }
                    // 设定异步数据接口的额外参数
                });
            }

            // 用户视图设置
            function setUserView() {
                $('.btn-data-add').hide();
                $('input[name="search_input_1"]').show();
                $('input[name="search_input_1"]').attr('placeholder', "请输入用户名");
                $('#user-table-div').show();
                $('#exam-table-div').hide();
                $('#question-table-div').hide();
                $('#homework-table-div').hide();
                $('#sign-table-div').hide();
                $('#chapter-table-div').hide();
                $('#admin-table-div').hide();
                $('#course-table-div').hide();
                table.reload('user-table-id', {
                    where: {
                        isweb: 1,
                        user_name_like: $('input[name="search_input_1"]').val(),
                        user_phone_like: $('input[name="search_input_2"]').val()
                    }
                    // 设定异步数据接口的额外参数
                });
            }

        });

    })(window.jQuery);
</script>
</body>
</html>

