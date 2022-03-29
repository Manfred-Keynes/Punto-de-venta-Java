/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;


import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author mfer_
 */

public class Conexion {

    public Connection conexionBD;
    private final String puerto = "3306";
    private final String bd = "proyecto2_db";
    private final String urlConexion = String.format("jdbc:mysql://127.0.0.1:%s/%s", puerto, bd);
    private final String usuario = "root";
    private final String contra = "515919";
    private final String jbdc = "com.mysql.cj.jdbc.Driver";
    
    

    public void abrir_conexion() {
        try {
            Class.forName(jbdc);
            conexionBD = DriverManager.getConnection(urlConexion, usuario, contra);

        } catch (HeadlessException | ClassNotFoundException | SQLException ex) {
            System.out.println("Error:" + ex.getMessage());
        }
    }

    public void cerrar_conexion() {
        try {
            conexionBD.close();

        } catch (SQLException ex) {
            System.out.println("Error:" + ex.getMessage());
        }
    }

}
