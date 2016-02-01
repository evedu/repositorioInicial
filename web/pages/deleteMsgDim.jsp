<%
response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
String gAbrevArea2  = (String) session.getAttribute("nomeColab"); 
String gAbrevArea  = (String) session.getAttribute("nomeColab"); 
String src = request.getParameter("src");
String dst = request.getParameter("dst");
String datasend = request.getParameter("datasend");
if(src==null || dst==null || datasend==null){
%>
			<script>
			   window.location.href="/unicsul/principal?acao=MensagensCommand";
			</script>		
<%
}
%>

<%@ page contentType="text/html" language="Java" %>
<%@ page import="java.sql.*" %>

 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<%@page import="com.unicsul.dao.MensagemDAO"%>
<html>

<head>

<%  
response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
%>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">

<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<title>Usuário: <%=gAbrevArea2%> - UNICSUL - Avaliação Institucional</title>


<link rel="StyleSheet" href="/unicsul/web/css/default_unicsul.css"/>


<style type="text/unicsul/web/css">
<!--
.style2 {
	font-size: 11px;
	font-weight: bold;
}
.style6 {font-size: 9px}
.myGrey {
	color: #777777;
	font-size: 9px;
}
-->
</style>
</head>

<body>

<%
response.setDateHeader("Expires", 0);
response.setHeader("Pragma", "no-cache");
if (request.getProtocol().equals("HTTP/1.1")) {
  response.setHeader("Cache-Control", "no-cache");
}

if(session.getAttribute("permissao")!=null){
	String perm = (String) session.getAttribute("permissao");
	int permissao  = Integer.parseInt(perm);
}
String gCoda  = (String) session.getAttribute("gCoda"); 


boolean encontrado=false;
String atu = (String) session.getAttribute("acrossTheUniverse");
if (atu!=null && atu.compareTo("5GSDTWRWEbdfrwrUUTRvcbQASkd9898989876543ewedcsrftygg34wqxc432")==0 ) encontrado=true; else encontrado=false;
if(!encontrado) {
%>
			<script>
			   alert("Identificação não autorizada!");
			   window.location.href="/unicsul/principal?acao=indexCommand";
			</script>		
<%
}
%>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
                <td width="20%">
                	<% out.println("<img src='/unicsul/web/img/novo_logo.gif' alt='Site da Universidade' align='baseline' width='224' height='84'>"); %>
		</td>
                
          <td width="60%">
          <img src="/unicsul/web/img/CpaiTitulo2.gif"
                width="392" height="85"></td>
          <td width="20%" valign="bottom" align="middle">
          <font face=Verdana size=1><b>
      <p>Dimensões SINAES UNICSUL</p>
      <p></p></b></font>
          </td>
    </tr>
</table>
 

<table class="MenuOption2" align="center" border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr class="MenuOption2">
    <td class="MenuOption2">
    <p class="MenuOption2" style="margin: 5px">&nbsp;&nbsp;| 
 	    <a class="MenuOption2" href="/unicsul/principal?acao=CursosCommand"/>Cursos</a>&nbsp;&nbsp;|
 	   <a class="MenuOption2" href="/unicsul/principal?acao=MensagensCommand"/>Mensagens</a>&nbsp;&nbsp;|
 	   <a class="MenuOption2" href="/unicsul/principal?acao=ResumosCommand"/>Resumos</a>&nbsp;&nbsp;|
 	   <a class="MenuOption2" href="/unicsul/principal?acao=LogoffCommand"/>Logoff seguro</a>&nbsp;&nbsp;|
    </p>     
    </td>
 </tr>
</table>

<blockquote>  

<table width="832">
<tr>
<td width="5%">
<img border="0" src="/unicsul/web/img/dim.jpg" width="32" height="31">
</td>
<td width="34%">
<p class="style2"><font face=Verdana>&nbsp;Mensagem eliminada com sucesso.</font></p>
</td>
<td width="3%"><div align="center" class="Grey style6"></div></td>
<td width="3%">&nbsp;</td>
<td width="55%">&nbsp;</td>
</tr>
</table>

 <%
  
  
  try{
 			MensagemDAO mensagemDao = new MensagemDAO();
		  	int delMsg = mensagemDao.delMsg(datasend, src, dst);
		  	
		  	
		  		%>
		      <p>Sua mensagem foi eliminada com sucesso.  </p>
<p>Clique na opção de menu Mensagens para voltar para a caixa de entrada.

	  <%     
		  	
			
	 		}//do try
			catch (Exception e) { }
			
	%>



        <br>
        <br>
        <br>
               

</p>
</body>

<HEAD>
  <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</HEAD>

</html>
