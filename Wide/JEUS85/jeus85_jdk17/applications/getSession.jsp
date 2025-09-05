<%@page contentType="text/html; charset=euc-kr" %>
<%
out.println("<font color=red size=5>Session Get</font><br><p>");
out.println("Hostname : " + java.net.InetAddress.getLocalHost().getHostName() + "<br>");
out.println("Session ID : " + session.getId() + "<br>");
out.println("Session Get : " + (String) session.getAttribute("id") + "<br><p>");

out.println("Session Timeout : " + session.getMaxInactiveInterval() + " sec.<br>");
out.println("Session Timeout : " + session.getMaxInactiveInterval()/60 + " min.<br>");
out.println("Session Timeout : " + (double)session.getMaxInactiveInterval()/3600 + " hour.<br><p>");
out.println("session.getLastAccessedTime() : " + new java.util.Date(session.getLastAccessedTime()).toString() + "<br>");
out.println("session.getCreationTime() : " + new java.util.Date(session.getCreationTime()).toString() + "<br>");
%>
