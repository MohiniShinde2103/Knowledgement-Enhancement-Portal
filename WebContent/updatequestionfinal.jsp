<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Question Paper</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String id=request.getParameter("id");
String date=request.getParameter("date");
String subcode=request.getParameter("subcode"); 
String count=request.getParameter("count"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from examqp where id='"+id+"'");
if(rs.next())
{
String id1=rs.getString("id");
String subname=rs.getString("subname");
int i=st.executeUpdate("update examqp set id='"+id+"',date='"+date+"',subcode='"+subcode+"',subname='"+subname+"',numpack='"+count+"' where id='"+id+"'"); 
	out.println("<h1>Question Paper Account Updated Successfully<h1>");
}
else
{
	out.println("<h1 style=\"color:red;\">Question Paper does not exist</h1>");
}
%>
<br/><br/>
<a href="EditQuestionPaperAccount.jsp">Back To Home</a>
</body>
</html>