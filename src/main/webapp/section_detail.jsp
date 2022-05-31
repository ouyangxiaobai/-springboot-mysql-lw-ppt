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
    <title>疫情网课教学平台</title>
    <link rel="stylesheet" href="<%=PATH%>/assets/layui/css/layui.css">
    <link rel="stylesheet" href="<%=PATH%>/assets/css/workspace.css">

    <script src="<%=PATH%>/assets/js/jquery-3.2.1.js"></script>
    <!--可无视-->
    <link rel="stylesheet" type="text/css" href="<%=PATH%>/assets/css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="<%=PATH%>/assets/css/reset.css">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!--布局样式，意义不大-->
    <link rel="stylesheet" href="<%=PATH%>/assets/css/demo.css">

    <!--核心样式-->
    <link rel="stylesheet" href="<%=PATH%>/assets/css/ckin.css">
</head>
<body class="layui-layout-body" style="background-color: white;">
<div class="layui-layout layui-layout-admin">
    <jsp:include flush="true" page="top.jsp"></jsp:include>


    <div class="layui-row   body-aa" style="margin-left: 20px; margin-right: 20px;">
        <div class="layui-col-md9 layui-col-xs12 layui-col-sm12">
            <section class="demo-section demo-section--light video-body" id="demo">
                <div class="container">
                    <h2 class="title heading">《${detail.all_section_name}》</h2>
                    <video poster="<%=PATH%>/${detail.section_head}" src="<%=PATH%>/${detail.section_video_path}"
                           data-ckin="default" data-overlay="1" data-title="${detail.section_info}"></video>
                    <h6 style="margin-bottom: 20px; text-indent: 25px">${detail.section_info}</h6>
                </div>
            </section>
        </div>
        <div class="layui-col-md3 layui-col-xs12 layui-col-sm12">
            <div class="layui-tab" style="margin-left: 20px;">
                <ul class="layui-tab-title">
                    <li>教学课件</li>
                    <li class="layui-this">课堂答疑</li>
                    <li>课堂作业</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item">
                        <ul class="list_aa" style="left: 0; width: 100%;" type="rollbox">

                            <c:choose>
                                <c:when test="${sessionUser.user_id==null}">
                                    登录后可查看和下载
                                </c:when>
                                <c:otherwise>

                                    <li type="rollitem">
                                        <ul id="section-files-ul" style="overflow-y: auto; height: 700px;">
                                        </ul>
                                    </li>

                                </c:otherwise>
                            </c:choose>


                        </ul>
                    </div>
                    <div class="layui-tab-item  layui-show">


                        <c:choose>
                            <c:when test="${sessionUser.user_id==null}">
                                <b>登录后才可提问</b><br><br><br>
                            </c:when>
                            <c:otherwise>

                                <form class="layui-form" action="" id="question-form">
                                    <input type="hidden" name="section_id" value="${detail.section_id}"/>
                                    <div class="layui-form-item layui-form-text">
                                        <div class="layui-input-block" style="margin-left: 0px;">
                                            <textarea name="question_ask" placeholder="请输入您的疑问"
                                                      class="layui-textarea"></textarea>
                                        </div>
                                    </div>
                                    <div class="layui-form-item" style="margin-top: 30px; text-align: right;">
                                        <button class="layui-btn layui-btn-normal  " lay-submit
                                                lay-filter="question-form-commit">提交问题
                                        </button>
                                    </div>
                                </form>

                            </c:otherwise>
                        </c:choose>


                        <fieldset class="layui-elem-field">
                            <legend>答疑列表</legend>
                            <div class="layui-field-box">
                                <ul class="list_aa" style="left: 0; width: 100%;" type="rollbox">
                                    <li type="rollitem">
                                        <ul id="section-question-ul" style="overflow-y: auto; height: 580px;"></ul>
                                    </li>
                                </ul>
                            </div>
                        </fieldset>
                    </div>


                    <div class="layui-tab-item">


                        <c:choose>
                            <c:when test="${sessionUser.user_id==null}">
                                <b>登录后才可查看作业</b><br><br><br>
                            </c:when>
                            <c:otherwise>

                                <form class="layui-form" action="" id="homework-form">
                                    <input type="hidden" name="homework_id"/>
                                    <div class="layui-form-item layui-form-text">
                                        <div class="layui-input-block" style="margin-left: 0px;">
                                            <textarea name="answer_content" placeholder="请输入您的答案"
                                                      class="layui-textarea"></textarea>
                                        </div>
                                    </div>
                                    <div class="layui-form-item" style="margin-top: 30px; text-align: right;">
                                        <button class="layui-btn layui-btn-normal  " lay-submit
                                                lay-filter="homework-form-commit">提交答案
                                        </button>
                                    </div>
                                </form>
                                <div class="layui-field-box">
                                    <ul class="list_aa" style="left: 0; width: 100%;" type="rollbox">
                                        <li type="rollitem">
                                            <ul id="section-homework-ul" style="overflow-y: auto; height: 580px;"></ul>
                                        </li>
                                    </ul>
                                </div>

                            </c:otherwise>
                        </c:choose>


                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include flush="true" page="footer.jsp"></jsp:include>

</div>
<script src="<%=PATH%>/assets/layui/layui.js"></script>
<script>
    (function ($) {
        layui.use(['element', 'form', 'layer', 'util'], function () {

            var element = layui.element
                , layer = layui.layer
                , form = layui.form
                , util = layui.util;

            $('#homework-form').hide();


            //这里是获取课堂文件列表
            if ('${detail.section_files}'.length > 0) {
                var html = '';
                var files = JSON.parse('${detail.section_files}');
                $.each(files, function (i, o) {

                    html += '<li style="width: 100%;margin-top:20px;border: 1px solid #aaa;padding:10px;border-radius: 5px;" >';
                    html += '<div class="layui-row">';
                    html += (i + 1) + '.';
                    html += '<span style="color: #333;">' + o.path.slice(o.path.lastIndexOf("/") + 1) + '</span>';
                    html += '<p style="color: #999;font-size:12px;"><span>大小：' + o.size + '</span> 发布时间：' + o.datetime + '</p>';
                    html += '<button class="layui-btn layui-btn-normal list-homework-commit" data-homework-id="' + o.homework_id + '" style="margin-top:10px;">';
                    html += '<a   href="<%=PATH%>/file/download.do?path=' + o.path + '" style="color:white;float:right;">下载</a>';
                    html += '</button>';
                    html += '</div>';
                    html += '</li>';
                });
                $('#section-files-ul').html(html);
            } else {
                $('#section-files-ul').html("<li>暂无课件</li>");
            }


            //这里是提交问题部分
            form.on('submit(question-form-commit)', function (data) {
                if (data.field.question_ask.length != 0) {
                    $.ajax({
                        url: '<%=PATH%>/question/add.do',
                        data: data.field,
                        type: 'post',
                        success: function (result) {
                            if (result.success) {
                                layer.msg('提交成功');
                                getSectionQuestionList();
                                $('textarea[name="question_ask"]').val('');
                            } else {
                                layer.msg(result.msg || '提交失败');
                            }
                        }
                    });
                } else {
                    layer.msg('问题不可为空');
                }
                return false;
            });

            //这里是获取问题列表
            getSectionQuestionList();

            function getSectionQuestionList() {

                $.ajax({
                    url: '<%=PATH%>/question/queryList.do',
                    type: 'post',
                    data: {section_id: '${detail.section_id}'},
                    success: function (result) {
                        if (result.success) {
                            var html = '';
                            $.each(
                                result.data,
                                function (i, o) {
                                    html += '<li style="width: 100%;margin-top:20px;">';
                                    html += '<div class="layui-row">';
                                    html += '<div class="layui-col-md2" style="text-align: right;">';
                                    html += '<img src="<%=PATH%>/' + o.user_head + '" class="layui-nav-img">';
                                    html += '</div>';
                                    html += '<div class="layui-col-md10">';
                                    html += '<span>' + o.user_name + '</span><span style="color: #999;margin-left: 10px;">' + o.question_ask_datetime + '</span>';
                                    html += '<p>问：' + o.question_ask + '</p>';
                                    html += '<div><div>答：' + (o.question_answer || '暂未答复') + '</div><div style="color: #999;text-align: right;">' + (o.question_answer_datetime || '') + '</div></div>';
                                    html += '</div>';
                                    html += '</div>';
                                    html += '</li>';
                                });
                            if (html.length == 0) {
                                html += '<li>无人提问</li>';
                            }
                            $('#section-question-ul').html(html);
                        }
                    }
                });
            }


            <c:choose>
            <c:when test="${sessionUser.user_id==null}">

            </c:when>
            <c:otherwise>

            //这里是获取作业列表
            getSectionHomeworkList();


            </c:otherwise>
            </c:choose>


            function getSectionHomeworkList() {


                $.ajax({
                    url: '<%=PATH%>/homework/querySelfList.do',
                    type: 'post',
                    data: {section_id: '${detail.section_id}'},
                    success: function (result) {
                        if (result.success) {
                            var html = '';
                            $.each(
                                result.data,
                                function (i, o) {
                                    html += '<li style="width: 100%;margin-top:20px;border: 1px solid #aaa;padding:10px;border-radius: 5px;" >';
                                    html += '<div class="layui-row">';
                                    html += (i + 1) + '.';
                                    html += '<span>发布时间：</span><span style="color: #999;">' + o.homework_publish_datetime + '</span>';
                                    html += '<p style="color: #333;">' + o.homework_title + '</p>';
                                    html += '<p>' + o.homework_content + '</p>';
                                    if (o.user_id) {
                                        html += '<div><div style="margin-left:20px;">作答内容：' + o.answer_content + '</div><div style="color: #999;margin-left:20px;">作答时间：' + o.answer_commit_datetime + '</div></div>';
                                        if (o.homework_score) {
                                            html += '<div><div style="color:red;margin-left:20px;">分数：' + o.homework_score + '分</div><div style="color: #999;margin-left:20px;">评语：' + o.homework_remark + '</div></div>';
                                        }
                                    } else {
                                        html += '<button class="layui-btn layui-btn-normal list-homework-commit" data-homework-id="' + o.homework_id + '" style="margin-top:10px;">开始作答</button>';
                                    }
                                    html += '</div>';
                                    html += '</li>';
                                });
                            if (html.length == 0) {
                                html += '教师暂未发布作业';
                            }
                            $('#section-homework-ul').html(html);
                            $('#section-homework-ul .list-homework-commit').click(function () {
                                var homework_id = $(this).data("homework-id");
                                $('input[name="homework_id"]').val(homework_id);
                                $('#homework-form').show();
                            });
                        }
                    }
                });
            }

            //这里是提交作业部分
            form.on('submit(homework-form-commit)', function (data) {
                if (data.field.answer_content.length != 0) {
                    $.ajax({
                        url: "<%=PATH%>/homework/answer/add.do",
                        data: data.field,
                        type: 'post',
                        success: function (result) {
                            if (result.success) {
                                layer.msg('提交成功');
                                $('#homework-form').hide();
                                getSectionHomeworkList();
                            } else {
                                layer.msg(result.msg || '提交失败');
                            }
                        }
                    });
                } else {
                    layer.msg('作答不可为空');
                }
                return false;
            });

        });

    })(window.jQuery);
</script>
<script src="<%=PATH%>/assets/js/ckin.js"></script>
</body>
</html>

