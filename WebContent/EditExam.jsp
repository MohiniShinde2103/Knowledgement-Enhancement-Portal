<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Exam</title>
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
	<a href="InsertExamRecord.jsp"><input type="button" value="Back" id="butt"></a>&nbsp;&nbsp;
<div class="simple-form" >
<form action="updateexamfinal.jsp">
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
ResultSet rs=st.executeQuery("select * from examdetails where id='"+id+"'");
if(rs.next())
{
	if(val.equals("Edit Exam"))
	{
     out.println("<table class=\"table1\">");
	out.println("<tr><td><a href=\"#\"><input type=\"button\" name=\"insert\" value=\"Edit Exam Records\" id=\"butt1\"/></a></td><td></td><td></td>");
	out.println("<tr><td>Examination Id*:&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&emsp;&emsp;&emsp;</td>");
	out.println("<td><input type=\"text\" name=\"examid\" readonly=\"readonly\" value=\""+rs.getString(1)+"\"id=\"button\"></td></tr>");
	out.println("<tr><td>Examination Center*:&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&emsp;&emsp;&emsp;</td>");
	out.println("<td><input type=\"text\" name=\"examcenter\" readonly=\"readonly\" value=\""+rs.getString(2)+"\" readonly=\"readonly\" id=\"button\"></td></tr>");
	out.println("<tr><td>Examination Center Name* : &emsp;&emsp;&emsp;&emsp;&emsp; </td>");
	out.println("<td><input type=\"text\" name=\"centername\" readonly=\"readonly\" value=\""+rs.getString(3)+"\" readonly=\"readonly\" id=\"button\"></td></tr>");
	out.println("<tr><td>Examination(Summer/Winter)*:&emsp;&emsp;&emsp;&emsp;  </td>");	
	out.println("<td><select id=\"button\" name=\"sem\"><option>Summer</option><option>Winter</option></select></td>");
	out.println("<td><select id=\"button\" name=\"year\"><option>2019</option><option>2020</option><option>2021</option></select></td></tr>");
	out.println("<tr><td>  </td>");
	out.println("<td>Start From Date</td>");
	out.println("<td>To End Date</td></tr>");
	out.println("<tr><td>Duration for Examination*: &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp; </td>");	
	out.println("<td><input type=\"date\" name=\"examcenterdatefrom\"  value=\""+rs.getString(5).split(" ")[0]+"\" id=\"button\"></td>");
	out.println("<td><input type=\"date\" name=\"examcenterdateto\"  value=\""+rs.getString(5).split(" ")[1]+"\" id=\"button\"></td></tr>");
	out.println("<tr><td>Sessions of Examination*: &emsp;&emsp;</td>");
	out.println("<td><select name=\"session1\" id=\"button\"><option>Session1</option><option>Session2</option></select></td></tr>");
	out.println("<tr><td>  </td>");
	out.println("<td>Session Start From Date</td>");
	out.println("<td>Session To End Date</td></tr>"); 
	out.println("<tr><td>Session Duration for Exam*:&emsp; </td>");
	out.println("<td><input type=\"date\" name=\"examcentersessdatefrom\"  value=\""+rs.getString(7).split(" ")[0]+"\" id=\"button\"></td>");
	out.println("<td><input type=\"date\" name=\"examcentersessdateto\"  value=\""+rs.getString(7).split(" ")[0]+"\" id=\"button\"></td></tr>");
	out.println("<tr><td>Examination Chief Officer In-Charge*: &emsp;&emsp;&emsp; </td>");
	out.println("<td><input type=\"text\" name=\"chiefofficer\" value=\""+rs.getString(8)+"\" id=\"button\"></td></tr>");
	out.println("<tr><td>Examination Officer In-Charge*: &emsp;&emsp;&emsp; </td>");
	out.println("<td><input type=\"text\" name=\"officer\"  value=\""+rs.getString(9)+"\" id=\"button\"></td></tr>");
	out.println("<tr><td>Examination Controller*: &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; </td>");
	out.println("<td><input type=\"text\" name=\"controller\"  value=\""+rs.getString(10)+"\" id=\"button\"></td></tr>");
	out.println("<tr><td>Sealing Supervisor*:  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>");
	out.println("<td><input type=\"text\" name=\"sealsuper\"  value=\""+rs.getString(11)+"\" id=\"button\"></td></tr>");
	out.println("<tr><td></td><td></td><td><a href=\"#\"><input type=\"submit\" name=\"insert\" value=\"Edit Staff\" id=\"butt1\" /></a></td>");
	}
	else if(val.equals("Delete Exam"))
	{
		st.executeUpdate("delete from examdetails where id='"+id+"'");
		out.println("<h1>Exam Record Deleted Successfully</h1>");
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