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
    <style type="text/css">
        .user-score {
            text-align: center;
            margin: 20px;
            padding: 10px 20px;
            font-size: 14px;
            width: 70%;
            margin-right: 20px;
        }
    </style>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<body class="layui-layout-body" style="background-color: white;">
<div class="layui-layout layui-layout-admin">
    <jsp:include flush="true" page="top.jsp"></jsp:include>


    <div class="layui-row   body-aa" style="margin-left: 20px; margin-right: 20px;">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">

            <div class="layui-col-md9  layui-col-xs12 layui-col-sm12 " style="padding: 10px;">

                <div class="layui-carousel" id="carousel-ad">
                    <div carousel-item="">
                        <div>
                            <img src="<%=PATH%>/assets/images/banner_1.jpg" style="width: 100%;height: 300px;">
                        </div>
                        <div>
                            <img src="<%=PATH%>/assets/images/banner_2.jpg" style="width: 100%;height: 300px;">
                        </div>
                        <div>
                            <img src="<%=PATH%>/assets/images/banner_3.jpg" style="width: 100%;height: 300px;">
                        </div>
                    </div>
                </div>

                <ul class="list_aa " style="left: 0; width: 100%;" type="rollbox">
                    <li type="rollitem">
                        <ul id="main-grid-ul" class="product_ul ">
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="layui-col-md3 layui-col-xs12 layui-col-sm12 " style="padding: 10px;">

                <jsp:include flush="true" page="right.jsp"></jsp:include>


            </div>
        </div>
    </div>

    <jsp:include flush="true" page="footer.jsp"></jsp:include>


</div>
<script src="<%=PATH%>/assets/layui/layui.js"></script>
<script>
    (function ($) {
        /*
         * var admin_name = '

        ${admin_name}'; alert("

        ${admin_name}");
			 */
        // 数据列表配置项
        // 主方法
        layui.use(['element', 'layer', 'carousel', 'util', 'flow'], function () {

            var table = layui.table, element = layui.element, layer = layui.layer, form = layui.form,
                carousel = layui.carousel, util = layui.util, flow = layui.flow;


            // 常规轮播
            carousel.render({
                elem: '#carousel-ad',
                width: '100%',
                height: '300px',
                interval: 3000
            });


            getCourseList();//获取课程

            function getCourseList() {
                $.ajax({
                    url: '<%=PATH%>/course/queryList.do',
                    type: 'post',
                    success: function (result) {
                        if (result.success) {
                            var html = '';
                            $.each(result.data, function (i, o) {
                                html += '<li class="line4 " nname="course-65152-9164_2-470621_4" ddt-pit="4" style="width:180px;"';
                                html += 'dd_name="4"><a title="' + o.course_name + '" class="img"';
                                html += 'href="<%=PATH%>/course/detail?course_id=' + o.course_id + '"   style="width:180px;height:180px;"><img style="width:180px;height:180px;"';
                                html += 'src="<%=PATH%>/' + o.course_head + '"';
                                html += 'alt="' + o.course_name + '"></a>';
                                html += '<p class="name" ddt-src="25172281">';
                                html += '<a title="' + o.course_name + '" ';
                                html += 'href="<%=PATH%>/course/detail?course_id=' + o.course_id + '"';
                                html += '>《' + o.course_name + '》</a>';
                                html += '</p>';
                                //html += '<p class="borrow" style="margin-top: 10px;padding-left:0px;text-align:center;">';
                               // html += '<button class="layui-btn layui-btn-small list-btn-learn" data-course-id = "' + o.course_id + '">学习</button>';
                               // html += '<button class="layui-btn layui-btn-small list-btn-exam" data-course-id = "' + o.chapter_id + '">测评</button>';
                               // html += '</p>';
                                html += '<div class="icon_pop">';
                                if (o.course_num < 5) {
                                    html += '<img ';
                                    html += 'src="<%=PATH%>/assets/images/xsq.png"';
                                    html += 'class="product_tags"></img>';
                                }
                                html += '</div>';
                                html += '</li>';
                            });
                            $('#main-grid-ul').html(html);



                        }
                    }
                });
            }


        });

    })(window.jQuery);
</script>
</body>
</html>

