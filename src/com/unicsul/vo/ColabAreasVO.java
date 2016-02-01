package com.unicsul.vo;
/*
 * Created on 20/05/2008
 * @author Flavio
 *  To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
import java.io.Serializable;

public class ColabAreasVO implements Serializable{
	/**
	 * 
	 */
	 private static final long serialVersionUID = 1L;
	 private String log;
	 private String senha;
	 private String codArea;
	 private String abrevArea;
	 private String descArea;
	 private int permissao;
	 private int codCent;
	 private String nomeColab;
	/**
	 * @return the abrevArea
	 */
	public String getAbrevArea() {
		return abrevArea;
	}
	/**
	 * @param abrevArea the abrevArea to set
	 */
	public void setAbrevArea(String abrevArea) {
		this.abrevArea = abrevArea;
	}
	/**
	 * @return the codArea
	 */
	public String getCodArea() {
		return codArea;
	}
	/**
	 * @param codArea the codArea to set
	 */
	public void setCodArea(String codArea) {
		this.codArea = codArea;
	}
	/**
	 * @return the codCent
	 */
	public int getCodCent() {
		return codCent;
	}
	/**
	 * @param codCent the codCent to set
	 */
	public void setCodCent(int codCent) {
		this.codCent = codCent;
	}
	/**
	 * @return the descArea
	 */
	public String getDescArea() {
		return descArea;
	}
	/**
	 * @param descArea the descArea to set
	 */
	public void setDescArea(String descArea) {
		this.descArea = descArea;
	}
	/**
	 * @return the log
	 */
	public String getLog() {
		return log;
	}
	/**
	 * @param log the log to set
	 */
	public void setLog(String log) {
		this.log = log;
	}
	/**
	 * @return the nomeColab
	 */
	public String getNomeColab() {
		return nomeColab;
	}
	/**
	 * @param nomeColab the nomeColab to set
	 */
	public void setNomeColab(String nomeColab) {
		this.nomeColab = nomeColab;
	}
	/**
	 * @return the permissao
	 */
	public int getPermissao() {
		return permissao;
	}
	/**
	 * @param permissao the permissao to set
	 */
	public void setPermissao(int permissao) {
		this.permissao = permissao;
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
		 
	
}
