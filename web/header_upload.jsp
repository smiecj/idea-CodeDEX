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
			"'" + codeDEX.question + "'" +
			"'" + codeDEX.description + "'" +
			"'" + codeDEX.solution + "'" +
			"'" + codeDEX.code + "'" +
			");";
		boolean insert_codedex_success = state.execute(sql);
		if (!insert_codedex_success) {
			return false;
		}
		
		// 获取刚刚插入的最新的codeDEX
		sql = "select cid from CodeDEX where question = '" + codeDEX.question + "';";
		ResultSet resultSet_codeDEX = state.executeQuery(sql);
		if (!resultSet_codeDEX.next()) {
			return false;
		}
		String cid = resultSet_codeDEX.getString("cid");
		
		// 插入Question和CodeDEX之间的外键连接
		sql = "insert into Question_CodeDEX values(" + qid + ", " + cid + ");";
		boolean insert_connect_success = state.execute(sql);
		if (!insert_connect_success) {
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