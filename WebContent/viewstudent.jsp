<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Student</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String option=request.getParameter("option");
String id=request.getParameter("enroll"); 
session.putValue("bid",id); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from student where enrollment="+id+" or roll_no="+id);
if(rs.next())
{
	out.println("<h1>Student Details<h1><br/>");
	out.println("<h2>Enrollment Number: "+rs.getString(1));
	out.println("<br/>Roll Number: "+rs.getString(2));
	out.println("<br/>Student Name: "+rs.getString(3));
		out.println("<br/>Student DOB: "+rs.getString(4));
		out.println("<br/>Student Gender: "+rs.getString(5));
		out.println("<br/>Student Email: "+rs.getString(6));
		out.println("<br/>Student Mobile Number: "+rs.getString(7));
		out.println("<br/>Student Address: "+rs.getString(8));
		out.println("<br/>Student Branch: "+rs.getString(9));
		out.println("<br/>Student Year: "+rs.getString(10));
	
}
else
{
	out.println("<h1 style=\"color:red;\">Student Profile does not exist</h1>");
}

%>
<br/><br/><h3>
<a href="updatestudent.html">Update</a><br/><br/>
<a href="studentprofile.html">Home</a>
</h3>
</body>
</html>