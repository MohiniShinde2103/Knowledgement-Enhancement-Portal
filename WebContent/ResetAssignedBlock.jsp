<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset Assigned Block</title>
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
<form action="resetblockfinal.jsp">
<fieldset id="registration">
                     <font color="#ffffff" font size=4px>
<div class="heading1"><h1>Reset Assigned Block</h1></div></br></br>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement();
ResultSet rsblock=st.executeQuery("select * from examblocks");
out.println("<center><h1>Block Assignment</h1><br/>Select Block: <select name=\"block\" id=\"button\">");
while(rsblock.next())
{
	out.println("<option>");
	out.println(rsblock.getString(2));
	out.println("</option>");
}
out.println("</select><br/><br/>");
%>	
<input type="submit" id="butt">
	</fieldset><br/><br/>
</form></div>
<!---------footer------->
<section id="footer">
<div class="container text-center">
<p><strong><h3>&copy 2020.</strong> Government Polytechnic, Karad.</h3></p>
</div>
</section>
</body>
</html>