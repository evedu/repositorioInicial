function limpaSubcategorias(tabela,tamanhoLista){
	for(i=1;i<=tamanhoLista;i++){		
		if(tabela==i){			
			if(document.getElementById(i).style.display==""){				
				document.getElementById(i).style.display="none";				
			}
			else{				
				document.getElementById(i).style.display="";
			}
		}
		else{
			document.getElementById(i).style.display="none";
		}
	}	
}