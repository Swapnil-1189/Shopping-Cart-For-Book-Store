<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

		<center>
		<h1>Shopping Cart For Book Store</h1>
		
			<form action="./CustomerRegister">
			Customer Name:<input type="text" name="name"><br><br>
			Address :<input type="text" name="add"><br><br>
			Phone No:<input type="number" name="phn"><br><br>
			Order Date :<input type="date" name="dtd"><br><br>
			
			Your Order Details :
			<table>
				<tr >
					<th>Book Name</th>
					<th>Author</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Total</th>
				</tr>
			
			<%
			try
			{
				ResultSet rs=(ResultSet) session.getAttribute("rs3");
				
				String QTY=(String)session.getAttribute("qty");
				
					int q=Integer.parseInt(QTY);	
					
				while(rs.next())
				{
			%>
				<tr>
					<td><%=rs.getString("books_name")%> </td> 
					<td><%=rs.getString("author") %></td>
					<td><%=rs.getInt("price") %>	</td>
					<td><%=q%>		</td>
					<td><%=rs.getInt("price")*q %>
				</tr>
			<%
				}
			}
			catch(Exception e)
			
			{
				e.printStackTrace();
			}
			
			%>				
			</table>
			<br><br>
			<input type="submit" value="Confirm">
				
			</form>
			
			<br><br>
			
			<form action="Index.jsp">
				<input type="submit" value="Cancel">
			</form>
		
		
		
		</center>
</body>
</html>