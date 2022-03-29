/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author mfer_
 */
public class Producto {
    
    private String producto,descripcion;
    public String imagen;
    private int id,id_marca,existencia;
    private double precioCosto,precioVenta;

    public Producto(){}
    Conexion cn; 

    public Producto(String producto, String descripcion, String imagen, int id, int id_marca, int existencia, double precioCosto, double precioVenta) {
        this.producto = producto;
        this.descripcion = descripcion;
        this.imagen = imagen;
        this.id = id;
        this.id_marca = id_marca;
        this.existencia = existencia;
        this.precioCosto = precioCosto;
        this.precioVenta = precioVenta;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_marca() {
        return id_marca;
    }

    public void setId_marca(int id_marca) {
        this.id_marca = id_marca;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public double getPrecioCosto() {
        return precioCosto;
    }

    public void setPrecioCosto(double precioCosto) {
        this.precioCosto = precioCosto;
    }

    public double getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(double precioVenta) {
        this.precioVenta = precioVenta;
    }

    public int agregar() {
        int retorno = 0;
        
        try{
            PreparedStatement parametro;
            
            String query;
            cn = new Conexion();
            cn.abrir_conexion();
            query = "INSERT INTO productos(producto,idMarca,Descripcion,Imagen,precio_costo,precio_venta,existencia,fecha_ingreso) VALUES(?,?,?,?,?,?,?,CURRENT_TIMESTAMP);";
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getProducto());
            parametro.setInt(2, getId_marca());
            parametro.setString(3, getDescripcion());
            parametro.setString(4, getImagen());
            parametro.setDouble(5, getPrecioCosto());
            parametro.setDouble(6, getPrecioVenta());
            parametro.setInt(7, getExistencia());
            
            
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        
        }catch(Exception ex){
            System.out.println("Error" + ex.getMessage());
        }
        
        return retorno;
    }
    
    public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        
        try{
            cn = new Conexion();
            String query = "SELECT idProducto as id,producto,marca,Descripcion,Imagen,precio_costo,precio_venta,existencia,fecha_ingreso,idMarca FROM productos inner join marcas USING(idMarca);";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id","Producto","Marca","Descripción","Imagen","Precio-Costo","Precio-Venta","Existencias","fecha Ingreso","idMarca"};
            tabla.setColumnIdentifiers(encabezado);
            
            String datos[] = new String[12];
            while(consulta.next()) {
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("producto");
                datos[2] = consulta.getString("marca");
                datos[3] = consulta.getString("Descripcion");
                datos[4] = consulta.getString("Imagen");
                datos[5] = consulta.getString("precio_costo");
                datos[6] = consulta.getString("precio_venta");
                datos[7] = consulta.getString("existencia");  
                datos[8] = consulta.getString("fecha_ingreso");
                datos[9] = consulta.getString("idMarca");
                tabla.addRow(datos);       
            }
            
            cn.cerrar_conexion();
            
        }catch(Exception ex){
            System.out.println("Error" + ex.getMessage());
        }
        
        return tabla;
    }
    
    public int modificar() {
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "UPDATE productos set producto=?,idMarca=?,Descripcion=?,Imagen=?,precio_costo=?,precio_venta=?,existencia=?,fecha_ingreso=CURRENT_TIMESTAMP where idProducto=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            
            parametro.setString(1, getProducto());
            parametro.setInt(2, getId_marca());
            parametro.setString(3, getDescripcion());
            parametro.setString(4, getImagen());
            parametro.setDouble(5, getPrecioCosto());
            parametro.setDouble(6, getPrecioVenta());          
            parametro.setInt(7, getExistencia());
            parametro.setInt(8, getId());
            
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return retorno;
    }
    
    
    public int eliminar() {
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "DELETE from productos  where idProducto = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId());
            
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return retorno;
    }
   
}
