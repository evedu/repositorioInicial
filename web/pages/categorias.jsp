<%@ page contentType="text/html" language="Java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.unicsul.dao.CategoriasDao" %>
<%@ page import="com.unicsul.vo.CategoriasVO" %>
<%@ page import="com.unicsul.dao.SubCategoriasDao" %>
<%@ page import="com.unicsul.vo.SubCategoriasVO" %>
<%@page import="java.util.ArrayList"%>

<%
	response.addHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	String gAbrevArea  = (String) session.getAttribute("AbrevArea"); 
	String gCodArea  = (String) session.getAttribute("codArea"); 
	String gNomeCurso  = (String) session.getAttribute("nomeCurso"); 
%>
 
<html>
<head>
	<script type="text/javascript" src="/unicsul/web/js/ajax.js"></script>
	<script type="text/javascript" src="/unicsul/web/js/limpaSubcategorias.js"></script>
	<link rel="StyleSheet" href="/unicsul/web/css/default_unicsul.css"/>
	<LINK REL="SHORTCUT ICON" HREF="http://200.136.79.7:8080/cpa/avl/aval.ico">
	<title>Usuário: <%=gAbrevArea%> - UNICSUL - Avaliação Institucional</title>
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
	<%	}%>
	
<script language=JavaScript>
  function selFragilidade(codigo2){
  	  document.frmPerg.codCat.value=codigo2;
      document.frmPerg.submit();
  }
  function selPotencialidade(codigo2){
  	  document.frmPerg2.codCat.value=codigo2;
      document.frmPerg2.submit();
  }
</script>
	
<style type="text/css">
<!--
.style7 {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
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
		<th width="3%" nowrap> <div align="right">
			<div><img border="0" src="/unicsul/web/img/seta.jpg"></div>
		</th>
		<td width="97%" height="32">
			<p align="left" class="style2">
				<font face=Verdana>Curso: <%=gNomeCurso%></font>        
			</p>
		</td>
	</tr>
</table>
<p align="center"><img src="/unicsul/web/img/dimensoes.jpg" border="0"></p>
<div align="center"> 
	<table border="1" cellpadding="0" cellspacing="0" bgcolor="#666666"> 
		<div align="center">
			<td bgcolor="#2A70BF" class="style13" width=603 height="28">
				<div align="left" class="style12">
				
					<font face=Verdana size=1>Dimensões utilizadas na Avaliação da Graduação</font>
				</div>
			</td>
		</div> 
	 	<%
		 try{
				CategoriasDao categoriasDao = new CategoriasDao();
		  		ArrayList listaCategorias = categoriasDao.Categorias();
		  		CategoriasVO categoriasVO = new CategoriasVO();
				for(int i=0;i<=listaCategorias.size();i++ ) { 
					categoriasVO = (CategoriasVO) listaCategorias.get(i);
				%>
				    <tr>
						<td bgcolor="#FFFFFF" class="style13">
							<%out.println("<a href=javascript:limpaSubcategorias('"+categoriasVO.getCodigo()+"','"+listaCategorias.size()+"');>"+categoriasVO.getCategoria()+"</a>");%>
							
						</td>
					</tr>
				    <tr id="<%=categoriasVO.getCodigo()%>" name="<%=categoriasVO.getCodigo()%>" style = "display:none">
						<td>
							<table border="1" cellpadding="0" cellspacing="0"  > 
					        	<td width="403" height="28" bgcolor="#2A70BF" >
					        		<div align="center" class="style12">
					        			<font face=Verdana size="1">Categorias de<b><% out.print(" "+categoriasVO.getCategoria()); %></b></font>
					        		</div>
					        	</td> 
						 		<td bgcolor="#2A70BF" class="style13" width="100" height="28">
						 			<div align="left" class="style12">
							      		<div align="center">
							      			<font face="Verdana" size="1">Fragilidades</font>
							      		</div>
							      	</div>
						      	</td> 
						  		<td bgcolor="#2A70BF" class="style13" width="100" height="28">
						  			<div align="left" class="style12">
						  				<div align="center">
						  					<font face=Verdana size="1">Potencialidades</font>
						  				</div>
						  			</div>
						  		</td> 
							  <%
							    // Carrega as subCategorias de acordo com o codigoda Categoria
								  try{
									  	SubCategoriasDao subcategoriasDao = new SubCategoriasDao();
									  	ArrayList listaSubCategorias = subcategoriasDao.SubCategorias(categoriasVO.getCodigo());
									 	SubCategoriasVO subcategoriasVO = new SubCategoriasVO();
										for(int j=0;j<=listaSubCategorias.size();j++ ) { 
											subcategoriasVO = (SubCategoriasVO) listaSubCategorias.get(j);%>
											<tr>
												<td  bgcolor="#FFFFFF" height="28" class="style13"><%out.print(""+subcategoriasVO.getDescricao());%></td>
												<td  bgcolor="#FFFFFF" class="style13" style="cursor:pointer;" title="clique" onClick="selFragilidade(<%=subcategoriasVO.getCodSubCategoria()%>);"><%out.println("<div align='center'><img src='/unicsul/web/img/add.jpg' border='0'>");%></td>
												<td  bgcolor="#FFFFFF" class="style13" style="cursor:pointer;" title="clique" onClick="selPotencialidade(<%=subcategoriasVO.getCodSubCategoria()%>);"><%out.println("<div align='center'><img src='/unicsul/web/img/check.jpg' border='0'>");%></td>
											</tr>
										<%}// do for
								  }//do try
							      catch (Exception e) { }
								%>
							</table>
						</td>			      
					</tr>
				<%}
		}catch (Exception e) { }%>
	</table>
    <p><span class="style7">Clique na dimens&atilde;o  e logo ap&oacute;s no &iacute;cone de fragilidade ou potencialidade da categoria desejada. </span></p>
</div>

<form name="frmPerg2" method="post" action="/unicsul/principal?acao=ListadepotCommand" runat="server">
      <input type=hidden name=codCat size=10>
</form>	

<form name="frmPerg" method="post" action="/unicsul/principal?acao=ListadefragCommand" runat="server">
      <input type=hidden name=codCat size=10>
</form>	<br>
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
</html>