<%
response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
String gAbrevArea2  = (String) session.getAttribute("nomeColab"); 
String nomeColab  = (String) session.getAttribute("nomeColab"); 
String gNomeCurso  = (String) session.getAttribute("nomeCurso"); 
String login  = (String) session.getAttribute("loginID2"); 
//login="1112"; para testar
session.setAttribute("loginID",login);
String src = "";
String dst = "";
String areaRem = "";
String lida = "";
String datasend = "";
String assunto = "";
String textom = "";
String nomeDest = "";
%>

<%@ page contentType="text/html" language="Java" %>

 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<%@page import="com.unicsul.vo.MensagemVO"%>
<%@page import="com.unicsul.dao.MensagemDAO"%>
<%@page import="java.util.ArrayList"%>
<html>

<head>

<LINK REL="SHORTCUT ICON" HREF="http://200.136.79.7:8080/cpa/avl/aval.ico">

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
.style1 {
	color: #000066;
	font-weight: bold;
}
.style2 {
	font-size: 12px;
	font-weight: bold;
}
.style3 {
	color: #003399;
	font-size: 9px;
}
.style6 {font-size: 9px}

.style92 {
   color: #000000;
   font:Verdana;
   font-weight: bold;
   font-size-adjust:none;
   font-size:10px;
   font-size-adjust:none;
   font-style:normal;
}

-->
</style>

<script language=JavaScript>

  function selOpenMsg(datasend){
  	  document.frmPerg.datasend.value=datasend;
      document.frmPerg.submit();
  }
  function selDelMsg(src,dst,datasend){
  	  document.frmPerg2.src.value=src;
  	  document.frmPerg2.dst.value=dst;
  	  document.frmPerg2.datasend.value=datasend;
      document.frmPerg2.submit();
  }
</script>

<style type="text/css">
<!--
.style1 {font-family: Verdana, Arial, Helvetica, sans-serif}
.style2 {font-size: 9px}
.style3 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px; }
.style4 {font-size: 10px}
-->
</style>
</head>

<body>

   <form name="formAbrirMsg" method="post" action="abrirMsgDim.jsp" >
      <input type=hidden name=src size=10>
      <input type=hidden name=dst size=10>
      <input type=hidden name=datasend size=20>
</form>	

   <form name="formDeleteMsg" method="post" action="deleteMsgDim.jsp" >
      <input type=hidden name=src size=10>
      <input type=hidden name=dst size=10>
      <input type=hidden name=datasend size=20>
</form>	


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

<blockquote>   <br>

<table width="832">
<tr>
<td width="5%">
<img border="0" src="/unicsul/web/img/dim.jpg">
</td>
<td width="34%"> <span class="style92"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Mensagens internas recebidas</b> </font></span></td>
<td width="26%"><div align="center" class="Grey style6 style1 style2"><img src="/unicsul/web/img/email.gif" width="27" height="17" align="absmiddle" class="botao "> - n&atilde;o lida&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/unicsul/web/img/emailopen2.gif" width="27" height="17" align="absmiddle"> - lida </div></td>
<td width="5%">&nbsp;</td>
<td width="30%">
  <a href="/unicsul/principal?acao=SendMsgCommand"><img src="/unicsul/web/img/emailg.gif" align="absmiddle" border="0"></a>
  &nbsp;&nbsp;<a href="/unicsul/principal?acao=SendMsgCommand" class="style2">Enviar uma nova mensagem</a> </td>
</tr>
</table>
	


<p>Para ler  uma mensagem, clique no assunto. </p>
<table border="1" width=85%> 

               <tr bgcolor="#EAEAEA"><td width=5% ><div align="center"><span class="style1">&nbsp;</span></div></td> 
               <td width=15% ><div align="center"><span class="style1"><font face=Verdana size=1>Remetente</font></span></div></td> 
               <td width=15% ><div align="center"><span class="style1"><font face=Verdana size=1>Data/hora</font></span></div></td> 
               <td width=60% ><div align="left"><span class="style1"> <font face=Verdana size=1>Assunto da mensagem </font></span></div></td>

               <td width=5% ><div align="center"><span class="style1"><font face=Verdana size=1>Eliminar</font></span></div></td>
               <tr>
         <%
        	
             
                MensagemDAO mensagemDao = new MensagemDAO();
                ArrayList listaMsg = mensagemDao.listaMsg(login);
                MensagemVO vo = new MensagemVO();

               for(int i=0;i < listaMsg.size();i++) { 
               %><tr><%
               vo = (MensagemVO) listaMsg.get(i);
           
                src = "" + vo.getSrc();
                dst = "" + vo.getDst();
                areaRem = vo.getAreaRem();
                lida = "" + vo.getLida();
                datasend = vo.getDatasend();
                assunto = vo.getAssunto();
                textom = vo.getTextom();
                nomeDest = vo.getNomeDest();
               
				   if(lida.equals("1")){
				   %>
	                  <td width=5% ><div align="center"><font face=Verdana size=1><img src="/unicsul/web/img/emailopen2.gif"></font></div></td> 
				   <%
				   }
				   else{
				   %>
	                  <td width=5% ><div align="center"><font face=Verdana size=1><img src="/unicsul/web/img/email.gif"></font></div></td> 
				   <%
				   }
	               %>
			   
               <td width=15% ><div align="center"><font face=Verdana size=1><%=areaRem%></font></div></td> 
               <td width=15% ><div align="center"><font face=Verdana size=1><%=datasend%></font></div></td> 
			   <td width=60% style="cursor: pointer; font-size: 11px;" title="clique" onClick="selOpenMsg('<%=datasend%>');"><span class="style3"><u><%=assunto%></u></span></td>
			   <td width=5% style="cursor: pointer; font-size: 11px;" title="clique" onClick="selDelMsg('<%=src%>','<%=dst%>','<%=datasend%>');"><div align="center"><font face=Verdana size=1><img src="/unicsul/web/img/emaildel.gif"></font></div></td>
    		</tr>          
			   <%
			 }//termina o for
						
%>
</table>
</blockquote>
 
<form name="frmPerg" method="post" action="/unicsul/principal?acao=OpenMsgCommand" runat="server">
      <input type=hidden name=datasend size=10>
      
</form>	

<form name="frmPerg2" method="post" action="/unicsul/principal?acao=DelMsgCommand" runat="server">
      <input type=hidden name=src size=10>
      <input type=hidden name=dst size=10>
      <input type=hidden name=datasend size=10>
      
</form>	
 
 
<br>
<br>
<br>
<br>
 

</body>

<HEAD>
  <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</HEAD>

</html>