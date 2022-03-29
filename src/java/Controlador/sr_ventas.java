/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Cliente;
import Modelo.ClienteDAO;
import Modelo.Generar_numfact;
import Modelo.Producto;
import Modelo.ProductoDAO;
import Modelo.Venta;
import Modelo.VentaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mfer_
 */
public class sr_ventas extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Cliente c=new Cliente();
    ClienteDAO cdao=new ClienteDAO();
    Producto p=new Producto();
    ProductoDAO pdao=new ProductoDAO();
    Venta v=new Venta();
   //VARIABLES LOCALES PARA EL MANEJO DE LA TABLA 
    List<Venta>lista=new ArrayList<>();
    int item;
    int cod;
    String descripcion;
    double precio;
    int cant;
    double subtotal;
    double totalpagar;
    String numerofactura;//VARIABLE PARA EL NUMERO DE FACTURA
    VentaDAO vdao=new VentaDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        //RECOGER PARAMETROS 
        String menu=request.getParameter("menu");
        String accion=request.getParameter("accion");
        String useremp = request.getParameter("useremp");
        
          //GENERAR NUMERO DE FACTURA
               numerofactura = vdao.GenerarSerie();
               if(numerofactura==null){
                  numerofactura="00000001";
                  request.setAttribute("nfactura", numerofactura);
               }else{
                   int incrementar = Integer.parseInt(numerofactura);
                   Generar_numfact gnf= new Generar_numfact();
                   numerofactura=gnf.NumeroFactura(incrementar);
                   request.setAttribute("nfactura", numerofactura);
               }
        //GENERAR LA FECHA DE LA FACTURA
        String fechactual=vdao.obtenerfecha();
        request.setAttribute("fechac", fechactual);
        
        switch(accion){
           case "Buscar Cliente":
               //BUSCAR CLIENTE
                String nit= request.getParameter("codigocliente");
                c.setNit(nit);
                c=cdao.buscar(nit);
                request.setAttribute("c", c);
                
               break;
             case "BuscarProducto":
                 //BUSCAR PRODUCTO
                int id= Integer.parseInt(request.getParameter("codigoproducto"));
                p=pdao.listarId(id); 
                request.setAttribute("c", c);
                request.setAttribute("producto", p);
                
                request.setAttribute("lista", lista);
                request.setAttribute("totalpagar",totalpagar );
                 break;
             case "Agregar":
                 //AGREGAR ARTICULOS A LA TABLA 
                request.setAttribute("c", c);
                totalpagar = 0.0;
                item = item + 1;//variable contador
                cod=p.getId();//cod es igual al producto buscado con el metodo getId
                descripcion=request.getParameter("nomproducto");//descripcion es igual a la caja txt
                precio=Double.parseDouble(request.getParameter("precio"));//precio es igual a la caja txt precio
                cant=Integer.parseInt(request.getParameter("cant"));//cantidad es igual a la cakja de texto cant
                subtotal = precio * cant;
                v=new Venta();
                v.setItem(item);//agrego intem al obj venta
                v.setIdproducto(cod);//agrego el id-codigo
                v.setDescripcionp(descripcion);
                v.setPrecio_unitario(precio);
                v.setCantidad(cant);
                v.setSubtotal(subtotal);
                //todo debe estar dentro de una lista
                lista.add(v); // inserto en la lista el obj venta
                //CALCULO DEL TOTAL A PAGAR
                for (int i = 0; i < lista.size(); i++) {
                    totalpagar=totalpagar + lista.get(i).getSubtotal();
                }
                
                //ENVIO EL RESULTADO DE TOTAL A PAGAR Y LA LISTA DE ITEMS A LA PAGINA 
                request.setAttribute("totalpagar",totalpagar ); 
                request.setAttribute("lista", lista); 
                 break;
             case "Delete":
                 //ELIMINAR DE LA TABLA 
                    request.setAttribute("c", c);//--MUESTRA EL CLIENTE EL LAS CAJAS DE TEXTO
                    int idproductop=Integer.parseInt(request.getParameter("idp"));//CAPTURA EL ID DE PRODUCTO QUE SE DESEAELIMINAR 
                    String caso="hola ingrese";
                    //SE RECORRE LA LISTA HASTA ENCONTRAR EL ARTICULO QUE COINSIDA CON EL ID CAPTURADO
                    for (int i = 0; i < lista.size(); i++) {
                        if(lista.get(i).getIdproducto()==idproductop){
                            lista.remove(i);
                            item=0;
                            totalpagar = 0.0;
                            
                        }   
                    }
                    //SE CACLCULA NUEVAMENTE EL TOTAL A PAGAR RECORRIENDO LA LISTA 
                    for (int i = 0; i < lista.size(); i++) {
                    totalpagar=totalpagar + lista.get(i).getSubtotal();
                    }
                    
                    //CARGAR TOTAL Y LA LISTA DE ARTICULOS A LA PAGINA 
                    request.setAttribute("totalpagar",totalpagar);
                    request.setAttribute("lista", lista);
                 break;
              case "cancelarfactura":
                   //LIMPIA LA LISTA Y LIMPIA EL NUMERO DE ARTICULOS
                    lista.clear();
                    item=0;
                  break;
              case "GenerarVenta":
                   //ACTUALIZA EL STOCK
                for (int i = 0; i < lista.size(); i++) {
                    Producto pr=new Producto();
                    int cantidad = lista.get(i).getCantidad();
                    int idproducto = lista.get(i).getIdproducto();
                    ProductoDAO aO=new ProductoDAO();
                    pr=aO.buscar(idproducto);
                    int sac=pr.getExistencia()-cantidad;//integer sac STOCK ACTUAL ES IGUAL A METODO GET EXISTENCIA MENOS CANTIDAD
                    aO.actualizarStock(idproducto, sac); 
                }
                
                //-----------GUARDAR VENTA------------
                //CARGO EL NUMERO DE FACTURA 
                int nserie = Integer.parseInt(numerofactura);
                //CARGO EL OBJETO 
                v.setNumfactura(nserie);
                v.setSerie("A");
                v.setFecha_factura(fechactual);
                v.setIdcliente(c.getId());
                v.setIdempleado(11);
                vdao.guardarVenta(v);//AGREGO A LA FUNCION GUARDAR VENTA
                
                
                //----GUARDAR DETALLE VENTA-------------
                int idv=Integer.parseInt(vdao.idVentas());
                for (int i = 0; i < lista.size(); i++) {
                    v=new Venta();
                    v.setId(idv);
                    v.setIdproducto(lista.get(i).getIdproducto());
                    v.setCantidad(lista.get(i).getCantidad());
                    v.setPrecio_unitario(lista.get(i).getPrecio_unitario());
                    vdao.guardarDetaleventas(v);
                //request.getRequestDispatcher("sr_ventas?menu=NuevaVenta&accion=default").forward(request, response);    
                }
                //int result =vdao.guardarDetaleventas(v);
                //if(rsult!=0){
                    //request.setAttribute("config", "alert alert-success");
                    //request.setAttribute("mensaje", "Se agrego conexito");
                   // request.getRequestDispatcher("mensajejsp").forward(request, response);
                //}else{
                   //request.setAttribute("config", "alert alert-warning");
                   //request.setAttribute("mensaje", "Error no se guardo la venta");
                   //request.getRequestDispatcher("mensaje.jsp").forward(request, response);
                //}
                lista.clear();
                item=0;
                request.getRequestDispatcher("RegistrarVentao.jsp").forward(request, response);
                  break;
           default:
               
               
               lista.clear();
               item=0;
               request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
       }
       
        request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
