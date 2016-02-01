<%@ page contentType="text/html" language="Java" %>

<%@ page import="java.sql.*" %>

<%@page import="java.util.ArrayList"%>

<%
response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
String login  = (String) session.getAttribute("loginColab"); 
session.setAttribute("login4",login);
String codigoCategoria  = (String) request.getParameter("codigoCategoria"); 
String gAbrevArea  = (String) session.getAttribute("AbrevArea"); 
String codCurso  = (String) session.getAttribute("CodigoCurso"); 
String gNomeCurso  = (String) session.getAttribute("nomeCurso"); 


%>
<%@page import="com.unicsul.dao.IdentificacaoDAO"%>
<html>
<head>
<script type="text/javascript" src="/unicsul/web/js/ajax.js"></script>
<script type="text/javascript" src="/unicsul/web/js/limpaSubcategorias.js"></script>
<LINK REL="SHORTCUT ICON" HREF="http://200.136.79.7:8080/cpa/avl/aval.ico">

<%  
response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);


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
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">

<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<title>Usuário: <%=gAbrevArea%> - UNICSUL - Avaliação Institucional</title>


<link rel="StyleSheet" href="/unicsul/web/css/default_unicsul.css"/>

<style type="text/css">
<!--
.style2 {
	font-size: 11px;
	font-weight: bold;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style6 {
	font-size: 12px;
	font-family: Geneva, Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.style8 {
	font-size: 12px;
	font-family: Geneva, Arial, Helvetica, sans-serif;
}
.style9 {font-size: 12}

.style11 {font-size: 12px;
font-family: Geneva, Arial, Helvetica, sans-serif;
color: #003399;
}
-->
</style>

</head>

<body>
<table  width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <th height="7" colspan="2" nowrap bgcolor="#F4F8FC" ><span class="style4"></span></th>
  </tr>
  <tr>
    <td width="73%" height="75"><img src="/unicsul/web/img/logo.jpg"></td>
    <td width="27%"><div align="right"><img src='/unicsul/web/img/novo_logo.jpg' alt='UNICSUL'></div></td>
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

  <table width="100%" cellpadding="0" cellspacing="0">
    <tr>
      <th width="3%" nowrap> <div align="right"><img border="0" src="/unicsul/web/img/seta.jpg"> </div></th>
      <td width="97%" height="32">
        <p align="left" class="style2">
        	<font face=Verdana>Curso: <%=gNomeCurso%></font>        </p>      </td>
      
    </tr>
    
  </table>
    

<p align="center"><img src="/unicsul/web/img/identificacao.jpg" border="0"></p>
<p align="center">&nbsp;</p><div align="center">
<table width="329" border="1" cellpadding="0" cellspacing="0" bordercolor="#E8E8E8">
  <tr><td><br>

<table width="329" border="0" cellpadding="0" cellspacing="2">
   <form name="form1" method="post" action="/unicsul/principal?acao=AlteraColabCommand">
  
    <tr>
      <td width="150" bgcolor="#FFFFFF"><div align="right" class="style6">Login:</div></td>
      <td width="169" bgcolor="#FFFFFF">&nbsp;&nbsp;<span class="style8"><%=request.getParameter("login")%></span></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right" class="style6">Nome do Colaborador:</div></td>
      <td bgcolor="#FFFFFF">&nbsp;&nbsp;<input type="text" name="nome" id="nome"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF"><div align="right" class="style6">Senha:</div></td>
      <td bgcolor="#FFFFFF">&nbsp;&nbsp;<span class="style8"><%=request.getParameter("senha")%></span></td>
    </tr>
    <tr>
      <td height="52" colspan="2" bgcolor="#FFFFFF"><div align="center">
        <input type="submit" name="button" id="button" value="Alterar">
      </div></td>
      </tr>
  
  <p>
    <label></label>
  </p>
  </form></table><br>

		     </td></tr></table>
  <br>
</div>
<p align="center"><a href="/unicsul/principal?acao=IdentificacaoCommand" class="style11"><strong><br>
<img src="/unicsul/web/img/voltar.jpg" border="0"></strong></a></p>     

 		 
 
  
  
 <table width="100%" border="0">
  <tr>
    <td width="82%" height="45"><br>
<table width="100%" border="0" align="center" class="MenuOption2">
      <tr>
        <th height="7"><span class="style4"></span></th>
      </tr>
    </table></td>
    	
        <th width="18%" nowrap>
    		<img src="/unicsul/web/img/sm.jpg" width="50" height="40"> 
    		<img src="/unicsul/web/img/af.jpg" width="50" height="40">
    		<img src="/unicsul/web/img/lib.jpg" width="50" height="40">
    		<img src="/unicsul/web/img/pin.jpg" width="50" height="40">    </th>
  </tr>
</table>

 
</body>

<HEAD>
  <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</HEAD>

</html>