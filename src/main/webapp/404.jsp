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
	<h1 >404</h1>
	<h2 >很抱歉，我们无法找到该网页 :(</h2>
	<div >
		<div class="highlight">
			<pre><code class="language-html" data-lang="html"><span class="c">页面地址：</span><span class="s">"<%=request.getParameter("url")!=null?request.getParameter("url"):(request.getRequestURI().toString().indexOf("404.jsp")!=-1?"404":request.getRequestURI()) %>"</span></code></pre>
		</div>
	</div>
	<p>
		您正在浏览的页面不存在
	</p>
</div>
</div>