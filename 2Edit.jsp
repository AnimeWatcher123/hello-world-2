<%@ page import="java.sql.*" %>
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
try
{	
	int roll=Integer.parseInt(request.getParameter("roll_no"));
	Class.forName("com.mysql.jdbc.Driver");
	String connectionURL = "jdbc:mysql://localhost:3307/first";
	Connection con = DriverManager.getConnection(connectionURL,"root","");
	if(!con.isClosed())
	{
		out.println("Successfully connected to " + "MySQL server using TCP/IP...");
		out.println(roll);
	}
	Statement st=con.createStatement();
	ResultSet resultSet = null;
	String sql ="select * from details where roll_no="+roll;
	resultSet = st.executeQuery(sql);
	resultSet.next();
	String s=resultSet.getString("name");
%>
    <form action="3EditProcess.jsp" method="get">
    
    Roll : <%= resultSet.getString("roll_no")%><input type="hidden" name="roll" value=<%= resultSet.getString("roll_no")%> ><br>
    Name : <input type="text" name="name" value='<%= s %>' size=30><br>
    age : <input type="number" name="age" value=<%=resultSet.getString("age") %>><br>
    <input type="submit" value="Edit">	
    </form>	
<%
con.close();
}
catch(Exception e)
{
 out.println(e);	
}
%>
</body>
</html>