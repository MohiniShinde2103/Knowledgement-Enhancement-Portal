<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String user=request.getParameter("sub");
int role=0;
if(user.equals("Change Password Admin"))
{
	role=2;
}
else if(user.equals("Change Password Librarian"))
{
	role=1;
}
String old=request.getParameter("old"); 
String new1=request.getParameter("new1");
String repnew=request.getParameter("repnew");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from users where role='"+role+"'");
if(rs.next())
{
	if(rs.getString(3).equals(old))
	{
		
		if(new1.equals(repnew))
		{
			st.executeUpdate("update users set pass='"+new1+"' where role='"+role+"'");
			out.println("<h1>Password changed successfully</h1>");
			out.println("<h2><a href=\"login.html\">Login</a></h2>");
		}
		else
		{
			out.println("<h1 style=\"color:red;\">New password and confirm password did not match</h1>");
			out.println("<h2><a href=\"ChangePassword.jsp\">back</a></h2>");
		}
	}
	else
	{
		out.println("<h1 style=\"color:red;\">Old Password did not match</h1>");
		out.println("<h2><a href=\"ChangePassword.jsp\">back</a></h2>");
	}
}
else
{
	out.println("<h1 style=\"color:red;\">User does not exist</h1>");
	out.println("<h2><a href=\"ChangePassword.jsp\">back</a></h2>");
}
%>
</body>
</html>