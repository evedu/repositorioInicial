package com.unicsul.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.unicsul.vo.ColabAreasVO;
import com.unicsul.vo.MensagemVO;


public class MensagemDAO {
	
	public ArrayList listaMsg(String login) throws SQLException{
				 
		ArrayList listaID = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT m.src, m.dst, m.textom, m.datasend, m.lida, m.assunto, m.areaRem, m.adata, c.nomeColab FROM colabareas c inner join msgs m on m.dst = c.login WHERE m.dst='"+login+"' ORDER BY adata DESC";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
       
            while (rs.next()) {
                MensagemVO vo = new MensagemVO();
                
                vo.setTextom(rs.getString("textom"));
                vo.setDatasend(rs.getString("datasend"));
                vo.setLida(rs.getInt("lida"));
                vo.setAssunto(rs.getString("assunto"));
                vo.setAreaRem(rs.getString("areaRem"));
                vo.setSrc(rs.getInt("src"));
                vo.setDst(rs.getInt("dst"));
                vo.setData(rs.getString("adata"));
                vo.setNomeDest(rs.getString("c.nomeColab"));
                listaID.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	con.close();
        	psmt.close();
        	rs.close();
        	con=null;
        	rs=null;
        	psmt=null;
        }
		return listaID;
	}
	
	public ArrayList abreMsg(String data) throws SQLException{
		
		ArrayList listaID = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT * FROM msgs WHERE datasend='"+data+"'";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
       
            while (rs.next()) {
                MensagemVO vo = new MensagemVO();
                
                vo.setTextom(rs.getString("textom"));
                vo.setDatasend(rs.getString("datasend"));
                vo.setLida(rs.getInt("lida"));
                vo.setAssunto(rs.getString("assunto"));
                vo.setAreaRem(rs.getString("areaRem"));
                vo.setSrc(rs.getInt("src"));
                vo.setDst(rs.getInt("dst"));
                vo.setData(rs.getString("adata"));
                listaID.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	con.close();
        	psmt.close();
        	rs.close();
        	con=null;
        	rs=null;
        	psmt=null;
        }
		return listaID;
	}
	
	public ArrayList listaColaboradores() throws SQLException{
		 
		ArrayList lista = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT * FROM colabareas WHERE not(nomeColab LIKE '%Colaborador %') ORDER BY nomeColab;";
        
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
       
            while (rs.next()) {
                ColabAreasVO vo = new ColabAreasVO();
  
				 vo.setLog(rs.getString("login"));
				 vo.setNomeColab(rs.getString("nomeColab"));
				 
                lista.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	con.close();
        	psmt.close();
        	rs.close();
        	con=null;
        	rs=null;
        	psmt=null;
        }
		return lista;
	}
	
	public int sendMsg(String areaRem, String src, String dst, String textom, String assunto) throws SQLException{

		assunto  = assunto.replaceAll("'", "\"");
		textom  = textom.replaceAll("'", "\"");
		 
		int ok=0;
		Connection con = null;
		PreparedStatement psmt = null;
		
		/*******************DATA*********************/
		java.util.Date adata = new java.util.Date();
        String horas="",minutos="",dia="",mes="", segundos="";
        
        segundos = "" + adata.getSeconds();        
        if(segundos.length()==1)segundos="0"+segundos;
        
        horas = "" + adata.getHours();         
        if(horas.length()==1)horas="0"+horas;
        
        minutos = "" + adata.getMinutes(); 
        if(minutos.length()==1)minutos="0"+minutos;
        
        dia = "" + adata.getDate();
        if(dia.length()==1)dia="0"+dia;
        
        mes = "" + (adata.getMonth()+1);
        if(mes.length()==1)mes="0"+mes;
        
        String datasend = "" + dia  + "/" + mes + "/" + (adata.getYear()+1900) + ", " + horas + ":" + minutos+ ":" + segundos;
        String englishdatasend = "" + (adata.getYear()+1900) + "/" + mes  + "/" + dia  + ", " + horas + ":" + minutos+ ":" + segundos;
        
        /*******************FIM DATA*********************/
        
        
        String query = "INSERT INTO msgs (src,dst,textom,datasend,lida,assunto,areaRem,adata)"  +
		         " VALUES (" + src + "," +  dst + ",'" + textom + "','" + datasend  +  "',"  +  0  +  ",'"  +  assunto +  "','"  + areaRem  + "','" + englishdatasend + "')";			 
        
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            ok = psmt.executeUpdate();
                   
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	con.close();
        	psmt.close();
        	con=null;
        	psmt=null;
        }
		return ok;
	}
	
	public int delMsg(String datasend, String src, String dst) throws SQLException{
		 
		int ok=0;
		Connection con = null;
		PreparedStatement psmt = null;
		
		String query = "DELETE FROM msgs WHERE src=" + src + " AND dst=" +  dst + " AND datasend='" + datasend  +  "'";			 
        
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            ok = psmt.executeUpdate();
                   
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	con.close();
        	psmt.close();
        	con=null;
        	psmt=null;
        }
		return ok;
	}
	
	public String upLidaMsg(String datasend) throws SQLException{
		 
		String ok = "0";
		Connection con = null;
		PreparedStatement psmt = null;
		
		String query = "UPDATE msgs SET lida = 1 WHERE datasend='" + datasend+"'";			 
        
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            int aux =  psmt.executeUpdate();
            ok = ""+aux;
                   
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	con.close();
        	psmt.close();
        	con=null;
        	psmt=null;
        }
		return ok;
	}
}
