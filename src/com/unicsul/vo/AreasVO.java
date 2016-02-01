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
public class AreasVO implements Serializable{
	 
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int codCent;
	 private String descArea;
	 private String descCompleta;
		
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
	 * @return the descCompleta
	 */
	public String getDescCompleta() {
		return descCompleta;
	}
	/**
	 * @param descCompleta the descCompleta to set
	 */
	public void setDescCompleta(String descCompleta) {
		this.descCompleta = descCompleta;
	}
	 
}
