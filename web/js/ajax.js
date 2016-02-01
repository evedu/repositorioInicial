var objMyDiv; 
var Habilita_pesquisaCli;


function XmlHttp( ){ 
	this.CreateXmlHttpObject = CreateXmlHttpObject; 
	this.GetUrlContent              = GetUrlContent; 
	this.GetResponseText          = GetResponseText; 
	this.GetReadyState              = GetReadyState;            
	this.HttpMethod = 'GET'; // default 
	this.objXmlHttp = this.CreateXmlHttpObject(); 
} 

// Initialize XMLHttpObject 
function CreateXmlHttpObject(){ 
	var xmlhttp=false; 
	try { 
		xmlhttp = new ActiveXObject("Msxml2.XMLHTTP"); 
	} catch (e) { 
	try { 
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); 
	} catch (E) { 
		xmlhttp = false; 
	} 
} 


if (!xmlhttp && typeof XMLHttpRequest!='undefined') { 
	xmlhttp = new XMLHttpRequest(); 
} 
	return xmlhttp; 
} 
var objXMLHttp =  new XmlHttp(); 
		
function GetReadyState( ){ 
	return this.objXmlHttp.readyState; 
} 

function GetResponseText( ){ 
	return this.objXmlHttp.responseText; 
} 


// Function performs Get request to absolute url(strUrl) 
// using XmlHttp object (asynchroni) 
// Response returned into objResult element using innerHTML. 
// When state of XmlHttp object is changed - objOnReadyStateChangeFunction called 
function GetUrlContent( strUrl, objOnReadyStateChangeFunction ){ 
	this.objXmlHttp.open(this.HttpMethod, strUrl, true); 
	this.objXmlHttp.setRequestHeader('Content-Type', 'text/xml; charset=UTF-8'); 
	if(objOnReadyStateChangeFunction){ 
		this.objXmlHttp.onreadystatechange=function(){ 
			objOnReadyStateChangeFunction(); 
		} 
	} 
	this.objXmlHttp.send(null)    
} 

//This function is called when we get the data back from the server.        
function GetResponse( ){ 
	
	if (objXMLHttp.GetReadyState()==4) {
		// save response in inner html of result object 
		objMyDiv.innerHTML = objXMLHttp.GetResponseText( ); 
		
		
	} 
} 

function UpdateDiv( Url, div ){ 		
		//alert(Url);
		//alert(div);
		objMyDiv = document.getElementById(div); 
		objXMLHttp.GetUrlContent( Url, GetResponse );        
	return; 
 } 
 
 
 function UpdateDivObj( Url, obj){ 		 		 		
        //alert(Url);
		//alert(obj);
	objMyDiv = obj; 
	objXMLHttp.GetUrlContent( Url, GetResponse );        
 	return; 
 } 

 function pesquisaEquipamento(parametro, filtro , grupo , usuario){ 
	 
	 parametro_tmp = "";
	 for (i=0; i <= parametro.length; i++ )
	 {
			if (parametro.charAt(i)=='#')
			{
				parametro_tmp = parametro_tmp + "%23";
			}
			else {parametro_tmp = parametro_tmp + parametro.charAt(i);}

	 }
    

	window.parent.frames["Frame_2"].location = 'tabela_consulta.asp?parametro='+parametro_tmp+'&filtro='+filtro+'&grupo='+grupo+'&usuario='+usuario;
	window.status = "";
 }  


  function pesquisaEquipamentoData(data_inicial, data_final, filtro , grupo , usuario){ 
	 
	window.parent.frames["Frame_2"].location = 'tabela_consulta.asp?data_inicial='+data_inicial+'&Data_final='+data_final+'&filtro='+filtro+'&grupo='+grupo+'&usuario='+usuario;
	window.status = "";
 }  

 


   function abrirJanelaFull(url, nomeJanela, scroll, tool) {
		
		//alert(url);

        var largura = window.screen.width - 12;

        var altura = window.screen.height - 100;

        var posX = 1 //(window.screen.width-largura)/2;
		

        var posY = 0;//10;                            

        var parametros = "'titlebar=no, toolbar="+tool+", scrollbars="+ scroll +", location=no, statusbar=no, menubar=no, resizable=yes, directories=no, status=no, width="+largura+",height="+altura+",left="+posX+",top="+posY+"'";                        

        window.open(url, nomeJanela, parametros);

   } 


   function filtro(evt)
	{
		
		var charCode = (evt.which) ? evt.which : event.keyCode
		if (charCode == 13) {return false; }
		return true;
	}
	
	
function dosubmitimport_cisco()
		{	UpdateDiv('importacao_cisco.asp?flag=1','MyDivImport');	}	

//substitui caracteres
function trataString(texto)
{
		
	var textoTratado;
	//var tot;
	//tot = texto.length;

	textoTratado = texto.replace('#', '%23');
	textoTratado = textoTratado.replace('#', '%23');
	
	return textoTratado;
}


//Função do radiobutton
function ValidaRadioResult_cliente()
	{
	//validacao de radio buttons sem saber quantos sao
	if (typeof(document.result_cli.respLink[0]) == 'object')
		{			
		for (i=0; i < window.document.result_cli.respLink.length; i++) 
			{			
			if (window.document.result_cli.respLink[i].checked)
				{				
					window.document.result_cli.cd_cliente.value = window.document.result_cli.respLink[i].value;
					
					return true;
				}
			}
		} 
	else 
		{
			if (window.document.result_cli.respLink.checked)
				{
					window.document.result_cli.cd_cliente.value = window.document.result_cli.respLink.value;
					return true;
				}
		}	
	return false;	
}								
	


function montaConexao()
{
	window.document.cadPorta.txt_conexao.value="<"+window.document.cadPorta.txt_numero.value+">%"+window.document.cadPorta.txt_ponta_remota.value+"#"+window.document.cadPorta.txt_nome_usuario.value+"$"+window.document.cadPorta.txt_negocio.value+"!"+window.document.cadPorta.txt_severidade.value+"@"+window.document.cadPorta.txt_funcao.value;
}

function montaNegocio(idSelectToRemove) {

	if(idSelectToRemove=="cbo_negocio")
	{
		window.document.cadPorta.txt_negocio.value ='';
		if (window.document.cadPorta.cbo_negocio != null && window.document.cadPorta.cbo_negocio != "") {
						   
			   for (i = 0; i <= window.document.cadPorta.cbo_negocio.length - 1; i++) {
					
					eOption = window.document.cadPorta.cbo_negocio.options[i];
					window.document.cadPorta.txt_negocio.value = window.document.cadPorta.txt_negocio.value + ' ' + eOption.value;
				 
				 } montaConexao();
		}
	}
	else
	{
		window.document.cadPorta.txt_negocio.value ='';
		if (window.document.cadPorta.cbo_negocio != null && window.document.cadPorta.cbo_negocio != "") {
						   
			   for (i = window.document.cadPorta.cbo_negocio.length - 1; window.document.cadPorta.cbo_negocio.selectedIndex >= 0 && i >= 0; i--) {
					
					eOption = window.document.cadPorta.cbo_negocio.options[i];
					window.document.cadPorta.txt_negocio.value = window.document.cadPorta.txt_negocio.value + ' ' + eOption.value;
				 
				 } montaConexao();
		}
	}
		
}


function swapSelectedOptions(idSelectToRemove, idSelectToAdd) {

	if (idSelectToRemove != null && idSelectToRemove != "") {
		eSelectToRemove = document.getElementById(idSelectToRemove);
        for (i = eSelectToRemove.length - 1; eSelectToRemove.selectedIndex >= 0 && i >= 0; i--) {
			eOption = eSelectToRemove.options[eSelectToRemove.selectedIndex];
            if (idSelectToAdd != null && idSelectToAdd != "") {
				eSelectToAdd = document.getElementById(idSelectToAdd);				
                eSelectToAdd.appendChild(eOption);
            }


            //eSelectToRemove.remove(eOption);
         }montaNegocio(idSelectToRemove);
		
    }
		else{
			alert('Id de lista <select id=select1 name=select1> inválido.');
		}
    }

	function swapAllOptions(idSelectToRemove, idSelectToAdd) {

	if (idSelectToRemove != null && idSelectToRemove != "") {
		eSelectToRemove = document.getElementById(idSelectToRemove);
        for (i = eSelectToRemove.length - 1; i >= 0; i--) {
			eOption = eSelectToRemove.options[i];
            if (idSelectToAdd != null && idSelectToAdd != "") {
				eSelectToAdd = document.getElementById(idSelectToAdd);
                eSelectToAdd.appendChild(eOption);
            }
            //eSelectToRemove.remove(eOption);
        }montaNegocio();
    } 
	else{
		alert('Id de lista <select id=select1 name=select1> inválido.');
    }
}


//Altera os objetos  para a consulta do BDI
 function selecionaTD(filtro) {
	
	var idElementTexto = "td_texto";
	var eElementTexto =document.getElementById(idElementTexto) ;
	var idElementData = "td_data";
	var eElementData = document.getElementById(idElementData);

	/*alert(filtro);
	alert(eElementTexto.style.display);
	alert(eElementData.style.display);*/
	
	
	if ( parseInt(filtro)  <= 13  )
	{	 
		if(eElementTexto.style.display != "none"){
            eElementTexto.style.display = "";
			eElementData.style.display = "none";
		}
        else {
            eElementTexto.style.display = "";
			eElementData.style.display = "none";
		}	
	}
	else{ 
		if(eElementData.style.display != "none") {
            eElementData.style.display = "";
			eElementTexto.style.display = "none";
		}
        else {
            eElementData.style.display = "";
			eElementTexto.style.display = "none";
		}
	}	

 }
 function Calendario(campo, exibeHr) {
			var myObject = new Object();
			myObject.campo = campo;
			myObject.exibirHora = exibeHr;
			window.showModalDialog("./calendario/calendario.html" ,myObject,"dialogHeight:260px;dialogWidth:223px;center:yes");
}


function SomenteIP(evt)
{					
	//window.document.OptMascara.txt_LAN_BBDE_SUBNET.Value = "heee"
	var charCode = (evt.which) ? evt.which : event.keyCode
	
	if (charCode == 46 )
		return true;
	if (charCode > 31 && (charCode < 48 || charCode > 57) )
		return false;
	return true;
}


function atalhopesquisa(evt, tipopesquisa, grupo, usuario  )
{					
	//window.document.OptMascara.txt_LAN_BBDE_SUBNET.Value = "heee"
	var charCode = (evt.which) ? evt.which : event.keyCode
	
	if (charCode == 13 ) {
		if (tipopesquisa != 'data')
		{
			pesquisaEquipamento(window.document.frmMenu.txtpesquisa.value, window.document.frmMenu.cbofiltro.value , grupo , usuario);
		}
		else{
			
			pesquisaEquipamentoData(window.document.frmMenu.txtDataIni.value , window.document.frmMenu.txtdataFin.value, window.document.frmMenu.cbofiltro.value , grupo , usuario);
		}
	}
		
}



