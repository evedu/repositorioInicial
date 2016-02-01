package com.unicsul.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.unicsul.vo.CursosVO;

public class CursosDao {
	public ArrayList Cursos(String gCodArea) throws SQLException{
		 
		ArrayList listaCursos = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT * FROM cursosareas WHERE codArea="+gCodArea+" ORDER BY descCurso";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
            while (rs.next()) {
                CursosVO vo = new CursosVO();
                vo.setCodArea(rs.getString("codArea"));
                vo.setCodCurso(rs.getString("codCurso"));
                vo.setDescCurso(rs.getString("descCurso"));
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
	
	public ArrayList Cursos2() throws SQLException{
		 
		ArrayList listaCursos = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT * FROM cursosareas ORDER BY descCurso";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
            while (rs.next()) {
                CursosVO vo = new CursosVO();
                vo.setCodArea(rs.getString("codArea"));
                vo.setCodCurso(rs.getString("codCurso"));
                vo.setDescCurso(rs.getString("descCurso"));
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
	
	public ArrayList Cursos3(String codCent) throws SQLException{
		 
		ArrayList listaCursos = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT * FROM cursosareas WHERE codCent="+codCent+" ORDER BY descCurso";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
            while (rs.next()) {
                CursosVO vo = new CursosVO();
                vo.setCodArea(rs.getString("codArea"));
                vo.setCodCurso(rs.getString("codCurso"));
                vo.setDescCurso(rs.getString("descCurso"));
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
	
	public ArrayList Cursos4(String gCodCurso) throws SQLException{
		 
		ArrayList listaCursos = new ArrayList();
		Connection con = null;
		PreparedStatement psmt = null;
        ResultSet rs = null;
        String query = "SELECT * FROM cursosareas WHERE codCurso="+gCodCurso+" ORDER BY descCurso";
		
        try {
            con=Conexao.getConnection();
            psmt = con.prepareStatement(query.toString());
            rs = psmt.executeQuery();
            while (rs.next()) {
                CursosVO vo = new CursosVO();
                vo.setDescCurso(rs.getString("descCurso"));
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
