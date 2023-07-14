<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Exam</title>
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
<form action="insertfinalexam.jsp">
<fieldset id="registration">
<font color="white" font size=5px>
     <table class="table1">
	<tr><td><a href="#"><input type="button" name="insert" value="Insert New Exam Records" id="butt1"/></a></td><td></td><td></td><br>
	<tr><td>Examination Center*:&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&emsp;&emsp;&emsp;</td>
	<td><input type="text" name="examcenter" value="0010" readonly="readonly" id="button"></td></tr>
	<tr><td>Examination Center Name* : &emsp;&emsp;&emsp;&emsp;&emsp; </td>
	<td><input type="text" name="centername" value="Government Polytechnic, Karad" readonly="readonly" id="button"></td></tr>
	<tr><td>Examination(Summer/Winter)*:&emsp;&emsp;&emsp;&emsp;  </td>	
	<td><select id="button" name="sem"><option>Summer</option><option>Winter</option></select></td>
	<td><select id="button" name="year"><option>2019</option><option>2020</option><option>2021</option></select></td></tr>
	<tr><td>  </td>
	<td>Start From Date</td>
	<td>To End Date</td></tr>
	<tr><td>Duration for Examination*: &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp; </td>	
	<td><input type="date" name="examcenterdatefrom"  id="button"></td>
	<td><input type="date" name="examcenterdateto"  id="button"></td></tr>
	<tr><td>Sessions of Examination*: &emsp;&emsp;</td>
	<td><select name="session1" id="button"><option>Session1</option><option>Session2</option></select></td></tr>
	<tr><td>  </td>
	<td>Session Start From Date</td>
	<td>Session To End Date</td></tr> 
	<tr><td>Session Duration for Exam*:&emsp; </td>
	<td><input type="date" name="examcentersessdatefrom"  id="button"></td>
	<td><input type="date" name="examcentersessdateto"  id="button"></td></tr>
	<tr><td>Examination Chief Officer In-Charge*: &emsp;&emsp;&emsp; </td>
	<td><input type="text" name="chiefofficer"  id="button"></td></tr>
	<tr><td>Examination Officer In-Charge*: &emsp;&emsp;&emsp; </td>
	<td><input type="text" name="officer"  id="button"></td></tr>
	<tr><td>Examination Controller*: &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; </td>
	<td><input type="text" name="controller"  id="button"></td></tr>
	<tr><td>Sealing Supervisor*:  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
	<td><input type="text" name="sealsuper"  id="button"></td></tr>
	<tr><td></td><td></td><td><a href="#"><input type="submit" name="insert" value="Insert New Exam Records" id="butt1"/></a></td>
	<tr><td></td><td></table><br>
</form>
<font color="white" fontsize=6px>
<form action="EditExam.jsp">
<input type="submit" name="edit" value="Edit Exam" id="butt1" /> 
<input type="submit" name="edit" value="Delete Exam" id="butt1" /></a>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
out.println("<table border=2 width=\"100%\"><h3><tr><td>Id</td><td>Examination Center</td><td>Examination(Summer/Winter)</td><td>Duration From To</td><td>Session</td><td>Chief Officer Incharge</td><td>Officer Incharge</td><td>Controller</td><td>Sealing Supervisor</td><td>Select</td></tr></h3>");
ResultSet rs=st.executeQuery("select * from examdetails");
while(rs.next())
{
	String id=rs.getString(1);
	out.println("<tr>");
	out.println("<td>"+id+"</td>");
	out.println("<td>"+rs.getString(2)+"</td>");
	out.println("<td>"+rs.getString(4)+"</td>");
	out.println("<td>"+rs.getString(5)+"</td>");
	out.println("<td>"+rs.getString(6)+"</td>");
	out.println("<td>"+rs.getString(8)+"</td>");
	out.println("<td>"+rs.getString(9)+"</td>");
	out.println("<td>"+rs.getString(10)+"</td>");
	out.println("<td>"+rs.getString(11)+"</td>");
	out.println("<td><input type=\"radio\" name=\"radio1\" value=\""+id+"\"></td></tr>");
}
out.println("</table>");
%>
</form>
</font>
</fieldset>
</div>
<!---------footer------->
<section id="footer">
<div class="container text-center">
<p><strong><h3>&copy 2020.</strong> Government Polytechnic, Karad.</h3></p>
</div>
</section>
</body>
</html>