<%@ page contentType="text/html" language="Java" %>

<%@ page import="java.sql.*" %>

<%@ page import="com.unicsul.dao.CategoriasDao" %>
<%@ page import="com.unicsul.vo.CategoriasVO" %>
<%@ page import="com.unicsul.dao.SubCategoriasDao" %>
<%@ page import="com.unicsul.vo.SubCategoriasVO" %>
<%@ page import="com.unicsul.dao.CategPotDao" %>
<%@ page import="com.unicsul.vo.PotencialidadesVO" %>
<%@page import="java.util.ArrayList"%>

<%
response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
String gAbrevArea  = (String) session.getAttribute("nomeColab"); 
String gCodArea  = (String) session.getAttribute("codArea");
String gNomeCurso  = (String) session.getAttribute("nomeCurso");
	 	   
if(session.getAttribute("permissao")!=null){
	String perm = (String) session.getAttribute("permissao");
	int permissao  = Integer.parseInt(perm);
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
      
    </tr>
    
  </table>
  <p align="center"><img src="/unicsul/web/img/resumos_pot.jpg" border="0"></p>
  <p align="center">&nbsp;</p>
<div align="center">

<table width="97%" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"> 
      
      
  
  <%
///////pega os dados das categorias e joga num vetor////////
  String vet[]=new String[9];
  CategoriasDao categoriaDao = null;
  ArrayList listaCateg = null;
  CategoriasVO categoriaVO = null;
  
  
  try {
	  	categoriaDao = new CategoriasDao();
	  	listaCateg = categoriaDao.Categorias();
		categoriaVO = new CategoriasVO();
		
		
		for(int i=0;i<listaCateg.size();i++ ) { 
			categoriaVO = (CategoriasVO) listaCateg.get(i);
	 
	  
		    vet[i]=""+categoriaVO.getCategoria();
		  
	  	}
  }//do try
  
  catch (Exception e) { out.print("" + e.getMessage()); }
  finally{
    categoriaDao = null;
    if(listaCateg!=null)listaCateg.clear();
    listaCateg = null;
    categoriaVO = null;
  }
  


 
  
  
///////Resumo de todas as potencialidades////////
  
  String auxSubCat="";
  int  contador=1;
 
	  CategPotDao potDao = new CategPotDao();
	  ArrayList listaPot = null;
	  PotencialidadesVO potsVO = new PotencialidadesVO();
  
  try{
		
	  for(contador=1;contador<=9;contador++){	
				  
					 %><tr><th colspan="3" scope="row" class="style15" ><%out.println(""+vet[contador-1]);%></th></tr>
					 <tr bgcolor="#FFFFFF"><th colspan="3" scope="row">&nbsp; </th>
</tr>
					 <% 
				  
					 
					 
				///////pega os dados das subcategorias e joga num vetor////////
					  
					   String aux=""+contador;
					  
						  	SubCategoriasDao subCategoriaDao = new SubCategoriasDao();
						  	ArrayList listaSubCateg = subCategoriaDao.SubCategorias(aux);
							SubCategoriasVO subCategoriaVO = new SubCategoriasVO();
					  try {
							
							
							for(int i=0;i<listaSubCateg.size();i++ ) { 
								subCategoriaVO = (SubCategoriasVO) listaSubCateg.get(i);
						 	  
								 %><tr><th colspan="3" scope="row" class="style19" ><%out.println(subCategoriaVO.getDescricao());%></th></tr><% 
							    auxSubCat = subCategoriaVO.getCodSubCategoria();
							    %>
							    
							    
								   <tr bgcolor="#EEEEEE"><td width="71" class="style3"><div align="center">Curso</div></td>
			   						 <td width="578" class="style3"><div align="center">Potencialidade</div></td>
			    					<td width="15%" class="style3"><div align="center">Tipo</div></td></tr>
								 
								 <% 
								 
								 
								 if(listaPot!=null)listaPot.clear();
								 listaPot = potDao.CategPot(auxSubCat);
									
								 	
							 		for(int i2=0;i2<listaPot.size();i2++ ) { 
										
											potsVO = (PotencialidadesVO) listaPot.get(i2); 
										
								  
						
											  %>
										      <tr>
										          
										  			<td bgcolor="#FFFFFF" class="style17"><div align="center">
										  			  <%out.println(""+potsVO.getAbrevCurso());%>
									  			    </div></td>
										  
										 			<td bgcolor="#FFFFFF" class="style17"><%out.println(""+potsVO.getTextoProposta());%></td>
										 			<td bgcolor="#FFFFFF" class="style17"><div align="center">
                                                      <%
													  if(potsVO.getTipoPot().trim().equals("Medio"))
													    out.println("Média");
														else out.println("Forte");
													  %>
								 			    </div></td>
										      </tr>
										     
										  	 	
										<%
								 	}%><tr><th colspan="4" scope="row">&nbsp;</th></tr><%
								 
								 
								 
								 
						  	}
					  }//do try
					  
					  catch (Exception e) {  out.print("" + e.getMessage()); }
					  finally{
						  	if(listaSubCateg != null)listaSubCateg.clear();
						  	listaSubCateg = null;
						  	subCategoriaDao = null;
							subCategoriaVO = null;
					  }
				///fim///////////////////////////////////////
				
					
					 
					 	%>
						
								  <%
				
			  }//fim do for	
				
		  }//do try
  	
		  catch (Exception e) {  out.print("" + e.getMessage()); }
		  finally{
	         if(listaPot != null)listaPot.clear();
	         listaPot = null;
	         potDao = null;
	         potsVO = null;
		  }
  	
		
  
%>
    </table>
   
  </div>
  
  <br>
<br>
<table width="100%" border="0">
  <tr>
    <td><div align="center"><a href="/unicsul/principal?acao=ResumosCommand" class="style11"><strong><img src="/unicsul/web/img/voltar.jpg" border="0"></strong></a></div></td>
  </tr>
</table><br>

  
   
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