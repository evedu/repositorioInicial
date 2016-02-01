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
String gNomeCurso  = (String) session.getAttribute("nomeCurso");
String codCentAux = (String) session.getAttribute("codCent");
String login  = (String) session.getAttribute("loginID2"); 

if(session.getAttribute("codCent")!=null){
	int codCent2  = Integer.parseInt(codCentAux);
	String codCent = ""+ codCent2;
}



String aux[]=new String[400];

%>

<%

	 	    Connection connection = null;
			Statement statement1 = null;
			ResultSet rs1 = null;
			int tipo_n;
			String query = "", newCount = "0";

			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost/ag2008groupwear?useUnicode=true&characterEncoding=CP1252&characterSetrs1=CP1252";
				query = "SELECT count(datasend) AS newCount FROM msgs WHERE lida=0 AND dst=" + login;
				connection = DriverManager.getConnection(url, "root", "");
				statement1 = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,0);
				rs1 = statement1.executeQuery(query);

                if(rs1.next()){
                   newCount = rs1.getString("newCount");
			   }
			   
			}
			catch (ClassNotFoundException e) {
			  %>
				<script>
					alert('Nao foi possível carregar o driver do banco de dados. Por favor, tente novamente.')
				</script>
			  <%
 			}
			catch (SQLException e) {
			  %>
				<script>
					alert('Nao foi possível completar a operação (SQL). Por favor, tente novamente. <%=e.getMessage()%>')
				</script>
			  <%
			}
			catch (Exception e) {
			  %>
				<script>
					alert('Nao foi possível completar a operação. Por favor, tente novamente.')
				</script>
			  <%
 			}
			finally {
				try { 
					if (rs1 != null){rs1.close(); rs1=null;}
					if (statement1 != null){statement1.close(); statement1=null;}
					if (connection != null){connection.close(); connection=null;}
				}
				catch (SQLException e) { }
			}

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
.style4 {font-family: Geneva, Arial, Helvetica, sans-serif}
.style7 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
}
-->
</style>
<script language=JavaScript>
  function selFragilidade(codigo2){
  	  document.frmPerg.codigo.value=codigo2;
      document.frmPerg.submit();
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

int permissao=0;
if(session.getAttribute("permissao")!=null){
	String perm = (String) session.getAttribute("permissao");
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
 	   <a class="MenuOption2" href="/unicsul/principal?acao=LogoffCommand"/>Logoff seguro</a>&nbsp;&nbsp;|
    </p>     
    </td>
 </tr>
</table>


  <table width="100%" cellpadding="0" cellspacing="0">
    <tr>
      <th width="3%" nowrap> <img border="0" src="/unicsul/web/img/ico.jpg"> </th>
      <td width="97%">
        <p class="style2">
        	<font face=Verdana>Sistema colaborativo on-line para acompanhamento dos resultados da Avaliação no Ensino de Graduação Institucional / Curso 2007. </font>        </p>      </td>
    </tr>
  </table>
  
  <%
	  if(!newCount.equals("0")) {
	  String strAjustada = "";
	  if(newCount.equals("1")) strAjustada = "mensagem nova"; else strAjustada = "mensagens novas"; 
	  %>	
	    <div align="right">    
        <a href="/unicsul/web/pages/msgDim1.jsp"><img src="/unicsul/web/img/email.gif" width="27" height="17" align="absmiddle" border="0"></a>
		&nbsp;&nbsp;<b><a href="/unicsul/web/pages/msgDim1.jsp">voc&ecirc; tem <%=newCount%> <%=strAjustada%> </span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
		</div> 
	  <%
	  }
%>	  
  
  <p align="center">&nbsp;</p>
  <p align="center" class="style5"><img src="/unicsul/web/img/cursos.jpg"></p>
<div align="center">
   
    <table border="1" cellpadding="0" cellspacing="0" bgcolor="#666666"> 
      
      <tr bgcolor="#2A70BF">
        <td width=403 ><div align="center" class="style12">Cursos</div></td> 
		  <%
		  ////////conforme a area do usuario, mostra na tela todos os cursos da sua area/////
		  try{
			  ArrayList listaCursos;
			  
			  CursosDao cursosDao = new CursosDao();
			  	
			  	if(permissao==10){
			  		listaCursos = cursosDao.Cursos2();
			
			  	}else{
			  		listaCursos = cursosDao.Cursos(gCodArea);
			  
			  	}
			  	CursosVO cursosVO = new CursosVO();
				
				
				for(int i=0;i<=listaCursos.size();i++ ) { 
					cursosVO = (CursosVO) listaCursos.get(i);
					//cursosVO.getCodCurso(listaCursos.get(i));
					//System.out.println(listaCursos.contains(cursosVO.getCodCurso()));
					
					
				
				%>
	  <tr>
				  	
		<td width="403" bgcolor="#FFFFFF" height="28" class="style13" style="cursor:pointer;" title="clique" onClick="selFragilidade(<%=cursosVO.getCodCurso()%>);"><div align="center"><font color="blue"><%=cursosVO.getDescCurso()%></font></div> </td>
	  </tr>
				<%}
		}//do try
		catch (Exception e) { }
		%>
    </table>
    <p><span class="style7">Clique no curso desejado. </span></p>
  </div>

	<form name="frmPerg" method="post" action="/unicsul/principal?acao=IdentificacaoCommand" runat="server">
      <input type=hidden name=codigo size=10>
    </form>	

  <p><br>
    <br>
    <br>
    <br>
    <br>
    <br>
   


    
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



</html>