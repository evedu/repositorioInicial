package com.unicsul.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.unicsul.vo.AreasVO;

public class AreasDao {
	public ArrayList areas(String codCent) throws SQLException{
		 
		ArrayList listaCursos = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        
        	String query = "SELECT * FROM areas WHERE codCent="+codCent+" ORDER BY codCent";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
            while (rs.next()) {
                AreasVO vo = new AreasVO();
                vo.setCodCent(rs.getInt("codCent"));
                vo.setDescArea(rs.getString("descArea"));
                vo.setDescCompleta(rs.getString("descCompleta"));
                listaCursos.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	rs.close(); rs=null;
            psmt .close(); psmt=null;
            con.close(); con=null;
        }
		return listaCursos;
	}
	
	public ArrayList areas2() throws SQLException{
		 
		ArrayList listaCursos = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        
        	String query = "SELECT * FROM areas ORDER BY codCent";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
            while (rs.next()) {
                AreasVO vo = new AreasVO();
                vo.setCodCent(rs.getInt("codCent"));
                vo.setDescArea(rs.getString("descArea"));
                vo.setDescCompleta(rs.getString("descCompleta"));
                listaCursos.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	rs.close(); rs=null;
            psmt .close(); psmt=null;
            con.close(); con=null;
        }
		return listaCursos;
	}
	
}
