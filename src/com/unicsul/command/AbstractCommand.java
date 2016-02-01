package com.unicsul.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

public abstract class AbstractCommand extends HttpServlet{
	/**
	 * Representa a pr�xima p�gina a ser chamada 
	 */
	protected String pagina;
	
	/**
	 * Realiza a execu��o de sua rotina
	 * @param request
	 * @param response
	 * @param sessao
	 * @param log
	 * @throws ServletException
	 * @throws IOException
	 */
	public abstract void execute(HttpServletRequest request, HttpServletResponse response, HttpSession sessao, 
			Logger log)throws ServletException, IOException;
	
	/**
     * Realiza a chamada para a p�gina configurada pelo m�todo
     */
    protected void redirect(HttpServletRequest request, HttpServletResponse response)
    	throws IOException, ServletException{
    	request.getRequestDispatcher(pagina).forward(request, response);
    }
}
