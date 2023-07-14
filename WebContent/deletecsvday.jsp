<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete CSV Day</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<% 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from examstudent");
if(rs.next())
{
int i=st.executeUpdate("delete from examstudent"); 
	out.println("<h1>Data Deleted Successfully</h1><br/>");
}
else
{
	out.println("<h1 style=\"color:red;\">Please Enter the data</h1>");
}
%>
<br/><br/>
<h1><a href="DayWiseSeatChart.jsp">Back To Home</a></h1>
</body>
</html>