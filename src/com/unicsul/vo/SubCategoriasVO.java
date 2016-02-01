/*
 * Created on 20/05/2008
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.unicsul.vo;

import java.io.Serializable;

/**
 * @author Eduardo
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class SubCategoriasVO implements Serializable {
	
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String codSubCategoria;
	 private String codCategoria;
	 private String descricao;
	/**
	 * @return the codSubCategoria
	 */
	public String getCodSubCategoria() {
		return codSubCategoria;
	}
	/**
	 * @param codSubCategoria the codSubCategoria to set
	 */
	public void setCodSubCategoria(String codSubCategoria) {
		this.codSubCategoria = codSubCategoria;
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
	 * @return the descricao
	 */
	public String getDescricao() {
		return descricao;
	}
	/**
	 * @param descricao the descricao to set
	 */
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	 
}
