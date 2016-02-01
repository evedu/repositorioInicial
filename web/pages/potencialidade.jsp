<%@ page contentType="text/html" language="Java" %>

<%@ page import="java.sql.*" %>

<%@ page import="com.unicsul.dao.PotencialidadeDao" %>
<%@ page import="com.unicsul.vo.PotencialidadesVO" %>
<%@page import="java.util.ArrayList"%>

<%
response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
String gAbrevArea  = (String) session.getAttribute("AbrevArea"); 
String gCodArea  = (String) session.getAttribute("codArea");
String nomeCat  = (String) session.getAttribute("nomeCat");
String codSubCat  = (String) session.getAttribute("codSubCateg"); 
String codigoPot  = (String) session.getAttribute("CodigoPoten");
String CodigoCurso = (String) session.getAttribute("CodigoCurso");
String gNomeCurso  = (String) session.getAttribute("nomeCurso");
String textor2="", prazo="";


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
         <a class="MenuOption2" href="/unicsul/principal?acao=IdentificacaoCommand"/>Identificação</a>&nbsp;&nbsp;|
          <a class="MenuOption2" href="/unicsul/principal?acao=CategoriaCommand"/>Dimensões</a>&nbsp;&nbsp;|
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
    
  <table width="100%" cellpadding="0" cellspacing="0">
    <tr>
      <th width="6%" nowrap> <div align="right"><img border="0" src="/unicsul/web/img/seta.jpg"> </div></th>
      <td width="94%" height="32">
        <p align="left" class="style2">
        	<font face=Verdana>Categoria: <%=nomeCat%></font>        </p>      </td>
      
    </tr>    
  </table></table>
  
  <br>
<br>

  <div align="center">
   
   
  <%
  
////////////////////////////////////pega a potencialidade e joga na textarea////////////////////////
  
  
  
  
	try{
  
  	
	  	PotencialidadeDao potencDao = new PotencialidadeDao();
	  	ArrayList listaPotenc = potencDao.potencialidade(codSubCat,codigoPot,CodigoCurso);
	  	PotencialidadesVO potVO = new PotencialidadesVO();
		
	  	for(int i=0;i<listaPotenc.size();i++ ) { 
	  		potVO = (PotencialidadesVO) listaPotenc.get(i);
	  	
	  		textor2=""+potVO.getTextoProposta();
	  		prazo=""+potVO.getTipoPot();
		
		}
	   
	   listaPotenc.clear();
	   listaPotenc = null;
	   potVO = null;
	   potencDao = null;	  	

	}//do try
	
	catch (Exception e) {  out.print("<p>" + e.getMessage() +  "</p>");}
			
			

////////////////////////////////////fim////////////////////////

%>
	
	  <form action="/unicsul/principal?acao=GravaCommand" method="post" runat="server">
	    <table width="925" border="0">
          <tr>
            <th width="825" scope="row"><div align="left"> <img src="/unicsul/web/img/potencialidades.jpg"></div></th>
            <td width="90"><div align="left"><img src="/unicsul/web/img/tipo.jpg"></div></td>
          </tr>
          <tr>
            <td width="825"><div align="left">
                <textarea rows="12" name="textor" id="textor" cols="118" style="font-family: Verdana; font-size: 8 pt"><%out.println(""+textor2);%>
        </textarea>
                <br>
                
              </div>
                <center>
                  <input type="submit" name="grava" value="Gravar Potencialidade"  title="Gravar Potencialidade"  >
                
                  <br><div align="center"><a href="/unicsul/principal?acao=ListadepotCommand" class="style11"><strong><img src="/unicsul/web/img/voltar.jpg" border="0"></strong></a></div>
              </center></td>
            <td><p>
                <input type="radio" id="Forte" name="prazo" title="Forte" value="Forte" checked>
                <span class="style6">Forte</span><br>
                <%
	  if(prazo.equals("Medio")){
	  %>
                <input type="radio" id="Medio" name="prazo" title="Medio" value="Medio" checked>
                <span class="style6">Média</span><br>
                <%}else{%>
                <input type="radio" id="Medio" name="prazo" title="Medio" value="Medio">
                <span class="style6">Média</span><br>
                <%}
	 
	 
	  %>
              </p>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p>&nbsp; </p></td>
          </tr>
        </table>
	    <br>
	    <br>

 	
  
  

  	 	
   </form>
   
 </div>
  
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