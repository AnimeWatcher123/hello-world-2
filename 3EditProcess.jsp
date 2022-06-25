<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int roll=Integer.parseInt(request.getParameter("roll"));
String name=request.getParameter("name");
int age=Integer.parseInt(request.getParameter("age"));
try
{	
	Class.forName("com.mysql.jdbc.Driver");
	String connectionURL = "jdbc:mysql://localhost:3307/first";
	Connection con = DriverManager.getConnection(connectionURL,"root","");
	if(!con.isClosed())
	{
		out.println("Successfully connected to " + "MySQL server using TCP/IP...<br>");
	}
	Statement st=con.createStatement();
	int i=st.executeUpdate("Update details set roll_no="+roll+",name='"+name+"',age="+age+" where roll_no="+roll);
	if(i > 0)
	{
	out.print("Record Updated Successfully<br>");
	}
	else
	{
	out.print("There is a problem in updating Record.<br>");
	}
    con.close();
}
catch(Exception e)
{
 out.println(e);	
}
%>
<a href="1displayedit.jsp">BACK</a>
s
</body>
</html>