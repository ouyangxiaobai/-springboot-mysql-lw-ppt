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
<body >
<div style="padding:10px;">
	<div class="layui-row">
	    <input type="hidden" name="chapter_id" class="layui-input" value="${chapter_id}">
	    <button class="layui-btn btn-data-add" style="margin-top: 20px;margin-right: 20px;margin-bottom: 10px;">
			   <i class="layui-icon">&#xe608;</i> 添加
		</button>
	</div>
	<div id="section-table-div">
		<table id="section-table" lay-filter="section-filter"></table>
	</div>
</div>

<link rel="stylesheet"href="<%=PATH%>/assets/layui/css/layui.css">
<script src="<%=PATH%>/assets/js/jquery-3.2.1.js"></script>
<script src="<%=PATH%>/assets/layui/layui.js"></script>
<script type="text/html" id="common-table-bar">
  <a class="layui-btn layui-btn-sm" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
</script>
<script type="text/html" id="section-head-field">
 {{#  if(d.section_head !== undefined){ }}
    <a href="javascript:void(0);" onclick="showimgdialog('/MoviesectionWeChatWeb/{{d.section_head}}')" class="layui-table-link img-view" data-img-path="/MoviesectionWeChatWeb/{{d.section_head}}" >{{d.section_head}}</a>
  {{#  } else { }}
    
  {{#  } }}
</script>
<%-- <script src="<%=PATH%>/assets/layui/layui.js"></script> --%>
<script >
function showimgdialog(img) {
	var imgdata = {
			  "title": "", //相册标题
			  "id": 123, //相册id
			  "start": 0, //初始显示的图片序号，默认0
			  "data": [   //相册包含的图片，数组格式
			    {
			      "alt": "照片",
			      "pid": 0, //图片id
			      "src": img, //原图地址
			      "thumb": img //缩略图地址
			    }
			  ]
			};
	layer.photos({
	    photos: imgdata
	    ,anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
	  });
}
(function($) {
//节数据列表配置项
var chapter_id = $('input[name="chapter_id"]').val();
var section_option = {
		  elem: '#section-table' //指定原始表格元素选择器（推荐id选择器）
			  ,id:'section-table-id'
			  ,url: '<%=PATH%>/section/queryPageList.do'
			  ,even: true //开启隔行背景
			  ,method: 'post'
			  ,height:'full-120'
			  ,where: {chapter_id:chapter_id}
			  ,page: true
			  ,limits: [5,10,15,20,50]
			  ,limit: 5 //默认采用5
			  ,loading: true
			  ,request: {
				  pageName: 'start' //页码的参数名称，默认：page
				  ,limitName: 'limit' //每页数据量的参数名，默认：limit
				} 
			  ,cols: [[ //标题栏
				     {field: 'section_name', title: '节标题',   }
		            ,{field: 'section_info', title: '节简介',   }
		        ,{field: 'section_head', title: '节图片',  }
			              ,{field: 'section_video_path', title: '节视频',  }
			            ,{fixed: 'right',  title: '操作',width:140, align:'center', toolbar: '#common-table-bar'} //这里的toolbar值是模板元素的选择器
			          ]] //设置表头
			};

//主方法
layui.use(['element','table','layer','form'], function(){
	
		var table = layui.table
		,layer = layui.layer
		,form = layui.form;
		
		
		/* 节列表 */
		table.render(section_option);
		
		function showimgdialog(img) {
			var imgdata = {
					  "title": "", //相册标题
					  "id": 123, //相册id
					  "start": 0, //初始显示的图片序号，默认0
					  "data": [   //相册包含的图片，数组格式
					    {
					      "alt": "照片",
					      "pid": 0, //图片id
					      "src": img, //原图地址
					      "thumb": img //缩略图地址
					    }
					  ]
					};
			layer.photos({
			    photos: imgdata
			    ,anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
			  });
		}
		

		
		//节工具栏
		table.on('tool(section-filter)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
				  var data = obj.data; //获得当前行数据
				  var layEvent = obj.event; //获得 lay-event 对应的值
				  var tr = obj.tr; //获得当前行 tr 的DOM对象
				 
				  if(layEvent === 'del'){ //删除
				    layer.confirm('确定删除?', function(index){
				      $.ajax({
							url : 'delete.do',
							data : {id:data.section_id},
							type : 'post',
							success : function(result) {
								if(result.success){
									 layer.msg(result.msg||'删除成功');
									 obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
								}else{
									 layer.msg(result.msg||'删除失败');
								}
							}
						});
				      layer.close(index);
				    });
				  } else if(layEvent === 'edit'){ //编辑
					  layer.open({
						  type: 2, 
						  title: '章节编辑',
						  area: ['700px', '400px'],
						  offset: '5px',
						  scrollbar: true,
						  maxmin:true,
						  content: 'edit?id='+data.section_id,     //新的页面地址
						  end: function(index, layero){ 
							  table.reload('section-table-id', {
								  where: {} //设定异步数据接口的额外参数
								});
								return false; 
							}
					});
				  }else if(layEvent === 'detail'){ //查看
					  layer.open({
						  type: 2, 
						  title: '章节详情',
						  area: ['700px', '700px'],
						  offset: '30px',
						  content: 'detail?id='+data.section_id    //新的页面地址
					});
				  }
			});
		
		
		//发布按钮事件
			$('.btn-data-add').click(function(){
				layer.open({
					  type: 2, 
					  title: '添加章节',
					  area: ['700px', '400px'],
					  offset: '5px',
					  scrollbar: true,
					  maxmin:true,
					  content: 'add?chapter_id='+'${chapter_id}',     //新的页面地址
					  end: function(index, layero){ 
							  table.reload('section-table-id');
							  return false; 
							}    
					});
			});
	});

})(window.jQuery);
</script>
</body>

