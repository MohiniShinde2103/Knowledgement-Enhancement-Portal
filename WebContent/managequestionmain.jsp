<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Question Paper</title>
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
<form action="managequestionfinal.jsp">
<fieldset id="registration">
                     <font color="#ffffff" font size=4px>
<div class="heading1"><h1>Assign Special Codes</h1></div></br></br>
<%@ page import="java.io.*"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String date=request.getParameter("date");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
String previ="",new1="";
ResultSet rs=st.executeQuery("select * from examqp where date='"+date+"'");
if(rs.next())
{
	out.println("<h3>Selected Date: <input type=\"text\" name=\"date\" id=\"button\" value=\""+date+"\" readonly=\"readonly\">");
	ResultSet rs1=st.executeQuery("select * from examqp where date='"+date+"' and numpack='0'");
	out.println("<h3>Select Exam Subject Code : <select id=\"button\" name=\"code\">");
	while(rs1.next())
	{
			out.println("<option>");
			out.println(rs1.getString(3));
			out.println("</option>");
	}
	out.println("</select>");
	out.println("<h3>Enter Question Paper Number: <input type=\"text\" name=\"qpno\" id=\"button\">");
	out.println("<br/><br/><input type=\"submit\" name=\"sub\" id=\"butt\">");
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