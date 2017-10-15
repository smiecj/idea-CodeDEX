<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/header_codedex.jsp" %>
<%
request.setCharacterEncoding("utf-8"); 
response.setContentType("text/html;charset=utf-8");
connect();
String cid = request.getParameter("cid");
CodeDEX codeDEX = getCodeDEXByCid(cid);
%>
<title><%=codeDEX.question %></title>
</head>
<body>

<h2 id="question"><%=codeDEX.question%></h2>



<h3 id="问题描述">问题描述</h3>

<blockquote>
  <p><%=codeDEX.description %></p>
</blockquote>



<h3 id="解决方法">解决方法</h3>

<blockquote>
  <p><%=codeDEX.solution %></p>
</blockquote>



<h3 id="代码">代码</h3>



<pre class="prettyprint"><code class="language-java hljs "><%=codeDEX.code %></code></pre>

</body>
</html>