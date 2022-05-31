<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="com.alibaba.fastjson.JSON"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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



		<div class="layui-row  body-aa " style="margin-left: 20px; margin-right: 20px;">
		
			<blockquote class="layui-elem-quote" style="margin-top: 20px;">${detail.exam_title} 答题面板</blockquote>
			<ul id="main-grid-ul" style="text-align:left;width: 800px;margin-left: 220px;" >
			</ul>
			<button class="layui-btn layui-btn-fluid layui-btn-radius" style="margin-top:20px;width: 800px;margin-left: 220px;" id="btn-exam-commit" >提交试卷</button>
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
			
			
			 
			  <%Map<String,Object> map = (HashMap)request.getAttribute("detail");
			  List<String>mlist = Arrays.asList((map.get("exam_content").toString().split("\\n")));
			  String content = JSON.toJSONString(mlist);%>;
			
			var exam_content = '<%=content%>';
			
			var questions = JSON.parse(exam_content);
			var html = '';
			$.each(questions,function(i,o){
				html += '<h2 style="margin-top:20px;">'+(i+1)+'.'+o+'</h2>';
				html += '<textarea style="margin-top:10px;" name="desc" placeholder="请输入您的答案" class="layui-textarea"></textarea>';
			});
			if(html.length==0){
				$('#btn-exam-commit').hide();
			}
			$('#main-grid-ul').html(html);
			$('#btn-exam-commit').click(function(){
				var html_content = '';
				$.each(questions,function(i,o){
					html_content += '<h2 style="margin-top:20px;">'+(i+1)+'.'+o+'</h2>';
					html_content += '<div style="margin-top:10px;" name="desc" class="layui-textarea">'+$('.layui-textarea')[i].value+'</div>';
				});
				setTimeout(function(){
					 $.ajax({
						url : '<%=PATH%>/exam/result/add.do',
						data : {result_content:html_content,result_score:0,exam_id:'${detail.exam_id}'},
						type : 'post',
						success : function(result) {
							if (result.success) {
								layer.msg('提交成功！');
								setTimeout(function(){
									window.location.href='<%=PATH%>/exam/index?chapter_id='+'${detail.chapter_id}';
								},1500);
							}else{
								layer.msg(result.msg||'提交失败');
							}
						}
					}); 
				},200);
			});
			
		});

	})(window.jQuery);
</script>
</body>
</html>

