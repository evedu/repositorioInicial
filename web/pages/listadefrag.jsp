<%@ page contentType="text/html" language="Java" %>

<%@ page import="java.sql.*" %>
<%@ page import="com.unicsul.dao.SubCategoriasDao" %>
<%@ page import="com.unicsul.vo.SubCategoriasVO" %>
<%@ page import="com.unicsul.dao.ListadefragDao" %>
<%@ page import="com.unicsul.vo.FragilidadesVO" %>
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
try{

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

catch (Exception e) { out.print("<p>" + e.getMessage() +  "</p>"); }


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


<link rel="StyleSheet" href="/unicsul/web/css/default_unicsul.css">

<style type="text/css">
<!--
.style2 {
	font-size: 11px;
	font-weight: bold;
}
.style7 {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
}
.style8 {color: #333333}
-->
</style>

<script language="javascript" type="text/javascript">
  function selDeleta(codFrag,contador){
  	  document.frmPerg2.codigoFrag.value=codFrag;
  	  document.frmPerg2.cont.value=contador;
  	  if(confirm("Deseja deletar a fragilidade?")==true){
	  
	      document.frmPerg2.submit();
	  }
  }

  function selFragilidade(codFrag,contador,maiorFrag){
  	  document.frmPerg3.codigoFrag.value=codFrag;
  	  document.frmPerg3.cont.value=contador;
  	  document.frmPerg3.maiorFrag.value=maiorFrag;
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
			<script language="javascript" type="text/javascript">
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
        	<font face=Verdana>Curso: <%=gNomeCurso%></font>        </p>      </td>
      
    </tr>
    
  </table>
  <table width="100%" cellpadding="0" cellspacing="0">
    <tr>
      <th nowrap> <div align="right"><img border="0" src="/unicsul/web/img/seta.jpg"> </div></th>
      <td width="94%" height="32">
        <p align="left" class="style2">
        	<font face=Verdana>Categoria: <%=nomeCat%></font>        </p>      </td>
      
    </tr>    
  </table>
  <p align="center"><img src="/unicsul/web/img/fragilidades.jpg"></p>
  <div align="center">

  <p align="center">
  <span class="style7">Clique no texto de uma fragilidade para editá-la ou nos ícones para adicionar uma nova proposta para essa mesma fragilidade ou para eliminar uma proposta.  
  <br>
O botão 'Inserir nova' permite inserir uma nova fragilidade para esta categoria. 
</span>
</p>  
    <table width="80%" border="1" cellpadding="0" cellspacing="0"> 
      
      <tr bgcolor="#2A70BF">
	  <td height="66%" colspan="2"><div align="center"><span class="style11"> <font face=Verdana size=1><center>Fragilidades</center></font></span></div></td>
	  <td width="17%" height="28" ><div align="center"><span class="style11"> <font face=Verdana size=1><center>Adicionar Proposta</center></font></span></div></td> 
      <td width="17%" height="28" ><div align="center"><span class="style11"> <font face=Verdana size=1><center>Excluir</center></font></span></div></td> 
       </tr>

 
  
  <%
  //////////////////codFrag identifica a ultima fragilidade e soma 1/////////
  
  int codFrag=0, a1=0, a2=4, a4=1, a5=5, maiorFrag=0;
  
  try{
	  	ListadefragDao fragDao2 = new ListadefragDao();
	  	ArrayList listaFrag2 = fragDao2.Listadefrag(codSubCat,CodCurso);
	  	FragilidadesVO fragVO2 = new FragilidadesVO();
		
	  	for(int i=0;i<listaFrag2.size();i++ ) { 
	  		fragVO2 = (FragilidadesVO) listaFrag2.get(i);
	  
	  		maiorFrag = fragVO2.getCodfragilidade()+1;
	  	}
		
        listaFrag2.clear();
        listaFrag2 = null;
        fragDao2 = null;
        fragVO2 = null;
		
	}
	catch (Exception e) {  out.print("<p>" + e.getMessage() +  "</p>");}
	
  
  try{
    	
////////////////////////////////////pega as fragilidades e joga na table////////////////////////
  			ListadefragDao fragDao = new ListadefragDao();
		  	ArrayList listaFrag = fragDao.Listadefrag(codSubCat,CodCurso);
		  	FragilidadesVO fragVO = new FragilidadesVO();
 			
		  	for(int i=0;i<listaFrag.size();i++ ) { 
		  		fragVO = (FragilidadesVO) listaFrag.get(i);
		  	
				codFrag=fragVO.getCodfragilidade()+1;
     		
//////////o if verifica se foi cadastrado pelo usuario ou por outro da mesma area///////
//////////se for dele ele pode alterar/////////
//////////senão ele só pode ver///////////  
  
    			
				if((fragVO.getSenha().equals(session.getAttribute("senhaID2")) && fragVO.getLogin().equals(session.getAttribute("loginID2"))) || (permissao==10 || permissao==1) ){
	 	
	 	%>
      <tr>
	          
	  				  
			<td height="14" colspan="2" bgcolor="#FFFFFF" class="style13" style="cursor:pointer;" title="clique" onClick="selFragilidade(<%=fragVO.getCodfragilidade()%>,<%=a1 %>,<%=maiorFrag %>);">
			<font color="blue">
				<%
						out.println(fragVO.getTextoFragilidade());
					
					%>
			</font>
			</td>
			
			<td height="28" rowspan="2" bgcolor="#FFFFFF" class="style13" style="cursor:pointer;" title="clique" onClick="selFragilidade(<%=fragVO.getCodfragilidade()%>,<%=a5%>,<%=maiorFrag %>);"><font color="blue"><%out.println("<center><img src='/unicsul/web/img/add.jpg' border='0'></center>");%></font>
			</td>

			  
			<td height="28" rowspan="2" bgcolor="#FFFFFF" class="style13" style="cursor:pointer;" title="clique" onClick="selDeleta(<%=fragVO.getCodfragilidade()%>,<%=a2 %>);"><%out.println("<center><img src='/unicsul/web/img/error.jpg' border='0'></center>");%>
			</td>
      </tr>
	  
      <tr>
        <td width="432" bgcolor="#FFFFFF" class="style13" style="cursor:pointer;border-style:none;" title="clique" onClick="selFragilidade(<%=fragVO.getCodfragilidade()%>,<%=a1 %>,<%=maiorFrag %>);">
			<%
              out.print("Proposta:" + fragVO.getProposta()+"");
    		%>       
     </td>
      </tr>
	   	<%}else{%>
	   
	      <tr>
	          
	  		<td height="14" colspan="2" bgcolor="#FFFFFF" class="style13">
			<font color="blue">
	  		<%    
						out.println(fragVO.getTextoFragilidade());
					
					
					%>
            </font>
			</td>
			
			<td height="28" rowspan="2" bgcolor="#FFFFFF" class="style13" style="cursor:pointer;" title="clique" onClick="selFragilidade(<%=fragVO.getCodfragilidade()%>,<%=a5%>,<%=maiorFrag %>);">
			<font color="blue"><%out.println("<center><img src='/unicsul/web/img/add.jpg' border='0'></center>");%>
			</font>
			</td>	  
	 		<td height="28" rowspan="2" bgcolor="#FFFFFF" class="style13">
			<%out.println("<center><img src='/unicsul/web/img/error2.jpg' border='0'></center> ");%>
			</td>
	      </tr>
		  
	      <tr>
            <td height="14" bgcolor="#FFFFFF" class="style13" style="cursor:pointer;border-style:none;">
			<%
              out.print("Proposta:" + fragVO.getProposta()+"");
    		%>       
			 </td>
      </tr>
	      
	      
	  <%
	  }

  

}

listaFrag.clear();
listaFrag = null;
fragDao = null;
fragVO = null;

}//do try

catch (Exception e) { out.print("<p>" + e.getMessage() +  "</p>"); }

//////aqui ele ve se o codFrag é zero, se for ele altera para 1////
//////sera a 1º fragilidade da categoria////
if(codFrag==0){
	codFrag=1;
}

%>
    </table>
</div>
  
  
  <br>

  	


   
<form name="frmPerg3" method="post" action="/unicsul/principal?acao=FragilidadeCommand" >
      <input type=hidden name=codigoFrag size=10>
      <input type=hidden name=cont size=10>
      <input type=hidden name=maiorFrag size=10>
</form>	

<form name="frmPerg2" method="post" action="/unicsul/principal?acao=DeletaCommand">
      <input type=hidden name=codigoFrag size=10>
      <input type=hidden name=cont size=10>
</form>	
   
<center><input type="submit" name="novo" value="Inserir Nova"  title="Nova Fragilidade"  style="cursor:pointer;" title="clique" onclick="selFragilidade(<%=codFrag%>,<%=a4 %>,<%=maiorFrag %>);"></center>   
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
    	
        <th nowrap>
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