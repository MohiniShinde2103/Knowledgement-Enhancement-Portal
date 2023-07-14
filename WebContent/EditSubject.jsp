<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Subject</title>
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
	<a href="MainExamTimetable.jsp"><input type="button" value="Back" id="butt"></a>&nbsp;&nbsp;
	   
<div class="simple-form" >
<form action="updatesubjectfinal.jsp">
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
ResultSet rs=st.executeQuery("select * from examtimetable where id='"+id+"'");
if(rs.next())
{
	if(val.equals("Edit Subject"))
	{
     out.println("<table class=\"table1\">");
    out.println("<tr><td><a href=\"#\"><input type=\"button\" name=\"insert\" value=\"Edit Subject Records\" id=\"butt1\"/></a></td><td></td><td></td>");
    out.println("<tr><td></td><td>Id*:&emsp;&emsp;&emsp;&emsp;</td>");
    out.println("<td><input type=\"text\" readonly=\"readonly\" value=\""+rs.getString(1)+"\" name=\"id\" id=\"button\"></td></tr>");
    out.println("<tr><td></td><td>Date*:&emsp;&emsp;</td>");
    out.println("<td><input type=\"text\" value=\""+rs.getString(2)+"\" name=\"date\" id=\"button\"></td></tr>");
    out.println("<tr><td></td><td>Time* : &nbsp; </td>");
    out.println("<td><input type=\"text\" name=\"time\"  value=\""+rs.getString(3)+"\" id=\"button\"></td></tr>");
    out.println("<tr><td></td><td>Subject Code*:  </td>");
    out.println("<td><input type=\"text\" name=\"subcode\"  value=\""+rs.getString(4)+"\" id=\"button\"></td></tr>");	
    out.println("<tr><td></td><td>Subject Name*:  </td>");
    out.println("<td><input type=\"text\" name=\"subname\"  value=\""+rs.getString(5)+"\" id=\"button\"></td></tr>");	
    out.println("<tr><td></td><td>Count*:  </td>");
    out.println("<td><input type=\"text\" name=\"count\"  value=\""+rs.getString(6)+"\" id=\"button\"></td></tr>");
    out.println("<tr><td></td><td></td><td><a href=\"#\"><input type=\"submit\" name=\"insert\" value=\"Edit Subject\" id=\"butt1\" /></a></td>");
	}
	else if(val.equals("Delete Subject"))
	{
		st.executeUpdate("delete from examtimetable where id='"+id+"'");
		out.println("<h1>Subject Record Deleted Successfully</h1>");
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