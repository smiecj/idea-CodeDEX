<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%@include file="/header.jsp" %>

<%!
//通过cid获取CodeDEX
CodeDEX getCodeDEXByCid(String cid)
{
	CodeDEX codeDEX = null;
	try {
		String sql = "select * from CodeDEX where cid = " + cid;
		state = conn.createStatement();
		resultSet = state.executeQuery(sql);
		if (resultSet.next()) {
			String question = resultSet.getString("question");
			String description = resultSet.getString("description");
			String solution = resultSet.getString("solution");
			String code = resultSet.getString("code");
			codeDEX = new CodeDEX(cid, question, description, solution, code);
		}
// 		else {
// 			out.print("<script>alert('不存在的qid！');window.stop();</script>");
// 		}
	}
	catch (SQLException e) {
	}
	return codeDEX;
}
%>

</html>