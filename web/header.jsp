<%@page import="com.sun.corba.se.impl.oa.poa.AOMEntry"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%!
// 定义Class实体
class Question{
	public String qid;
	public String question;
	public String description;
	
	public Question(String qid, String question, String description)
	{
		this.qid = qid;
		this.question = question;
		this.description = description;
	}
}

class CodeDEX{
	public String cid;
	public String question;
	public String description;
	public String solution;
	public String code;
	public CodeDEX(String cid, String question, String description, 
			String solution, String code)
	{
		this.cid = cid;
		this.question = question;
		this.description = description;
		this.solution = solution;
		this.code = code;
	}
}

//连接数据库
ResultSet resultSet = null;
Statement state = null;
Connection conn = null;
int resultInt;
boolean resultBoolean;
boolean connect(){
	String connectString = "jdbc:mysql://localhost:3306/company"
			+ "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(connectString, "root", "");
	} catch (Exception e) {
		return false;
	}
	String sqlSentence = "select * from Question;";
	try {
		state = conn.createStatement();
		resultSet = state.executeQuery(sqlSentence);
	}
	catch (Exception e) {return false;}
	return true;
}
%>

</html>