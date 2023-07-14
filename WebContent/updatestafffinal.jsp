<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Staff</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String id=request.getParameter("staffid");
String name=request.getParameter("staffname"); 
String dept=request.getParameter("staffdept"); 
String design=request.getParameter("staffdesign");  
String role=request.getParameter("staffrole"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from examstaff where staff_id='"+id+"'");
if(rs.next())
{
	String status=rs.getString("status");
int i=st.executeUpdate("update examstaff set staff_id='"+id+"',staff_name='"+name+"',staff_dept='"+dept+"',staff_design='"+design+"',staff_role='"+role+"',status='"+status+"' where staff_name='"+name+"'"); 
	out.println("<h1>Staff Updated Successfully<h1><br/>");
}
else
{
	out.println("<h1 style=\"color:red;\">Staff does not exist</h1>");
}
%>
<br/><br/>
<a href="InsertStaffRecords.jsp">Back To Home</a>
</body>
</html>