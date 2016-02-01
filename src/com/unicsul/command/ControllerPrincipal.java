package com.unicsul.command;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.log4j.PatternLayout;
import org.apache.log4j.WriterAppender;

public class ControllerPrincipal extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Classe utilizada para log
	 */
	private Logger log;
	
	/**
	 * Arquivo para gravação do Log
	 */
	private FileOutputStream fos;
	
	/* (non-Javadoc)
	 * @see javax.servlet.GenericServlet#init()
	 */
	public void init()throws ServletException{
		// Seta os arquivos para log
		try {
			String prefix = getServletContext().getRealPath("/");
	    	String arquivoLog = "WEB-INF/log/";
			fos = new FileOutputStream(new File(prefix + arquivoLog + "unicsul.txt"), true);
			
		} catch (FileNotFoundException fnfe){
			throw new ServletException("Arquivo de log não encontrado");
			
		}
	}
	
	/* (non-Javadoc)
	 * @see javax.servlet.Servlet#destroy()
	 */
	public void destroy(){
		log = null;
	}
	
   /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public ControllerPrincipal() {
		super();
	}   	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}  	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	/**
	 * Processa qualquer requisição atravéd de GET ou POST
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = null;
		String geral= "GeralCommand";
		String login="",senha="";
		HttpSession sessao = request.getSession(true);
		WriterAppender appender = new WriterAppender(new PatternLayout(), fos);
		log = Logger.getLogger("unicsulLog");
		log.addAppender(appender);
		
		try {
			login = request.getParameter("loginID");
			senha = request.getParameter("senhaID");
			
			acao = request.getParameter("acao");
			if(acao==null){
				acao = "indexCommand";
			}
						
			// Cria a instância do command que irá tratar a solicitação
			AbstractCommand command = null;
			
			sessao.setAttribute("loginID", login);
			sessao.setAttribute("senhaID", senha);
			sessao.setAttribute("loginColab", (String)(request.getParameter("login")));		
			sessao.setAttribute("senhaColab", (String)(request.getParameter("senha")));
			sessao.setAttribute("acao", acao);
		
			command = CommandFactory.get(geral);
			command.execute(request, response, sessao, log);
			
		}catch (Exception ex){
			ex.printStackTrace();
			throw new ServletException(ex);
			
		}		        
	}
}
