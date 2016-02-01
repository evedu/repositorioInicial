package com.unicsul.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.unicsul.vo.PotencialidadesVO;

public class CategPotDao {
	public ArrayList CategPot(String contador) throws SQLException{
				 
		ArrayList listaPots = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query ="SELECT c.abrevCurso, p.codCurso, p.codPotencialidade, p.textoProposta, p.tipoPot FROM potencialidades p inner join cursosareas c on p.codCurso=c.codCurso WHERE p.codCategoria="+contador+" ORDER BY p.codCategoria, c.abrevCurso";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
       
            while (rs.next()) {
            	PotencialidadesVO vo = new PotencialidadesVO();
            	vo.setAbrevCurso(rs.getString("c.abrevCurso"));
            	vo.setCodCurso(rs.getInt("p.codCurso"));
            	vo.setCodPotencialidade(rs.getInt("p.codPotencialidade"));
                vo.setTextoProposta(rs.getString("p.textoProposta"));
                vo.setTipoPot(rs.getString("p.tipoPot"));
                listaPots.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	rs.close(); rs=null;
            psmt .close(); psmt=null;
            con.close(); con=null;
        }
		return listaPots;
	}
	
	public ArrayList CategPot2(int contador,int gCodCurso) throws SQLException{
		 
		ArrayList listaPots = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT c.abrevCurso, p.codCurso, p.codPotencialidade, p.textoProposta, p.tipoPot FROM potencialidades p inner join cursosareas c on p.codCurso=c.codCurso WHERE codCategoria="+contador+" AND p.codCurso="+gCodCurso+" ORDER BY codCategoria,c.abrevCurso";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
       
            while (rs.next()) {
            	PotencialidadesVO vo = new PotencialidadesVO();
            	vo.setAbrevCurso(rs.getString("c.abrevCurso"));
            	vo.setCodCurso(rs.getInt("codCurso"));
            	vo.setCodPotencialidade(rs.getInt("codPotencialidade"));
                vo.setTextoProposta(rs.getString("textoProposta"));
                vo.setTipoPot(rs.getString("tipoPot"));
                listaPots.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	rs.close(); rs=null;
            psmt .close(); psmt=null;
            con.close(); con=null;
        }
		return listaPots;
	}
	
	public ArrayList CategPot3(String contador, int codCent) throws SQLException{
		 
		ArrayList listaPots = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query="";
        
        
        	query = "SELECT c.abrevCurso, p.codCurso, p.codPotencialidade, p.textoProposta, p.tipoPot FROM potencialidades p inner join cursosareas c on p.codCurso=c.codCurso WHERE codCategoria="+contador+" AND codCent="+codCent+" ORDER BY codCategoria,c.abrevCurso";
        
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
       
            while (rs.next()) {
            	PotencialidadesVO vo = new PotencialidadesVO();
            	vo.setAbrevCurso(rs.getString("c.abrevCurso"));
            	vo.setCodCurso(rs.getInt("codCurso"));
            	vo.setCodPotencialidade(rs.getInt("codPotencialidade"));
                vo.setTextoProposta(rs.getString("textoProposta"));
                vo.setTipoPot(rs.getString("tipoPot"));
                listaPots.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	rs.close(); rs=null;
            psmt .close(); psmt=null;
            con.close(); con=null;
        }
		return listaPots;
	}
	
	
}
