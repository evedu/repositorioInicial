/*
 * Created on 20/05/2008
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.unicsul.vo;

import java.io.Serializable;

public class PotencialidadesVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/*
	 * Created on 20/05/2008
	 * @author Eduardo
	 * TODO To change the template for this generated file go to
	 * Window - Preferences - Java - Code Style - Code Templates
	 */
	
	 	 private String abrevCurso;
		 private String login;
		 private String senha;
		 private int codCurso;
		 private String codCategoria;
		 private int codPotencialidade;
		 private String textoProposta;
		 private String tipoPot;	
		/**
		 * @return the login
		 */
		public String getLogin() {
			return login;
		}
		/**
		 * @param login the login to set
		 */
		public void setLogin(String login) {
			this.login = login;
		}
		/**
		 * @return the senha
		 */
		public String getSenha() {
			return senha;
		}
		/**
		 * @param senha the senha to set
		 */
		public void setSenha(String senha) {
			this.senha = senha;
		}
		/**
		 * @return the codCurso
		 */
		public int getCodCurso() {
			return codCurso;
		}
		/**
		 * @param codCurso the codCurso to set
		 */
		public void setCodCurso(int codCurso) {
			this.codCurso = codCurso;
		}
		/**
		 * @return the codCategoria
		 */
		public String getCodCategoria() {
			return codCategoria;
		}
		/**
		 * @param codCategoria the codCategoria to set
		 */
		public void setCodCategoria(String codCategoria) {
			this.codCategoria = codCategoria;
		}
		/**
		 * @return the codPotencialidade
		 */
		public int getCodPotencialidade() {
			return codPotencialidade;
		}
		/**
		 * @param codPotencialidade the codPotencialidade to set
		 */
		public void setCodPotencialidade(int codPotencialidade) {
			this.codPotencialidade = codPotencialidade;
		}
		/**
		 * @return the textoProposta
		 */
		public String getTextoProposta() {
			return textoProposta;
		}
		/**
		 * @param textoProposta the textoProposta to set
		 */
		public void setTextoProposta(String textoProposta) {
			this.textoProposta = textoProposta;
		}
		public String getTipoPot() {
			return tipoPot;
		}
		public void setTipoPot(String tipoPot) {
			this.tipoPot = tipoPot;
		}
		public String getAbrevCurso() {
			return abrevCurso;
		}
		public void setAbrevCurso(String abrevCurso) {
			this.abrevCurso = abrevCurso;
		}
	
}
