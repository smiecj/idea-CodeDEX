<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/header.jsp" %>
<%!
//根据qid获取问题
Question getQuestionByQid(String qid)
{
	Question q = null;
	try {
		String sql = "select * from Question where qid = " + qid;
		state = conn.createStatement();
		resultSet = state.executeQuery(sql);
		if (resultSet.next()) {
			String question = resultSet.getString("question");
			String description = resultSet.getString("description");
			q = new Question(qid, question, description);
		}
//		else {
//			out.print("<script>alert('不存在的qid！');window.stop();</script>");
//		}
	}
	catch (SQLException e) {
	}
	return q;
}

//获取问题qid对应的所有codeDEX
List<CodeDEX> getCodeDEXByQid(String qid)
{
	List<CodeDEX> list = new ArrayList();
	try {
		String sql = "select cid from Question_CodeDEX where qid = " + qid;
		state = conn.createStatement();
		ResultSet resultSet_question = state.executeQuery(sql);
		while (resultSet_question.next()) {
			String cid = resultSet_question.getString("cid");
			sql = "select * from CodeDEX where cid = " + cid;
			ResultSet resultSet_codeDEX = state.executeQuery(sql);
			while (resultSet_codeDEX.next()) {
				//cid = resultSet_codeDEX.getString("cid");
				String question = resultSet_codeDEX.getString("question");
				String description = resultSet_codeDEX.getString("description");
				String solution = resultSet_codeDEX.getString("solution");
				String code = resultSet_codeDEX.getString("code");
				CodeDEX codeDEX = new CodeDEX(cid, question, description, solution, code);
				list.add(codeDEX);
			}
		}
	}
	catch (SQLException e) {
	}
	return list;
}

//获取所有的问题
List<Question> getAllQuestion()
{
	List<Question> list = new ArrayList();
	try {
		String sql = "select qid, question from Question;";
		state = conn.createStatement();
		resultSet = state.executeQuery(sql);
		while (resultSet.next()) {
			String qid = resultSet.getString("qid");
			String question = resultSet.getString("question");
			list.add(new Question(qid, question, null));
		}
	}
	catch (SQLException e)
	{
	}
	return list;
}
%>
</html>