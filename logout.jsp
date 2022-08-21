<%
	session.setAttribute("LOGIN-STATUS", null);
	session.setAttribute("name", null);
	response.sendRedirect("index.jsp");
%>