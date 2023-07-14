<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Staff</title>
</head>
<link rel="stylesheet" href="style.css">
<body>
<style>
#butt1
{
width: 340px;
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
#butt
{
width:350px;
}
</style>
<div class="heading">
Examination Seating Arrangement</div>
  <div class="nav">
<ul>     <li>  <a  href="home.jsp">Home |</a> </li>
 </ul>
    </div>
</br>
<a href="InsertExamRecord.jsp"><input type="button" value="Enter Details Of Examination" id="butt"></a>&nbsp;&nbsp;
	   <a href="InsertBlockRecord.jsp"><input type="button" value="Create and Edit Block Details" id="butt"></a>&nbsp;&nbsp;
	  <a href="InsertStaffRecords.jsp"><input type="button" value="Enter Details About Other Staff Members" id="butt"></a>
         
<div class="simple-form" >
<form action="finalinsertstaff.jsp">
<fieldset id="registration">
<font color="white" font size=5px>
     <table class="table1">
	<tr><td><a href="#"><input type="button" name="insert" value="Insert New Supporting Staff Records" id="butt1"/></a></td><td></td><td></td>
	<tr><td>Supporting Staff Name*:&emsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
	<td><input type="text" name="staffname" id="button"></td></tr>
	<tr><td>Department* : &nbsp;&emsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&emsp;&emsp;&emsp;&nbsp;&emsp;&emsp;&nbsp;&emsp;&emsp;&emsp; </td>
	<td><select id="button" name="staffdept"><option>Computer</option><option>Electrical</option><option>Mechanical</option><option>Civil</option><option>Instrumentation</option><option>Electronics and Telecommunication</option><option>Applied Mechanics</option><option>Language</option><option>Workshop</option></select></td>
	<tr><td>Designation Of Supporting Staff*:&emsp;&nbsp;&nbsp;&emsp;&nbsp;&emsp;&emsp;&emsp;  </td>	
	<td><select id="button" name="staffdesign"><option>Permanent Faculty</option><option>Temporary Faculty</option></select></td>
	<tr><td>Define Role For Supporting Staff*: &emsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp; </td>	
	<td><select id="button" name="staffrole"><option>Supervisor</option><option>Secondary Supervisor</option></select></td>
	<tr><td></td><td></td><td><a href="#"><input type="submit" name="insert" value="Insert New Supporting StaffRecords" id="butt1"/></a></td></tr>
</table><br></font>
</form>
<form action="EditStaff.jsp">
<input type="submit" name="edit" value="Edit Staff" id="butt1" />
<input type="submit" name="edit" value="Delete Staff" id="butt1" />
<font color="white" fontsize=6px>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
out.println("<table border=2 width=\"100%\"><h3><tr><td>Staff Id</td><td>Staff Name</td><td>Staff Department</td><td>Staff Designation</td><td>Staff Role</td><td>Status</td><td>Select</td></tr></h3>");
ResultSet rs=st.executeQuery("select * from examstaff");
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