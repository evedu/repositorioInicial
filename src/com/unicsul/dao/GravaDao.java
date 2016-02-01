package com.unicsul.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.unicsul.vo.PotencialidadesVO;
import com.unicsul.vo.FragilidadesVO;

public class GravaDao {
	private String erro = "";
	
	public String getErro(){
	    return erro;	
	}
	
	public ArrayList Grava(String codigoCat, String grava, int CodigoCurso) throws SQLException{
		 
		ArrayList listaGrava = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query=null;
        
        /////se for uma potencialidade/////////////
        if(grava.equals("Gravar Potencialidade")) {	
  	
		  query = "SELECT * FROM potencialidades WHERE codCategoria="+codigoCat+" AND codCurso="+CodigoCurso+" ORDER BY codPotencialidade";
		
        }
        /////se for uma fragilidade/////////////
        if(grava.equals("Gravar Fragilidade")) {
			
		  query = "SELECT * FROM fragilidades WHERE codCategoria="+codigoCat+" AND codCurso="+CodigoCurso+" ORDER BY codfragilidade";
		  
        }

        try {
        	con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
            
            while (rs.next()) {
            	
            /////se for uma potencialidade/////////////
                if(grava.equals("Gravar Potencialidade")) {	
                  	
                	PotencialidadesVO vo = new PotencialidadesVO();
	                vo.setCodPotencialidade(rs.getInt("codPotencialidade"));
	                listaGrava.add(vo);
        		  
	                
                }
                /////se for uma fragilidade/////////////
                if(grava.equals("Gravar Fragilidade")) {
        			
                	FragilidadesVO vo = new FragilidadesVO();
                	vo.setCodfragilidade(rs.getInt("codfragilidade"));
	                listaGrava.add(vo);
        	
                }
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	rs.close(); rs=null;
            psmt .close(); psmt=null;
            con.close(); con=null;

        }
        
		return listaGrava;
	}
	
	public ArrayList InsertPot(String login, String senha, String codCurso, String codCategoria, String codPotencialidade, String textoProposta, String tipoPot) throws SQLException{
		ArrayList listaPot = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        
		textoProposta  = textoProposta.replaceAll("'", "\"");

        String query = "INSERT INTO potencialidades(login,senha,codCurso,codCategoria,codPotencialidade,textoProposta, tipoPot) VALUES('"+login+"','"+senha+"','"+codCurso+"','"+codCategoria+"','"+codPotencialidade+"','"+textoProposta+"','"+tipoPot+"')";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            
       
            psmt.executeUpdate(query);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	
            psmt .close(); psmt=null;
            con.close(); con=null;

        }
		return listaPot;
	}
	
	public ArrayList UpdatePot(int permissao, String login, String senha, String codCurso, String codCategoria, String codPotencialidade, String textoProposta, String tipoPot) throws SQLException{
		ArrayList listaPot = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;

		textoProposta  = textoProposta.replaceAll("'", "\"");
        
		String query="";
		
		if(permissao==10 || permissao==1){
			query = "UPDATE potencialidades SET codCurso='"+codCurso+"',codCategoria='"+codCategoria+"',codPotencialidade='"+codPotencialidade+"',textoProposta='"+textoProposta+"',tipoPot='"+tipoPot+"' WHERE codPotencialidade='"+codPotencialidade+"' AND codCategoria='"+codCategoria+"' AND codCurso='"+codCurso+"' ";
			
		}else{
        	query = "UPDATE potencialidades SET login='"+login+"',senha='"+senha+"',codCurso='"+codCurso+"',codCategoria='"+codCategoria+"',codPotencialidade='"+codPotencialidade+"',textoProposta='"+textoProposta+"',tipoPot='"+tipoPot+"' WHERE codPotencialidade='"+codPotencialidade+"' AND codCategoria='"+codCategoria+"' AND codCurso='"+codCurso+"' ";
        	
		}
		
		
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            
       
            psmt.executeUpdate(query);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	psmt .close(); psmt=null;
            con.close(); con=null;
        }
		return listaPot;
	}
	
	public ArrayList InsertFrag(String login, String senha, String codCurso, String codCategoria, String codigoFrag, String texto, String texto2, String prazo, String responsavel) throws SQLException{
		ArrayList listaFrag = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;

		texto  = texto.replaceAll("'", "\"");
		texto2 = texto2.replaceAll("'", "\"");
        
		String query = "INSERT INTO fragilidades(login,senha,codCurso,codCategoria,codfragilidade,textoFragilidade,proposta,prazo,responsavel) VALUES('"+login+"','"+senha+"','"+codCurso+"','"+codCategoria+"','"+codigoFrag+"','"+texto+"','"+texto2+"','"+prazo+"','"+responsavel+"')";
			
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            
       
            psmt.executeUpdate(query);

        } catch (Exception e) {
            erro = "Erro: " + query;
        } finally {
        	psmt .close(); psmt=null;
            con.close(); con=null;
        }
		return listaFrag;
	}
	
	public ArrayList UpdateFrag(int permissao, String login, String senha, String codCurso, String codCategoria, String codigoFrag, String texto, String texto2, String prazo, String responsavel) throws SQLException{
		ArrayList listaFrag = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
		
		texto  = texto.replaceAll("'", "\"");
		texto2 = texto2.replaceAll("'", "\"");
		
        String query="";
		
		if(permissao==10 || permissao==1){
			query = "UPDATE fragilidades SET codCurso='"+codCurso+"',codCategoria='"+codCategoria+"',codfragilidade='"+codigoFrag+"',textoFragilidade='"+texto+"',proposta='"+texto2+"',prazo='"+prazo+"',responsavel='"+responsavel+"' WHERE codfragilidade='"+codigoFrag+"' AND codCategoria='"+codCategoria+"' AND codCurso='"+codCurso+"'";
		}else{
			query = "UPDATE fragilidades SET login='"+login+"',senha='"+senha+"',codCurso='"+codCurso+"',codCategoria='"+codCategoria+"',codfragilidade='"+codigoFrag+"',textoFragilidade='"+texto+"',proposta='"+texto2+"',prazo='"+prazo+"',responsavel='"+responsavel+"' WHERE codfragilidade='"+codigoFrag+"' AND codCategoria='"+codCategoria+"' AND codCurso='"+codCurso+"'";
		}
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            
       
            psmt.executeUpdate(query);

        } catch (Exception e) {
            erro = "Erro: " + query;
        } finally {
        	psmt .close(); psmt=null;
            con.close(); con=null;
        }
		return listaFrag;
	}
	
	public ArrayList DeletaPot(String codCategoria, String codigoPot, String codigoCurso) throws SQLException{
		ArrayList listaFrag = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
		
        String query = "Delete From potencialidades WHERE codPotencialidade='"+codigoPot+"' AND codCurso='"+codigoCurso+"' AND codCategoria='"+codCategoria+"' ";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            
       
            psmt.executeUpdate(query);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	psmt .close(); psmt=null;
            con.close(); con=null;
        }
		return listaFrag;
	}
	
	public ArrayList DeletaFrag(String codCategoria, String codigoFrag, String codigoCurso) throws SQLException{
		ArrayList listaFrag = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
		
        String query = "Delete From fragilidades WHERE codfragilidade='"+codigoFrag+"' AND codCurso='"+codigoCurso+"' AND codCategoria='"+codCategoria+"' ";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            
       
            psmt.executeUpdate(query);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	psmt .close(); psmt=null;
            con.close(); con=null;
        }
		return listaFrag;
	}
	
	
}
