<%
response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
%>

<%@ page contentType="text/html" %>
<%@ page errorPage="pagError.jsp" %>


<html>
  <head>
<%
response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
%>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">

<title>Universidade - Avaliação Institucional</title>
  </head>
  <body bgcolor=#FFFFFF>

  <c:set var="contador" value="${contador + 1}" scope="application" />

<% 
	long tjf;
	String stjf;
%>

<%
 java.util.Date ti = new java.util.Date();
 tjf = ti.getTime();
 ti = null;
 stjf = "&stjf=" + tjf;
%>

 	<%   	 
 		session.setAttribute("gloginID","xdsge235454534jkkbggh");
	 	session.setAttribute("gloginPass","xdsge235454534jkkbggh");
	 	session.setAttribute("ploginID","xdsge235454534jkkbggh");
	 	session.setAttribute("ploginPass","xdsge235454534jkkbggh");
	 	session.setAttribute("Aut","xdsge235454534jkkbggh");
		session.setAttribute("Tipo","xdsge235454534jkkbggh");
		session.setAttribute("Codproj","xdsge235454534jkkbggh");
		session.setAttribute("Nomeproj","xdsge235454534jkkbggh");
		session.setAttribute("PCodproj","xdsge235454534jkkbggh");
		session.setAttribute("PNomeproj","xdsge235454534jkkbggh");
		session.setAttribute("Pproj","xdsge235454534jkkbggh");
		session.setAttribute("acrossTheUniverse","xdsge235454534jkkbggh");
		session.invalidate();
	%>
	<script>
		window.location.href='/unicsul/principal?acao=SaidaCommand';
	</script>			
	
  </body>


</html>