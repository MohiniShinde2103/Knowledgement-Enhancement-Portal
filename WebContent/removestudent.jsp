<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>REMOVE STUDENT</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String enroll=request.getParameter("enroll"); 
String roll=request.getParameter("roll"); 
String name=request.getParameter("name"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from student where enrollment="+enroll+" and roll_no='"+roll+"'");
if(rs.next())
{
int i=st.executeUpdate("delete from student where enrollment="+enroll+" and roll_no='"+roll+"'"); 
	out.println("<h1 style=\"color:green;\">Student Profile Deleted Successfully</h1><br/>");
	out.println("<h3>Enrollment Number: "+enroll);
	out.println("<br/>Roll Number: "+roll);
	out.println("<br/>Student Name: "+name);
}
else
{
	out.println("<h1 style=\"color:red;\">Student does not exist</h3>");
}
%>
<br/><br/>
<a href="studentprofile.html">Home</a>
</body>
</html>