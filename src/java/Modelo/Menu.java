/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author gerar
 */
public class Menu {
    private String dirmenu;
    private int diridmenu;
    Conexion cn;

    public Menu () {}
    
    public Menu(String dirmenu, int diridmenu) {
        this.dirmenu = dirmenu;
        this.diridmenu = diridmenu;
    }

    public String getDirmenu() {
        return dirmenu;
    }

    public void setDirmenu(String dirmenu) {
        this.dirmenu = dirmenu;
    }

    public int getDiridmenu() {
        return diridmenu;
    }

    public void setDiridmenu(int diridmenu) {
        this.diridmenu = diridmenu;
    }

    public DefaultTableModel leer() {
        DefaultTableModel tablaM = new DefaultTableModel();
        try{
            String query;
            cn = new Conexion();
            cn.abrir_conexion();
            query = "SELECT idmenu AS id,dir,menu_nombre FROM menu;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id","dir","menu_nombre"};
            tablaM.setColumnIdentifiers(encabezado);
            
            String datos[] = new String[3];
            while(consulta.next()) {
                datos[0] = consulta.getString("id");                
                datos[1] = consulta.getString("dir");
                datos[2] = consulta.getString("menu_nombre");
                tablaM.addRow(datos);
            }
            
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println("Error" + ex.getMessage());
        }
        
        return tablaM;
    }
    
}
