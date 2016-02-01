<%@ page contentType="text/html" language="Java" %>

<%@ page import="java.sql.*" %>
<%@ page import="com.unicsul.dao.SubCategoriasDao" %>
<%@ page import="com.unicsul.vo.SubCategoriasVO" %>
<%@ page import="com.unicsul.dao.ListadepotDao" %>
<%@ page import="com.unicsul.vo.PotencialidadesVO" %>
<%@page import="java.util.ArrayList"%>

<%
response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
String gAbrevArea  = (String) session.getAttribute("AbrevArea"); 
String gCodArea  = (String) session.getAttribute("codArea");
String codSubCat  = (String) session.getAttribute("codSubCateg"); 
String CodigoCurso = (String) session.getAttribute("CodigoCurso");
String gNomeCurso  = (String) session.getAttribute("nomeCurso");
	
int CodCurso = 0;
if(session.getAttribute("CodigoCurso")!=null){
	CodCurso = Integer.parseInt(CodigoCurso);
}

String nomeCat="";



///////////pega o nome da categoria e joga na sessao////////////////////////
try {

SubCategoriasDao subDao = new SubCategoriasDao();
ArrayList listaSub = subDao.SubCategorias2(codSubCat);
SubCategoriasVO subCatVO = new SubCategoriasVO();

for(int i=0;i<listaSub.size();i++ ) { 
subCatVO = (SubCategoriasVO) listaSub.get(i);

nomeCat=subCatVO.getDescricao();


}

listaSub.clear();
listaSub = null;
subDao = null;
subCatVO = null;

}//do try

catch (Exception e) {out.print("<p>" + e.getMessage() +  "</p>"); }


session.setAttribute("nomeCat", nomeCat);
////////////////////////////////////////////////////////////




%>
 

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
<title>Usuário: <%=gAbrevArea%> - UNICSUL - Avaliação Institucional</title>


<link rel="StyleSheet" href="/unicsul/web/css/default_unicsul.css"/>

<style type="text/css">
<!--
.style2 {
	font-size: 11px;
	font-weight: bold;
}
.style4 {font-family: Verdana, Arial, Helvetica, sans-serif}
.style5 {
	font-size: 9px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style7 {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
}
-->
</style>
<script language=JavaScript>
   function selDeleta(codPot,contador){
  	  document.frmPerg2.codigoPot.value=codPot;
  	  document.frmPerg2.cont.value=contador;
      if(confirm("Deseja deletar a potencialidade?")==true){
	  
	      document.frmPerg2.submit();
	  }
  }

  function selPotencialidade(codPot,contador){
  	  document.frmPerg3.codigoPot.value=codPot;
  	  document.frmPerg3.cont.value=contador;
      document.frmPerg3.submit();
  }
</script>
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
  </table>
  <table width="100%" cellpadding="0" cellspacing="0">
    <tr>
      <th width="6%" nowrap> <div align="right"><img border="0" src="/unicsul/web/img/seta.jpg"> </div></th>
      <td width="94%" height="32">
        <p align="left" class="style2">
        	<font face=Verdana>Categoria: <%=nomeCat%></font>        </p>      </td>
      
    </tr>    
  </table>
  <p align="center"><img src="/unicsul/web/img/potencialidades.jpg"></p>
<div align="center">

   <p align="center"><span class="style7">Clique no texto de uma potencialidade  para edit&aacute;-la ou no &iacute;cone da coluna ‘Excluir' para elimin&aacute;-la. <br>
  O bot&atilde;o 'Inserir nova' permite inserir uma nova potencialidade para esta categoria. </span></p>

    <table width="80%" border="1" cellpadding="0" cellspacing="0"> 
      
      <tr bgcolor="#2A70BF">
	  <td width="85%" height="28" ><div align="center"><span class="style11"> <font face=Verdana size=1><center>Potencialidades</center></font></span></div></td> 
      <td width="15%" height="28" ><div align="center"><span class="style11"> <font face=Verdana size=1><center>Excluir</center></font></span></div></td> 
    
 
  
  <%
  //////////////////codPot identifica a ultima potencialidade e soma 1/////////
  int codPot=0, a1=0, a2=3, a4=1;
  

  
  
  try{
  
////////////////////////////////////pega as potencialidades e joga na table////////////////////////
  
 
			ListadepotDao potDao = new ListadepotDao();
		  	ArrayList listaPot = potDao.Listadepot(codSubCat,CodCurso);
		  	PotencialidadesVO potVO = new PotencialidadesVO();
 			
		  	for(int i=0;i<listaPot.size();i++ ) { 
		  		potVO = (PotencialidadesVO) listaPot.get(i);
		  	
				codPot=potVO.getCodPotencialidade()+1;
				
//////////o if verifica se foi cadastrado pelo usuario ou por outro da mesma area///////
//////////se for dele ele pode alterar/////////
//////////senão ele só pode ver///////////
				String aux_Login = ""+ potVO.getLogin();
				if((potVO.getSenha().equals(session.getAttribute("senhaID2")) && session.getAttribute("loginID2").equals(aux_Login))|| (permissao==10 || permissao==1) ){
			 	

			 	%>
      <tr>
			          
			  		<td bgcolor="#FFFFFF" height="28" class="style13" style="cursor:pointer;" title="clique" onClick="selPotencialidade(<%=potVO.getCodPotencialidade()%>,<%=a1 %>);"><font color="blue">
			  		
			  		
			  		 <%    
						out.println(""+potVO.getTextoProposta()+"");
					%>
			  		
			 		<td bgcolor="#FFFFFF" height="28" class="style13" style="cursor:pointer;" title="clique" onClick="selDeleta(<%=potVO.getCodPotencialidade()%>,<%=a2 %>);"><%out.println("<center><img src='/unicsul/web/img/error.jpg' border='0'></center>");%></td>
			  
      </tr>
			   	<%}else{%>
			   
			      <tr>
			      
			  		<td  bgcolor="#FFFFFF" height="28" class="style13"><%out.println("<center>"+potVO.getTextoProposta()+"</center>");%></td>
			  
			 		<td  bgcolor="#FFFFFF" height="28" class="style13"><div align='center'><center><img src='/unicsul/web/img/error2.jpg' border='0'></center></td>
			  			 
			      </tr>
			      
			      
			  <%}

}

listaPot.clear();
listaPot = null;
potDao = null;
potVO = null;

}//do try

catch (Exception e) {  out.print("<p>" + e.getMessage() +  "</p>");}

//////aqui ele ve se o codPot é zero, se for ele altera para 1////
//////sera a 1º potencialidade da categoria////
if(codPot==0){
	codPot=1;
}

%>
    </table>
   
</div>
  

<br>
  	<center><input type="submit" name="novo" value="Inserir Nova"  title="Nova Potencialidade"  style="cursor:pointer;" title="clique" onclick="selPotencialidade(<%=codPot%>,<%=a4 %>);"></center>

   
<form name="frmPerg3" method="post" action="/unicsul/principal?acao=PotencialidadeCommand" runat="server">
      <input type=hidden name=codigoPot size=10>
      <input type=hidden name=cont size=10>
</form>	

<form name="frmPerg2" method="post" action="/unicsul/principal?acao=DeletaCommand" runat="server">
      <input type=hidden name=codigoPot size=10>
      <input type=hidden name=cont size=10>
</form>	
  <br>

<table width="100%" border="0">
  <tr>
    <td><div align="center"><a href="/unicsul/principal?acao=CategoriaCommand" class="style11"><strong><img src="/unicsul/web/img/voltar.jpg" border="0"></strong></a></div></td>
  </tr>
</table>
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