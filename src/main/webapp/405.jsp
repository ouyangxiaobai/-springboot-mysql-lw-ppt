<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String BASE = request.getScheme() + "://" + request.getServerName()
			+ ":" + request.getServerPort() + request.getContextPath()
			+ "/";
	String PATH = request.getContextPath();
	String SPATH = PATH + "/static";
	String LPATH = SPATH + "/lib";
	String TPATH = SPATH + "/theme";
	String TDPATH = TPATH + "/default";
%>
<div class="content" >
<div style="padding:30px;">
	<h1 >405</h1>
	<h2 >很抱歉，用来访问本页面的HTTP方法不被允许，请联系相关维护人员 :(</h2>
	<div >
		<div class="highlight">
			<pre><code class="language-html" data-lang="html"><span class="c">页面地址：</span><span class="s">"${uri}"</span></code></pre>
		</div>
	</div>
	<p>
		您正在浏览的页面存在问题
	</p>
</div>
</div>