<%@ page contentType="text/html" language="Java" %>

<%@ page import="java.sql.*" %>
<%@ page import="com.unicsul.dao.CursosDao" %>
<%@ page import="com.unicsul.vo.CursosVO" %>
<%@page import="java.util.ArrayList"%>

<%
response.addHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
String gAbrevArea  = (String) session.getAttribute("AbrevArea"); 
String gCodArea  = (String) session.getAttribute("codArea"); 

String perm="";
int permissao=0;
String codigo  = ""; 
int cod = 0;

if(session.getAttribute("permissao")!=null){
	perm = (String) session.getAttribute("permissao");
	permissao  = Integer.parseInt(perm);
	codigo  = (String) session.getAttribute("CodigoCurso"); 
	cod = Integer.parseInt(codigo);
}


String gNomeCurso="";


	  
///////////pega o nome do curso e joga na sessao////////////////////////
try{

CursosDao nomeDao = new CursosDao();
ArrayList listaNome = nomeDao.Cursos4(codigo);
CursosVO cursoVO = new CursosVO();

for(int i=0;i<=listaNome.size();i++ ) { 
	cursoVO = (CursosVO) listaNome.get(i);

	gNomeCurso=cursoVO.getDescCurso();


}

}//do try

catch (Exception e) { }


session.setAttribute("nomeCurso", gNomeCurso);
////////////////////////////////////////////////////////////

gNomeCurso  = (String) session.getAttribute("nomeCurso"); 
%>
 
<%@page import="com.unicsul.vo.IdentificacaoVO"%>
<%@page import="com.unicsul.dao.IdentificacaoDAO"%>
<html>
<head>
<script type="text/javascript" src="/unicsul/web/js/ajax.js"></script>
<script type="text/javascript" src="/unicsul/web/js/limpaSubcategorias.js"></script>
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
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style7 {
	font-size: 12px;
	font-family: Geneva, Arial, Helvetica, sans-serif;
}
.style9 {font-size: 12px; font-family: Geneva, Arial, Helvetica, sans-serif; font-weight: bold; }
.style11 {font-size: 12px;
font-family: Geneva, Arial, Helvetica, sans-serif;
color: #003399;
}
.style12 {font-family: Verdana, Arial, Helvetica, sans-serif}
.style13 {font-style: italic}
-->
</style>
<script language=JavaScript>
  function selIdent(login,senha){
  	  document.frmPerg.login.value=login;
  	  document.frmPerg.senha.value=senha;
      document.frmPerg.submit();
  }
</script>

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
      <th width="3%" nowrap> <div align="right"><img border="0" src="/unicsul/web/img/seta.jpg"> </div></th>
      <td width="97%" height="32">
        <p align="left" class="style2">
        	<font face=Verdana>Curso: <%=gNomeCurso%></font>        </p>      </td>
      
    </tr>
    
  </table>
    

<p align="center"><img src="/unicsul/web/img/identificacao.jpg" border="0">
</p>
<div align="center">
  <table width="300" border="1" cellpadding="0" cellspacing="0" bordercolor="#E0E0E0">
        <tr><td>
<table width="416" border="0">
                <%
             try{
                IdentificacaoDAO identificacaoDao = new IdentificacaoDAO();
                ArrayList listaID = identificacaoDao.identificacao(cod);
                IdentificacaoVO vo = new IdentificacaoVO();
                
                
                for(int i=0;i<=listaID.size();i++ ) { 
                    vo = (IdentificacaoVO) listaID.get(i);
                    
                    
                    %>
                <tr>
                  <td width="103"><div align="right"><span class="style9">Área:</span></div></td>
                  <td width="303"><span class="style7"><%=vo.getDescArea()%> - <%=vo.getDescCompleta()%></span></td>
              </tr>
                <tr>
                  <td><div align="right"><span class="style9">Curso:</span></div></td>
                  <td><span class="style7"><%=vo.getDescCurso()%></span></td>
              </tr>
                <tr>
                  <td><div align="right"><span class="style9">Coordenador:</span></div></td>
                  <td><span class="style7"><%=vo.getNomeCoord()%></span></td>
              </tr>
                <tr>
                  <%}
                }//do try
                catch (Exception e) { }
                
                %>
                </tr>
          </table>
          </td>
  </tr></table>
          
		  <p align="center"><a href="/unicsul/principal?acao=CategoriaCommand" class="style11">
		  <a href="/unicsul/principal?acao=CategoriaCommand" class="style11">
		  <img src="/unicsul/web/img/seta.jpg" align="absmiddle" border="0"><img src="/unicsul/web/img/seta.jpg" align="absmiddle" border="0"></a>
		  &nbsp;<a href="/unicsul/principal?acao=CategoriaCommand" class="style11"><strong>Clique aqui para processar os dados deste curso</strong></a>	<a href="/unicsul/principal?acao=CategoriaCommand" class="style11"><img src="/unicsul/web/img/bullet.png" align="absmiddle" border="0"></a> </p>

		  <table width="50%" border="0" bordercolor="#EEEEEE" >
            <tr  bordercolor="#EEEEEE" border="0">
              <td width="100%"  class="style7 TextoGris" border="0"><div align="center" class="style7">O(a) Coordenador(a) de  Curso(s) poder&aacute;: </div>
                <ul>
                  <li class="style7">Nomear <em>colaboradores</em> e fornecer para eles as
                                    senhas de acesso a este sistema. </li>
                        <li class="style7">Cadastrar ou consultar informa&ccedil;&otilde;es sobre seu(s) curso(s) e modificar ou eliminar suas informa&ccedil;&otilde;es ou de outros colaboradores do grupo. </li>
                </ul>                
                <div align="center" class="style7">Um colaborador poder&aacute;: </div>                <ul>
          <li class="style7">Cadastrar informa&ccedil;&otilde;es e modific&aacute;-las, mas apenas as por ele fornecidas. </li>
                <li class="style7">Consultar as informa&ccedil;&otilde;es de outros colaboradores do grupo, mas n&atilde;o poder&aacute; modific&aacute;-las. </li>
              </ul>                </td>
            </tr>
  </table>
  
		<br>
		  <table width="500" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
<tr bgcolor="#2A70BF">
				<td colspan="2">
					<div align="center" class="style12">Colaboradores				</div></td>
            </tr>
		    <%
 		 try{
 			IdentificacaoDAO identificacaoDao = new IdentificacaoDAO();
		  	ArrayList listaColabID = identificacaoDao.idColab(cod);
		  	IdentificacaoVO voID = new IdentificacaoVO();
			
			
			for(int i=0;i<=listaColabID.size();i++ ) { 
				voID = (IdentificacaoVO) listaColabID.get(i);
				
				
				%>
		    <tr>
		     
		      <td width="80%"><span class="style7"><%=voID.getLogin()%> - <%=voID.getNomeColab()%></span></td>
		      
		      <%if(permissao==0){ %>
		      
			  <%}else{ %>
			  <td width="20%" class="style13" style="cursor:pointer;" title="clique" onClick="selIdent('<%=voID.getLogin()%>','<%=voID.getSenha()%>');"><div align="center">
				      <font color="blue"><strong>[alterar]</strong></font>
              </div></td>
              <%} %>
              
              
    		</tr>
    		
		    
		    <%}
	 		}//do try
			catch (Exception e) { }
			
			%>
  </table>
</div>
<p align="center"><a href="/unicsul/principal?acao=CategoriaCommand" class="style11"><strong><br>
</strong></a></p>
 		 
  
<div align="center" name="DivSubCategoria" id="DivSubCategoria">
    
</div>

<form name="frmPerg" method="post" action="/unicsul/principal?acao=altCommand" runat="server">
      <input type=hidden name=login size=10>
      <input type=hidden name=senha size=10>
</form>	  
  
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