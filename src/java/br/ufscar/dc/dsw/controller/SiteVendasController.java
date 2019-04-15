/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufscar.dc.dsw.controller;

import br.ufscar.dc.dsw.dao.SiteVendasDAO;
import br.ufscar.dc.dsw.modo.SiteVendas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 743509
 */
@WebServlet(name = "SiteVendasController", urlPatterns = {"/admin"})
public class SiteVendasController extends HttpServlet {
    private SiteVendasDAO dao;
    
    @Override
    public void init(){
    dao = new SiteVendasDAO();
    }
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        switch(action){
            case "/cadastro_site":
                apresentaForm(request,response);
                break;
            case "/insercao":
                insere(request,response);
                break;
            case "/remocao":
                remove(request,response);
                break;
            case "/atualizacao":
                
                break;
            default:
                                      
        }
    }

    public void apresentaForm(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException{
        RequestDispatcher dispatcher = request.getRequestDispatcher("CadastroSite.jsp");
        dispatcher.forward(request,response);
    }
    
    public void apresentaFormEdicao(HttpServletRequest request, HttpServletResponse response){
        String url = request.getParameter("url");
        SiteVendas site = dao.getFromURL(url);
        RequestDispatcher dispatcher = request.getRequestDispatcher("CadastroSite.jsp");
        request.setAttribute("site",site);
        dispatcher.forward(request,response);       
    }
    
   public void insere(HttpServletRequest request, HttpServletResponse response)throws IOException{
       String url = request.getParameter("url");
       String email = request.getParameter("email");
       String senha = request.getParameter("senha");
       String nome = request.getParameter("nome");
       String telefone = request.getParameter("telefone");
       
       SiteVendas site = new SiteVendas(url,email,senha,nome,telefone);
       dao.insert(site);
       response.sendRedirect("admin");
   }
   public void remove(HttpServletRequest request, HttpServletResponse response)throws IOException{
       String url = request.getParameter("url");
       SiteVendas site = new SiteVendas();
       site.setUrl(url);
       dao.delete(site);
       response.sendRedirect("admin");
   }
   
   public void update(HttpServletRequest request, HttpServletResponse response){
       String url = request.getParameter("url");
       String email = request.getParameter("email");
       String senha = request.getParameter("senha");
       String nome = request.getParameter("nome");
       String telefone = request.getParameter("telefone");
       SiteVendas site = new SiteVendas(url,email,senha,nome,telefone);
       dao.update(site);
       response.redirect("admin");
   }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
