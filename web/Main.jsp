<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.corba.se.impl.oa.poa.AOMEntry"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<%@include file="header_question.jsp" %>
<body>
<%
request.setCharacterEncoding("utf-8"); 
response.setContentType("text/html;charset=utf-8");
connect();
List<Question> list_question = getAllQuestion();
%>
<h1 id="codedex"><font face="微软雅黑">codeDEX</font></h1>

<p><font size="3" face="微软雅黑">将平时自己改的codeDEX进行总结。我老婆镇楼。</font></p>
<img src="Resource/01.jpg" alt="圣人惠"></p>

<blockquote>
  <p><font size="7" face="微软雅黑">没有找到你想搜索的问题？点击这里。 </font></p>
</blockquote>

<ul>
<li><strong>这里显示问题的类别</strong></li>
<%
Iterator<Question> iterator = list_question.iterator();
while (iterator.hasNext())
{
	Question question = iterator.next();
%>
<li><strong>
<a href="/CodeDEX/question.jsp?qid=<%=question.qid%>" >
<%
	out.print(question.question);
%>
</a>
</strong></li>
<%
}
%>
</ul>

<blockquote>
  <p><font size="7" face="微软雅黑">没有找到你想搜索的问题？点击这里。 </font></p>
</blockquote>
</body>
</html>