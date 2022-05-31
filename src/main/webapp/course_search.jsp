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

            <div class="layui-col-md9 layui-col-xs12 layui-col-sm12 " style="padding: 10px;">


                <ul class="list_aa" style="left: 0; width: 100%;" type="rollbox">
                    <li type="rollitem">
                        <ul id="main-grid-ul" class="product_ul ">

                            <c:forEach items="${data}" var="course">


                                <li class="line4 " style="width:180px;">
                                    <a title="${course.course_name}" class="img"
                                       href="<%=PATH%>/course/detail?course_id=${course.course_id}"
                                       style="width:180px;height:180px;">
                                        <img
                                                style="width:180px;height:180px;"
                                                src="<%=PATH%>/${course.course_head}"
                                                alt="${course.course_name}">
                                    </a>
                                    <p class="name">
                                        <a title="${course.course_name}"
                                           href="<%=PATH%>/course/detail?course_id=${course.course_id}"
                                        >《${course.course_name}》
                                        </a>
                                    </p>

                                    <div class="icon_pop">
                                        <c:if test="${course.course_num<5}">
                                            <img
                                                    src="<%=PATH%>/assets/images/xsq.png"
                                                    class="product_tags"/>
                                        </c:if>
                                    </div>
                                </li>

                            </c:forEach>


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

        // 数据列表配置项
        // 主方法
        layui.use(['element', 'layer', 'carousel', 'util', 'flow'], function () {

            var table = layui.table, element = layui.element, layer = layui.layer, form = layui.form,
                carousel = layui.carousel, util = layui.util, flow = layui.flow;


        });

    })(window.jQuery);
</script>
</body>
</html>

