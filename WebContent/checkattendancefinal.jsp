<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Attendance</title>
</head>
<body>
<center><h1>Attendance</h1>
<%@ page import="java.io.*"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String date=request.getParameter("date");
String time=request.getParameter("time");
String class1=request.getParameter("class1");
String coucode=class1.split(" ")[0];
String yearcode=class1.split(" ")[1];
String mastercode=class1.split(" ")[2];
Class.forName("com.mysql.jdbc.Driver");
int count=0;
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement();
ResultSet rs2=st.executeQuery("select * from examstudent where date='"+date+"' and time='"+time+"' and coucode='"+coucode+"' and yearcode='"+yearcode+"' and mastercode='"+mastercode+"'");
while(rs2.next())
{
	count++;
}
ResultSet rs=st.executeQuery("select * from examstudent where date='"+date+"' and time='"+time+"' and coucode='"+coucode+"' and yearcode='"+yearcode+"' and mastercode='"+mastercode+"'");
if(rs.next())
{
	out.println("<table width=\"40%\" border=\"1\"><tr><td>Class:</td><td> <b>"+class1+"</b></td><td>Date:</td> <td><b>"+date+"</td></b> </tr><tr><td>Time:</td> <td><b>"+time+"</td></b><td>Subject Code:</td> <td><b>"+rs.getString(4)+"</b></td></tr><tr><td> Subject:</td><td> <b>"+rs.getString(5)+"</b></td><td>Total Students:</td><td><b>"+count+"</b></td></table>");
	out.println("<table border=1 width=\"50%\"><h2><tr><td>Sr. No.</td><td>Seat No</td><td>Class Name</td><td>Block Name</td><td>Attendance</td><td>Edit</td></tr>");
	ResultSet rs1=st.executeQuery("select * from examstudent where date='"+date+"' and time='"+time+"' and coucode='"+coucode+"' and yearcode='"+yearcode+"' and mastercode='"+mastercode+"'");
	while(rs1.next())
	{
		out.println("<tr><td>"+rs1.getString(1)+"</td><td>"+rs1.getString(6)+"</td><td>"+class1+"</td><td>"+rs1.getString(11)+"</td><td>"+rs1.getString(12)+"</td><td><a href=\"MarkAbsent.jsp\">Edit</a></td></tr>");
	}
	out.println("</table>");
}
else
{
	out.println("<h1 style=\"color:red;\">Please Select Valid data</h1>");
}
%>
<h1><a href="home.jsp">Home</a> <a href="CheckAttendance.jsp">Back</a></h1>
</center>
</body>
</html>