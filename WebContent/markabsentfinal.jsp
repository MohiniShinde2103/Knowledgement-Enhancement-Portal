<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mark Absent</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="heading">
Examination Seating Arrangement</div>
  <div class="nav">
<ul>     <li>  <a  href="home.jsp">Home |</a> </li>
 </ul>
    </div>
<center><h1>Mark Attendance</h1>
<form action="updateattendance.jsp">
<%@ page import="java.io.*"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String date=request.getParameter("date");
String time=request.getParameter("time");
String block=request.getParameter("block");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from examstudent where date='"+date+"' and time='"+time+"' and block='"+block+"'");
String attend="";
if(rs.next())
{
	out.println("<table width=\"50%\"><tr><td>Block :</td><td> <b><input type=\"text\" value=\""+block+"\" name=\"block\" readonly=\"readonly\"></b></td><td>Date :</td> <td><b><input type=\"text\" readonly=\"readonly\" name=\"date\" value=\""+date+"\"></td></b> </tr><tr><td>Time:</td> <td><b><input type=\"text\" readonly=\"readonly\" name=\"time\" value=\""+time+"\"></td></b></tr></table>");
	out.println("<br/><b>Present</b><input type=\"checkbox\">  &nbsp &nbsp<b>Absent</b><input type=\"checkbox\" checked=\"true\"> ");
	out.println("<table border=1><h2><tr><td>Sr. No.</td><td>Seat No</td><td>Subject Code</td><td>Subject Name</td><td>Class</td><td>Attendance</td></tr>");
	ResultSet rs1=st.executeQuery("select * from examstudent where date='"+date+"' and time='"+time+"' and block='"+block+"'");
	while(rs1.next())
	{
		out.println("<tr><td>"+rs1.getString(1)+"</td><td>"+rs1.getString(6)+"</td><td>"+rs1.getString(4)+"</td><td>"+rs1.getString(5)+"</td><td>"+rs1.getString(8)+rs1.getString(9)+rs1.getString(10)+"</td>");
	if(rs1.getString(12).equals("present")|| rs1.getString(12).equals("copycase"))
	{
		out.println("<td><input type=\"checkbox\" name=\"check"+rs1.getString(1)+"\">");
	}
	else
	{
		out.println("<td><input type=\"checkbox\" name=\"check"+rs1.getString(1)+"\" checked=\"true\">");
	}
	}
	out.println("</table>");
	out.println("</br></br><input type=\"submit\" name=\"sub\" value=\"Submit\" id=\"butt\"> &nbsp &nbsp <input type=\"reset\" name=\"sub\" value=\"Reset\" id=\"butt\"><br/><br/></font>");
}
else
{
	out.println("<h1 style=\"color:red;\">Please Select Valid data</h1>");
}
%>
</form>
<h2><a href="home.jsp">Home</a> &nbsp &nbsp <a href="MarkAttendance.jsp">Back</a></h2>
</center><br/><br/><br/><br/>
<section id="footer">
<div class="container text-center">
<p><strong><h3>&copy 2020.</strong> Government Polytechnic, Karad.</h3></p>
</div>
</section>
</body>
</html>