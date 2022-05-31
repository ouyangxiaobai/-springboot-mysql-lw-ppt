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
	<form class="layui-form" action="" id="section-edit-form">
	<input type="hidden" name="chapter_id" 
					class="layui-input" value="${detail.chapter_id}">
	<input type="hidden" name="course_id" class="layui-input" value="${detail.course_id}">
	<input type="hidden" name="section_id" 
					class="layui-input" value="${detail.section_id}">
		<div class="layui-form-item">
			<label class="layui-form-label">标题</label>
			<div class="layui-input-block">
				<input type="text" name="section_name" required lay-verify="required"
					placeholder="请输入节标题" autocomplete="off" class="layui-input" value="${detail.section_name}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">视频文件</label>
			<div class="layui-input-block">
				<button type="button" class="layui-btn" id="video-upload"><i class="layui-icon"></i>上传视频</button>
				<input type="text" name="section_video_path" required lay-verify="required" style="margin-top: 10px;"
					placeholder="assets/video/您放于该目录下的视频文件名mp4格式，示例：assets/video/video1.mp4" autocomplete="off" class="layui-input"value="${detail.section_video_path}" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">封面</label>
			<input type="hidden" name="section_head" 
					class="layui-input" value="${detail.section_head}">
			<div class="layui-upload" style="margin-left: 110px;">
				  <button type="button" class="layui-btn" id="section-edit-form-file-commit">上传图片</button>
				  <div class="layui-upload-list">
				    <img class="layui-upload-img" id="section-edit-form-file-img-preview" style="width: 150px;height: 150px;">
				    <p id="section-edit-form-file-text"></p>
				  </div>
			</div>   
		</div>   
		
		<div class="layui-form-item layui-form-text">
		    <label class="layui-form-label">简介</label>
		    <div class="layui-input-block">
		      <textarea name="section_info" placeholder="请输入简介" maxlength="1024" class="layui-textarea">${detail.section_info}</textarea>
		    </div>
		  </div>
		  
		  <div class="layui-form-item layui-form-text">
		    <label class="layui-form-label">课件文件</label>
		    <button type="button" class="layui-btn" id="test3"><i class="layui-icon"></i>上传文件</button>
		    <div class="layui-input-block" id="section-files">
		      
		    </div>
		  </div>
		
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit
					lay-filter="section-edit-form-commit">立即提交</button>
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
			
			var files = [];
			
			//这里是获取课堂文件列表
			if('${detail.section_files}'.length>0){
				files = JSON.parse('${detail.section_files}');
				showFileList();
			}

			//监听提交
			form.on('submit(section-edit-form-commit)', function(data) {
				data.field.section_files = JSON.stringify(files);
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
			if('${detail.section_head}'!=undefined){
				$('#section-edit-form-file-img-preview').attr('src','<%=PATH%>/'+'${detail.section_head}'); 
			}
		
			 //上传文件
			  var uploadInst = upload.render({
				  elem: '#section-edit-form-file-commit' //绑定元素
					    ,field:'img'
					    ,url: '<%=PATH%>/file/upload.do' //上传接口
				        ,before: function(obj){
				          //预读本地文件示例，不支持ie8
				          obj.preview(function(index, file, result){
				            $('#section-edit-form-file-img-preview').attr('src', result); //图片链接（base64）
				          });
				        }
				        ,done: function(res){
				        	 if(res.success){
						    	  $('input[name="section_head"]').val(res.msg);
						      }else{
						    	  layer.msg('上传失败');
						      }
				        }
				        ,error: function(){
				          //演示失败状态，并实现重传
				          var demoText = $('#section-edit-form-file-text');
				          demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-sm demo-reload">重试</a>');
				          demoText.find('.demo-reload').on('click', function(){
				            uploadInst.upload();
				          });
				        }
			  });
			 
			  //上传ppt
			  upload.render({
			    elem: '#test3'
			    ,field:'file'
			    ,url: '<%=PATH%>/file/uploadFile.do'
			    ,accept: 'file' //普通文件
		    	,before:function(obj){
			    	layer.load(); //上传loading
			    }
			  	,error: function(index, upload){
				    layer.closeAll('loading'); //关闭loading
				 }
			    ,done: function(res){
			    	layer.closeAll('loading'); //关闭loading
			    	if(res.success){
			    		var o1 = {
		    				path:res.path,
		    				size:res.size,
		    				datetime:res.datetime
			    		}
			    		files.push(o1);
			    		showFileList();
				      }else{
				    	  layer.msg('上传失败');
				      }
			    }
			  });
			  //上传视频
			  upload.render({
			    elem: '#video-upload'
			    ,field:'file'
			    ,url: '<%=PATH%>/file/uploadFile.do'
			    ,accept: 'video' //普通文件
		    	,before:function(obj){
			    	layer.load(); //上传loading
			    }
			  	,error: function(index, upload){
				    layer.closeAll('loading'); //关闭loading
				 }
			    ,done: function(res){
			    	layer.closeAll('loading'); //关闭loading
			    	if(res.success){
			    		$('input[name="section_video_path"]').val(res.path);
				      }else{
				    	  layer.msg('上传失败');
				      }
			    }
			  });
			  
			 function showFileList(){
				 var html = '';
				 $.each(files,function(i,o){
					 html += '<div style="margin-top:10px;">'+(i+1)+'.<span>'+o.path+' ('+o.size+')<span class="layui-badge section-file-delete" style="margin-left:10px;cursor: pointer;"  data-num="'+i+'">删除</span</span></div>'
				 })
				 $('#section-files').html(html);
				 $('#section-files .section-file-delete').click(function(){
						var num = $(this).data("num");
						var new_file = [];
						$.each(files,function(i,o){
							if (i!=num) {
								new_file.push(o);
							}
						});
						files = new_file;
						showFileList();
					});
			 }
		});

	})(window.jQuery);
</script>