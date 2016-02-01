package com.unicsul.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.unicsul.vo.FragilidadesVO;

public class FragilidadeDao {
	public ArrayList fragilidade(String codCat, String codigoFrag, String CodigoCurso) throws SQLException{
				 
		ArrayList listaFrag = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT * FROM fragilidades WHERE codCategoria="+codCat+" AND codCurso="+CodigoCurso+" AND codfragilidade="+codigoFrag+"";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
       
            while (rs.next()) {
            	FragilidadesVO vo = new FragilidadesVO();
                vo.setTextoFragilidade(rs.getString("textoFragilidade"));
                vo.setProposta(rs.getString("proposta"));
                vo.setPrazo(rs.getInt("prazo"));
                vo.setResponsavel(rs.getString("responsavel"));
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
