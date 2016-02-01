package com.unicsul.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.unicsul.dao.AutenticaDao;
import com.unicsul.vo.ColabAreasVO;

public class GeralCommand extends AbstractCommand {

	public void execute(HttpServletRequest request,
			HttpServletResponse response, HttpSession sessao, Logger log)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
				if("altCommand".equals(sessao.getAttribute("acao"))){
					sessao.setAttribute("loginColab", (String)(request.getParameter("login")));		
					sessao.setAttribute("senhaColab", (String)(request.getParameter("senha")));		
					pagina = "/web/pages/alteraColab.jsp";
				}
				else if("AlteraColabCommand".equals(sessao.getAttribute("acao"))){
						
					sessao.setAttribute("nomeColab", (String)(request.getParameter("nome")));
					pagina = "/web/pages/updateColab.jsp";
				}
				else if("AutenticaCommand".equals(sessao.getAttribute("acao"))){
					String login=(String)(sessao.getAttribute("loginID"));
				  	String senha=(String)(sessao.getAttribute("senhaID"));
				  	 
			  	    ArrayList listaColabAreas = new ArrayList();
				 	AutenticaDao autenticaDao = new AutenticaDao();
				 	listaColabAreas = autenticaDao.Autenticar(login,senha);
				 	if(listaColabAreas!=null && !"".equals(listaColabAreas)&&listaColabAreas.size()>0){
				 		ColabAreasVO x = (ColabAreasVO) listaColabAreas.get(0);
				 		String aux = ""+x.getLog();
					  	if(aux.equals(login)&&x.getSenha().equals(senha))
					 	{
					     	sessao.setAttribute("codArea", x.getCodArea());
					     	sessao.setAttribute("AbrevArea", x.getAbrevArea());
					     	sessao.setAttribute("AbrevArea2", x.getAbrevArea());
					     	sessao.setAttribute("permissao", ""+x.getPermissao());
					 		sessao.setAttribute("loginID2", login);
					     	sessao.setAttribute("senhaID2", senha);
					     	sessao.setAttribute("acrossTheUniverse","5GSDTWRWEbdfrwrUUTRvcbQASkd9898989876543ewedcsrftygg34wqxc432");
					     	sessao.setAttribute("listaColabAreas", listaColabAreas);
					     	sessao.setAttribute("codCent", ""+x.getCodCent());
					     	sessao.setAttribute("nomeColab", ""+x.getNomeColab());
					     	pagina = "/web/pages/cursos.jsp";
					 	}
				 	}
				 	 else{
				 		pagina = "/web/pages/home.jsp";
				 		String loginErrado = "erro";
				 		sessao.setAttribute("loginErrado", loginErrado);
				 	}
				}
				else if("CategFragAreaCommand".equals(sessao.getAttribute("acao"))){
					pagina = "/web/pages/categFragArea.jsp";
				}
				
				else if("CategFragCommand".equals(sessao.getAttribute("acao"))){
					pagina = "/web/pages/categFrag.jsp";
				}
				
				else if("CategFragCursoCommand".equals(sessao.getAttribute("acao"))){
					pagina = "/web/pages/categFragCurso.jsp";
				}
				
				else if("CategoriaCommand".equals(sessao.getAttribute("acao"))){
					pagina = "/web/pages/categorias.jsp";
				}
				
				else if("CategPotAreaCommand".equals(sessao.getAttribute("acao"))){
					pagina = "/web/pages/categPotArea.jsp";
				}
				
				else if("CategPotCommand".equals(sessao.getAttribute("acao"))){
					pagina = "/web/pages/categPot.jsp";
				}
				
				else if("CategPotCursoCommand".equals(sessao.getAttribute("acao"))){
					 pagina = "/web/pages/categPotCurso.jsp";
				}
				
				else if("CursosCommand".equals(sessao.getAttribute("acao"))){
					pagina = "/web/pages/cursos.jsp";
				}

				else if("DeletaCommand".equals(sessao.getAttribute("acao"))){
					sessao.setAttribute("CodigoPoten", (String)(request.getParameter("codigoPot")));
					sessao.setAttribute("CodigoFragil", (String)(request.getParameter("codigoFrag")));
					sessao.setAttribute("cont2", (String)(request.getParameter("cont")));
					
					pagina = "/web/pages/deleta.jsp";
				}
				
				else if("DelMsgCommand".equals(sessao.getAttribute("acao"))){
					
					pagina = "/web/pages/deleteMsgDim.jsp";
				}
				
				else if("FragilidadeCommand".equals(sessao.getAttribute("acao"))){
					if(request.getParameter("codigoFrag")!=null){
						sessao.setAttribute("CodigoFragil", (String)(request.getParameter("codigoFrag")));
						sessao.setAttribute("cont2", (String)(request.getParameter("cont")));
						sessao.setAttribute("maiorF", (String)(request.getParameter("maiorFrag")));
						
					}
					pagina = "/web/pages/fragilidade.jsp";
				}
				
				else if("GravaCommand".equals(sessao.getAttribute("acao"))){
					pagina = "/web/pages/grava.jsp";			
				}
				
				else if("IdentificacaoCommand".equals(sessao.getAttribute("acao"))){
					
						if(request.getParameter("codigo")!=null){
							sessao.setAttribute("CodigoCurso", (String)(request.getParameter("codigo")));		
						}

						pagina = "/web/pages/identificacao.jsp";
				}
				
				else if("indexCommand".equals(sessao.getAttribute("acao"))){
					pagina = "/web/pages/home.jsp";
				}
				
				else if("ListadefragCommand".equals(sessao.getAttribute("acao"))){
					if(request.getParameter("codCat")!=null){
						sessao.setAttribute("codSubCateg", (String)(request.getParameter("codCat")));	
					}
					pagina = "/web/pages/listadefrag.jsp";
				}
				
				else if("ListadepotCommand".equals(sessao.getAttribute("acao"))){
					if(request.getParameter("codCat")!=null){
						sessao.setAttribute("codSubCateg", (String)(request.getParameter("codCat")));	
					}
					pagina = "/web/pages/listadepot.jsp";
				}
				
				else if("LogoffCommand".equals(sessao.getAttribute("acao"))){
					pagina = "/web/pages/logoffDim.jsp";
				}
				
				else if("MensagensCommand".equals(sessao.getAttribute("acao"))){
					 pagina = "/web/pages/msgDim1.jsp";
				}

				else if("OpenMsgCommand".equals(sessao.getAttribute("acao"))){
					sessao.setAttribute("datasend", request.getParameter("datasend"));
					sessao.setAttribute("nomeDest", request.getParameter("nomeDest"));
					 pagina = "/web/pages/abrirMsgDim.jsp";
				}
				
				else if("PotencialidadeCommand".equals(sessao.getAttribute("acao"))){
					if(request.getParameter("codigoPot")!=null){
						sessao.setAttribute("CodigoPoten", (String)(request.getParameter("codigoPot")));
						sessao.setAttribute("cont2", (String)(request.getParameter("cont")));
					}
					pagina = "/web/pages/potencialidade.jsp";
				}
				
				else if("ResumosCommand".equals(sessao.getAttribute("acao"))){
					pagina = "/web/pages/resumo.jsp";
				}
				
				else if("SaidaCommand".equals(sessao.getAttribute("acao"))){
					pagina = "/web/pages/saida.html";
				}
				
				else if("SendCommand".equals(sessao.getAttribute("acao"))){
					sessao.setAttribute("src", request.getParameter("src"));
					sessao.setAttribute("dst", request.getParameter("dst"));
					sessao.setAttribute("assunto", request.getParameter("assunto"));
					sessao.setAttribute("textom", request.getParameter("textom"));
					sessao.setAttribute("areaRem", request.getParameter("areaRem"));
					sessao.setAttribute("datasend", request.getParameter("datasend"));
					sessao.setAttribute("nomeDest", request.getParameter("nomeDest"));
					 pagina = "/web/pages/sendMsgDim.jsp";
				}
				
				else if("SendMsgCommand".equals(sessao.getAttribute("acao"))){
					sessao.setAttribute("src", request.getParameter("src"));
					sessao.setAttribute("dst", request.getParameter("dst"));
					sessao.setAttribute("assunto", request.getParameter("assunto"));
					sessao.setAttribute("textom", request.getParameter("textom"));
					sessao.setAttribute("areaRem", request.getParameter("areaRem"));
					sessao.setAttribute("datasend", request.getParameter("datasend"));
					sessao.setAttribute("nomeDest", request.getParameter("nomeDest"));
					pagina = "/web/pages/sendNewMsgDim.jsp";
				}
				else{
					pagina = "/web/pages/home.jsp";
				}
				
					
			 } 
		catch(Exception e) {
		         e.printStackTrace();
		         request.setAttribute("errorMessage", e.getMessage());
		         
		     }
		finally {		
				request.setAttribute("titulo", "Portal Unicsul");
					 redirect(request, response);				
		     }
	}

}
