<%
response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
String gAbrevArea  = (String) session.getAttribute("nomeColab"); 
String gAbrevArea2  = (String) session.getAttribute("nomeColab"); 
String src = (String) session.getAttribute("loginID2");
String dst = request.getParameter("dst");
String assunto = request.getParameter("assunto");
String textom = request.getParameter("textom");
String datasend = "";
String areaRem = "";

if(src==null || dst==null || assunto==null || textom==null){
%>
			<script>
			   window.location.href="msgDim1.jsp";
			</script>		
<%
}

if(assunto.equals("")) assunto = "Sem assunto";
if(textom.equals("")) textom = " ";
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
.style22 {font-size: 10px}
.style23 {font-family: Geneva, Arial, Helvetica, sans-serif}
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

%>





<%

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
}%>

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

<blockquote>  

<table width="832">
<tr>
<td width="5%">
<img border="0" src="/unicsul/web/img/dim.jpg" width="32" height="31">
</td>
<td width="34%">
<p class="style2"><font face=Verdana>&nbsp;Mensagem enviada com sucesso.</font></p>
</td>
<td width="3%"><div align="center" class="Grey style6"></div></td>
<td width="3%">&nbsp;</td>
<td width="55%">&nbsp;</td>
</tr>
</table>


  <%
  
  
  try{
 			MensagemDAO mensagemDao = new MensagemDAO();
		  	int sendMsg = mensagemDao.sendMsg(gAbrevArea, src, dst, textom, assunto);
		  	
		  	if(sendMsg==1){
		  		%>
		      <p><br>Sua mensagem foi enviada com sucesso para o destinat&aacute;rio solicitado. <br>
Clique na opção de menu Mensagens para voltar para a caixa de entrada.
  <br><br><br><br>
		      <%
		      
		      java.util.Date adata = new java.util.Date();
	            String horas="",minutos="",dia="",mes="",segundos="";
	            segundos = "" + adata.getSeconds();
	            if(segundos.length()==1)segundos="0"+segundos;
	            horas = "" + adata.getHours(); 
	            if(horas.length()==1)horas="0"+horas;
	            minutos = "" + adata.getMinutes(); 
	            if(minutos.length()==1)minutos="0"+minutos;
	            dia = "" + adata.getDate();
	            if(dia.length()==1)dia="0"+dia;
	            mes = "" + (adata.getMonth()+1);
	            if(mes.length()==1)mes="0"+mes;
	            datasend = "" + dia  + "/" + mes + "/" + (adata.getYear()+1900) + ", " + horas + ":" + minutos+ ":" + segundos;
	            String englishdatasend = "" + (adata.getYear()+1900) + "/" + mes  + "/" + dia  + ", " + horas + ":" + minutos+ ":" + segundos;
	            
	            
		  	}else
		  	{
		  		%>
		      Ocorreu um erro na gravação.
		      <%
		  	}
			
	 		}//do try
			catch (Exception e) { }
			
	%>
			




        <br>
        <br>
        <br>
               


</body>

<HEAD>
  <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</HEAD>

</html>
