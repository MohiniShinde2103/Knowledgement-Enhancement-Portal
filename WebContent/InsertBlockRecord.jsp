<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Block</title>
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
#butt
{
width:350px;
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
	<a href="InsertExamRecord.jsp"><input type="button" value="Enter Details Of Examination" id="butt"></a>&nbsp;&nbsp;
	   <a href="InsertBlockRecord.jsp"><input type="button" value="Create and Edit Block Details" id="butt"></a>&nbsp;&nbsp;
	  <a href="InsertStaffRecords.jsp"><input type="button" value="Enter Details About Other Staff Members" id="butt"></a>
         
<div class="simple-form" >
<form action="insertblockfinal.jsp">
<fieldset id="registration">
<font color="white" font size=5px>
     <table class="table1">
	<tr><td><a href="#"><input type="button" name="insert" value="Insert New Block Records" id="butt1"/></a></td><td></td><td></td>
	<tr><td>Block Id*:&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
	<td><input type="text" name="blockid" id="button"></td></tr>
	<tr><td>Block Name*:&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
	<td><input type="text" name="blockname" id="button"></td></tr>
	<tr><td>Block Size(Total Student Seating Capacity)* : &nbsp; </td>
	<td><input type="text" name="blocksize"  id="button"></td></tr>
	<tr><td>Block Break1(Each Column Last Row Count)*:  </td>
	<td><input type="text" name="break1"  id="button"></td></tr>	
	<tr><td>Block Break2(Each Column Last Row Count)*:  </td>
	<td><input type="text" name="break2"  id="button"></td></tr>	
	<tr><td>Block Break3(Each Column Last Row Count)*:  </td>
	<td><input type="text" name="break3"  id="button"></td></tr>	
	<tr><td>Block Break4(Each Column Last Row Count)*:  </td>
	<td><input type="text" name="break4"  id="button"></td></tr>	
	<tr><td></a></td><td></td><td><a href="#"><input type="submit" name="insert" value="Insert New Block" id="butt1" /></td></tr>
	</table><br></font>
	</form>
<font color="white" fontsize=6px>
<form action="EditBlock.jsp">
<input type="submit" name="edit" value="Edit Block" id="butt1" />
<input type="submit" name="edit" value="Delete Block" id="butt1" />

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
out.println("<table border=2 width=\"100%\"><h3><tr><td>Block Id</td><td>Block Name</td><td>Block Size</td><td>Break 1</td><td>Break 2</td><td>Break 3</td><td>Break 4</td><td>Select</td></tr></h3>");
ResultSet rs=st.executeQuery("select * from examblocks");
while(rs.next())
{
	out.println("<tr>");
	out.println("<td>"+rs.getString(1)+"</td>");
	out.println("<td>"+rs.getString(2)+"</td>");
	out.println("<td>"+rs.getString(3)+"</td>");
	out.println("<td>"+rs.getString(4)+"</td>");
	out.println("<td>"+rs.getString(5)+"</td>");
	out.println("<td>"+rs.getString(6)+"</td>");
	out.println("<td>"+rs.getString(7)+"</td><td><input type=\"radio\" name=\"radio1\" value=\""+rs.getString(1)+"\"></td></tr>");
}
out.println("</table>");
%>
</font>
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