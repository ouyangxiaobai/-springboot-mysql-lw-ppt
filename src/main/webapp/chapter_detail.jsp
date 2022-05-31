<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<!-- 内容主体区域 -->
			<div style="padding: 15px;">

				<div class="layui-col-md9 layui-col-xs12 layui-col-sm12 " style="padding: 10px;">

					<blockquote class="layui-elem-quote" style="margin-top: 20px;">章节:<b>${detail.all_chapter_name}</b></blockquote>
					<ul class="list_aa" style="left: 0; width: 100%;" type="rollbox">
						<li type="rollitem">
							<ul id="main-grid-ul" class="product_ul ">
							</ul>
						</li>
					</ul>

				</div>
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
			
			
		 
			 
			
			getChapterSectionList();
			
			function getChapterSectionList(){
				
				$.ajax({
					url : '<%=PATH%>/section/queryList.do',
					type : 'post',
					data:{chapter_id:'${detail.chapter_id}'},
					success : function(result) {
						if(result.success){
							var html = '';
							$.each(
									result.data,
									function(i,o) {
										html += '<li class="line4 " nname="chapter-65152-9164_2-470621_4" ddt-pit="4"';
										html += 'dd_name="4"><a title="'+o.section_name+'" class="img"';
										html += 'href="<%=PATH%>/section/detail?section_id='+o.section_id+'"  ><img style="width:150px;height:150px;"';
										html += 'src="<%=PATH%>/'+o.section_head+'"';
										html += 'alt="'+o.section_name+'"></a>';
										html += '<p class="name" ddt-src="25172281">';
										html += '<a title="'+o.section_name+'" ';
										html += 'href="<%=PATH%>/section/detail?section_id=' + o.section_id + '"';
									html += ' >' + o.section_name + '</a>';
									html += '</p>';
									html += '<p class="author">';
									html += '<span class="author_t"></span>' + o.section_info;
									html += '</p>';
									html += '<div class="icon_pop">';
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

