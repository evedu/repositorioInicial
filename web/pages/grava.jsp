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
String gCurso  = (String) session.getAttribute("CodigoCurso"); 
String gCodArea  = (String) session.getAttribute("codArea");
String codSubCat  = (String) session.getAttribute("codSubCateg"); 
String codigoPot  = (String) session.getAttribute("CodigoPoten"); 
String codigoFrag  = (String) session.getAttribute("CodigoFragil"); 
String maiorF  = (String) session.getAttribute("maiorF");
String cont  = (String) session.getAttribute("cont2"); 
int CodCurso=0;
String grava = "";
if(session.getAttribute("CodigoCurso")!=null){
	CodCurso = Integer.parseInt(gCurso);
	grava = request.getParameter("grava");
}

int contador=8;





	 
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
String perm="";
int permissao=0;

if(session.getAttribute("permissao")!=null){
	perm = (String) session.getAttribute("permissao");
	permissao  = Integer.parseInt(perm);
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
  int codigoPotInt= 0;
  int codigoFragInt= 0;
  
  
  try{
	  
	  	GravaDao gravDao = new GravaDao();
		ArrayList listaGrava = gravDao.Grava(codSubCat,grava,CodCurso);
		ArrayList listaGrava2 = gravDao.Grava(codSubCat,grava,CodCurso);
		FragilidadesVO fragilVO = new FragilidadesVO();
		PotencialidadesVO potVO = new PotencialidadesVO();
		
		
	  	for(int i=0;i<listaGrava.size();i++ ) { 
	  		
 			if(grava.equals("Gravar Potencialidade")) {	
 				
////////o contador pega o ultimo codigo, para saber se é update ou insert//// 		
		 		potVO = (PotencialidadesVO) listaGrava.get(i);
		 		contador=potVO.getCodPotencialidade();
		 		if(session.getAttribute("CodigoPoten")!=null){
		 			codigoPotInt= Integer.parseInt(codigoPot);
		 		}
		 	
		 		
			}
			if(grava.equals("Gravar Fragilidade")) {
		
////////o contador pega o ultimo codigo, para saber se é update ou insert////	
				fragilVO = (FragilidadesVO) listaGrava2.get(i);		 		
				contador=fragilVO.getCodfragilidade();
		 		
		 		if(session.getAttribute("CodigoFragil")!=null){
		 			codigoFragInt= Integer.parseInt(codigoFrag);
		 		}
	
			}
		}// do for
		
	   listaGrava.clear();
	   listaGrava = null;
	   listaGrava2.clear();
	   listaGrava2 = null;
	   gravDao = null;
	   fragilVO = null;	  	
	   potVO = null;	  	

}//do try

catch (Exception e) {  out.print("<p>Erro: " + e.getMessage() +  "</p>"); }
			
		



   
/////se for uma potencialidade/////////////
  if(grava.equals("Gravar Potencialidade")) {
  		
  		String texto = request.getParameter("textor");
		String tipoPot = request.getParameter("prazo");
		
		
//////////////////////Verifica se é Update ou Insert///////////////////// 		
  		if((contador<codigoPotInt || (codigoPotInt==0) ) && cont.equals("1")){
  		
  			
  			//Insert
  			
  			

			try {
				
				GravaDao gravaDao = new GravaDao();
				ArrayList listaGrava2 = gravaDao.InsertPot((String) session.getAttribute("loginID2"),(String) session.getAttribute("senhaID2"),gCurso,codSubCat,codigoPot,texto, tipoPot);
				
			   
			}
			
			catch (SQLException e) { out.print("<p>" + e.getMessage() +  "</p>"); }
			
		
			
		///parte que aparece o gif gravando, e depois retransfere///////
		///para pagina anterior///////
			%>
			<META HTTP-EQUIV="Refresh" CONTENT="1; URL= /unicsul/principal?acao=ListadepotCommand">
	        <div align="center">
	          <p>&nbsp;</p>
	          <p>Cadastrado com sucesso!!!!....</p>           
	        </div>
	        <div align="center"><img src="/unicsul/web/img/ProgressBar2.gif"></div>
  			<%
  			
  			
  			
  			
  		}else{
  			//Update
  			
  			

			try {
				
				GravaDao gravaDao = new GravaDao();
				ArrayList listaGrava2 = gravaDao.UpdatePot(permissao,(String) session.getAttribute("loginID2"),(String) session.getAttribute("senhaID2"),gCurso,codSubCat,codigoPot,texto, tipoPot);
						   
			}
			catch (SQLException e) { out.print("<p>" + e.getMessage() +  "</p>"); }
	
			
			
			
			///parte que aparece o gif gravando, e depois retransfere///////
			///para pagina anterior///////
			%>
			<META HTTP-EQUIV="Refresh" CONTENT="1; URL= /unicsul/principal?acao=ListadepotCommand">
	        <div align="center">
	          <p>&nbsp;</p>
	          <p>Alterado com sucesso!!!!....</p>           
	        </div>
	        <div align="center"><img src="/unicsul/web/img/ProgressBar2.gif"></div>
  			<%
  		
  		}
  

  }
  
/////se for uma fragilidade/////////////
  if(grava.equals("Gravar Fragilidade")) {
  
  		
  		String texto = request.getParameter("textor");
  		String texto2 = request.getParameter("textor2");
  		String prazo = request.getParameter("prazo");
 		String responsavel = request.getParameter("respons");
  		
//////////////////////Verifica se é Update ou Insert/////////////////////  
  		
  		if(cont.equals("5")){
  	  		
  	  		
			try {
				
				GravaDao gravaDao = new GravaDao();
				ArrayList listaGrava2 = gravaDao.InsertFrag((String) session.getAttribute("loginID2"),(String) session.getAttribute("senhaID2"),gCurso,codSubCat,maiorF,texto,texto2,prazo,responsavel);
				
				
							   
			}
			
			catch (SQLException e) { out.print("<p>Erro: " + e.getMessage() +  "</p>"); }
			
			
			
			///parte que aparece o gif gravando, e depois retransfere///////
			///para pagina anterior///////
			%>
			<META HTTP-EQUIV="Refresh" CONTENT="1; URL= /unicsul/principal?acao=ListadefragCommand">
	        <div align="center">
	          <p>&nbsp;</p>
	          <p>Cadastrado nova Proposta com sucesso!!!!....</p>           
	        </div>
	        <div align="center"><img src="/unicsul/web/img/ProgressBar2.gif"></div>
  			<%
  			
  		
  		}else if((contador<codigoFragInt || (codigoFragInt==0) ) && cont.equals("1")){
  		
  		
			try {
				
				GravaDao gravaDao = new GravaDao();
				ArrayList listaGrava2 = gravaDao.InsertFrag((String) session.getAttribute("loginID2"),(String) session.getAttribute("senhaID2"),gCurso,codSubCat,codigoFrag,texto,texto2,prazo,responsavel);
				//out.print("<p>" + gravaDao.getErro() +  "</p>");
			}
			
			catch (SQLException e) { out.print("<p>Erro: " + e.getMessage() +  "</p>"); }
			
			
			
			///parte que aparece o gif gravando, e depois retransfere///////
			///para pagina anterior///////
			%>
			<META HTTP-EQUIV="Refresh" CONTENT="1; URL= /unicsul/principal?acao=ListadefragCommand">
	        <div align="center">
	          <p>&nbsp;</p>
	          <p>Cadastrado com sucesso!!!!....</p>           
	        </div>
	        <div align="center"><img src="/unicsul/web/img/ProgressBar2.gif"></div>
  			<%
  			
  		
  		}else{
  							
			
			try {

				GravaDao gravaDao = new GravaDao();
				ArrayList listaGrava2 = gravaDao.UpdateFrag(permissao, (String) session.getAttribute("loginID2"),(String) session.getAttribute("senhaID2"),gCurso,codSubCat,codigoFrag,texto,texto2,prazo,responsavel);
				//out.print("<p>" + gravaDao.getErro() +  "</p>");
			
			}
			
			catch (SQLException e) { out.print("<p>Erro: " + e.getMessage() +  "</p>"); }
						
			
			///parte que aparece o gif gravando, e depois retransfere///////
			///para pagina anterior///////
			
			%>
			<META HTTP-EQUIV="Refresh" CONTENT="1; URL= /unicsul/principal?acao=ListadefragCommand">
	        <div align="center">
	          <p>&nbsp;</p>
	          <p>Alterado com sucesso!!!!....</p>           
	        </div>
	        <div align="center"><img src="/unicsul/web/img/ProgressBar2.gif"></div>
  			<%
  		
  		
  		}
  
  
  }







%>
	
	  
   
 </div>
  
  
   

  
 
</body>

<HEAD>
  <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</HEAD>

</html>