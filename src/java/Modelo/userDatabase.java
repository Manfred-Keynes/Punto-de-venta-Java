/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author gerar
 */
public class userDatabase {

    Conexion cn;
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;

    //public userDatabase(Connection con) {
        //this.con = con;
    //}

    //for register user 
    
    public boolean saveUser(User user) {
        boolean set = false;
        try {
            //Insert register data to database
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "INSERT INTO usuarios(user,pass) VALUES (?,md5(?));";

            ps = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getPassword());

            ps.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }
    //user login

    public User logUser(String name, String pass) {

        User user = null;
        try {
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT * FROM usuarios WHERE user=? AND pass=md5(?)";
            ps = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("idUser"));
                user.setName(rs.getString("user"));
                user.setPassword(rs.getString("pass"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

}
