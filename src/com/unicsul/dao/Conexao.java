package com.unicsul.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexao {
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        
        String user = "root";
        String password = "";
        String port = "3306";      
        String host = "localhost";
        String database = "/ag2008groupwear?useUnicode=true&characterEncoding=CP1252&characterSetResults=CP1252";
        
        if (port == null) {
            throw new SQLException("Porta n\343o especificado no arquivo de configura\347\343o");
        } else {
        	Class.forName("com.mysql.jdbc.Driver");
            //DriverManager.registerDriver(new ());
            return DriverManager.getConnection("jdbc:mysql://"+host+""+database+"&user="+user+"&password="+password);
        }
    }
    
    
    public static void closeConnection(Connection cn, ResultSet rs, PreparedStatement stmp) {
        if (cn != null) {
            try {
                cn.close();
            }
            catch (Exception e) {
                // TODO: handle exception
            }
        }
                
        if (rs != null) {
            try {
                rs.close();
            }
            catch (Exception e) {
                // TODO: handle exception
            }
        }
                
        if (stmp != null) {
            try {
                stmp.close();
            }
            catch (Exception e) {
                // TODO: handle exception
            }
        }
    }
    
    
    public static void closeConnection(Connection cn, ResultSet rs, CallableStatement cstm) {
        if (cn != null) {
            try {
                cn.close();
            }
            catch (Exception e) {
                // TODO: handle exception
            }
        }
                
        if (rs != null) {
            try {
                rs.close();
            }
            catch (Exception e) {
                // TODO: handle exception
            }
        }
                
        if (cstm != null) {
            try {
                cstm.close();
            }
            catch (Exception e) {
                // TODO: handle exception
            }
        }
    }
    
    
    
    public static void closeConnection(Connection cn, ResultSet rs, Statement smt) {
        if (cn != null) {
            try {
                cn.close();
            }
            catch (Exception e) {
                // TODO: handle exception
            }
        }
                
        if (rs != null) {
            try {
                rs.close();
            }
            catch (Exception e) {
                // TODO: handle exception
            }
        }
                
        if (smt != null) {
            try {
                smt.close();
            }
            catch (Exception e) {
                // TODO: handle exception
            }
        }
    }
    
 
    public static void main(String args[]) {
        try {
            Connection c = getConnection();
            Statement stm = c.createStatement();
            ResultSet rs = stm.executeQuery("select * from status");
            System.out.println(rs.next());
            c.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }  
}
