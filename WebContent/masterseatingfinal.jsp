<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Master Seating Arrangement</title>
<style>
.abc
{
margin-left:7%;
margin-right:7%;
}
</style>
</head>
<body>
<div class="abc">
<center><h1>Master Seating Chart</h1>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<% 
String date=request.getParameter("date");
String time=request.getParameter("time");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
String ins="",previ="",previ1="",new1="",college="",code="",name="",course="",code1="",start="",last="",supname="",previsub="",new1sub="";
String blocks[]=new String[50];
String subcode1[]=new String[50];
int srno=0,count=1,total=0,incount=1,inincount=0,status=1;
ResultSet rs=st.executeQuery("select * from examdetails");
if(rs.next())
{
	ins=rs.getString(2);

	college=rs.getString(3)+" ("+rs.getString(2)+")";
	out.println("<h2 style=\"text-transform:uppercase\">Examination "+rs.getString(4)+"</h2></center><br/>");
	out.println("Name of Institute: <b>"+college+"</b>");
	out.println("<br/><br/><table style=\"horizontal-padding:15px\"><tr><td>Date: </td><td><b>"+date+"</b></td>");
	out.println("<td> </td><td> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</td><td>Time: </td><td><b>"+time+"</b></td></tr></table>");
	out.println("<br/><table border=\"1\" width=\"100%\"><tr><td><b>Sr. No.</b></td><td><b>Block Name</b></td><td><b>Supervisor Name</b></td><td><b>Course/<br/>Semester/<br/>Year/Scheme</b></td><td><b>Total</b></td><td><b>Subject Code</b></td><td><b>Subject Name</b></td><td><b>Examination Seat Number</b></td></tr>");
	ResultSet rs1=st.executeQuery("select * from examstudent where date='"+date+"' and time='"+time+"'");
	while(rs1.next())
	{
		count++;
		if(rs1.previous())
		{
			previ=rs1.getString(11);
		}
	    rs1.next();
	    new1=rs1.getString(11);
	    if(previ.equals(new1))
	    {
	    	continue;
	    }
	    else
	    {
	    	for(int i=0;i<blocks.length;i++)
	    	{
	    		if(new1.equals(blocks[i]))
	    		{
	    			status=0;
	    			break;
	    		}
	    	}
	    	if(status==0)
	    	{
	    		status=1;
	    		continue;
	    	}
	    	else
	    	{
	    	ResultSet rs2=st.executeQuery("select * from examstudent where block='"+new1+"'");
	    	incount=1;
	    	previsub="";
	    	while(rs2.next())
	    	{
	    		incount++;
	    		if(rs2.previous())
	    		{
	    			previsub=rs2.getString(4);
	    		}
	    	    rs2.next();
	    	    new1sub=rs2.getString(4);
	    	    if(previsub.equals(new1sub))
	    	    {
	    	    	continue;
	    	    }
	    	    else
	    	    {
	    	    		srno++;		
	    	    		ResultSet rssub=st.executeQuery("select * from examstudent where subcode='"+new1sub+"' and block='"+new1+"'");
	    	    		while(rssub.next())
	    	    		{
	    	    			inincount++;
	    	    			if(rssub.previous())
	    		    		{
	    		    			previsub=rssub.getString(4);
	    		    		}
	    		    	    rssub.next();
	    		    	    new1sub=rssub.getString(4);
	    		    	    supname=rssub.getString(13);
	    		    	    course=rssub.getString(8)+rssub.getString(9)+rssub.getString(10);
	    		    	    name=rssub.getString(5);
	    		    	    String ins1=rssub.getString(7);
	    		    	    if(previsub.equals(new1sub))
	    		    	    {
	    		    	    	continue;
	    		    	    }
	    		    	    else
	    		    	    {
	    		    	     blocks[srno]=new1;
	    		    	     subcode1[srno]=new1sub;
	    	    			 out.println("<tr><td>"+srno+"</td>");
	    	    			 out.println("<td>"+ins1+"</td>");
							 out.println("<td>"+course+"</td>");
							 out.println("<td>"+new1sub+"</td><td>"+name+"</td>");
							 ResultSet rs3=st.executeQuery("select * from examstudent where block='"+new1+"' and subcode='"+new1sub+"'");
							 if(rs3.next())
							 {
								rs3.first();
								start=rs3.getString(6);
								rs3.last();
								last=rs3.getString(6);
							 }
						 	 rs3.first();
							 rs3.previous();
							 while(rs3.next())
							 {
							 	total++;
							 }
							 out.println("<td>"+start+" to "+last+"</td>");
							 out.println("<td>"+new1+"</td>");
							 out.println("<td>"+total+"</td>");
							 total=0;
	    		    	    }
							rssub=st.executeQuery("select * from examstudent where subcode='"+new1sub+"' and block='"+new1+"'");
							rssub.absolute(inincount);
	
	    		    	}
	    	    }
	    	    rs2=st.executeQuery("select * from examstudent where block='"+new1+"'");
	    		rs2.absolute(incount);
	    	}}
	    }
	    rs1=st.executeQuery("select * from examstudent where date='"+date+"' and time='"+time+"'");
		rs1.absolute(count);
	}
	out.println("</tr></table>");
}
else
{
	out.println("<h2 style=\"color:red;\">Enter Exam Data</h2>");
}
%>
</div>
</body>
</html>