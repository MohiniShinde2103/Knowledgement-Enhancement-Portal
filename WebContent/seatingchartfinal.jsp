<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seating Chart</title>
<style>
.abc
{
margin-left:10%;
margin-right:10%;
}
.abc1
{
margin-left:-3%;
}
.abc1 td
{
width:20%;
}
</style>
</head>
<body>

	<div class="abc">
<%@ page import="java.io.*"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String date=request.getParameter("date");
String time=request.getParameter("time");
String block=request.getParameter("block");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge","root","root"); 
Statement st= con.createStatement();
String sess="",session1="",ins="",previ="",previ1="",new1="",code="",cent="",name="",course="",code1="",start="",last="",supname="",previsub="",new1sub="",exam1="";
int srno=0,count=1,total=0,incount=1,inincount=0,status=1,b1=0,b2=0,b3=0,b4=0,b4fi2=0,b2fi2=0;
String blocks[]=new String[50];
String subcode1[]=new String[50];
int count1[]=new int[100];
ResultSet rsbr=st.executeQuery("select * from examblocks where block_name='"+block+"'");
if(rsbr.next())
{
	b1=rsbr.getInt(4);
	b2=rsbr.getInt(5);
	b3=rsbr.getInt(6);
	b4=rsbr.getInt(7);
	b2-=b1;
	b3=b3-b2-b1;
	b4=b4-b3-b2-b1;
}
ResultSet rs5=st.executeQuery("select * from examdetails");
if(rs5.next())
{
	exam1=rs5.getString(4);
	sess=exam1.split(" ")[0];
	if(sess.equals("Summer"))
	{
		session1="Afternoon";
	}
	else
	{
		session1="Morning";
	}
	out.println("<center><h2>Maharashtra State Board of Technical Education, Mumbai<br/><h2 style=\"text-transform:uppercase;\">EXAMINATION "+rs5.getString(4)+"</h2><h2>Seating Chart</h2></center>");
	ins=rs5.getString(2);
	out.println("<h3 style=\"text-transform:uppercase;\"><hr size=\"3px\" color=\"black\"><table width=\"100%\" style=\"fontsize:15px;line-spacing:10px;margin-left:2%;\"><tr><td>Date: </td><td>"+date+"</td><td>Time: </td><td>"+time+"</td></tr>");
	out.println("<tr><td>Block NO: </td> <td>"+block+"</td><td>Place : </td><td><b>"+block+"</b></td></tr><tr><td>Session: </td><td>"+session1+"</td></tr></table></h3>");
	out.println("<br/><table border=\"1\" width=\"100%\"><tr><td><b><center>Course</b></td><td><b><center>Institute</b></td><td><b><center>Subject <br/>Code</b></td><td><b><center>Subject Name</b></td><td><b><center>Number of Students</b></td></tr>");
	ResultSet rs1=st.executeQuery("select * from examstudent where date='"+date+"' and time='"+time+"' and block='"+block+"'");
	while(rs1.next())
	{
	    	    srno++;
	    	    count++;
    	    	if(rs1.previous())
    		    {
    		    	previsub=rs1.getString(4);
    		    }
    		    rs1.next();
    		    new1sub=rs1.getString(4);
    		    course=rs1.getString(8)+rs1.getString(9)+rs1.getString(10);
    		    name=rs1.getString(5);
    		    cent=rs1.getString(7);
    		    if(previsub.equals(new1sub))
    		    {
    		    	 continue;
    		    }
    		    else
    		    {
							 out.println("<td><center>"+course+"</td>");
							 ResultSet rs3=st.executeQuery("select * from examstudent where block='"+block+"' and subcode='"+new1sub+"'");
							 while(rs3.next())
							 {
							 	total++;
							 }
							 out.println("<td><center>"+cent+"</td>");
							 out.println("<td><center>"+new1sub+"</td><td><center>"+name+"</td>");
							 out.println("<td><center>"+total+"</td></center></tr>");
							 total=0;
	
	    		    }
	    rs1=st.executeQuery("select * from examstudent where date='"+date+"' and time='"+time+"' and block='"+block+"'");
		rs1.absolute(count);
	}
	out.println("</tr></table><br/><br/>");
	ResultSet rs4=st.executeQuery("select * from examstudent where date='"+date+"' and time='"+time+"' and block='"+block+"'");
	rs4.last();
	rs4.next();
	int b1fi=0,b2fi=0,b3fi=0,b4fi=0,count2=count,counter=0;
	if(count>b1)
	{
		b1fi=b1;
		count=count-b1fi;
	}
	else
	{
		b1fi=count;
		count=count-b1fi;
	}
	if(count>=b2)
	{
		b2fi=b2;
		count=count-b2fi;
	}
	else
	{
		b2fi=count;
		count=count-b2fi;
	}
	if(count>=b3)
	{
		b3fi=b3;
		count=count-b3fi;
	}
	else
	{
		b3fi=count;
		count=count-b3fi;
	}
	if(count>=b4)
	{
		b4fi=b4;
		count=count-b4fi;
	}
	else
	{
		b4fi=count;
		count=count-b4fi;
	}
	count2++;
	out.println("<h3><table class=\"abc1\">");
	if(b4fi>0)
	{
		out.println("<td><table border=\"1\" width=\"80%\"><tr><td>Sr. <br/>No.</td><td>Seat <br/>Number</td><td>Course</td></tr>");
		while(rs4.previous())
		{
			counter++;count2--;
			if(counter==b4fi)
			{
				break;
			}
		}
		int count3=count2;
		int ct=0;
		rs4.previous();
		while(rs4.next())
		{
			out.println("<tr><td>"+count3+"</td>");
			out.println("<td>"+rs4.getString(6)+"</td>");
			out.println("<td>"+rs4.getString(8)+rs4.getString(9)+rs4.getString(10)+"</td></tr>");
			count3++;
			ct++;
		}
		while(ct>=0)
		{
			rs4.previous();
			ct--;
		}
		rs4.next();
		out.println("</table></td>");
	}
	if(b3fi>0)
	{
		out.println("<td><table border=\"1\" width=\"80%\"><tr><td>Sr. <br/>No.</td><td>Seat <br/>Number</td><td>Course</td></tr>");
		while(rs4.previous())
		{
			counter++;
			count2--;
			out.println("<tr><td>"+count2+"</td>");
			out.println("<td>"+rs4.getString(6)+"</td>");
			out.println("<td>"+rs4.getString(8)+rs4.getString(9)+rs4.getString(10)+"</td></tr>");
			if(counter==b3fi+b4fi)
			{
				break;
			}
		}
		out.println("</table></td>");
	}
	int counter1=0;
	if(b2fi>0)
	{
		out.println("<td><table border=\"1\" width=\"80%\"><tr><td>Sr. <br/>No.</td><td>Seat <br/>Number</td><td>Course</td></tr>");
		while(rs4.previous())
		{
			counter++;
			counter1++;
			count2--;
			if(counter==b3fi+b4fi+b2fi)
			{
				break;
			}
		}
		rs4.previous();
		int count3=count2;
		int ct=0;
		counter=counter-counter1;
		int count4=count2+counter1;
		while(rs4.next())
		{
			counter++;
			out.println("<tr><td>"+count3+"</td>");
			out.println("<td>"+rs4.getString(6)+"</td>");
			out.println("<td>"+rs4.getString(8)+rs4.getString(9)+rs4.getString(10)+"</td></tr>");
			if(counter==b3fi+b4fi+b2fi)
			{
				break;
			}
			ct++;
			count3++;
		}
		while(ct>=0)
		{
			rs4.previous();
			ct--;
		}
		rs4.next();
		out.println("</table></td>");
	}
	if(b1fi>0)
	{
		out.println("<td><table border=\"1\" width=\"80%\"><tr><td>Sr. <br/>No.</td><td>Seat <br/>Number</td><td>Course</td></tr>");
		while(rs4.previous())
		{
			counter++;
			count2--;
			out.println("<tr><td>"+count2+"</td>");
			out.println("<td>"+rs4.getString(6)+"</td>");
			out.println("<td>"+rs4.getString(8)+rs4.getString(9)+rs4.getString(10)+"</td></tr>");
			if(counter==b3fi+b4fi+b2fi+b1fi)
			{
				break;
			}
		}
		out.println("</table></td></table>");
	}
	out.println("<h3 style=\"float:right;\">Signature of Officer In-Charge");
}
else
{
	out.println("<h1 style=\"color:red;\">Please Enter Exam Data</h1>");
}
%>
</center>
</body>
</html>