<%
response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
String gAbrevArea  = (String) session.getAttribute("nomeColab"); 
String gAbrevArea2 = (String) session.getAttribute("nomeColab"); 
String gCoda  = (String) session.getAttribute("gCoda"); 
String permissao  = (String) session.getAttribute("permissao"); 

String src = (String) session.getAttribute("src") , dst2 = (String) session.getAttribute("dst");
String datasend = "";
String areaRem = (String) session.getAttribute("areaRem");
String assunto = (String) session.getAttribute("assunto");
String textom = (String) session.getAttribute("textom");

if(assunto==null){
	src = "";
}

%>

<%@ page contentType="text/html" language="Java" %>
<%@ page import="java.sql.*" %>

 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<%@page import="com.unicsul.dao.MensagemDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.unicsul.vo.ColabAreasVO"%>
<html>

<head>
<!-- TinyMCE -->
<script type="text/javascript" src="/unicsul/web/js/tiny_mce.js"></script>
<script type="text/javascript">
	tinyMCE.init({
		mode : "textareas",
		theme : "simple"
	});
</script>
<!-- /TinyMCE -->
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

<script language=JavaScript>
  function selEnviarNewMsg(s,d){
      document.formNewMsg.src.value=s;
      document.formNewMsg.dst.value=d;
      document.formNewMsg.submit();
  }
</script>


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
.myBlack {
	color: #000000;
	font-size: 9px;
}
.style22 {font-size: 9px}
.style23 {font-family: Geneva, Arial, Helvetica, sans-serif}
-->
</style>
<style type="text/css">
<!--
.style2 {font-size: 9px}
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

<table width="90%">
<tr>
<td width="5%">
<img border="0" src="/unicsul/web/img/dim.jpg" width="32" height="31">
</td>
<td width="50%">
<p class="style2"><font face=Verdana>Enviar uma nova mensagem interna</font></p>
</td>
<td width="6%"><div align="center" class="Grey style6"></div></td>
<td width="1%">&nbsp;</td>
<td width="38%">&nbsp;</td>
</tr>
</table>

<p>Selecione o destinat&aacute;rio desta mensagem, digite o assunto/texto da mensagem e clique no bot&atilde;o Enviar.<br>
Clique na opção  Mensagens para cancelar o envio e voltar
para a caixa de entrada.
</p>

<form name="formNewMsg" method="post" action="/unicsul/principal?acao=SendCommand"  >
        <input type=hidden id="src" name="src" size="10" value="<%=src%>" >
        <table width="80%"  border="1" bordercolor="#DDDDDD">
          <tr>
            <td width="10%"><div align="right" class="style22"><span class="style23">Destinat&aacute;rio:</span></div></td>
            <td width="90%" >              
			
			<select name="dst" class="myBlack">
	
 <%   
                MensagemDAO mensagemDao = new MensagemDAO();
                ArrayList listaMsg = mensagemDao.listaColaboradores();
                ColabAreasVO vo = new ColabAreasVO();

               for(int i=0;i <listaMsg.size();i++) { 
               
             	   vo = (ColabAreasVO) listaMsg.get(i);
                
				   %>
			         <option value="<%=vo.getLog()%>" <%if(src.equals(vo.getLog())){%>selected<%}%>><%=vo.getNomeColab()%></option>
				   <% 
				}//fecha o for
	
%>
            </select>
			<span class="style22"><span class="style23">&nbsp;&nbsp;<span class="style2">-&gt; importante: selecione o destinat&aacute;rio da sua mensagem</span></span></span></td>
          </tr>
          <tr>
            <td><div align="right" class="style22"><span class="style22">&nbsp;&nbsp;&nbsp;Assunto:</span></div></td>
            <td><input name="assunto" type="text" class="myBlack"  id="assunto" style="font-family: Verdana; font-size: 8 pt" value="<%if(assunto==null){%><%}else{%>Re: <%=assunto%><%}%>" size="75" ></td>
          </tr>
        </table>
        <br>
		
		<textarea name="textom" cols= "130" rows="15" id="textom" style="font-family: Verdana; font-size: 8 pt" ><%if(textom==null){%><%}else{%><%="<br><br>-----<br>" + textom%><%} %></textarea>
          <br>
          <br>
		                                                                   
          <input name="btnEnviar" type="submit" value="Enviar">
&nbsp;&nbsp;<img src="/unicsul/web/img/email.gif" width="34" height="22"  align="absmiddle">
</form>	
      <br>
      <br>
      <br>
               

</body>

<HEAD>
  <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</HEAD>

</html>
