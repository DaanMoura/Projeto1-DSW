/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufscar.dc.dsw.dao;

import br.ufscar.dc.dsw.model.Promocao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
    
    public void insert(Promocao promocao) {
        String sql = "INSERT INTO Promocao "
                + "(url, CNPJ, nome, preco, horario) "
                + "VALUES (?, ?, ?, ?, ?)";
        
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, promocao.getUrl());
            statement.setString(2, promocao.getCNPJ());
            statement.setString(3, promocao.getNome());
            statement.setFloat(4, promocao.getPreco());
            statement.setDate(5, (Date) promocao.getHorario());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void delete(Promocao promocao) {
      String sql = "DELETE FROM Promocao WHERE "
            + "url = ? AND CNPJ = ? AND horario = ?";
      try {
        Connection conn = this.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);

        statement.setString(1, promocao.getUrl());
        statement.setString(2, promocao.getCNPJ());
        statement.setDate(3, (Date) promocao.getHorario());
        statement.executeUpdate();
        statement.close();
        conn.close();
      } catch (SQLException e) {
        throw new RuntimeException(e);
      }
    }

    public Promocao getFromKey(String url,String CNPJ,Date horario){
        Promocao promocao = null;
        String sql = "SELECT * FROM Promocao WHERE url = ? AND CNPJ = ? AND horario = ?";
        try{
        Connection conn = this.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1,url);
        statement.setString(2,CNPJ);
        statement.setDate(3,horario);
        ResultSet resultSet = statement.executeQuery(sql);
        if(resultSet.next()){
         String nome = resultSet.getString("nome");
         Float preco = resultSet.getFloat("preco");
        }
        }
        catch(SQLException e){
            throw new RuntimeException(e);
        }
        return promocao;
    }
    
    public List<Promocao> getAll() {
      List<Promocao> promocoes = new ArrayList<>();
      String sql = "SELECT * FROM Promocao";

      try {
        Connection conn = this.getConnection();
        Statement statement = conn.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
          String url = resultSet.getString("url");
          String cnpj = resultSet.getString("cnpj");
          String nome = resultSet.getString("nome");
          float preco = resultSet.getFloat("preco");
          Date horario = (Date) resultSet.getDate("date");

          Promocao promocao = new Promocao(url, cnpj, nome, preco, horario);
          promocoes.add(promocao);
        }
        resultSet.close();
        conn.close();
      } catch (SQLException e) {
        throw new RuntimeException(e);
      }

      return promocoes;
    }

    //QUESTION: terá um get específico?
    
    public void update(Promocao promocao) {
      String sql = "UPDATE Promocao SET "
              + "nome = ?, preco = ?, "
              + "WHERE url = ? AND CNPJ = ? AND horario = ?";
      try {
        Connection conn = this.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, promocao.getNome());
        statement.setFloat(2, promocao.getPreco());
        statement.setString(3, promocao.getUrl());
        statement.setString(4, promocao.getCNPJ());
        statement.setDate(5, (Date) promocao.getHorario());

        statement.close();
        conn.close();
      } catch (SQLException e) {
        throw new RuntimeException(e);
      }
    }
}
