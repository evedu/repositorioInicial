package com.unicsul.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.unicsul.vo.PotencialidadesVO;

public class PotencialidadeDao {
	public ArrayList potencialidade(String codCat, String codigoPot, String CodigoCurso) throws SQLException{
				 
		ArrayList listaPot = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT * FROM potencialidades WHERE codCategoria="+codCat+" AND codCurso="+CodigoCurso+" AND codPotencialidade="+codigoPot+"";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
       
            while (rs.next()) {
                PotencialidadesVO vo = new PotencialidadesVO();
                vo.setTextoProposta(rs.getString("textoProposta"));
                vo.setTipoPot(rs.getString("tipoPot"));
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
