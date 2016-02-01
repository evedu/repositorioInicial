package com.unicsul.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.unicsul.vo.FragilidadesVO;

public class CategFragDao {
	public ArrayList CategFrag(String contador) throws SQLException{
				 
		ArrayList listaFrags = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT c.abrevCurso, f.codCurso, f.codFragilidade, f.textoFragilidade, f.proposta, f.prazo, f.responsavel FROM fragilidades f inner join cursosareas c on f.codCurso=c.codCurso WHERE codCategoria="+contador+" ORDER BY codCategoria, c.abrevCurso";

        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
       
            while (rs.next()) {
            	FragilidadesVO vo = new FragilidadesVO();
            	vo.setAbrevCurso(rs.getString("c.abrevCurso"));
            	vo.setCodCurso(rs.getInt("f.codCurso"));
            	vo.setCodfragilidade(rs.getInt("f.codFragilidade"));
            	vo.setTextoFragilidade(rs.getString("f.textoFragilidade"));
                vo.setProposta(rs.getString("f.proposta"));
                vo.setPrazo(rs.getInt("f.prazo"));
                vo.setResponsavel(rs.getString("f.responsavel"));
                listaFrags.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	rs.close(); rs=null;
            psmt .close(); psmt=null;
            con.close(); con=null;
        }
		return listaFrags;
	}
	
	public ArrayList CategFrag2(int contador,int gCodCurso) throws SQLException{
		 
		ArrayList listaFrags = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT c.abrevCurso, f.codCurso, f.codFragilidade, f.textoFragilidade, f.proposta, f.prazo, f.responsavel FROM fragilidades f inner join cursosareas c on f.codCurso=c.codCurso WHERE codCategoria="+contador+" AND codCurso="+gCodCurso+"  ORDER BY codCategoria, c.abrevCurso";
			
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
       
            while (rs.next()) {
            	FragilidadesVO vo = new FragilidadesVO();
            	vo.setAbrevCurso(rs.getString("c.abrevCurso"));
            	vo.setCodCurso(rs.getInt("f.codCurso"));
            	vo.setCodfragilidade(rs.getInt("f.codFragilidade"));
            	vo.setTextoFragilidade(rs.getString("f.textoFragilidade"));
                vo.setProposta(rs.getString("f.proposta"));
                vo.setPrazo(rs.getInt("f.prazo"));
                vo.setResponsavel(rs.getString("f.responsavel"));
                listaFrags.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	rs.close(); rs=null;
            psmt .close(); psmt=null;
            con.close(); con=null;
        }
		return listaFrags;
	}
	
	public ArrayList CategFrag3(String contador, int codCent) throws SQLException{
		 
		ArrayList listaFrags = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT c.abrevCurso, f.codCurso, f.codFragilidade, f.textoFragilidade, f.proposta, f.prazo, f.responsavel FROM fragilidades f inner join cursosareas c on f.codCurso=c.codCurso WHERE codCategoria="+contador+" AND codCent="+codCent+" ORDER BY codCategoria,c.abrevCurso";

        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
       
            while (rs.next()) {
            	FragilidadesVO vo = new FragilidadesVO();
            	vo.setAbrevCurso(rs.getString("c.abrevCurso"));
            	vo.setCodCurso(rs.getInt("f.codCurso"));
            	vo.setCodfragilidade(rs.getInt("f.codFragilidade"));
            	vo.setTextoFragilidade(rs.getString("f.textoFragilidade"));
                vo.setProposta(rs.getString("f.proposta"));
                vo.setPrazo(rs.getInt("f.prazo"));
                vo.setResponsavel(rs.getString("f.responsavel"));
                listaFrags.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	rs.close(); rs=null;
            psmt .close(); psmt=null;
            con.close(); con=null;
        }
		return listaFrags;
	}
	
	
}
