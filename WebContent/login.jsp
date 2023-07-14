<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="style.css">
<title>LOGIN</title>
</head>
<body>
<div class="main">
<form action="studentmain.jsp">
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
int role=Integer.parseInt(request.getParameter("role")); 
session.putValue("bid",role); 
String id=request.getParameter("fname"); 
String pass=request.getParameter("pass");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
if(role==1)
{
	ResultSet rslib=st.executeQuery("select * from users where role='"+role+"'");
	if(rslib.next())
	{
	if(id.equals(rslib.getString(2)) && pass.equals(rslib.getString(3)))
	{
		out.println("<h2 style=\"color:green;\">Login Successfull<h2><h2>Welcome Librarian<br/>");
		out.println("<a href=\"Library.html\">Click Here to continue</a>");
	}
	else
	{
		out.println("<h2 style=\"color:red;\">Invalid credentials please login again<br/>");
		out.println("<a href=\"login.html\">Login</a>");
	}
	}
}
if(role==2)
{
	ResultSet rsad=st.executeQuery("select * from users where role='"+role+"'");
	if(rsad.next())
	{
	if(id.equals(rsad.getString(2)) && pass.equals(rsad.getString(3)))
	{
		out.println("<h2 style=\"color:green;\">Login Successfull<h2><h2>Welcome Admin<br/>");
		out.println("<a href=\"adminmain.html\">Click Here to continue</a>");
	}
	else
	{
		out.println("<h2 style=\"color:red;\">Invalid credentials please login again<br/>");
		out.println("<a href=\"login.html\">Login</a>");
	}
	}
}
if(role==3)
{
	ResultSet rs=st.executeQuery("select * from student where enrollment="+id);
	if(rs.next())
	{
		String passdb=rs.getString(11);
		if(pass.equals(passdb))
		{
			out.println("<h2 style=\"color:green;\">Login Successfull<h2><h2>Welcome <input type=\"text\" readonly=\"readonly\" name=\"name1\" value=\""+rs.getString(3)+"\">");
			out.println("<input type=\"text\" name=\"name2\" hidden=\"hidden\" value=\""+rs.getString(1)+"\">");
			out.println("<br/><br/><input type=\"submit\" id=\"butt\" value=\"Click Here to continue\"</a>");
		}
		else
		{
			out.println("<h2 style=\"color:red;\">Invalid Password please login again<br/>");
			out.println("<a href=\"login.html\">Login</a>");
		}
	}
	else
	{
		out.println("<h2 style=\"color:red;\">Invalid Enrollment Number please login again<br/>");
		out.println("<a href=\"login.html\">Login</a>");
	}
}
%>
</form>
<br/><br/>
</div>
</body>
</html>