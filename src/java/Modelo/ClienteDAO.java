/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Modelo.Conexion;
import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author mfer_
 */
public class ClienteDAO extends Cliente{
    
    Conexion cn;
    
    public Cliente buscar(String nit){    
        ResultSet rs;
        Cliente c=new Cliente();
        try{
            String sql="select * from clientes where nit="+nit;
            cn = new Conexion();
            cn.abrir_conexion();
             rs = cn.conexionBD.createStatement().executeQuery(sql);
            while(rs.next()){
                c.setId(rs.getInt(1));
                c.setNombres(rs.getString(2));
                c.setApellidos(rs.getString(3));
                c.setNit(rs.getString(4));
                c.setGenero(rs.getString(5));
                c.setTelefono(rs.getString(6));
                c.setCorreo(rs.getString(7));
            }
        }catch(Exception e){
        }
        return c;
         
    }
    
    public List listar(){
        ResultSet rs;
        List<Cliente>lista=new ArrayList<>();
        try{
            String sql="SELECT * FROM bd_ventas.clientes;";
            cn = new Conexion();
            cn.abrir_conexion();
            rs = cn.conexionBD.createStatement().executeQuery(sql);
            while(rs.next()){
            Cliente cl=new Cliente();
            cl.setId(rs.getInt(1));
            cl.setNombres(rs.getString(2));
            cl.setApellidos(rs.getString(3));
            cl.setNit(rs.getString(4));
            cl.setGenero(rs.getString(5));
            cl.setTelefono(rs.getString(6));
            cl.setCorreo(rs.getString(7));
           
            lista.add(cl);
            }
        }catch(Exception e){}
        return lista;
    }
    
    
}