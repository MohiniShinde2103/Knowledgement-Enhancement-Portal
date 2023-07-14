<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Staff</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String name=request.getParameter("staffname"); 
String dept=request.getParameter("staffdept"); 
String design=request.getParameter("staffdesign");
String role=request.getParameter("staffrole");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from examstaff where staff_name='"+name+"'");
if(rs.next())
{
	out.println("<h1 style=\"color:red;\">Staff Already Exists</h1>");
}
else
{
	ResultSet rs1=st.executeQuery("select * from examstaff");
	rs1.last();
	int j=Integer.parseInt(rs1.getString(1));
	j=j+1;
	int i=st.executeUpdate("insert into examstaff values('"+j+"','"+name+"','"+dept+"','"+design+"','"+role+"','free')"); 
	out.println("<h1>Staff Added Successfully</h1><br/>");
}
%>
<h1><a href="InsertStaffRecords.jsp">Back</a></h1>
</body>
</html>