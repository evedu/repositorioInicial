/*
 * Created on 20/05/2008
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.unicsul.vo;

import java.io.Serializable;

public class FragilidadesVO implements Serializable{
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
		 private int codfragilidade;
		 private String textoFragilidade;
		 private String proposta;
		 private int prazo;
		 private String responsavel; // 14-08-2008, 11h35
		 private int id;
		 
		/**
		 * @return the id
		 */
		public int getId() {
			return id;
		}
		/**
		 * @param id the id to set
		 */
		public void setId(int id) {
			this.id = id;
		}
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
		
		// 14-08-2008, 11h35
		/**
		 * @return the responsavel
		 */
		public String getResponsavel() {
			return responsavel;
		}
		/**
		 * @param responsavel the responsavel to set
		 */
		public void setResponsavel(String responsavel) {
			this.responsavel = responsavel;
		}
		
		/**
		 * @return the codFragilidade
		 */
		public int getCodfragilidade() {
			return codfragilidade;
		}
		/**
		 * @param codfragilidade the codfragilidade to set
		 */
		public void setCodfragilidade(int codfragilidade) {
			this.codfragilidade = codfragilidade;
		}
		/**
		 * @return the textofragilidade
		 */
		public String getTextoFragilidade() {
			return textoFragilidade;
		}
		/**
		 * @param textoFragilidade the textoFragilidade to set
		 */
		public void setTextoFragilidade(String textoFragilidade) {
			this.textoFragilidade = textoFragilidade;
		}
		/**
		 * @return the proposta
		 */
		public String getProposta() {
			return proposta;
		}
		/**
		 * @param proposta the proposta to set
		 */
		public void setProposta(String proposta) {
			this.proposta = proposta;
		}
		/**
		 * @return the prazo
		 */
		public int getPrazo() {
			return prazo;
		}
		/**
		 * @param prazo the prazo to set
		 */
		public void setPrazo(int prazo) {
			this.prazo = prazo;
		}
		public String getAbrevCurso() {
			return abrevCurso;
		}
		public void setAbrevCurso(String abrevCurso) {
			this.abrevCurso = abrevCurso;
		}
	
}
