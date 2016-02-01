package com.unicsul.vo;

import java.io.Serializable;

public class IdentificacaoVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String descArea, descCompleta, nomeColab, descCurso, abrevCurso, nomeCoord, login, senha;
	private int codArea;
	
	public String getAbrevCurso() {
		return abrevCurso;
	}
	public void setAbrevCurso(String abrevCurso) {
		this.abrevCurso = abrevCurso;
	}
	public int getCodArea() {
		return codArea;
	}
	public void setCodArea(int codArea) {
		this.codArea = codArea;
	}
	public String getDescArea() {
		return descArea;
	}
	public void setDescArea(String descArea) {
		this.descArea = descArea;
	}
	public String getDescCompleta() {
		return descCompleta;
	}
	public void setDescCompleta(String descCompleta) {
		this.descCompleta = descCompleta;
	}
	public String getDescCurso() {
		return descCurso;
	}
	public void setDescCurso(String descCurso) {
		this.descCurso = descCurso;
	}
	public String getNomeColab() {
		return nomeColab;
	}
	public void setNomeColab(String nomeColab) {
		this.nomeColab = nomeColab;
	}
	public String getNomeCoord() {
		return nomeCoord;
	}
	public void setNomeCoord(String nomeCoord) {
		this.nomeCoord = nomeCoord;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	
	
}
