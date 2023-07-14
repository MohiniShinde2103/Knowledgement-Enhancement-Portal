<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Attendance Report</title>
<style>
.abc
{
margin-left:7%;
margin-right:7%;
}
.pqr table td
{
align:center;
}
</style>
</head>
<body>
<div class="abc">
<center><h1>Maharashtra State Board of Technical Education, Mumbai<br/>PRESENT / ABSENT REPORT</h1>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<% 
String date=request.getParameter("date");
String time=request.getParameter("time");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement(); 
String ins="",previ="",previ1="",new1="",code="",name="",course="",code1="",start="",last="",supname="",previsub="",new1sub="";
String blocks[]=new String[50];
String subcode1[]=new String[50];
int srno=0,count=1,total=0,incount=1,inincount=0,status=1;
ResultSet rs=st.executeQuery("select * from examdetails");
if(rs.next())
{
	ins=rs.getString(2);
	out.println("<h2 style=\"text-transform:uppercase\">Examination "+rs.getString(4)+"</h2></center><br/>");
	out.println("Name of Institute: <b>Government Polytechnic, Karad (0010)</b>");
	out.println("<br/><br/><table style=\"horizontal-padding:15px\"><tr><td>Date: </td><td><b>"+date+"</b></td>");
	out.println("<td> </td><td> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</td><td>Time: </td><td><b>"+time+"</b></td></tr></table>");
	out.println("<br/><table border=\"1\" width=\"100%\"><tr><td><b><center>Sr. No.</center></b></td><td><b><center>Block Venue</center></b></td><td><b><center>Name of Supervisor<br/>with dated Signature</center></b></td><td><b><center>Center</center></b></td><td><b><center>Course/ Paper Code</center></b></td><td><b><center>P - Present<br/>A - Absent<br/>-----------------<br/>T - Total</center></b></td><td><b><center>Absent Candidate Seat Numbers</center></b></td></tr>");
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
	    		    	    ins=rssub.getString(7);
	    		    	    if(previsub.equals(new1sub))
	    		    	    {
	    		    	    	continue;
	    		    	    }
	    		    	    else
	    		    	    {
	    		    	     blocks[srno]=new1;
	    		    	     subcode1[srno]=new1sub;
	    	    			 out.println("<tr><td><center>"+srno+"</center></td>");
							 out.println("<td><center>"+new1+"</center></td>");
							 out.println("<td><center>"+supname+"</center></td>");
							 out.println("<td><center>"+ins+"</center></td>");
							 out.println("<td><center>"+course+"<br/>"+new1sub+"<br/>"+name+"</center></td>");
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
							 out.println("<td><center>P - &nbsp &nbsp  &nbsp <br/>A- &nbsp &nbsp   &nbsp <br/>-----------------<br/>T- "+total+"</td></center><td></td>");
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
	out.println("</tr></table></div>");
}
else
{
	out.println("<h2 style=\"color:red;\">Enter Exam Data</h2>");
}
%>
</center>
</div>
</body>
</html>