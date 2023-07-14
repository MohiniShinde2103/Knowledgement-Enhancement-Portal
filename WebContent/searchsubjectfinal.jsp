<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Subject</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String search1=request.getParameter("search1");
String value1=request.getParameter("value1"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from examstudent where id="+value1);;
if(search1.equals("Id"))
{
rs=st.executeQuery("select * from examtimetable where id="+value1);
}
else if(search1.equals("subject code"))
{
rs=st.executeQuery("select * from examtimetable where subcode='"+value1+"'");
}
if(rs.next())
{
	out.println("<table border=2 width=\"100%\"><h4><tr><td>Sr. No.</td><td>Date</td><td>Time</td><td>Subject Code</td><td>Subject Name</td><td>Count</td></tr></h4>");
	out.println("<tr>");
	out.println("<td>"+rs.getString(1)+"</td>");
	out.println("<td>"+rs.getString(2)+"</td>");
	out.println("<td>"+rs.getString(3)+"</td>");
	out.println("<td>"+rs.getString(4)+"</td>");
	out.println("<td>"+rs.getString(5)+"</td>");
	out.println("<td>"+rs.getString(6)+"</td></tr>");
}
else
{
	out.println("<h1 style=\"color:red;\">Subject does not exists</h1>");
}
%>
<br/><br/>
</body>
</html>