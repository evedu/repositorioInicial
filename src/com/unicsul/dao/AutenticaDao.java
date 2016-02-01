package com.unicsul.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.unicsul.vo.ColabAreasVO;

public class AutenticaDao {
	public ArrayList Autenticar(String log,String senha) throws SQLException{
			Connection con = null;
			PreparedStatement psmt = null;
	        ResultSet rs = null;
			ArrayList listaColabAreas = new ArrayList();
			String query = "SELECT * FROM colabareas WHERE login='" + log+"'";
			
			try {
				con=Conexao.getConnection();
	            psmt = con.prepareStatement(query.toString());
	            rs = psmt.executeQuery();	          
   
	            while (rs.next()) {
	            	ColabAreasVO vo = new ColabAreasVO();
					if (rs.getString("senha").equals(senha)){
						 vo.setCodArea(rs.getString("codArea"));						
						 vo.setAbrevArea(rs.getString("abrevArea"));
						 vo.setDescArea(rs.getString("descArea"));
						 vo.setLog(rs.getString("login"));
						 vo.setSenha(rs.getString("senha"));	
						 vo.setPermissao(rs.getInt("permissao"));
						 vo.setCodCent(rs.getInt("codCent"));
						 vo.setNomeColab(rs.getString("nomeColab"));
						 listaColabAreas.add(vo);
						 //session.setAttribute("codArea", codArea);
						//session.setAttribute("Aut", "1");
						//session.setAttribute("gAbrevArea", results.getString("abrevArea"));
						//session.setAttribute("acrossTheUniverse","5GSDTWRWEbdfrwrUUTRvcbQASkd9898989876543ewedcsrftygg34wqxc432");
	             }
	        }

	     			
			}
			catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	        	rs.close(); rs=null;
	            psmt .close(); psmt=null;
	            con.close(); con=null;
	        }
			 return listaColabAreas;
		}
	
			
}
	

