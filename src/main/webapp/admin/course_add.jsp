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
	<form class="layui-form" action="" id="course-add-form">
		<div class="layui-form-item">
			<label class="layui-form-label">标题</label>
			<div class="layui-input-block">
				<input type="text" name="course_name" required lay-verify="required"
					placeholder="请输入课程标题" autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">封面</label>
			<input type="hidden" name="course_head" 
					class="layui-input" >
			<div class="layui-upload" style="margin-left: 110px;">
				  <button type="button" class="layui-btn" id="course-add-form-file-commit">上传图片</button>
				  <div class="layui-upload-list">
				    <img class="layui-upload-img" id="course-add-form-file-img-preview" style="width: 150px;height: 150px;">
				    <p id="course-add-form-file-text"></p>
				  </div>
			</div>   
		</div>   
		
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit
					lay-filter="course-add-form-commit">立即提交</button>
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
			form.on('submit(course-add-form-commit)', function(data) {
				$.ajax({
					url : 'add.do',
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
			
			//上传文件
			  var uploadInst = upload.render({
				  elem: '#course-add-form-file-commit' //绑定元素
					    ,field:'img'
					    ,url: '<%=PATH%>/file/upload.do' //上传接口
				        ,before: function(obj){
				          //预读本地文件示例，不支持ie8
				          obj.preview(function(index, file, result){
				            $('#course-add-form-file-img-preview').attr('src', result); //图片链接（base64）
				          });
				        }
				        ,done: function(res){
				        	 if(res.success){
						    	  $('input[name="course_head"]').val(res.msg);
						      }else{
						    	  layer.msg('上传失败');
						      }
				        }
				        ,error: function(){
				          //演示失败状态，并实现重传
				          var demoText = $('#course-add-form-file-text');
				          demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-sm demo-reload">重试</a>');
				          demoText.find('.demo-reload').on('click', function(){
				            uploadInst.upload();
				          });
				        }
				      });
		});

	})(window.jQuery);
</script>