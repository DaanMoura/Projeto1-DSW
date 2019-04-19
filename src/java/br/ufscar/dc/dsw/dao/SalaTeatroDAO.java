/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufscar.dc.dsw.dao;

import br.ufscar.dc.dsw.model.SalaTeatro;
import java.sql.Connection;
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
public class SalaTeatroDAO {
    
    public SalaTeatroDAO() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    
    protected Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:derby://localhost:1527/VendaIngressoBD", "root", "root");
    }
    
    public void insert(SalaTeatro sala) {
        String sql = "INSERT INTO SalaTeatro "
                + "(CNPJ, email, senha, nome, cidade) "
                + "VALUES (?, ?, ?, ?, ?)";
        
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement =  conn.prepareStatement(sql);
            
            statement.setString(1, sala.getCNPJ());
            statement.setString(2, sala.getEmail());
            statement.setString(3, sala.getSenha());
            statement.setString(4, sala.getNome());
            statement.setString(5, sala.getCidade());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public List<SalaTeatro> getAll() {
        List<SalaTeatro> salas = new ArrayList<>();
        String sql = "SELECT * FROM SalaTeatro";
        
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                String CNPJ = resultSet.getString("CNPJ");
                String email = resultSet.getString("email");
                String senha = resultSet.getString("senha");
                String nome = resultSet.getString("nome");
                String cidade = resultSet.getString("cidade");
                
                SalaTeatro sala = new SalaTeatro(CNPJ, email, senha, nome, cidade);
                salas.add(sala);
            }
            resultSet.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        
        return salas;
    }
    
    public void delete(SalaTeatro sala) {
        String sql = "DELETE FROM SalaTeatro WHERE CNPJ = ?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, sala.getCNPJ());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public void update(SalaTeatro sala) {
        String sql = "UPDATE SalaTeatro SET "
                + "email = ?, "
                + "senha = ?, "
                + "nome = ?, "
                + "cidade = ? "
                + "WHERE CNPJ = ?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, sala.getEmail());
            statement.setString(2, sala.getSenha());
            statement.setString(3, sala.getNome());
            statement.setString(4, sala.getCidade());
            statement.setString(5, sala.getCNPJ());
            
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public SalaTeatro getFromCnpj(String CNPJ) {
        SalaTeatro sala = null;
        String sql = "SELECT * FROM SalaTeatro WHERE CNPJ = ?";
        
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, CNPJ);
            ResultSet resultSet = statement.executeQuery();
            
            if(resultSet.next()) {
                String email = resultSet.getString("email");
                String senha = resultSet.getString("senha");
                String nome = resultSet.getString("nome");
                String cidade = resultSet.getString("cidade");
                
                sala = new SalaTeatro(CNPJ, email, senha, nome, cidade);
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        
        return sala;
    }
    
    public List<SalaTeatro> getFromCity(String cidade) {
        List<SalaTeatro> salas = new ArrayList<>();
        String sql = "SELECT * FROM SalaTeatro "
                + "WHERE cidade = ?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, cidade);
            ResultSet resultSet = statement.executeQuery(sql);
            
            while (resultSet.next()) {
                String CNPJ = resultSet.getString("CNPJ");
                String email = resultSet.getString("email");
                String senha = resultSet.getString("senha");
                String nome = resultSet.getString("nome");
                
                SalaTeatro sala = new SalaTeatro(CNPJ, email, senha, nome, cidade);
                salas.add(sala);
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        
        return salas;
    }
}
