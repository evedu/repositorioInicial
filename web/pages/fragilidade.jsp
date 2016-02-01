<%@ page contentType="text/html" language="Java" %>

<%@ page import="java.sql.*" %>

<%@ page import="com.unicsul.dao.FragilidadeDao" %>
<%@ page import="com.unicsul.vo.FragilidadesVO" %>
<%@page import="java.util.ArrayList"%>
  
<%
response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
String gAbrevArea  = (String) session.getAttribute("AbrevArea"); 
String gCodArea  = (String) session.getAttribute("codArea");
String nomeCat  = (String) session.getAttribute("nomeCat");
String codSubCat  = (String) session.getAttribute("codSubCateg");
String codigoFrag = (String) session.getAttribute("CodigoFragil");  
String CodigoCurso = (String) session.getAttribute("CodigoCurso");
String gNomeCurso  = (String) session.getAttribute("nomeCurso");

String cont  = (String) session.getAttribute("cont2"); 


String textor2="", textor3="", prazo="", responsavel="";



//////////// armazenando varias para poder gravar na proxima tela//////////////////


////////////////////////////////////////////////////////////////////////////////////

	 	   

%>
 

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
<LINK REL="SHORTCUT ICON" HREF="http://200.136.79.7:8080/cpa/avl/aval.ico">

<%  
response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
%>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">

<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<title>Usuário: <%=gAbrevArea%> - UNICSUL - Avaliação Institucional</title>


<link rel="StyleSheet" href="/unicsul/web/css/default_unicsul.css">

<style type="text/css">
<!--
.style2 {
	font-size: 11px;
	font-weight: bold;
}
.style4 {font-family: Geneva, Arial, Helvetica, sans-serif}
.style6 {
	font-family: Geneva, Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
	color: #003399;
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
 	    <a class="MenuOption2" href="/unicsul/principal?acao=CursosCommand">Cursos</a>&nbsp;&nbsp;|
        <a class="MenuOption2" href="/unicsul/principal?acao=IdentificacaoCommand">Identificação</a>&nbsp;&nbsp;|
        <a class="MenuOption2" href="/unicsul/principal?acao=CategoriaCommand">Dimensões</a>&nbsp;&nbsp;|
 	   <a class="MenuOption2" href="/unicsul/principal?acao=MensagensCommand">Mensagens</a>&nbsp;&nbsp;|
 	   
 	   <a class="MenuOption2" href="/unicsul/principal?acao=ResumosCommand">Resumos</a>&nbsp;&nbsp;|
 	   <a class="MenuOption2" href="/unicsul/principal?acao=LogoffCommand">Logoff seguro</a>&nbsp;&nbsp;|
    </p>       
    </td>
 </tr>
</table>

  <table width="100%" cellpadding="0" cellspacing="0">
    <tr>
      <th nowrap> <div align="right"><img border="0" src="/unicsul/web/img/seta.jpg"> </div></th>
      <td width="97%" height="32">
        <p align="left" class="style2">
        	<font face=Verdana>Curso: <%=gNomeCurso%></font>       
        </p>      
     </td>
    </tr>
  </table>
  
  <table width="100%" cellpadding="0" cellspacing="0">
    <tr>
      <th nowrap> <div align="right"><img border="0" src="/unicsul/web/img/seta.jpg"> </div></th>
      <td width="94%" height="32">
        <p align="left" class="style2">
        	<font face=Verdana>Categoria: <%=nomeCat%></font>        
        </p>      
      </td>
    </tr>    
  </table>

  <div align="center">

    <%
  ////// pega as fragilidades e joga nos campos textarea na tela/////
  
  
 
	try{
		
		
		
		FragilidadeDao fragilDao = new FragilidadeDao();
		ArrayList listaFragil = fragilDao.fragilidade(codSubCat,codigoFrag, CodigoCurso);
		FragilidadesVO fragilVO = new FragilidadesVO();
		
	  	for(int i=0;i<listaFragil.size();i++ ) { 
	  		
	  		fragilVO = (FragilidadesVO) listaFragil.get(i);
	  		  
		      textor2=""+fragilVO.getTextoFragilidade(); 
		       
		      if(!cont.equals("5")){
			      textor3=""+fragilVO.getProposta(); 
			      responsavel=""+fragilVO.getResponsavel();
			      prazo=""+fragilVO.getPrazo(); 
			  }
	   }//do for
	   
	   listaFragil.clear();
	   listaFragil = null;
	   fragilVO = null;
	   fragilDao = null;
	  	
	}//do try

	catch (Exception e) { out.print("<p>" + e.getMessage() +  "</p>"); }
			
////////////fim/////////////	
		
		
%>
      <br>
      
      
      <form action="/unicsul/principal?acao=GravaCommand" method="post" >
      
      
  <p><br></p>
  <table width="95%" border="0">
    <tr>
      <td width="40%" scope="row"><div align="left"><img src="/unicsul/web/img/fragilidades.jpg"></div></td>
      <td width="40%"><div align="left"><img src="/unicsul/web/img/proposta.jpg"></div></td>
      <td width="20%"><div align="left"><img src="/unicsul/web/img/prazo.jpg"></div></td>
    </tr>
    
    <tr>
      <td >
        <textarea rows="12" name="textor" id="textor" cols="60" style="font-family: Verdana; font-size: 8 pt">
           <%out.println(""+textor2);%>
        </textarea>
      </td>
      <td>
	    <textarea rows="12" name="textor2" id="textor2" cols="60" style="font-family: Verdana; font-size: 8 pt">
	        <%out.println(""+textor3);%>
	    </textarea>	  
	  </td>
      
      <td>  
	  
	    <p>
	      <input type="radio" id="curto" name="prazo" title="curto" value="1" checked>
	      <span class="style6">Curto Prazo</span><br>
            <%
	  if(prazo.equals("2")){
	  %>
	      <input type="radio" id="medio" name="prazo" title="medio" value="2" checked>
	      <span class="style6">Médio Prazo</span><br>
            <%}else{%>
            <input type="radio" id="medio" name="prazo" title="medio" value="2">
	        <span class="style6">Médio Prazo</span><br>
            <%}
	  if(prazo.equals("3")){
	  %>
	      <input type="radio" id="longo" name="prazo" title="longo" value="3" checked>
	      <span class="style6">Longo Prazo</span>
	      <%}else{%>
            <input type="radio" id="longo" name="prazo" title="longo" value="3">
            <span class="style6">	      Longo Prazo</span>
	      <%}
	 
	  %>
        </p>

     <p>
	    <img src="/unicsul/web/img/responsavel.jpg"><br>
	 
	      <input type="radio" id="respons" name="respons" title="Coordenação" value="1" checked>
	      <span class="style6">Coordenação</span><br>

      <%
	  if(responsavel.equals("2")){
	  %>
	      <input type="radio" id="respons" name="respons" title="Reitoria" value="2" checked>
	      <span class="style6">Reitoria</span><br>
       <%}else{%>
          <input type="radio" id="respons" name="respons" title="Reitoria" value="2">
	      <span class="style6">Reitoria</span><br>
      <%}%>
	  
      <%
	  if(responsavel.equals("3")){
	  %>
	      <input type="radio" id="respons" name="respons" title="PROGRAD" value="3" checked>
	      <span class="style6">PROGRAD</span><br>
       <%}else{%>
          <input type="radio" id="respons" name="respons" title="PROGRAD" value="3">
	      <span class="style6">PROGRAD</span><br>
      <%}%>
	  
      <%
	  if(responsavel.equals("4")){
	  %>
	      <input type="radio" id="respons" name="respons" title="PRPGP" value="4" checked>
	      <span class="style6">PRPGP</span><br>
       <%}else{%>
          <input type="radio" id="respons" name="respons" title="PRPGP" value="4">
	      <span class="style6">PRPGP</span><br>
      <%}%>
	  
      <%
	  if(responsavel.equals("5")){
	  %>
	      <input type="radio" id="respons" name="respons" title="PREAC" value="5" checked>
	      <span class="style6">PREAC</span><br>
       <%}else{%>
          <input type="radio" id="respons" name="respons" title="PREAC" value="5">
	      <span class="style6">PREAC</span><br>
      <%}%>
	  
      <%
	  if(responsavel.equals("6")){
	  %>
	      <input type="radio" id="respons" name="respons" title="Outras áreas" value="6" checked>
	      <span class="style6">Outras áreas</span><br>
       <%}else{%>
          <input type="radio" id="respons" name="respons" title="Outras áreas" value="6">
	      <span class="style6">Outras áreas</span><br>
      <%}%>
	  
      <%
	  if(responsavel.equals("7")){
	  %>
	      <input type="radio" id="respons" name="respons" title="Instituição" value="7" checked>
	      <span class="style6">Instituição</span><br>
       <%}else{%>
          <input type="radio" id="respons" name="respons" title="Instituição" value="7">
	      <span class="style6">Instituição</span><br>
      <%}%>
	  
     </p>

    </td>
    </tr>
    
    <tr>
      <th colspan="2" scope="row">
        <div align="center">
          <input type="submit" name="grava" value="Gravar Fragilidade" title="Gravar Fragilidade"  >
            <a href="/unicsul/principal?acao=ListadefragCommand" class="style11"><strong>
		    <br><br>
	    <img src="/unicsul/web/img/voltar.jpg" border="0"></strong></a></div>
		</th>
      <td><div align="center"></div></td>
    </tr>
  </table>
  
  
  
  <br><br>
  
  </form>
 </div>
   
   <br>
<br>

<table width="100%" border="0">
  <tr>
    <td width="82%" height="45"><br>
    <table width="100%" border="0" align="center" class="MenuOption2">
      <tr>
        <th height="7"><span class="style4"></span></th>
      </tr>
    </table>
    </td>
    <th width="18%" nowrap>
    		<img src="/unicsul/web/img/sm.jpg" width="50" height="40"> 
    		<img src="/unicsul/web/img/af.jpg" width="50" height="40">
    		<img src="/unicsul/web/img/lib.jpg" width="50" height="40">
    		<img src="/unicsul/web/img/pin.jpg" width="50" height="40">    
    </th>
  </tr>
</table>

 
</body>

<HEAD>
  <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</HEAD>

</html>