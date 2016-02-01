package com.unicsul.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.unicsul.vo.FragilidadesVO;

public class ListadefragDao {
	public ArrayList Listadefrag(String codCat,int CodigoCurso) throws SQLException{
				 
		ArrayList listaFrag = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT * FROM fragilidades WHERE codCategoria="+codCat+" AND codCurso="+CodigoCurso+" ORDER BY codfragilidade";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
       
            while (rs.next()) {
            	FragilidadesVO vo = new FragilidadesVO();
                vo.setCodfragilidade(rs.getInt("codfragilidade"));
                vo.setTextoFragilidade(rs.getString("textoFragilidade"));
                vo.setProposta(rs.getString("proposta"));
                vo.setSenha(rs.getString("senha"));
                vo.setLogin(rs.getString("login"));
                listaFrag.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	rs.close(); rs=null;
            psmt .close(); psmt=null;
            con.close(); con=null;

        }
		return listaFrag;
	}
	
}
