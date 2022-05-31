<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
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
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<script src="<%=PATH%>/assets/js/jquery-3.2.1.js"></script>
</head>
<body class="layui-layout-body" style="background-color: white;">
	<div class="layui-layout layui-layout-admin">


		<jsp:include flush="true" page="top.jsp"></jsp:include>



		<div class="layui-row   body-aa" style="margin-left: 20px; margin-right: 20px;">


			<div class="layui-col-md9 layui-col-xs12 layui-col-sm12 ">
				<blockquote class="layui-elem-quote" style="margin-top: 20px;">${detail.chapter_name}考卷列表</blockquote>
				<table class="layui-table" lay-even="" lay-skin="row">
					<colgroup>
						<col width="100">
						<col width="400">
						<col width="200">
						<col width="200">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>序号</th>
							<th>标题</th>
							<th>发布时间</th>
							<th>分数</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="main-grid-ul">

					</tbody>
				</table>
			</div>
			<div class="layui-col-md3 layui-col-xs12 layui-col-sm12 " style="padding: 10px;">

					<jsp:include flush="true" page="right.jsp"></jsp:include>


				</div>
		</div>
		<jsp:include flush="true" page="footer.jsp"></jsp:include>

	</div>
	<script src="<%=PATH%>/assets/layui/layui.js"></script>
	<script>
	(function($) {
		layui.use(['element','layer','carousel','util','flow'], function(){
			
			var table = layui.table
			,element = layui.element
			,layer = layui.layer
			,form = layui.form
			,util = layui.util;
			
			
			  
			
			getExamList();
			
			function getExamList(){
				$.ajax({
					url : '<%=PATH%>/exam/querySelfList.do',
					type : 'post',
					data:{chapter_id:'${detail.chapter_id}'},
					success : function(result) {
						if(result.success){
							var html = '';
							$.each(
									result.data,
									function(i,o) {
										html += '<tr>';
										html += '<td>'+(i+1)+'.</td>';
										html += '<td>'+o.exam_title+'</td>';
										html += '<td>'+o.exam_publish_datetime+'</td>';
										if(o.user_id){
											if(o.result_state){
												if(o.result_score&&o.result_score>=60){
													html += '<td>'+(o.result_score||0)+'</td>';
												}else{
													html += '<td style="color:red;">'+(o.result_score||0)+'</td>';
												}
											}else{
												html += '<td>等待评判</td>';
											}
											html += '<td></td>';
										}else{
											html += '<td></td>';
											html += '<td><button class="layui-btn layui-btn-sm list-exam-result-go" data-exam-id="'+o.exam_id+'">开始作答</button></td>';
										}
										html += '</tr>';
									});
							if (html.length<1) {
								html += '<tr>';
								html += '<td>暂无考卷</td>';
								html += '<td>暂无考卷</td>';
								html += '<td>暂无考卷</td>';
								html += '<td>暂无考卷</td>';
								html += '<td>暂无考卷</td>';
								html += '</tr>';
							}
							$('#main-grid-ul').html(html);
							$('#main-grid-ul .list-exam-result-go').click(function(){
								var exam_id = $(this).data("exam-id");
								window.location.href='<%=PATH%>/exam/detail?id=' + exam_id + '&chapter_id=' + '${detail.chapter_id}';
								});
							}
						}
					});
				}
			});

		})(window.jQuery);
	</script>
</body>
</html>

