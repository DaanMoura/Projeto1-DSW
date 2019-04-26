/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufscar.dc.dsw.dao;

import br.ufscar.dc.dsw.model.Promocao;
import br.ufscar.dc.dsw.model.SalaTeatro;
import br.ufscar.dc.dsw.model.SiteVendas;
import java.sql.Connection;
import java.sql.Timestamp;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author daniel
 */
public class PromocaoDAO {
    public PromocaoDAO() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    
    protected Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:derby://localhost:1527/VendaIngressoBD", "root", "root");
    }
    
    public void insert(Promocao promocao) throws SQLException{
        String sql = "INSERT INTO Promocao "
                + "(url, CNPJ, nome, preco, horario) "
                + "VALUES (?, ?, ?, ?, ?)";
        
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, promocao.getUrl());
            statement.setString(2, promocao.getCNPJ());
            statement.setString(3, promocao.getNome());
            statement.setFloat(4, promocao.getPreco());
            statement.setTimestamp(5, new Timestamp(promocao.getHorario().getTime()));
            
            statement.executeUpdate();
            statement.close();
            conn.close();
    }

    public void delete(Promocao promocao)throws SQLException{
      String sql = "DELETE FROM Promocao WHERE "
            + "url = ? AND CNPJ = ? AND horario = ?";
        Connection conn = this.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        

        statement.setString(1, promocao.getUrl());
        statement.setString(2, promocao.getCNPJ());
        statement.setTimestamp(3, new Timestamp(promocao.getHorario().getTime()));
        statement.executeUpdate();
        statement.close();
        conn.close();
    }
    
    public boolean checkValidity(String url,String CNPJ,Date horario) throws SQLException{
        String sql = "SELECT * FROM Promocao WHERE (url = ? AND horario = ?) OR (CNPJ = ? AND horario = ?)";
        try{
        Connection conn = this.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1,url);
        statement.setString(3,CNPJ);
        statement.setTimestamp(2, new Timestamp(horario.getTime()));
        statement.setTimestamp(4, new Timestamp(horario.getTime()));
        ResultSet resultSet = statement.executeQuery();
        if(resultSet.next()){
            return false;
            }
        else{
            return true;
        }
        }
        catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public Promocao getFromKey(String url,String CNPJ,Date horario)throws SQLException{
        Promocao promocao = new Promocao();
        String sql = "SELECT * FROM Promocao WHERE url = ? AND CNPJ = ? AND horario = ?";

        Connection conn = this.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1,url);
        statement.setString(2,CNPJ);
        statement.setTimestamp(3, new Timestamp(horario.getTime()));
        ResultSet resultSet = statement.executeQuery();
        if(resultSet.next()){
        String nome = resultSet.getString("nome");
        Float preco = resultSet.getFloat("preco");
        promocao.setCNPJ(CNPJ);
        promocao.setHorario(horario);
        promocao.setUrl(url);
        promocao.setNome(nome);
        promocao.setPreco(preco);
        }
        
        return promocao;
    }
    
    public List<Promocao> getAll()throws SQLException {
      List<Promocao> promocoes = new ArrayList<>();
      String sql = "SELECT * FROM Promocao";


        Connection conn = this.getConnection();
        Statement statement = conn.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
          String url = resultSet.getString("url");
          String cnpj = resultSet.getString("cnpj");
          String nome = resultSet.getString("nome");
          float preco = resultSet.getFloat("preco");
          Date horario = new Date(resultSet.getTimestamp("horario").getTime());
         
          
          Promocao promocao = new Promocao(url, cnpj, nome, preco, horario);
          promocoes.add(promocao);
        }
        resultSet.close();
        conn.close();
      return promocoes;
    }

    public List<Promocao> getFromCNPJ(String CNPJ)throws SQLException{
       
            List<Promocao> promocoes = new ArrayList<>();
            String sql = "SELECT * FROM Promocao WHERE CNPJ = ?";
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1,CNPJ);
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()){
                String url = resultSet.getString("url");
                String cnpj = resultSet.getString("cnpj");
                String nome = resultSet.getString("nome");
                float preco = resultSet.getFloat("preco");
                Date horario = new Date(resultSet.getTimestamp("horario").getTime());

                Promocao promocao = new Promocao(url, cnpj, nome, preco, horario);
                promocoes.add(promocao);
            }
                 resultSet.close();
                 conn.close();

         return promocoes; 
    }
   public List<Promocao> getFromURL(String url)throws SQLException{
       
            List<Promocao> promocoes = new ArrayList<>();
            String sql = "SELECT * FROM Promocao WHERE url = ?";
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1,url);
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()){
                String URL = resultSet.getString("url");
                String cnpj = resultSet.getString("cnpj");
                String nome = resultSet.getString("nome");
                float preco = resultSet.getFloat("preco");
                Date horario = new Date(resultSet.getTimestamp("horario").getTime());

                Promocao promocao = new Promocao(url, cnpj, nome, preco, horario);
                promocoes.add(promocao);
            }
                 resultSet.close();
                 conn.close();

         return promocoes; 
    }

    //QUESTION: terá um get específico?
    
    public void update(Promocao promocao) throws SQLException{
      String sql = "UPDATE Promocao SET "
              + "nome = ?, preco = ? "
              + "WHERE url = ? AND CNPJ = ? AND horario = ?";

        Connection conn = this.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, promocao.getNome());
        statement.setFloat(2, promocao.getPreco());
        statement.setString(3, promocao.getUrl());
        statement.setString(4, promocao.getCNPJ());
        statement.setTimestamp(5, new Timestamp(promocao.getHorario().getTime()));
        statement.executeUpdate();

        statement.close();
        conn.close();
     
    }
}
