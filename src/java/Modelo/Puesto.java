/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.awt.HeadlessException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Lenovo FX
 */
public class Puesto {
    private int id_puesto;
    private String puesto;
    private int id_departamento;
    private String fechaIngreso;
    private String estado;
    
    Conexion cn;
    //constructor
    public Puesto(){}

    public Puesto(int id_puesto, String puesto, int id_departamento, String fechaIngreso, String estado) {
        this.id_puesto = id_puesto;
        this.puesto = puesto;
        this.id_departamento = id_departamento;
        this.fechaIngreso = fechaIngreso;
        this.estado = estado;
    }

        public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getPuesto() {
        return puesto;
    }

    public void setPuesto(String puesto) {
        this.puesto = puesto;
    }

    public int getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(int id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(String fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public List listar() {
        
        List<Puesto> lista = new ArrayList<>();
        try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "SELECT p.idPuesto as id, p.puesto,p.id_departamento,p.fechaIngreso,p.estado FROM puestos as p inner join departamento as d on p.id_departamento = d.id_departamento;";
            cn.abrir_conexion();
//            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
//            rs = ps.executeQuery();
            while (consulta.next()) {
                Puesto p = new Puesto();
                p.setId_puesto(consulta.getInt(1));
                p.setPuesto(consulta.getString(2));
                p.setId_departamento(consulta.getInt(3));
                p.setFechaIngreso(consulta.getString(4));
                p.setEstado(consulta.getString(5));
                lista.add(p);
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
        }
        return lista;
    }
    
    public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        
        try{
            cn = new Conexion();
            String query = "SELECT p.idPuesto as id, p.puesto,d.departamento,p.id_departamento,p.fechaIngreso,p.estado FROM puestos as p inner join departamento as d on p.id_departamento = d.id_departamento;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id","Puesto","Departamento","Id_departamento","FechaIngreso","Estado"};
            tabla.setColumnIdentifiers(encabezado);
            
            String datos[] = new String[6];
            while(consulta.next()) {
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("puesto");
                datos[2] = consulta.getString("departamento");
                datos[3] = consulta.getString("id_departamento");
                datos[4] = consulta.getString("fechaIngreso");
                datos[5] = consulta.getString("estado");
                
                tabla.addRow(datos);
            }
            
            cn.cerrar_conexion();
            
        }catch(SQLException ex){
            System.out.println("Error" + ex.getMessage());
        }
        
        return tabla;
    }
    
        
    public HashMap drop_sangre(){
        HashMap<String,String> drop = new HashMap();
        try{
            String query = "SELECT idPuesto as id,puesto FROM puestos;";
            cn = new Conexion();
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            
            while(consulta.next()) {
                drop.put(consulta.getString("id"), consulta.getString("puesto"));
            }
            
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        
        return drop;
    }
    

    
    public int agregar(){
        int retorno = 0;
        
        try{
            PreparedStatement parametro;
            
            String query;
            cn = new Conexion();
            cn.abrir_conexion();
            query = "INSERT INTO puestos(puesto,id_departamento,fechaIngreso,estado) VALUES(?,?,?,?);";
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getPuesto());
            parametro.setInt(2, getId_departamento());
            parametro.setString(3, getFechaIngreso());
            parametro.setString(4, getEstado());
            
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
                    
        }catch(HeadlessException | SQLException ex){
            System.out.println("Error" + ex.getMessage());
        }
        
        return retorno;
    }
    public int modificar() {
        int retorno = 0;
        
        try{
            PreparedStatement parametro;
            
            String query;
            cn = new Conexion();
            cn.abrir_conexion();
            query = "UPDATE puestos SET puesto=?,id_departamento=?,fechaIngreso=?,estado=? WHERE idPuesto = ?;";
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getPuesto());
            parametro.setInt(2, getId_departamento());
            parametro.setString(3, getFechaIngreso());
            parametro.setString(4, getEstado());
            parametro.setInt(5,getId_puesto());
            
            
            
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
                    
        }catch(HeadlessException | SQLException ex){
             System.out.println("Error" + ex.getMessage());
        }
        
        return retorno;
    }
//    public int eliminar() {
//        int retorno = 0;
//        
//         try{
//            PreparedStatement parametro;
//            
//            String query;
//            cn = new Conexion();
//            cn.abrir_conexion();
//            query = "DELETE from puestos WHERE idPuesto = ?;";
//            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
//            parametro.setInt(1,getId_puesto());
//            
//            retorno = parametro.executeUpdate();
//            cn.cerrar_conexion();
//                    
//        }catch(HeadlessException | SQLException ex){
//            System.out.println("Error" + ex.getMessage());
//        }
//         
//        return retorno;
//    }


}
