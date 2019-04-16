/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufscar.dc.dsw.controller;

import br.ufscar.dc.dsw.dao.SalaTeatroDAO;
import br.ufscar.dc.dsw.model.SalaTeatro;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author augusto
 */
@WebServlet(name = "SalaTeatroController", urlPatterns = {"/SalaTeatroController"})
public class SalaTeatroController extends HttpServlet {
private SalaTeatroDAO dao = new SalaTeatroDAO();
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        switch(action){
            case "/cadastro":
                apresentaForm(request,response);
                break;
            case "/edicao":
                apresentaFormEdicao(request,response);
                break;
            case "/insercao":
                insere(request,response);
                break;
            case "/remocao":
                remove(request,response);
                break;
            case "/atualizacao":
                update(request,response);
                break;
            
            default:
                lista(request,response);
        
        }
    }

    
    public void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<SalaTeatro> lista = dao.getAll();
        request.setAttribute("lista", lista);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ListaSite.jsp");
        dispatcher.forward(request,response); 
    }
    
    
    public void apresentaForm(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException{
        RequestDispatcher dispatcher = request.getRequestDispatcher("CadastroTeatro.jsp");
        dispatcher.forward(request,response);
    }
    public void apresentaFormEdicao(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        RequestDispatcher dispatcher = request.getRequestDispatcher("CadastroTeatro.jsp");
        String CNPJ = request.getParameter("cnpj");
        SalaTeatro sala = dao.getFromCnpj(CNPJ);
        request.setAttribute("sala",sala);
        dispatcher.forward(request, response);
    }
    
    public void insere(HttpServletRequest request,HttpServletResponse response) throws IOException{
        String CNPJ = request.getParameter("cnpj");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String cidade = request.getParameter("cidade");
        String nome = request.getParameter("nome");
        
        SalaTeatro sala = new SalaTeatro(CNPJ,email,senha,nome,cidade);
        dao.insert(sala);
        response.sendRedirect("admin");
    }
    
    public void remove(HttpServletRequest request,HttpServletResponse response) throws IOException{
        String CNPJ = request.getParameter("cnpj");
        SalaTeatro sala = dao.getFromCnpj(CNPJ);
        dao.delete(sala);
        response.sendRedirect("admin");
    }
    
    public void update(HttpServletRequest request,HttpServletResponse response) throws IOException{
        String CNPJ = request.getParameter("cnpj");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String cidade = request.getParameter("cidade");
        String nome = request.getParameter("nome");
        
        SalaTeatro sala = new SalaTeatro(CNPJ,email,senha,nome,cidade);
        dao.update(sala);
        response.sendRedirect("admin");
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
        doGet(request,response);
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
