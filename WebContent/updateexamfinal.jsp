<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Exam</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String id=request.getParameter("examid");
String examcenter=request.getParameter("examcenter"); 
String centername=request.getParameter("centername"); 
String sem=request.getParameter("sem");
String year=request.getParameter("year");
String finalyear=sem+" "+year;
String durstart=request.getParameter("examcenterdatefrom");
String durend=request.getParameter("examcenterdateto");
String duration=durstart+"-"+durend;
String session1=request.getParameter("session1");
String sesstart=request.getParameter("examcentersessdatefrom");
String sesend=request.getParameter("examcentersessdateto");
String sessiondur=sesstart+"-"+sesend;
String chiefofficer=request.getParameter("chiefofficer"); 
String officer=request.getParameter("officer"); 
String controller=request.getParameter("controller");
String supervisor=request.getParameter("sealsuper");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from examdetails where id='"+id+"'");
if(rs.next())
{
	int i=st.executeUpdate("update examdetails set id='"+id+"',examcenter='"+examcenter+"',centername='"+centername+"',examyear='"+finalyear+"',duration='"+duration+"',session1='"+session1+"',sessiondur='"+sessiondur+"',chiefofficer='"+chiefofficer+"',officer='"+officer+"',controller='"+controller+"',supervisor='"+supervisor+ "' where id='"+id+"'"); 
	out.println("<h1>Exam Record Updated Successfully<h1><br/>");
}
else
{
	out.println("<h1 style=\"color:red;\">Exam Record does not exist</h1>");
}
%>
<br/><br/>
<a href="InsertExamRecord.jsp">Back To Home</a>
</body>
</html>