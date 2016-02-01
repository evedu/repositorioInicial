<%@ page contentType="text/html" language="Java" %>

<%@ page import="java.sql.*" %>

<%@ page import="com.unicsul.dao.GravaDao" %>
<%@ page import="com.unicsul.vo.FragilidadesVO" %>
<%@ page import="com.unicsul.vo.PotencialidadesVO" %>
<%@page import="java.util.ArrayList"%>

<%
response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);

String cont  = (String) session.getAttribute("cont2"); 
String CodigoCurso = (String) session.getAttribute("CodigoCurso");





	 
%>
 
<html>

<head>



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



  <div align="center">
   
   
  <%
  
  
  
  
  
  /////////variaveis que pegam o valor da Pot ou Frag e alteram pra inteiro////
  
  
  
  try{
	  String codCat  = (String) session.getAttribute("codSubCateg"); 
	  GravaDao gravDao = new GravaDao();
	  
	  if(cont.equals("3")){
		  String codigoPot  = (String) session.getAttribute("CodigoPoten");
		  ArrayList listaGrava = gravDao.DeletaPot(codCat,codigoPot,CodigoCurso);
		  
		///parte que aparece o gif gravando, e depois retransfere///////
			///para pagina anterior///////
			%>
			<META HTTP-EQUIV="Refresh" CONTENT="1; URL= /unicsul/principal?acao=ListadepotCommand">
	      <div align="center">
	        <p>&nbsp;</p>
	        <p>Excluido com sucesso!!!!....</p>           
	      </div>
	      <div align="center"><img src="/unicsul/web/img/ProgressBar2.gif"></div>
			<%
	  }
	  
	  
	  if(cont.equals("4")){
		  String codigoFrag  = (String) session.getAttribute("CodigoFragil");
		  ArrayList listaGrava = gravDao.DeletaFrag(codCat,codigoFrag,CodigoCurso);
		  
		  
		///parte que aparece o gif gravando, e depois retransfere///////
			///para pagina anterior///////
			%>
			<META HTTP-EQUIV="Refresh" CONTENT="1; URL= /unicsul/principal?acao=ListadefragCommand">
	      <div align="center">
	        <p>&nbsp;</p>
	        <p>Excluido com sucesso!!!!....</p>           
	      </div>
	      <div align="center"><img src="/unicsul/web/img/ProgressBar2.gif"></div>
			<%
	  }
	  	
	
		

}//do try

catch (Exception e) { }
			
		
%>
	
	  
   
 </div>
  
  
   

  
 
</body>

<HEAD>
  <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</HEAD>

</html>