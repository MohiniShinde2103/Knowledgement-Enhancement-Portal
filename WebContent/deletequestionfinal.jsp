<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Question Paper</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String id=request.getParameter("id"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from examqp where id="+id);
if(rs.next())
{
int i=st.executeUpdate("delete from examqp where id="+id); 
	out.println("<h1>Question Paper Deleted Successfully</h1>");
}
	else
{
	out.println("<h3 style=\"color:red;\">Question Paper does not exist</h3>");
}
%>
<br/><br/>
<h1><a href="EditQuestionPaperAccount.jsp">Back To Home</a></h1>
</body>
</html>