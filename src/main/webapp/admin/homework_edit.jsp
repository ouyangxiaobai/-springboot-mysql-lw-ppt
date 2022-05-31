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
<style>
.layui-input-block{
	margin-right: 40px;
}
</style>
<div class="content" style="margin-top: 40px">
	<link rel="stylesheet"href="<%=PATH%>/assets/layui/css/layui.css">
	<script src="<%=PATH%>/assets/js/jquery-3.2.1.js"></script>
	<form class="layui-form" action="" id="homework-edit-form">
		<input type="hidden" name="homework_id" class="layui-input" value="${detail.homework_id}">
		<div class="layui-form-item">
			<label class="layui-form-label">所属章节</label>
			<div class="layui-input-block">
				<select name="section_id" lay-verify="required">
					
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">标题</label>
			<div class="layui-input-block">
				<input type="text" name="homework_title" required lay-verify="required"
					placeholder="请输入标题" autocomplete="off" class="layui-input" value="${detail.homework_title}">
			</div>
		</div>
		
		<div class="layui-form-item layui-form-text">
		    <label class="layui-form-label">内容</label>
		    <div class="layui-input-block">
		      <textarea name="homework_content" placeholder="请输入内容" maxlength="2048" class="layui-textarea">${detail.homework_content}</textarea>
		    </div>
		  </div>
		
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit
					lay-filter="homework-edit-form-commit">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
</div>

<script src="<%=PATH%>/assets/layui/layui.js"></script>
<script>
	(function($) {
		layui.use(['form','upload'], function() {
			var form = layui.form
			,upload = layui.upload;

			//监听提交
			form.on('submit(homework-edit-form-commit)', function(data) {
				$.ajax({
					url : 'edit.do',
					data : data.field,
					type : 'post',
					success : function(result) {
						if(result.success){
							 layer.msg(result.msg||'保存成功');
							 var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
							 parent.layer.close(index); //再执行关闭   
						}else{
							 layer.msg(result.msg||'保存失败');
						}
					}
				});
				return false;
			});
			//加载章节列表
			  $.ajax({
					url : '<%=PATH%>/section/queryList.do',
					data : {},
					type : 'post',
					success : function(result) {
						if (result.success) {
							var html = '';
							$.each(result.data,function(i,o){
								html += '<option value="'+o.section_id+'">'+o.section_name+'</option>';
							});
							$('select[name="section_id"]').html(html);
							$('select[name="section_id"]').val('${detail.section_id}'); 
						}
						form.render('select');
					}
				});
		});

	})(window.jQuery);
</script>