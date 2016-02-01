package com.unicsul.command;

import com.unicsul.command.AbstractCommand;

public class CommandFactory {
	/**
	 * Pacote default da localiza��o dos commands 
	 */

	private static final String PACOTE = "com.unicsul.command.";
	
	/**
	 * Cria uma inst�ncia do command de acordo com o nome passado
	 * como par�metro
	 * @param nome O nome do comando
	 * @return AbstractCommand
	 */
	public static AbstractCommand get(String nome)throws Exception{
		AbstractCommand command = null;
		try {
			command = (AbstractCommand)Class.forName(PACOTE + "" + nome).newInstance();
			
		} catch(Exception ex){
			throw new Exception("Problemas de execu��o na aplica��o");
			
		}
		return command;
	}
}
