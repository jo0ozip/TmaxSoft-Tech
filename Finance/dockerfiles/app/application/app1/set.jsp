<%
 String id = "login";
 session.setAttribute("userid", id);
%>
SessionID : <%=session.getId()%><BR>
<a href=get.jsp>get.jsp</a>
