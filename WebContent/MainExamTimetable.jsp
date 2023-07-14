<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main Exam Timetable</title>
</head>
<link rel="stylesheet" href="style.css">
<body>
<style>
#butt1
{
width: 250px;
padding: 10px;
border-radius: 5px;
outline: 0px;
background-color:white;
border: #01010c;
color: red;
font-size: 20px;
}
.simple-form{
margin:100px 100px
}


</style>
<div class="heading">
Examination Seating Arrangement
</div>
  <div class="nav">
<ul>     <li>  <a  href="home.jsp">Home |</a> </li>
 </ul>
    </div>
    </br>
	   <a href="ImportMainExaminationTimetable.jsp"><input type="button" value="Import Main Examination Timetable" id="butt"></a>&nbsp&nbsp
	   <a href="ImportMainSeatingChart.jsp"><input type="button" value="Import Main Seating Chart" id="butt"></a>&nbsp&nbsp
	  <a href="MainExamTimetable.jsp"><input type="button" value="Display Main Timetable" id="butt"></a>&nbsp&nbsp
        <a href="MainSeatingChart.jsp"><input type="button" value="Display Main Seating Chart" id="butt"></a>
<div class="simple-form" >
<form action="EditSubject.jsp">
<fieldset id="registration">
<font color="white" fontsize=6px>
<table>
<tr><td><a href="SearchTimetable.jsp"><input type="button" name="search" value="Search Subject" id="butt1" /></a>
</td><td><input type="submit" name="edit" value="Edit Subject" id="butt1" />
</td><td><input type="submit" name="edit" value="Delete Subject" id="butt1" /></td></tr>
</table>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
out.println("<table border=2 width=\"100%\"><h4><tr><td>Sr. No.</td><td>Date</td><td>Time</td><td>Subject Code</td><td>Subject Name</td><td>Count</td><td>Select</td></tr></h4>");
ResultSet rs=st.executeQuery("select * from examtimetable");
while(rs.next())
{
	out.println("<tr>");
	out.println("<td>"+rs.getString(1)+"</td>");
	out.println("<td>"+rs.getString(2)+"</td>");
	out.println("<td>"+rs.getString(3)+"</td>");
	out.println("<td>"+rs.getString(4)+"</td>");
	out.println("<td>"+rs.getString(5)+"</td>");
	out.println("<td>"+rs.getString(6)+"</td><td><input type=\"radio\" name=\"radio1\" value=\""+rs.getString(1)+"\"></td></tr>");
}
out.println("</table>");
%>
</font>
</fieldset>

<br/><br/><br/>
</form></div>
<!---------footer------->
<section id="footer">
<div class="container text-center">
<p><strong><h3>&copy 2020.</strong> Government Polytechnic, Karad.</h3></p>
</div>
</section>
</body>
</html>