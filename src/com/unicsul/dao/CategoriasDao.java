package com.unicsul.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.unicsul.vo.CategoriasVO;

public class CategoriasDao {
	public ArrayList Categorias() throws SQLException{
				 
		ArrayList listaCategorias = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT * FROM categorias ORDER BY codigo";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
       
            while (rs.next()) {
                CategoriasVO vo = new CategoriasVO();
                vo.setCodigo(rs.getString("codigo"));
                vo.setCategoria(rs.getString("categoria"));
                listaCategorias.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	rs.close(); rs=null;
            psmt .close(); psmt=null;
            con.close(); con=null;
        }
		return listaCategorias;
	}
	
	public ArrayList Categorias2(String codigoCategoria) throws SQLException{
		 
		ArrayList listaCategorias2 = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT categoria FROM categorias WHERE codigo='"+codigoCategoria+"'";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
       
            while (rs.next()) {
                CategoriasVO vo = new CategoriasVO();
                vo.setCategoria(rs.getString("categoria"));
                listaCategorias2.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	rs.close(); rs=null;
            psmt .close(); psmt=null;
            con.close(); con=null;
        }
		return listaCategorias2;
	}
	
}
