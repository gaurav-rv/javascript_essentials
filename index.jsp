<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>Bank Application</title>
    
	
  </head>
  <body>
<% 
	String funcID = request.getParameter("funcID");
	String name = request.getParameter("name");
	String street = request.getParameter("street");
	String city = request.getParameter("city");
%>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	}
	catch(Exception e)
	{
		out.println("can't load mysql driver");
		out.println(e.toString());
	}
%>

<b>1. List All the customer:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="1">
    		<input type="submit" value="GO!"/>
</form>

<b>2. Add a new customer:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="2">
		Customer name: <input name="name" type="text">
		Street: <input name="street" type="text">
		City: <input name="city" type="text">
    		<input type="submit" value="Add"/>
</form>

<% if(funcID!=null) {				
	try {
		String url="jdbc:mysql://127.0.0.1:3306/bank";
		String id="bank";
		String pwd="eecs118";
		Connection con= DriverManager.getConnection(url,id,pwd); 
	
		int func=Integer.valueOf(funcID);
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
		switch(func) {
			case 1:
				stmt = con.createStatement(); // Statements allow to issue SQL queries to the database
				String sql="SELECT * FROM customer";
				rs=stmt.executeQuery(sql); // Result set get the result of the SQL query
				out.println("<table border=\"1\">");
				out.println("<caption> Customer List </caption>");
				out.println("<tr>");
				out.println("<th>ID</th>");
				out.println("<th>Name</th>");
				out.println("<th>Street</th>");
				out.println("<th>City</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>"+rs.getString("customer_id")+"</td>");
					out.println("<td>"+rs.getString("customer_name")+"</td>");
					out.println("<td>"+rs.getString("customer_street")+"</td>");
					out.println("<td>"+rs.getString("customer_city")+"</td>");
					out.println("</tr>");
				}
				rs.close();
				stmt.close();
				out.println("</table>");
				break;
			case 2:
				// PreparedStatements can use variables and are more efficient
				pstmt = con.prepareStatement("insert into customer values (default,?,?,?)",Statement.RETURN_GENERATED_KEYS);
				// Use ? to represent the variables
				pstmt.clearParameters();
				// Parameters start with 1
				pstmt.setString(1, name);
				pstmt.setString(2, street);
				pstmt.setString(3, city);
				pstmt.executeUpdate();
				rs=pstmt.getGeneratedKeys();
				while (rs.next()) {
					out.println("Successfully added. Customer_ID:"+rs.getInt(1));
				}
				rs.close();
				pstmt.close();
				break;
		}
		con.close();
	}
	catch(Exception e)
	{
			out.println(e.toString());
	} 	
	
} %>


  
  </body>
</html>
