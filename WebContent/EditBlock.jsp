<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Block</title>
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
	<a href="InsertBlockRecord.jsp"><input type="button" value="Back" id="butt"></a>&nbsp;&nbsp;
	   
<div class="simple-form" >
<form action="updateblockfinal.jsp">
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
ResultSet rs=st.executeQuery("select * from examblocks where block_id='"+id+"'");
if(rs.next())
{
	if(val.equals("Edit Block"))
	{
     out.println("<table class=\"table1\">");
    out.println("<tr><td><a href=\"#\"><input type=\"button\" name=\"insert\" value=\"Edit Block Records\" id=\"butt1\"/></a></td><td></td><td></td>");
    out.println("<tr><td>Block Id*:&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>");
    out.println("<td><input type=\"text\" value=\""+rs.getString(1)+"\" readonly=\"readonly\" name=\"blockid\" id=\"button\"></td></tr>");
    out.println("<tr><td>Block Name*:&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>");
    out.println("<td><input type=\"text\" value=\""+rs.getString(2)+"\" name=\"blockname\" id=\"button\"></td></tr>");
    out.println("<tr><td>Block Size(Total Student Seating Capacity)* : &nbsp; </td>");
    out.println("<td><input type=\"text\" value=\""+rs.getString(3)+"\" name=\"blocksize\"  id=\"button\"></td></tr>");
    out.println("<tr><td>Block Break1(Each Column Last Row Count)*:  </td>");
    out.println("<td><input type=\"text\" name=\"break1\"  value=\""+rs.getInt(4)+"\" id=\"button\"></td></tr>");	
    out.println("<tr><td>Block Break2(Each Column Last Row Count)*:  </td>");
    out.println("<td><input type=\"text\" name=\"break2\"  value=\""+(rs.getInt(5)-rs.getInt(4))+"\" id=\"button\"></td></tr>");	
    out.println("<tr><td>Block Break3(Each Column Last Row Count)*:  </td>");
    out.println("<td><input type=\"text\" name=\"break3\"  value=\""+(rs.getInt(6)-rs.getInt(5))+"\" id=\"button\"></td></tr>");	
    out.println("<tr><td>Block Break4(Each Column Last Row Count)*:  </td>");
    out.println("<td><input type=\"text\" name=\"break4\" value=\""+(rs.getInt(7)-rs.getInt(6))+"\" id=\"button\"></td></tr>");	
    out.println("<tr><td></td><td></td><td><a href=\"#\"><input type=\"submit\" name=\"insert\" value=\"Edit Block\" id=\"butt1\" /></a></td>");
	}
	else if(val.equals("Delete Block"))
	{
		st.executeUpdate("delete from examblocks where block_id='"+id+"'");
		out.println("<h1>Block Deleted Successfully</h1>");
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