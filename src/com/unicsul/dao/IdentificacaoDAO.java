package com.unicsul.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.unicsul.vo.IdentificacaoVO;

public class IdentificacaoDAO {
	
	public ArrayList identificacao(int curso) throws SQLException{
				 
		ArrayList listaID = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "select distinct c.codArea, a.descArea, a.descCompleta, f.descCurso, f.abrevCurso, f.nomeCoord from colabareas c inner join areas a ON c.codCent = a.codCent inner join cursosareas f on c.codArea = f.codArea where f.codCurso ="+curso;
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
       
            while (rs.next()) {
                IdentificacaoVO vo = new IdentificacaoVO();
                vo.setCodArea(rs.getInt("c.codArea"));
                vo.setDescArea(rs.getString("a.descArea"));
                vo.setDescCompleta(rs.getString("a.descCompleta"));
                vo.setDescCurso(rs.getString("f.descCurso"));
                vo.setAbrevCurso(rs.getString("f.abrevCurso"));
                vo.setNomeCoord(rs.getString("f.nomeCoord"));
                listaID.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	rs.close(); rs=null;
            psmt .close(); psmt=null;
            con.close(); con=null;

        }
		return listaID;
	}
	
	
	public ArrayList idColab(int curso) throws SQLException{
		 
		ArrayList listaID = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "select c.login, c.senha, c.nomeColab from colabareas c inner join areas a ON c.codCent = a.codCent inner join cursosareas f on c.codArea = f.codArea where f.codCurso = "+curso+" and c.permissao != 1";

        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
       
            while (rs.next()) {
                IdentificacaoVO vo = new IdentificacaoVO();
                vo.setLogin(rs.getString("c.login"));
                vo.setSenha(rs.getString("c.senha"));
                vo.setNomeColab(rs.getString("c.nomeColab"));
                listaID.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	rs.close(); rs=null;
            psmt .close(); psmt=null;
            con.close(); con=null;

        }
		return listaID;
	}
	
	
	public int updateColab(String login, String nome) throws Exception{
		 
		int ok=0;
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "update colabareas set nomeColab = '"+nome+"', AbrevArea = '"+nome+"' where login ='"+login+"'";

        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            ok = psmt.executeUpdate();
                   
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	rs.close(); rs=null;
            psmt .close(); psmt=null;
            con.close(); con=null;

        }
        System.out.print("MERDAAAAAAAAAAAAAAAAAAAAAA"+ok);
		return ok;
	}
	
}
