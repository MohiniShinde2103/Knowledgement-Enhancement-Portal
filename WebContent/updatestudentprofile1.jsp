<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UPDATE STUDENT</title>
<style>
#butt
{
width: 200px;
padding: 10px;
border-radius: 5px;
outline: 0px;
background-color:#b53;
border: #01010c;
color: aliceblue;
font-size: 18px;
}
</style>
</head>
<body>
<form action="studentmain.jsp">
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String enroll=request.getParameter("enroll"); 
out.println("<input type=\"text\" name=\"name2\" value=\""+enroll+"\" hidden=\"hidden\">");
session.putValue("bid",enroll); 
String roll=request.getParameter("roll"); 
String name=request.getParameter("name"); 
String dob=request.getParameter("dob");  
String gender=request.getParameter("gender"); 
String email=request.getParameter("email");
String mbno=request.getParameter("mbno"); 
String add=request.getParameter("add");
String branch=request.getParameter("branch"); 
String year=request.getParameter("year");
String pass=request.getParameter("pass");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
if(mbno.length()==10)
{
	int i=st.executeUpdate("update student set enrollment='"+enroll+"',roll_no='"+roll+"',stud_name='"+name+"',stud_dob='"+dob+"',stud_gender='"+gender+"',stud_email='"+email+"',stud_mob='"+mbno+"',stud_add='"+add+"',stud_branch='"+branch+"',stud_year='"+year+"',stud_pass='"+pass+"' where enrollment='"+enroll+"'"); 
	out.println("<h1>Student Profile Updated Successfully<h1><br/>");
	out.println("Enrollment Number : "+enroll);
	out.println("<br/>Roll Number: "+roll);
	out.println("<br/>Student Name: "+name);
	out.println("<br/>Student DOB: "+dob);
	out.println("<br/>Student Gender: "+gender);
	out.println("<br/>Student Email: "+email);
	out.println("<br/>Student Mobile Number: "+mbno);
	out.println("<br/>Student Address: "+add);
	out.println("<br/>Student Branch: "+branch);
	out.println("<br/>Student Year: "+year);
}
else
{
	out.println("<h1 style=\"color:red;\">Invalid Mobile Number</h1>");
}
%>
<br/><br/>
<input type="submit" name="sub" value="Home" id="butt"/>
</form>
</body>
</html>