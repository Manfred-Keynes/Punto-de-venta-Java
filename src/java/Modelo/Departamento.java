/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author mfer_
 */
public class Departamento {
    private int id_departamento;
    private String departamento;
    Conexion cn;
    
    
    public Departamento(){}

    public Departamento(int id_departamento, String departamento) {
        this.id_departamento = id_departamento;
        this.departamento = departamento;
    }

    public int getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(int id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }
    
    /*drop departamentos*/
        public HashMap drop_sangre(){
        HashMap<String,String> drop = new HashMap();
        try{
            String query = "SELECT id_departamento as id,departamento FROM departamento;";
            cn = new Conexion();
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            
            while(consulta.next()) {
                drop.put(consulta.getString("id"), consulta.getString("departamento"));
            }
            
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        
        return drop;
    }
}




