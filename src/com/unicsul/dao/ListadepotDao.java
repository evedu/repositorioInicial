package com.unicsul.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.unicsul.vo.PotencialidadesVO;

public class ListadepotDao {
	public ArrayList Listadepot(String codCat,int CodigoCurso) throws SQLException{
				 
		ArrayList listaPot = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT * FROM potencialidades WHERE codCategoria="+codCat+" AND codCurso="+CodigoCurso+" ORDER BY codpotencialidade";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
       
            while (rs.next()) {
                PotencialidadesVO vo = new PotencialidadesVO();
                vo.setCodPotencialidade(rs.getInt("codPotencialidade"));
                vo.setTextoProposta(rs.getString("textoProposta"));
                vo.setSenha(rs.getString("senha"));
                vo.setLogin(rs.getString("login"));
                listaPot.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	rs.close(); rs=null;
            psmt .close(); psmt=null;
            con.close(); con=null;

        }
		return listaPot;
	}
	
}
