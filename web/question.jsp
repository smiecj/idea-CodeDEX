<%@page import="java.io.IOException"%>
<%@page import="java.io.Writer"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User safe</title>
</head>
<%@include file="/header_question.jsp" %>
<body>
<%
request.setCharacterEncoding("utf-8"); 
response.setContentType("text/html;charset=utf-8");
connect();
String qid = request.getParameter("qid");
Question question = getQuestionByQid(qid);

if (null == question)
{
	out.print("<script>alert('不存在的qid！');</script>");
	return;
}
%>

<h3 id="add_codedex"><a href="/CodeDEX/upload_codedex.jsp?qid=<%=qid%>" >
<font face="微软雅黑">没有找到你想查找的Codedex？点击这里添加</font></a></h3>

<h2 id="这里是问题名字"><%=question.question %></h2>

<p><%=question.description%></p>

<ul>
<li><strong>属于这个问题的codeDEX</strong></li>
<%
List<CodeDEX> list = getCodeDEXByQid(qid);
Iterator<CodeDEX> iterator = list.iterator();
while (iterator.hasNext())
{
	CodeDEX codeDEX = iterator.next();
%>

<li><strong>
<a href="/CodeDEX/codedex.jsp?cid=<%=codeDEX.cid%>" >
<%=codeDEX.question %>
</a></strong></li>

<%
}
%>
</ul>

<h3 id="add_codedex"><a href="/CodeDEX/upload_codedex.jsp?qid=<%=qid%>" >
<font face="微软雅黑">没有找到你想查找的Codedex？点击这里添加</font></a></h3>

</body>
</html>