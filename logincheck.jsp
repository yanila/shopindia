<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.* " %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
<%
		shopindia.DConnection db=new shopindia.DConnection();
		String user=request.getParameter("user");
		String pass=request.getParameter("pass");
		String user1="";
		for(int i=0;i<user.length();i++)
		{
			if(user.charAt(i)=='\'')
				user1+="\\'";
			else
				user1+=user.charAt(i);
		}
		user=user1;
		String pass1="";
		for(int i=0;i<pass.length();i++)
		{
			if(pass.charAt(i)=='\'')
				pass1+="\\'";
			else
				pass1+=pass.charAt(i);
		}
		pass=pass1;
		try
		{
			ResultSet rst=db.getdata("select * from users where userid='"+user+"' and password='"+pass+"' and usertype='customer'");
			if(rst.next()) // if authorized
			{
				response.sendRedirect("paymentmode.jsp?user="+user);
			}
			else //if unauthorized
			{
%>
				<jsp:include page="login.jsp"></jsp:include>
<%				out.print("<center><h1>Invalid user or password</h1></center>"); %>
<%				
			}
		}
		catch(SQLException e)
		{
			out.print(e.getMessage());
		}
	%>
	</body>
</html>