<%@ page contentType="text/html" language="Java" %>

<%@ page import="java.sql.*" %>

<%
response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
String gAbrevArea  = (String) session.getAttribute("nomeColab"); 
String gCodArea  = (String) session.getAttribute("codArea");
String gNomeCurso  = (String) session.getAttribute("nomeCurso");

String perm="";
int permissao=0;

if(session.getAttribute("permissao")!=null){
	perm = (String) session.getAttribute("permissao");
	permissao  = Integer.parseInt(perm);
}
%>
 
<html>

<head>

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
}
.style3 {
	font-size: 18px;
	font-weight: bold;
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

   
  <p align="center"><img src="/unicsul/web/img/resumos.jpg" border="0"></p>
<p align="center">&nbsp;</p>
<table width="474" border="1" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <th width="235" scope="row" height="28" bgcolor="#2A70BF"><div align="center" class="style12">Fragilidades</div></th>
      <th width="223" height="28" bgcolor="#2A70BF"><div align="center" class="style12">Potencialidades</div></th>
    </tr>
    <%if(permissao==10){ %>
	    
	    
	    
		    <tr>
		      <td scope="row" class="style13" height="28"><div align="center"><a href="/unicsul/principal?acao=CategFragCommand">Todas Fragilidades</a></div></td>
		      <td class="style13" height="28"><div align="center"><a href="/unicsul/principal?acao=CategPotCommand">Todas Potencialidades</a></div></td>
		    </tr>
	    
	   
	    
	    <tr>
	      <td scope="row" class="style13" height="28"><div align="center"><a href="/unicsul/principal?acao=CategFragAreaCommand">Fragilidades por Área</a></div></td>
	      <td class="style13" height="28"><div align="center"><a href="/unicsul/principal?acao=CategPotAreaCommand">Potencialidade por Área</a></div></td>
	    </tr>
	<%} %>
    <tr>
      <td height="28" scope="row" class="style13"><div align="center"><a href="/unicsul/principal?acao=CategFragCursoCommand">Fragilidades por Curso</a></div></td>
      <td height="28"class="style13"><div align="center"><a href="/unicsul/principal?acao=CategPotCursoCommand">Potencialidade por Curso</a></div></td>
    </tr>
</table>
  <p></p>
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