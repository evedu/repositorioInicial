<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ page errorPage="/web/pages/errPage2.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<LINK REL="SHORTCUT ICON" HREF="http://200.136.79.7:8080/cpa/avl/aval.ico">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<title>UNICSUL - Avaliação Institucional</title>
<link rel="StyleSheet" href="/unicsul/web/css/default_unicsul.css"/>
<style type="text/css">
<!--
.style5 {font-size: 9px}
-->
</style>
</head>
<body> 
<table border="0"  width="100%">
    <tr>
        <td width="15%" >
        	<img src='/unicsul/web/img/novo_logo.gif' alt='UNICSUL'>		
        </td>
        <td>
            <div align="right"><font face="Verdana" size="1">
            <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></font><font face=Verdana size=1><b>SINAES / UNICSUL </b></font></div>
        </td>
    </tr>
</table>
 

<table class="MenuOption2" align="center" border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr class="MenuOption2">
    <td class="MenuOption2">
    <p class="MenuOption2" style="margin: 5px">&nbsp;&nbsp;| <a class="MenuOption2" href="http://www.unicsul.br/cpa"> Site da CPA</a>&nbsp;&nbsp;| </p>     
    </td>
  </tr>
</table>

<div align="center"><br>
  <br>
  <img src="/unicsul/web/img/avaliacao.jpg"><br>
  <br>
  <br><br>
</div>
<table width="100%"  border="0" cellpadding="0ss" cellspacing="0" bordercolor="#FFFFFF" id="logg"  >
  <tr>
    <td height="262" colspan="2">
	<form action="/unicsul/principal" method="post" runat="server">
		<input type="hidden" name="acao" value="AutenticaCommand">
	  	<table align="center" >
	  		<tr>
	  			<td width="292" class="TextoBlanco"  >
			      <table width="255"  >
			        <tr>
			          <td align="left" width="51"  >&nbsp;</td>
			          <td align="left" width="58" >&nbsp;</td>
			          <td width="77"  >&nbsp;</td>
			          <td width="49" >&nbsp;            </td>
			        </tr>
			        <tr>
			          <td align="left" width="51"  >&nbsp;</td>
			          <td align="left" width="58"  ><div align="right"><font face="verdana" size="1">Login:&nbsp;&nbsp;</font></div></td>
			          <td width="77" ><input name="loginID" type="text" size="8"></td>
			          <td width="49"  >&nbsp;          </td>
			        </tr>
			        <tr>
			          <td align="left" width="51" >&nbsp;</td>
			          <td align="left" width="58" ><div align="right"><font face="verdana" size="1">Senha:&nbsp;&nbsp; </font></div></td>
			          <td width="77" ><input name="senhaID" type="password" value="" size="8"></td>
			          <td width="49"  >&nbsp;          </td>
			        </tr>
			        <br><br>
			        <tr>
			          <td width="51" height="101"  ></td>
			          <td width="58"  ><font face="verdana" size="-2">&nbsp;</font>          </td>
          			  <td width="77"  ><font face="verdana" size="-2">
          			  	<input name="submit" type="submit" class="SmallButton" value="Logon">					  </td>
         			  <td width="49" >
            			<font size="1">
            			<br></font><br>
						<font face="verdana" size="-2">&nbsp;</font>
						<font face="verdana" size="-2">&nbsp;</font><br><br>          </td>
        			</tr>
      			 </table>	  		   
      			</td>
	  		</tr>
	  		<%String loginErrado = (String)request.getSession().getAttribute("loginErrado");
	  			if("erro".equals(loginErrado)&&loginErrado!=null){%>
		  		<tr>
		  			<td class="style4">
	  				<div align="center">Usuário ou senha inválido!! </div></td>
		  		</tr>
	  		 <%}%>
      	</table>
    </form>    </td>
  </tr>
  <tr>
    <td width="33%" valign="bottom" ><span class="style5"> Projeto: Avalia&ccedil;&atilde;o no Ensino de Gradua&ccedil;&atilde;o Institucional / Curso 2007. An&aacute;lises e registros dos resultados dos cursos de Gradua&ccedil;&atilde;o (acesso &agrave;s Coordena&ccedil;&otilde;es de Cursos). <br>
<br>
    </span></td>
    <td width="67%" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <div align="right"><img src="/unicsul/web/img/sm.jpg" width="50" height="40"> <img src="/unicsul/web/img/af.jpg" width="50" height="40"> <img src="/unicsul/web/img/lib.jpg" width="50" height="40"> <img src="/unicsul/web/img/pin.jpg" width="50" height="40"><br>
      </div>    </td>
  </tr>
  <tr>
    <td height="5" colspan="2"></td>
  </tr>
  <tr>
    <td height="15" colspan="2" class="MenuOption2" >&nbsp;</td>
  </tr>
</table>
<br><br>
</body>
</html>