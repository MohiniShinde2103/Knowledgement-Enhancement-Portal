<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign Blocks</title>
<style>
#butt
{
width: 250px;
padding: 10px;
border-radius: 5px;
outline: 0px;
background-color:#8FBC8F;
border: #01010c;
color:#800000;
font-size: 18px;
font-weight: bold;
}
#footer
{
margin-top:15%;
margin-left:-1%;
margin-right:-1%;
margin-bottom:-2%;
background: #DB7093;
text-align: center;
color: #000080;
font-size: 18px;
font-weight: bold;
padding: 18px;
}
.heading {
	      background: #DB7093;
	      text-align: center;
	      text-decoration: none;
	      color: #000080;
	      font-size: 45px;
	      font-weight: bold;
	      style-height:100px;
	      height:65px;
	      width:100%;
}
#registration
{
width: 60%;
background-color:#051019;
opacity: 0.8;
padding:20px 0px;
align:center;
}
#button
{
padding:5px;
border-radius: 5px;
width: 320px;
outline: 0px;
color: black;
font-weight: bold;
background-color:#FFFFFF;

}
</style>
</head>
<body>
<div class="heading">
Examination Seating Arrangement</div>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String radio1=request.getParameter("radio1");
if(radio1==null)
{
	out.println("<h1>Please Check the radio button</h1>");
}
else
{
%>
<center>
<form action="assignblockfinal.jsp">
<fieldset id="registration">
<font color="white" font size=5px>
<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement();
ResultSet rstime=st.executeQuery("select subcode from examtimetable where id='"+radio1+"'");
ResultSet count2=null;
int remain=0,subcode1=0;
if(rstime.next())
{
	subcode1=Integer.parseInt(rstime.getString(1));
	ResultSet rsremcount=st.executeQuery("select remcount from examtimetable where subcode='"+subcode1+"'");
	if(rsremcount.next())
	{
		remain=Integer.parseInt(rsremcount.getString(1));
	}
	count2=st.executeQuery("select * from examstudent where subcode='"+subcode1+"' and block='none'");
}
int count1=0;
while(count2.next())
{
	count1++;
}
if(count1==remain)
{
ResultSet rsblock=st.executeQuery("select * from examblocks");
out.println("<center><h1>Block Assignment</h1><br/>Select Block: <select name=\"block\" id=\"button\">");
while(rsblock.next())
{
	out.println("<option>");
	out.println(rsblock.getString(2));
	out.println("</option>");
}
out.println("</select><br/>");
ResultSet rsstaff=st.executeQuery("select * from examstaff where status='free'");
out.println("<center>Select Staff: <select name=\"staff\" id=\"button\"><option>--------</option>");
while(rsstaff.next())
{
	out.println("<option>");
	out.println(rsstaff.getString(2));
	out.println("</option>");
}
out.println("</select><br/>");
ResultSet rs3=st.executeQuery("select subcode from examtimetable where id='"+radio1+"'");
if(rs3.next())
{
ResultSet rsstu=st.executeQuery("select * from examstudent where subcode='"+rs3.getString(1)+"' and block='none'");
out.println("<center>Select Start : <select name=\"start\" id=\"button\">");
while(rsstu.next())
{
	out.println("<option>");
	out.println(rsstu.getString(8)+rsstu.getString(9)+rsstu.getString(10)+" "+rsstu.getString(6));
	out.println("</option>");
}
out.println("</select><br/>");
rsstu.first();
rsstu.previous();
out.println("<center>Select End : <select name=\"end\" id=\"button\">");
while(rsstu.next())
{
	out.println("<option>");
	out.println(rsstu.getString(8)+rsstu.getString(9)+rsstu.getString(10)+" "+rsstu.getString(6));
	out.println("</option>");
}
out.println("</select><br/><br/>");
}
%>   
<input type="submit" id="butt">
   <br></font>
	</fieldset></form>
<%
ResultSet rs1=st.executeQuery("select subcode from examtimetable where id='"+radio1+"'");
String subcode;
if(rs1.next())
{
subcode=rs1.getString(1);
ResultSet rs2=st.executeQuery("select * from examstudent where subcode='"+subcode+"'");
out.println("<h1 align=\"center\">Student Details</h1><br/><table border=2 align=\"center\"><h4><tr><td>Class</td><td>Total Student</td><td>Remaining Student</td></tr></h4>");
int count=0,free=0;
if(rs2.next())
{
	out.println("<tr>");
	out.println("<td>"+rs2.getString(8)+" "+rs2.getString(9)+" "+rs2.getString(10)+"</td>");
	rs2.previous();
	while(rs2.next())
	{
		count++;
		if(rs2.getString(11).equals("none"))
		{
			free++;
		}
	}
	out.println("<td>"+count+"</td>");
	out.println("<td>"+free+"</td>");
	
}
}
out.println("<table border=2 align=\"center\"><h4><tr><td>ID.</td><td>Block Name</td><td>Free slots</td><td>Alloted slots</td><td>Total Size</td></tr></h4>");
ResultSet rs=st.executeQuery("select * from examblocks");
int total,rem,allot;
out.println("<h1 align=\"center\">Block Details</h1><br/>");
while(rs.next())
{
	out.println("<tr>");
	out.println("<td>"+rs.getString(1)+"</td>");
	out.println("<td>"+rs.getString(2)+"</td>");
	rem=Integer.parseInt(rs.getString(3))-Integer.parseInt(rs.getString(8));
	out.println("<td>"+rem+"</td>");
	out.println("<td>"+rs.getString(8)+"</td>");
	out.println("<td>"+rs.getString(3)+"</td></tr>");
}
out.println("</table>");
}
else
{
	out.println("<h1 style=\"color:red;\">Please Enter Valid number of students</h1>");
}
}
%>
<br/>
<h2><a href="AssignBlocks.jsp">Back</a></h2>
<!---------footer------->
<section id="footer">
<div class="container text-center">
<p><strong><h3>&copy 2020.</strong> Government Polytechnic, Karad.</h3></p>
</div>
</section>
</body>
</html>