<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Student</title>
</head>
<link rel="stylesheet" href="style.css">
<body>
<style>
#butt1
{
width: 250px;
padding: 10px;
border-radius: 5px;
outline: 0px;
background-color:white;
border: #01010c;
color: red;
font-size: 20px;
}
.simple-form{
margin:100px 100px
}


</style>
<div class="heading">
Examination Seating Arrangement</div>
  <div class="nav">
<ul>     <li>  <a  href="home.jsp">Home |</a> </li>
 </ul>
    </div>
</br>
	<a href="MainSeatingChart.jsp"><input type="button" value="Back" id="butt"></a>&nbsp;&nbsp;
<div class="simple-form" >
<form action="searchstudentfinal.jsp" target="_blank">
<fieldset id="registration">
<font color="white" font size=5px>
     <table class="table1">
	<tr><td><a href="#"><input type="button" name="insert" value="Delete Block Records" id="butt1"/></a></td><td></td><td></td>
	<tr><td>Search By*:&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
	<td><select name="search1"><option>Id</option><option>seat no</option><option>enrollment no</option></select></td></tr>
	<tr><td>Enter Value*:&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
	<td><input type="text" name="value1" id="button"></td></tr>	
	<tr><td></td><td></td><td><a href="#"><input type="submit" name="insert" value="Search" id="butt1" /></a></td>
</table><br></font>
</fieldset>

<br/><br/><br/>
</form>

</div>
<!---------footer------->
<section id="footer">
<div class="container text-center">
<p><strong><h3>&copy 2020.</strong> Government Polytechnic, Karad.</h3></p>
</div>
</section>

</body>
</html>