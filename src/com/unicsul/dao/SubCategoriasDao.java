package com.unicsul.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.unicsul.vo.SubCategoriasVO;

public class SubCategoriasDao {
	public ArrayList SubCategorias(String codigoCategoria) throws SQLException{
		 
		ArrayList listaSubCategorias = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT * FROM subcategoria WHERE codCategoria='"+codigoCategoria+"' ORDER BY codSubCategoria";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
            while (rs.next()) {
            	SubCategoriasVO vo = new SubCategoriasVO();
                vo.setCodSubCategoria(rs.getString("codSubCategoria"));
                vo.setCodCategoria(rs.getString("codCategoria"));
                vo.setDescricao(rs.getString("descricao"));
                listaSubCategorias.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	rs.close(); rs=null;
            psmt .close(); psmt=null;
            con.close(); con=null;

        }
		return listaSubCategorias;
	}
	
	public ArrayList SubCategorias2(String codigoCategoria) throws SQLException{
		 
		ArrayList listaSubCategorias = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT * FROM subcategoria WHERE codSubCategoria='"+codigoCategoria+"' ORDER BY codSubCategoria";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
            while (rs.next()) {
            	SubCategoriasVO vo = new SubCategoriasVO();
                vo.setCodSubCategoria(rs.getString("codSubCategoria"));
                vo.setCodCategoria(rs.getString("codCategoria"));
                vo.setDescricao(rs.getString("descricao"));
                listaSubCategorias.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	rs.close(); rs=null;
            psmt .close(); psmt=null;
            con.close(); con=null;

        }
		return listaSubCategorias;
	}
	
	
	
}
