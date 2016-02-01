package com.unicsul.command;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

public class GravaCommand extends AbstractCommand {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void execute(HttpServletRequest request,
			HttpServletResponse response, HttpSession sessao, Logger log)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			pagina = "/web/pages/grava.jsp";
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
