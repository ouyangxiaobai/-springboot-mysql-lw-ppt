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


<div class="layui-collapse" lay-accordion="" style="padding-top: 10px;padding-left: 10px;">
    <div class="layui-row">
        <div class="layui-col-md8">
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 0px;">
                    <input type="text" name="search_input_1" lay-verify="required" placeholder="请输入课程名称"
                           autocomplete="off"
                           class="layui-input" value="${aaaa}">
                </div>
            </div>
        </div>
        <div class="layui-col-md4">
            <button class="layui-btn btn-course-search">
                <i class="layui-icon">&#xe615;</i> 搜索
            </button>

        </div>
    </div>
</div>
<div class="layui-collapse" lay-accordion="" style="padding: 10px; margin-top: 20px">

    <c:choose>
        <c:when test="${sessionUser.user_id==null}">
            <div style="text-indent: 2em; font-size: 16px;">
                <p>欢迎您的使用，本站使用SpringBoot技术开发，竭诚为您服务，登录后此处显示综合评分和签到.</p>
                <p style="margin-top: 12px;">猫头鹰疫情网课教学平台，打通线下壁垒，疫情居家，为线上学习保驾护航...</p>
            </div>
        </c:when>
        <c:otherwise>



			<span class="layui-badge   layui-bg-gray  user-score">
			<b>${sessionUser.user_name} ${sessionUser.user_phone}</b>
			</span>

            <span class="layui-badge user-score" id="user-score">综合评分：0</span>
            <button class="layui-btn layui-btn-fluid layui-btn-radius" style="margin-top:20px" id="btn-sign">玩命加载中
            </button>


        </c:otherwise>
    </c:choose>


</div>

<blockquote class="layui-elem-quote" style="margin-top: 20px;">签到记录</blockquote>
<ul class="layui-timeline" id="right-time-list">
</ul>
<script src="<%=PATH%>/assets/layui/layui.js"></script>
<script>
    (function ($) {


        $('.btn-course-search').click(function () {
            course_name_like= $('input[name="search_input_1"]').val() ;
            console.log(course_name_like)
            //windows.locale
            if(!course_name_like) {
                layer.msg('请输入关键词');
                return false;
            }
            window.location.href='<%=PATH%>/course/queryWebList.do?course_name_like=' + course_name_like ;
        })


        /*
         * var admin_name = '



        ${admin_name}'; alert("



        ${admin_name}");
			 */
        // 数据列表配置项
        // 主方法


        <c:choose>
        <c:when test="${sessionUser.user_id==null}">
        </c:when>
        <c:otherwise>

        //登录后获取分数和签到按钮
        getSignState();
        getScore();
        </c:otherwise>
        </c:choose>


        getSignList();


        $("#btn-sign").click(function () {
            if ($("#btn-sign").text().indexOf("已签到") >= 0) {
                layer.msg('今日您已签到，无需再次签到');
                return;
            }
            if ($("#btn-sign").text().indexOf("玩命加载中") >= 0) {
                layer.msg('正在加载中，请稍后');
                return;
            }
            addSign();
        });

        /**
         * 签到方法
         */
        function addSign() {
            $.ajax({
                url: '<%=PATH%>/sign/add.do',
                type: 'post',
                data: {},
                success: function (result) {
                    if (result.success) {
                        $("#btn-sign").text("今日已签到");
                        getSignList();
                    } else {
                        layer.msg(result.msg);
                    }
                }
            });
        }

        /**
         * 获取分数
         */

        function getScore() {
            $.ajax({
                url: '<%=PATH%>/user/getSingle.do',
                type: 'post',
                success: function (result) {
                    if (result.success) {
                        $("#user-score").text('您的综合评分：' + result.data.user_score);
                    } else {
                        layer.msg("获取分数失败");
                    }
                }
            });
        }

        /**
         * 查询当前签到状态
         */
        function getSignState() {
            $.ajax({
                url: '<%=PATH%>/sign/getSignStateToday.do',
                type: 'post',
                data: {},
                success: function (result) {
                    $("#btn-sign").text(result.msg);
                    if (result.success) {
                        $("#btn-sign").text(result.msg);
                    } else {
                        $("#btn-sign").text(result.msg);
                    }
                }
            });
        }

        /**
         * 获取签到列表
         */
        function getSignList() {
            $.ajax({
                url: '<%=PATH%>/sign/queryPageList.do',
                type: 'post',
                data: {
                    start: 1,
                    limit: 20
                },
                success: function (result) {
                    if (result.success) {
                        var html = '';
                        $.each(result.data, function (i, o) {
                            html += '<li class="layui-timeline-item" >';
                            html += '<i class="layui-icon layui-timeline-axis"></i>';
                            html += '<div class="layui-timeline-content layui-text">';
                            html += '<h3 class="layui-timeline-title">' + o.sign_datetime + '</h3>';
                            html += '<div class="layui-timeline-content">';
                            html += '<div class="layui-row">';
                            html += '<div class="layui-col-md3">';
                            html += '<a>';
                            html += '<img alt="" src="<%=PATH%>/' + o.user_head + '" style="float: left; width: 40%;">';
                            html += '</a>';
                            html += '</div>';
                            html += '<div class="layui-col-md9">';
                            html += '<div>';

                            html += '<h5><b>' + o.user_name + '</b> ' + (o.user_phone.length > 7 ? (o.user_phone.substring(0, 4) + "****" + o.user_phone.substring(7, o.user_phone.length)) : o.user_phone) + '</h5>';

                            html += '</div>';
                            html += '</div>';
                            html += '</div>';
                            html += '</div>';
                            html += '</div>';
                            html += '</li>';
                        });
                        $('#right-time-list').html(html);
                    }
                }
            });
        }

    })(window.jQuery);
</script>