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
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
         try {
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
                 case "/listaTeatro":
                     listaTeatro(request,response);
                     break;
                 default:
                     lista(request,response);
                     
             }} catch (ParseException ex) {
             Logger.getLogger(PromocaoController.class.getName()).log(Level.SEVERE, null, ex);
         } catch (SQLException ex) {
             Logger.getLogger(PromocaoController.class.getName()).log(Level.SEVERE, null, ex);
         }
    }
    public void listaTeatro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String CNPJ = request.getParameter("CNPJ");
        List<Promocao> lista = dao.getFromCNPJ(CNPJ);
        request.setAttribute("ListaPromocao", lista);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ListaPromocaoByTeatro.jsp");
        dispatcher.forward(request, response);
    }

    public void apresentaForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        RequestDispatcher dispatcher = request.getRequestDispatcher("CadastroPromocao.jsp");
        dispatcher.forward(request, response);
    
    }
    
    public void apresentaFormEdicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException{
        RequestDispatcher dispatcher = request.getRequestDispatcher("CadastroPromocao.jsp");
        String url = request.getParameter("url");
        String CNPJ = request.getParameter("CNPJ");
        SimpleDateFormat dateFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss Z yyyy");
        String hor = request.getParameter("horario");
        Date horario = dateFormat.parse(hor);
        Promocao promocao = dao.getFromKey(url, CNPJ,horario);
        request.setAttribute("promocao",promocao);
        dispatcher.forward(request,response);
        
      //imcompleto  
    }
    
    public void insere(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException, SQLException, ServletException{
        String url = request.getParameter("url");
        String CNPJ = request.getParameter("CNPJ");
        String nome = request.getParameter("nome");
        float preco = parseFloat(request.getParameter("preco"));
       SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String hor = request.getParameter("data");
        hor += " " + request.getParameter("horario");
        Date horario = dateFormat.parse(hor);      
        if(dao.checkValidity(url, CNPJ, horario)){
        Promocao promocao = new Promocao(url,CNPJ,nome,preco,horario);
        dao.insert(promocao);
        response.sendRedirect("PromocaoController");
        }
        else{
        RequestDispatcher dispatcher = request.getRequestDispatcher("CadastroPromocao.jsp");
        request.setAttribute("mensagem_insercao",true);
        dispatcher.forward(request, response);
        }
    }
    
    public void update(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException{
        String url = request.getParameter("url");
        String CNPJ = request.getParameter("CNPJ");
        String nome = request.getParameter("nome");
        float preco = parseFloat(request.getParameter("preco"));
        SimpleDateFormat dateFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss Z yyyy");
        String hor = request.getParameter("horario");
        Date horario = dateFormat.parse(hor);   
        Promocao promocao = new Promocao(url,CNPJ,nome,preco,horario);
        dao.update(promocao);
        response.sendRedirect("PromocaoController");
    }
   public void remove(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException{
   //incompleto
   String url = request.getParameter("url");
   String CNPJ = request.getParameter("CNPJ");
   SimpleDateFormat dateFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss Z yyyy");
   String hor = request.getParameter("horario");
   Date horario = dateFormat.parse(hor);    
   Promocao promocao = new Promocao();
   promocao.setHorario(horario);
   promocao.setCNPJ(CNPJ);
   promocao.setUrl(url);
   
   dao.delete(promocao);
   response.sendRedirect("PromocaoController");

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
