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
public class CursosVO implements Serializable{
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String codArea;
	 private String codCurso;
	 private String descCurso;
	 private String abrevCurso;
	 private int codProf;
	 private int codCent;
	 private String nomeCoord;
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
	 * @return the codCurso
	 */
	public String getCodCurso() {
		return codCurso;
	}
	/**
	 * @param codCurso the codCurso to set
	 */
	public void setCodCurso(String codCurso) {
		this.codCurso = codCurso;
	}
	/**
	 * @return the descCurso
	 */
	public String getDescCurso() {
		return descCurso;
	}
	/**
	 * @param descCurso the descCurso to set
	 */
	public void setDescCurso(String descCurso) {
		this.descCurso = descCurso;
	}
	
	/**
	 * @return the abrevCurso
	 */
	public String getAbrevCurso() {
		return descCurso;
	}
	/**
	 * @param abrevCurso the abrevCurso to set
	 */
	public void setAbrevCurso(String abrevCurso) {
		this.abrevCurso = abrevCurso;
	}
	
	/**
	 * @return the codProf
	 */
	public int getCodProf() {
		return codProf;
	}
	/**
	 * @param codProf the codProf to set
	 */
	public void setCodProf(int codProf) {
		this.codProf = codProf;
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
	 * @return the nomeCoord
	 */
	public String getNomeCoord() {
		return nomeCoord;
	}
	/**
	 * @param nomeCoord the nomeCoord to set
	 */
	public void setNomeCoord(String nomeCoord) {
		this.nomeCoord = nomeCoord;
	}
	 
}
