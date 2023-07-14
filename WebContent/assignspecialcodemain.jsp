<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign Special Code</title>
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
<form action="assignspecialcodefinal.jsp">
<fieldset id="registration">
                     <font color="#ffffff" font size=4px>
<div class="heading1"><h1>Assign Special Codes</h1></div></br></br>
<%@ page import="java.io.*"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String date=request.getParameter("date");
String time=request.getParameter("time");
String seatno=request.getParameter("seatno");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from examstudent where date='"+date+"' and time='"+time+"' and seatno='"+seatno+"'");
if(rs.next())
{
	out.println("<h2>Selected Date: <input type=\"text\" name=\"date\" id=\"button\" value=\""+date+"\" readonly=\"readonly\">");
	out.println("<h2>Selected Time: <input type=\"text\" name=\"time\" id=\"button\" value=\""+time+"\" readonly=\"readonly\">");
	out.println("<h2>Selected Block: <input type=\"text\" name=\"seatno\" id=\"button\" value=\""+seatno+"\" readonly=\"readonly\">");
	out.println("<h2>Student Block Name: <input type=\"text\" name=\"block\" id=\"button\" readonly=\"readonly\" value=\""+rs.getString(11)+"\">");
	out.println("<h2>Current Special Code: <input type=\"text\" name=\"precode\" id=\"button\" readonly=\"readonly\" value=\""+rs.getString(14)+"\">");
	out.println("<br/><br/>Enter Special Code : <input type=\"text\" id=\"button\" name=\"code\">");
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