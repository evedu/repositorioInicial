<%@ page contentType="text/html" language="Java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.unicsul.dao.SubCategoriasDao" %>
<%@ page import="com.unicsul.vo.SubCategoriasVO" %>
<%@ page import="com.unicsul.dao.CategoriasDao" %>
<%@ page import="com.unicsul.vo.CategoriasVO" %>
<%@page import="java.util.ArrayList"%>

<%
	response.addHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	String codigoCategoria  = (String) request.getParameter("codigoCategoria"); 
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
<table border="1" cellpadding="0" cellspacing="0"> 
<%
      String categ="";
      ///////////Categoria///////////////////
      try{
	  
		  CategoriasDao categoriasDao = new CategoriasDao();
		  	ArrayList listaCategorias = categoriasDao.Categorias2(codigoCategoria);
		 	CategoriasVO categoriasVO = new CategoriasVO();
			for(int i=0;i<=listaCategorias.size();i++ ) { 
				categoriasVO = (CategoriasVO) listaCategorias.get(i);
		     	categ =""+ categoriasVO.getCategoria(); 
			}
	  }//do try
      catch (Exception e) { }
      %>
        	<td width=403 height="28" bgcolor="#2A70BF" ><div align="center" class="style12"><font face=Verdana size=1>Categorias de<b>
       	    	<%// out.print(" "+categ); %>	<% out.print(" "+categ); %>
      	  	</b></font></div></td> 
	 		<td bgcolor="#2A70BF" class="style13" width=100 height="28"><div align="left" class="style12">
	      	  <div align="center"><font face=Verdana size=1>Fragilidades</font></div>
	      	</div></td> 
	  		<td bgcolor="#2A70BF" class="style13" width=100 height="28"><div align="left" class="style12">
	  		  <div align="center"><font face=Verdana size=1>Potencialidades</font></div>
	  		</div></td> 
  <%
      ///////////Subcategorias///////////////
	  try{
		  	SubCategoriasDao subcategoriasDao = new SubCategoriasDao();
		  	ArrayList listaSubCategorias = subcategoriasDao.SubCategorias(codigoCategoria);
		 	SubCategoriasVO subcategoriasVO = new SubCategoriasVO();
			for(int i=0;i<=listaSubCategorias.size();i++ ) { 
				subcategoriasVO = (SubCategoriasVO) listaSubCategorias.get(i);
			%>
				<tr>
					<td  bgcolor="#FFFFFF" height="28" class="style13"><%out.print(""+subcategoriasVO.getDescricao());%></td>
					<td  bgcolor="#FFFFFF" class="style13"><%out.println("<a href='/unicsul/principal?acao=ListadefragCommand&codCat="+subcategoriasVO.getCodSubCategoria()+"'><div align='center'><img src='/unicsul/web/img/add.jpg' border='0'></a>");%></td>
					<td  bgcolor="#FFFFFF" class="style13"><%out.println("<a href='/unicsul/principal?acao=ListadepotCommand&codCat="+subcategoriasVO.getCodSubCategoria()+"'><div align='center'><img src='/unicsul/web/img/check.jpg' border='0'></a>");%></td>
				</tr>
			<%}
	  }//do try
      catch (Exception e) { }
%>
    </table>
</body>
</html>