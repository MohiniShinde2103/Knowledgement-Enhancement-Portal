<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Staff</title>
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
Examination Seating Arrangement</div>
  <div class="nav">
<ul>     <li>  <a  href="home.jsp">Home |</a> </li>
 </ul>
    </div>
</br>
	<a href="InsertStaffRecords.jsp"><input type="button" value="Back" id="butt"></a>&nbsp;&nbsp;
	   
<div class="simple-form" >
<form action="updatestafffinal.jsp">
<fieldset id="registration">
<font color="white" font size=5px>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<% 
String id=request.getParameter("radio1");
String val=request.getParameter("edit");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
if(id!=null)
{
ResultSet rs=st.executeQuery("select * from examstaff where staff_id='"+id+"'");
if(rs.next())
{
	if(val.equals("Edit Staff"))
	{
     out.println("<table class=\"table1\">");
    out.println("<tr><td><a href=\"#\"><input type=\"button\" name=\"insert\" value=\"Edit Staff Records\" id=\"butt1\"/></a></td><td></td><td></td>");
    out.println("<tr><td>Supporting Staff ID*:&emsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>");
    out.println("<td><input type=\"text\" name=\"staffid\" readonly=\"readonly\" value=\""+rs.getString(1)+"\" id=\"button\"></td></tr>");
    out.println("<tr><td>Supporting Staff Name*:&emsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>");
    out.println("<td><input type=\"text\" name=\"staffname\" value=\""+rs.getString(2)+"\" id=\"button\"></td></tr>");
    out.println("<tr><td>Department* : &nbsp;&emsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&emsp;&emsp;&emsp;&nbsp;&emsp;&emsp;&nbsp;&emsp;&emsp;&emsp; </td>");
    out.println("<td><select id=\"button\" name=\"staffdept\"><option>Computer</option><option>Electrical</option><option>Mechanical</option><option>Civil</option><option>Instrumentation</option><option>Electronics and Telecommunication</option><option>Applied Mechanics</option></select></td>");
    out.println("<tr><td>Designation Of Supporting Staff*:&emsp;&nbsp;&nbsp;&emsp;&nbsp;&emsp;&emsp;&emsp;  </td>");	
    out.println("<td><select id=\"button\" name=\"staffdesign\"><option>Permanent Faculty</option><option>Temporary Faculty</option></select></td>");
    out.println("<tr><td>Define Role For Supporting Staff*: &emsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp; </td>");	
    out.println("<td><select id=\"button\" name=\"staffrole\"><option>Supervisor</option><option>Secondary Supervisor</option></select></td>");
    out.println("<tr><td></td><td></td><td><a href=\"#\"><input type=\"submit\" name=\"insert\" value=\"Edit Staff\" id=\"butt1\" /></a></td>");
}
	else if(val.equals("Delete Staff"))
	{
		st.executeUpdate("delete from examstaff where staff_id='"+id+"'");
		out.println("<h1>Staff Record Deleted Successfully</h1>");
	}
	
}
}
else
{
	out.println("<h1>Please Select Radio Button</h1>");
}
%>
</table><br></font>
</fieldset>

<br/><br/><br/>
</form>

</div>
<!---------footer------->
<section id="footer">
<div class="container text-center">
<p><strong><h3>&copy 2020.</strong> Government Polytechnic, Karad.</h3></p>
</div>
</section>

</body>
</html>