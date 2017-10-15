<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提交问题</title>
</head>
<link rel="stylesheet" href="CSS/form_question.css" type="text/css" />
<body>
<%
request.setCharacterEncoding("utf-8"); 
response.setContentType("text/html;charset=utf-8");
String qid = request.getParameter("qid");
%>
<!-- 提交codeDEX，提交的内容包括：名字、描述、解决方式、代码 -->
<form action="upload.jsp" method="post" class="white-pink">
<h1>提交CodeDEX
<span>请在下方填写好需要CodeDEX的信息</span>
</h1>
<label>
<span>Name: </span>
<input id="name" type="text" name="name" placeholder="输入CodeDEX名字" />
</label>
<label>
<span>Description</span>
<input id="description" type="text" name="description" placeholder="输入CodeDEX的基本描述" />
</label>
<label>
<span>Solution</span>
<input id="solution" type="text" name="solution" placeholder="输入解决方法" />
</label>
<label>
<span>Code</span>
<textarea id="code" name="code" placeholder="代码"></textarea>
</label>
<input type="hidden" name="qid" value="<%=qid%>">
<label>
<span>&nbsp;</span>
<input type="submit" class="button" value="Send" />
</label>
</form>
</body>
</html>