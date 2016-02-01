<%@ page contentType="text/html" language="Java" %>

<%@ page import="java.sql.*" %>

<%@ page import="com.unicsul.dao.CategoriasDao" %>
<%@ page import="com.unicsul.vo.CategoriasVO" %>
<%@ page import="com.unicsul.dao.SubCategoriasDao" %>
<%@ page import="com.unicsul.vo.SubCategoriasVO" %>
<%@ page import="com.unicsul.dao.CategFragDao" %>
<%@ page import="com.unicsul.vo.FragilidadesVO" %>
<%@page import="java.util.ArrayList"%>

<%
response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
String gAbrevArea  = (String) session.getAttribute("nomeColab"); 
String gCodArea  = (String) session.getAttribute("codArea");
String gNomeCurso  = (String) session.getAttribute("nomeCurso");
	 

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
if(session.getAttribute("permissao")!=null){
	String perm = (String) session.getAttribute("permissao");
	int permissao  = Integer.parseInt(perm);
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


  <p align="center"><img src="/unicsul/web/img/resumos_frag.jpg" border="0"></p>


<center>
<table width="97%" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" > 
            
 
  
  <%
///////pega os dados das categorias e joga num vetor////////
  String vet[]=new String[9];
  
  
  try {
	  	CategoriasDao categoriaDao = new CategoriasDao();
	  	ArrayList listaCateg = categoriaDao.Categorias();
		CategoriasVO categoriaVO = new CategoriasVO();
		
		
		for(int i=0;i<listaCateg.size();i++ ) { 
			categoriaVO = (CategoriasVO) listaCateg.get(i);
	 
	  
		    vet[i]=""+categoriaVO.getCategoria();
		  
	  	}
  }//do try
  
  catch (Exception e) { out.print("" + e.getMessage()); }


 
  
  
///////Resumo de todas as fragilidades////////
  
  String auxSubCat="";
  int  contador=1;
 
 	  CategFragDao fragDao = new CategFragDao();
	  ArrayList listaFrag = null;
	  FragilidadesVO fragsVO = new FragilidadesVO();
  
  try{
		
	  for(contador=1;contador<=9;contador++){	
				  
					 %><tr width="100%" ><th width="100%" colspan="5" scope="row" class="style15" ><%out.println(""+vet[contador-1]);%></th></tr>
					 <tr width="100%" bgcolor="#FFFFFF"><th width="100%" colspan="5" scope="row">&nbsp; </th>
                      </tr>
					 <% 
				  
					 
					 
				///////pega os dados das subcategorias e joga num vetor////////
					  
					   String aux=""+contador;
					   SubCategoriasDao subCategoriaDao = null;
					   ArrayList listaSubCateg = null;
					   SubCategoriasVO subCategoriaVO = null;
					  
					  try {
						  	subCategoriaDao = new SubCategoriasDao();
						  	listaSubCateg = subCategoriaDao.SubCategorias(aux);
							subCategoriaVO = new SubCategoriasVO();
							
							
							for(int i=0;i<listaSubCateg.size();i++ ) { 
								subCategoriaVO = (SubCategoriasVO) listaSubCateg.get(i);
						 	  
								 %><tr><th  width="100%" colspan="5" scope="row" class="style19" ><%out.println(subCategoriaVO.getDescricao());%></th></tr><% 
							    auxSubCat = subCategoriaVO.getCodSubCategoria();
							    %>
							    
							    
								   <tr width="100%" bgcolor="#EEEEEE">
								       <td width="5%" class="style3"><div align="center">Curso</div></td>
									   <td width="45%" class="style3"><div align="center">Fragilidade</div></td>
				   					   <td width="35%" class="style3"><div align="center">Proposta</div></td>
								       <td width="6%" class="style3"><div align="center">Prazo</div></td>
								       <td width="9%" class="style3"><div align="center">Responsável</div></td>
								  </tr>
								<% 
								 
								 
								if(listaFrag!=null)listaFrag.clear(); 								 
								listaFrag = fragDao.CategFrag(auxSubCat);
									
								 	
							 		for(int i2=0;i2<listaFrag.size();i2++ ) { 
										
											fragsVO = (FragilidadesVO) listaFrag.get(i2); 
										
								  
						
											  %>
										      <tr  width="100%" >
										          
										  			
								    <td width="5%" bgcolor="#FFFFFF" class="style17">
									<div align="center">
								      <%out.println(""+fragsVO.getAbrevCurso());%>
							        </div>
									</td>
									  
								    <td width="45%" bgcolor="#FFFFFF" class="style17"><%out.println(""+fragsVO.getTextoFragilidade());%></td>
									  
								    <td width="35%" bgcolor="#FFFFFF" class="style17"><%out.println(""+fragsVO.getProposta());%></td>
									  
								    <%if(fragsVO.getPrazo()==1){ %>
								  		  <td width="6%" bgcolor="#FFFFFF" class="style17"><center><%out.println("Curto");%></center></td>
								    <%}else if (fragsVO.getPrazo()==2){ %>
								 		  <td width="6%" bgcolor="#FFFFFF" class="style17"><center><%out.println("Médio");%></center></td>
								    <%}else if(fragsVO.getPrazo()==3){ %>
								 		  <td width="6%" bgcolor="#FFFFFF" class="style17"><center><%out.println("Longo");%></center></td>
								    <%} %>
    								    <%
									  String strResp="---";
									  if(fragsVO.getResponsavel()!=null){
									  int rr = Integer.parseInt("" + fragsVO.getResponsavel());
									  switch(rr){ 
									    case 1:
										    strResp="Coordenação";
										    break;
									    case 2:
										    strResp="Reitoria";
										    break;
									    case 3:
										    strResp="PROGRAD";
										    break;
									    case 4:
										    strResp="PRPGP";
										    break;
									    case 5:
										    strResp="PREAC";
										    break;
									    case 6:
										    strResp="Outras áreas ou setores";
										    break;
									    case 7:
										    strResp="Instituição";
										    break;
									    default:
										    strResp="---";
									  }
									  }
									%>
								    
									<td width="9%" bgcolor="#FFFFFF" class="style17"><div align="center"><%=strResp%></div></td>

	
	                           </tr>
										     
										  	 	
										<%
								 	}%><tr width="100%" ><th width="100%" colspan="5" scope="row">&nbsp;</th></tr><%
								 
								 
								 
								 
						  	}
					  }//do try
					  
					  catch (Exception e) { 
					    out.print("" + e.getMessage()); 
					  }
					  finally {
	                        listaSubCateg.clear();
							listaSubCateg = null;
	                        subCategoriaVO = null;
	                        subCategoriaDao = null;
					  }
				
					
					 
					 
				
			  }//fim do for	
				
		  }//do try
  	
		  catch (Exception e) { }
		  finally{
			listaFrag.clear();
	        listaFrag = null;
	        fragDao = null;
            fragsVO = null;
		  }
  	
		
  
%>
    </table>
   </center>

  
  


  <br>
 <table width="100%" border="0">
  <tr>
    <td><div align="center"><a href="/unicsul/principal?acao=ResumosCommand" class="style11"><strong><img src="/unicsul/web/img/voltar.jpg" border="0"></strong></a></div></td>
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