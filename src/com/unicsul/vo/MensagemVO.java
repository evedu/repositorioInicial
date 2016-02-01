package com.unicsul.vo;

import java.io.Serializable;

public class MensagemVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String textom, datasend, assunto, areaRem, data, nomeDest;
	private int src, dst, lida;
	
	public String getAreaRem() {
		return areaRem;
	}
	public void setAreaRem(String areaRem) {
		this.areaRem = areaRem;
	}
	public String getAssunto() {
		return assunto;
	}
	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getDatasend() {
		return datasend;
	}
	public void setDatasend(String datasend) {
		this.datasend = datasend;
	}
	public int getDst() {
		return dst;
	}
	public void setDst(int dst) {
		this.dst = dst;
	}
	public int getLida() {
		return lida;
	}
	public void setLida(int lida) {
		this.lida = lida;
	}
	public int getSrc() {
		return src;
	}
	public void setSrc(int src) {
		this.src = src;
	}
	public String getTextom() {
		return textom;
	}
	public void setTextom(String textom) {
		this.textom = textom;
	}
	public String getNomeDest() {
		return nomeDest;
	}
	public void setNomeDest(String nomeDest) {
		this.nomeDest = nomeDest;
	}
}
