<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Format 8</title>
</head>
<link rel="stylesheet" href="style.css">
<body>
<div class="heading">
Examination Seating Arrangement</div>
  <div class="nav">
<ul>     <li>  <a  href="home.jsp">Home |</a> </li>
 </ul>
    </div>
<div class="simple-form">
<form action="format8final.jsp" target="_blank">
<fieldset id="registration">
                     <font color="#ffffff" font size=4px>
<%@ page import="java.io.*"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from examtimetable");
String previ="",new1;
out.println("<h3>Select Exam Date : <select id=\"button\" name=\"date\">");
while(rs.next())
{
	if(rs.previous())
	{
		previ=rs.getString(2);
	}
	rs.next();
	new1=rs.getString(2);
	if(previ.equals(new1))
	{
		continue;
	}
	else
	{
		out.println("<option>");
		out.println(rs.getString(2));
		out.println("</option>");
	}
}
out.println("</select>");
ResultSet rs1=st.executeQuery("select * from examtimetable");
out.println("<br/><br/>Select Exam Time : <select id=\"button\" name=\"time\">");
while(rs1.next())
{
	if(rs1.previous())
	{
		previ=rs1.getString(3);
	}
	rs1.next();
	new1=rs1.getString(3);
	if(previ.equals(new1))
	{
		continue;
	}
	else
	{
		out.println("<option>");
		out.println(rs1.getString(3));
		out.println("</option>");
	}
}
out.println("</select><br/><br/>");
%>	
<hr></br></br><a href="#"><input type="submit" name="sub" value="Submit" id="butt"></a><br/><br/></font>
	
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