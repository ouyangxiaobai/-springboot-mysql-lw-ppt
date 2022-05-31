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
	<form class="layui-form" action="" id="homework-answer--edit-form">
	<input type="hidden" name="answer_id" 
					class="layui-input" value="${detail.answer_id}">
		<div class="layui-form-item">
			<label class="layui-form-label">评分</label>
			<div class="layui-input-inline">
				<input type="number" name="homework_score" required
					lay-verify="required" placeholder="请输入评分" autocomplete="off"
					class="layui-input" value="${detail.homework_score}">
			</div>
			<div class="layui-form-mid layui-word-aux">分</div>
		</div>
		
		<div class="layui-form-item layui-form-text">
		    <label class="layui-form-label">评语</label>
		    <div class="layui-input-block">
		      <textarea name="homework_remark" placeholder="请输入评语" maxlength="2048" class="layui-textarea">${detail.homework_remark}</textarea>
		    </div>
		  </div>
		
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit
					lay-filter="homework-answer--edit-form-commit">立即提交</button>
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
			form.on('submit(homework-answer--edit-form-commit)', function(data) {
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
		});

	})(window.jQuery);
</script>