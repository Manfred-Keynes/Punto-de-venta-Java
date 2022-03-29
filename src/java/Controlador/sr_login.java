/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Modelo.Conexion;
import Modelo.User;
import Modelo.userDatabase;

/**
 *
 * @author gerar
 */
public class sr_login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    userDatabase usr=new userDatabase(); 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_login</title>");            
            out.println("</head>");
            out.println("<body>");
            //out.println("<h1>Servlet sr_login at " + request.getContextPath() + "</h1>");
            
            
           if ("Ingresar".equals(request.getParameter("btn_Ingresar"))){
           String lEmail = request.getParameter("txt_email");
            String lPass = request.getParameter("txt_password");
            
            User user = usr.logUser(lEmail, lPass);
            //User user = db.logUser(lEmail, lPass);
            if(user!=null){
                HttpSession session = request.getSession();
                session.setAttribute("loguser", user);
                response.sendRedirect("welcome.jsp");
            }
            else{
                HttpSession session = request.getSession();
                session.setAttribute("loguser", user);
                response.sendRedirect("login_failed.jsp");
            }
           }
           //registrar
           if ("Registrar".equals(request.getParameter("btn_Registrar"))){
               //fetch data from registration page
            String name = request.getParameter("txt_name");
            String password = request.getParameter("txt_password");
            String password2 = request.getParameter("txt_password2");
            if (password.equals(password2)) {

                //make user object
                User userModel = new User(name, password);

                //create a database model
                userDatabase regUser = new userDatabase();
                if (regUser.saveUser(userModel)) {
                    response.sendRedirect("registration_ok.jsp");
                } else {
                    String errorMessage = "User Available";
                    HttpSession regSession = request.getSession();
                    regSession.setAttribute("RegError", errorMessage);
                    response.sendRedirect("index.jsp");
                }
            }
            else{               
                response.sendRedirect("registration_failed.jsp");  
            }
           }
           //cerrar sesion
           if ("Salir".equals(request.getParameter("btn_Salir"))){
                HttpSession session = request.getSession();
                session.removeAttribute("loguser");
                response.sendRedirect("index.jsp");
           }
            out.println("</body>");
            out.println("</html>");
        }
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
