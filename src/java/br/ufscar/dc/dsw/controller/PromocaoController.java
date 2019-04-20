/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufscar.dc.dsw.controller;

import br.ufscar.dc.dsw.dao.PromocaoDAO;
import br.ufscar.dc.dsw.model.Promocao;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Float.parseFloat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static javax.xml.bind.DatatypeConverter.parseDate;


/**
 *
 * @author augusto
 */
@WebServlet(urlPatterns = {"/PromocaoController"})
public class PromocaoController extends HttpServlet {

     private PromocaoDAO dao = new PromocaoDAO();
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
            case "/insercaoPromocao":
                insere(request,response);
                break;
            case "/atualizacaoPromocao":
                update(request,response);
                break;
            case "/remocaoPromocao":
                remove(request,response);
                break;    
            case "/cadastroPromocao":
                apresentaForm(request,response);
                break;
            case "/edicaoPromocao":
                apresentaFormEdicao(request,response);
                break;
            default:
                lista(request,response);
                
        }
    }

    public void apresentaForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        RequestDispatcher dispatcher = request.getRequestDispatcher("CadastroPromocao.jsp");
        dispatcher.forward(request, response);
    
    }
    
    public void apresentaFormEdicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RequestDispatcher dispatcher = request.getRequestDispatcher("CadastroPromocao.jsp");
        String url = request.getParameter("url");
        String CNPJ = request.getParameter("CNPJ");
        Calendar calendar = parseDate(request.getParameter("horario"));
        Date horario = calendar.getTime();
        Promocao promocao = dao.getFromKey(url, CNPJ, (java.sql.Date)horario);
        request.setAttribute("promocao",promocao);
        dispatcher.forward(request,response);
        
      //imcompleto  
    }
    
    public void insere(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String url = request.getParameter("url");
        String CNPJ = request.getParameter("CNPJ");
        String nome = request.getParameter("nome");
        float preco = parseFloat(request.getParameter("preco"));
        Calendar calendar = parseDate(request.getParameter("horario"));
        Date horario = calendar.getTime();
        
        Promocao promocao = new Promocao(url,CNPJ,nome,preco,horario);
        dao.insert(promocao);
        response.sendRedirect("PromocaoController");
    }
    
    public void update(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String url = request.getParameter("url");
        String CNPJ = request.getParameter("CNPJ");
        String nome = request.getParameter("nome");
        float preco = parseFloat(request.getParameter("preco"));
        Calendar calendar = parseDate(request.getParameter("horario"));
        Date horario = calendar.getTime();
        Promocao promocao = new Promocao(url,CNPJ,nome,preco,horario);
        dao.update(promocao);
        response.sendRedirect("PromocaoController");
    }
   public void remove(HttpServletRequest request, HttpServletResponse response) throws IOException{
   //incompleto
   String url = request.getParameter("url");
   String CNPJ = request.getParameter("CNPJ");
   Date horario = (Date) request.getAttribute("horario");
   Promocao promocao = new Promocao();
   promocao.setHorario(horario);
   promocao.setCNPJ(CNPJ);
   promocao.setUrl(url);
   
   dao.delete(promocao);
   response.sendRedirect("site");

   }
   
   public void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
   //incompleto
   List<Promocao> lista = dao.getAll();
   request.setAttribute("ListaPromocao", lista);
   RequestDispatcher dispatcher = request.getRequestDispatcher("ListaPromocao.jsp");
   dispatcher.forward(request,response);
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
