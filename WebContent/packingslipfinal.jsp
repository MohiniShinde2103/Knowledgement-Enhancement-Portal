<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Packing Slip</title>
<style>
.img1
{
margin-top:2%;
margin-left:65%;
}
.table1 td
{
padding:3px;
horizontal-padding:3px;
}
.abc
{
font-size:25px;
border:thin solid #000;
margin-left:10%;
margin-right:10%;
padding:2%;
}
.abc1
{
margin-left:10%;
margin-top:3%;
}
.abc2
{
margin-left:57%;
margin-top:-5%;
}
</style>
</head>
<body>
<div class="abc">
<center><h1 style="margin-top:-2%;text-transform:uppercase;">Packing - Slip</h1></center>
<%@ page import="java.io.*"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String date=request.getParameter("date");
String time=request.getParameter("time");
String class1=request.getParameter("class1");
String coucode=class1.split(" ")[0];
String yearcode=class1.split(" ")[1];
String mastercode=class1.split(" ")[2];
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement();
String subname,exam1,sess,ins;
String subname1,subabb,session1="";
int count=0;
ResultSet rs1=st.executeQuery("select * from examdetails where id='1'");
if(rs1.next())
{
exam1=rs1.getString(4);
ins=rs1.getString(2);
sess=exam1.split(" ")[0];
if(sess.equals("Summer"))
{
	session1="Afternoon";
}
else
{
	session1="Morning";
}
ResultSet rs=st.executeQuery("select * from examstudent where date='"+date+"' and time='"+time+"' and coucode='"+coucode+"' and yearcode='"+yearcode+"' and mastercode='"+mastercode+"'");
if(rs.next())
{
	subname=rs.getString(5);
	int sublen=subname.length();
	int splitlength=sublen-5;
	subname1=subname.substring(0, sublen-5);
	subabb=subname.substring(sublen-4, sublen-1);
	out.println("<br/>Institute(Examination Center) Center Code : &nbsp &nbsp<b>"+ins+"</b><br/><br/>");
	out.println("Date :<b>"+date+"</b> &nbsp &nbsp Session : <b> &nbsp &nbsp"+session1+"</b><br/><br/>");
	out.println("Course / Sem / Year / Master : <b> &nbsp &nbsp"+class1+"</b><br/><br/>");
	out.println("Subject Name : <b> &nbsp &nbsp "+subname1+"</b><br/><br/>");
	out.println("Subject Code : <b> &nbsp &nbsp"+rs.getString(4)+"</b> &nbsp &nbsp Mark Sheet Number/s :<br/><br/>");
	ResultSet rs3=st.executeQuery("select * from examstudent where date='"+date+"' and time='"+time+"' and coucode='"+coucode+"' and yearcode='"+yearcode+"' and mastercode='"+mastercode+"' and attendance='present' or attendance='copycase'");
	while(rs3.next())
	{
		count++;
	}
	out.println("Number of Answer books in this packet : <b> &nbsp &nbsp "+count+"</b><br/><br/>");
	out.println("Date and Time of Sealing : &nbsp &nbsp Date : <b> &nbsp &nbsp "+date+"</b> &nbsp &nbsp Time : <b>"+"</b><br/><br/>");
	out.println("<b><div class=\"abc1\">Signature of <br/>Sealing Officer</div> <div class=\"abc2\">Signature of <br/>Officer-In-Incharge </div></b>");
}
else
{
	out.println("<h1 style=\"color:red;\">Please Select Valid data</h1>");
}
}
else
{
	out.println("<h1 style=\"color:red;\">Please Enter Exam Data</h1>");
}

%>
</div>
</center>
</body>
</html>