<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传codeDEX</title>
</head>
<%@include file="/header_upload.jsp" %>
<body>
<%
request.setCharacterEncoding("utf-8"); 
response.setContentType("text/html;charset=utf-8");
connect();
String qid = request.getParameter("qid");
String question = request.getParameter("question");
String description = request.getParameter("description");
String solution = request.getParameter("solution");
String code = request.getParameter("code");

// out.print(qid + " " + question + " " + description + " " + solution + " " + code);

// 上传codeDEX
if (null != qid)
{
	CodeDEX codeDEX = new CodeDEX("", question, description, solution, code);
	boolean upload_success = uploadCodeDEX(codeDEX, qid);
}
%>

</body>
</html>