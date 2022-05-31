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

<div class="layui-header" style="border-bottom: 1px solid #999; ">
	<a href="<%=PATH%>/index.jsp"><div class="layui-logo11  layui-hide-xs">疫情网课教学平台</div></a>


	<!-- 头部区域（可配合layui已有的水平导航） -->
	<ul class="layui-nav layui-layout-right" lay-filter="nav-menu-top">
		<li class="layui-nav-item layui-this"><a href="<%=PATH%>/index.jsp"><font style="color:#ffffff">首页</font></a></li>



		<c:choose>
			<c:when test="${sessionUser.user_id==null}">
				<li class="layui-nav-item"><a href="javascript:;" onclick="loading()"><font style="color:#ffffff">登录</font></a></li>


				<li class="layui-nav-item"><a href="javascript:;" onclick="reg()"><font style="color:#ffffff">注册</font></a></li>

			</c:when>
			<c:otherwise>

				<li class="layui-nav-item"><a href="javascript:;"><font style="color:#ffffff">个人中心</font></a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:;" onclick="userEdit()">修改资料</a>
						</dd>
						<dd>
							<a href="javascript:;" onclick="userEditpwd()">修改密码</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="javascript:;" onclick="logout()"><font style="color:#ffffff">退出</font></a></li>

			</c:otherwise>
		</c:choose>









	</ul>


</div>



<script src="<%=PATH%>/assets/layui/layui.js"></script>
<script>
	function reg() {

		layer.open({
			type : 2,
			title : '注册',
			area : [ '500px', '580px' ],
			offset : '50px',
			content : '<%=PATH%>/register.jsp'
		});

	}

	function loading() {
		layer.open({
			type : 2,
			title : '登录',
			area : [ '500px', '580px' ],
			offset : '50px',
			content : '<%=PATH%>/login.jsp'
		});
	}

	function userEdit() {

		layer.open({
			type : 2,
			title : '修改资料',
			area : [ '500px', '580px' ],
			offset : '50px',
			content : '<%=PATH%>/user/edit'
		});
	}
	function userEditpwd() {

		layer.open({
			type : 2,
			title : '修改密码',
			area : [ '500px', '280px' ],
			offset : '50px',
			content : '<%=PATH%>/user/editpwd'
		});
	}
	
	function logout() {
		layer.confirm('确定退出?', function(index) {
			$.ajax({
				url : '<%=PATH%>/user/logout.do',
				type : 'post',
				success : function(result) {
					layer.close(index);
					window.location.href = '/platform';
				}
			});

		});
	}
	(function($) {

		 
		// 启用滚动条
		$(document.body).css({
			"overflow-x" : "auto",
			"overflow-y" : "auto"
		});

	})(window.jQuery);
</script>



