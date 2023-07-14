<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Subject final</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String id=request.getParameter("id");
String date=request.getParameter("date"); 
String time=request.getParameter("time"); 
String subcode=request.getParameter("subcode"); 
String subname=request.getParameter("subname"); 
String count=request.getParameter("count"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from examtimetable where id='"+id+"'");
if(rs.next())
{
	String qp=rs.getString(8);
	String rem=rs.getString(7);
int i=st.executeUpdate("update examtimetable set id='"+id+"',date='"+date+"',time='"+time+"',subcode='"+subcode+"',subname='"+subname+"',count='"+count+"',remcount='"+rem+"',qpstatus='"+qp+"' where id='"+id+"'"); 
	out.println("<h1>Subject Updated Successfully<h1><br/>");
}
else
{
	out.println("<h1 style=\"color:red;\">Subject does not exist</h1>");
}
%>
<br/><br/>
<a href="MainExamTimetable.jsp">Back To Home</a>
</body>
</html>