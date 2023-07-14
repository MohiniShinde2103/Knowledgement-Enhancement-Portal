<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign Block</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String block=request.getParameter("block");
String staff=request.getParameter("staff"); 
String start=request.getParameter("start"); 
String start1=start.split(" ")[1];
int startfinal=Integer.parseInt(start1);
String end=request.getParameter("end"); 
String end1=end.split(" ")[1];
int endfinal=Integer.parseInt(end1);
int diff=endfinal-startfinal+1;
String block1;
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from examblocks where block_name='"+block+"'");
try
{
if(rs.next())
{
	int rem=Integer.parseInt(rs.getString(3))-Integer.parseInt(rs.getString(8));
	int previous=Integer.parseInt(rs.getString(8));
	int finaldiff=previous+diff;
	if(rem>=diff)
	{
		st.executeUpdate("update examblocks set allocated='"+finaldiff+"' where block_name='"+block+"'");
		ResultSet rsstaff=st.executeQuery("select * from examblocks where block_name='"+block+"'");
		if(rsstaff.next())
		{
			block1=rsstaff.getString(9);
			if(block1.equals("none"))
			{
				st.executeUpdate("update examstaff set status='"+block+"' where staff_name='"+staff+"'");
				st.executeUpdate("update examblocks set staff='"+staff+"' where block_name='"+block+"'");
				int start3=startfinal;
				while(start3>=startfinal && start3<=endfinal)
				{
					int i=st.executeUpdate("update examstudent set block='"+block+"',staffname='"+staff+"' where seatno='"+start3+"'"); 
					start3++;
				}
			}
			else
			{
				int start3=startfinal;
				while(start3>=startfinal && start3<=endfinal)
				{
					int i=st.executeUpdate("update examstudent set block='"+block+"',staffname='"+block1+"' where seatno='"+start3+"'"); 
					start3++;
				}
				out.println("<h1>staff has been previously assigned to block</h1>");
			}
		}
		
		ResultSet rs1=st.executeQuery("select subcode from examstudent where seatno='"+startfinal+"'");
		if(rs1.next())
		{
			String subcode=rs1.getString(1);
			ResultSet rs2=st.executeQuery("select * from examtimetable where subcode='"+subcode+"'");
			int remcount,finalcount;
			if(rs2.next())
			{
				remcount=Integer.parseInt(rs2.getString(7));
				finalcount=remcount-diff;
				st.executeUpdate("update examtimetable set remcount='"+finalcount+"' where subcode='"+subcode+"'");
			}
		}
		out.println("<h1>Candidates assigned successfully</h1>");
	}
	else
	{
		out.println("<h1 style=\"color:red;\">Block Size less than selected candidates</h1>");
	}
}
}
catch(Exception e)
{
	out.println("<h1>"+e+"</h1>");
}
%>
<br/><br/>
<a href="AssignBlocks.jsp">Back</a>
</body>
</html>