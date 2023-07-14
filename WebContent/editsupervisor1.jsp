<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Supervisor</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="heading">
Examination Seating Arrangement</div>
  <div class="nav">
<ul>     <li>  <a  href="home.jsp">Home |</a> </li>
 </ul>
    </div>
    <div class="simple-form">
<form action="editsupervisorfinal.jsp">
<fieldset id="registration">
                     <font color="#ffffff" font size=4px>
<div class="heading1"><h1>Reset Assigned Block Supervisor</h1></div></br></br>
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
if(rs.next())
{
	out.println("<h2>Selected Date: <input type=\"text\" name=\"date\" id=\"button\" value=\""+date+"\" readonly=\"readonly\">");
	out.println("<h2>Selected Time: <input type=\"text\" name=\"time\" id=\"button\" value=\""+time+"\" readonly=\"readonly\">");
	out.println("<h2>Selected Block: <input type=\"text\" name=\"block\" id=\"button\" value=\""+block+"\" readonly=\"readonly\">");
	out.println("<h2>Previous Staff Name: <input type=\"text\" name=\"prevstaff\" id=\"button\" readonly=\"readonly\" value=\""+rs.getString(13)+"\">");
ResultSet rs2=st.executeQuery("select * from examstaff where status='free'");
out.println("<br/><br/>Select Staff : <select id=\"button\" name=\"staff\"><option>-------</option>");
while(rs2.next())
{
		out.println("<option>");
		out.println(rs2.getString(2));
		out.println("</option>");
}
out.println("</select>");
out.println("<hr></br></br><input type=\"submit\" name=\"sub\" value=\"Submit\" id=\"butt\"><br/><br/></font>");
}
else
{
	out.println("<h1 style=\"color:red;\">Please Select Valid data</h1>");
}
%>
</fieldset><br/><br/><br/>
</form></div>
<!---------footer------->
<section id="footer">
<div class="container text-center">
<p><strong><h3>&copy 2020.</strong> Government Polytechnic, Karad.</h3></p>
</div>
</section>

</body>
</html>