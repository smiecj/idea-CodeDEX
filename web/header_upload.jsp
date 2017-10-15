<%@ page import="java.io.IOException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/header.jsp" %>
<%!
// 上传新的CodeDEX
boolean uploadCodeDEX(CodeDEX codeDEX, String qid)
{
	// 判断qid是否存在，不存在直接返回false
	try {
		String sql = "select qid from Question where qid = " + qid;
		state = conn.createStatement();
		ResultSet resultSet_question = state.executeQuery(sql);
		if (!resultSet_question.next()) {
			return false;
		}
		
		// 插入新的CodeDEX，并获取插入之后CodeDEX的id
		sql = "insert into CodeDEX(question, description, solution, code) values(" +
			"'" + codeDEX.question + "', " +
			"'" + codeDEX.description + "', " +
			"'" + codeDEX.solution + "', " +
			"'" + codeDEX.code + "'" +
			");";
		// 注意：这里判断必须用executeUpdate，用execute会有问题
		int insert_int = state.executeUpdate(sql);
		if (insert_int <= 0) {
			return false;
		}
		
		// 获取刚刚插入的最新的codeDEX
		// 因为保证了CodeDEX的名字是UNIQUE的，所以可以通过名字来查找codeDEX的id
		sql = "select cid from CodeDEX where question = '" + codeDEX.question + "';";
		ResultSet resultSet_codeDEX = state.executeQuery(sql);
		if (!resultSet_codeDEX.next()) {
			return false;
		}
		String cid = resultSet_codeDEX.getString("cid");
		
		// 插入Question和CodeDEX之间的外键连接
		sql = "insert into Question_CodeDEX values(" + qid + ", " + cid + ");";
		insert_int = state.executeUpdate(sql);
		if (insert_int <= 0) {
			return false;
		}
		return true;
	}
	catch (SQLException e) {
		return false;
	}
}
%>
</html>