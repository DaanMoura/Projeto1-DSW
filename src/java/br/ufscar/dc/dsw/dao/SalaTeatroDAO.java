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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 *
 * @author daniel
 */
public class SalaTeatroDAO {
    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
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
    
    public void insertPapel(String email) throws SQLException {
        String sql = "INSERT INTO Papel (email,nome) VALUES (?,?)";
        Connection conn = this.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, "ROLE_TEATRO");
        statement.execute();
        statement.close();
        conn.close();
    }
     public void insertUsuario(String email,String senha) throws SQLException{
    String sql = "INSERT INTO Usuario (email,senha,ativo) VALUES (?,?,?)";
        Connection conn = this.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1,email);
        statement.setString(2,encoder.encode(senha));
        statement.setBoolean(3,true);
        statement.execute();
        statement.close();
        conn.close();        
    }
    public void insert(SalaTeatro sala) throws SQLException {
        insertUsuario(sala.getEmail(),sala.getSenha());
        insertPapel(sala.getEmail());
        String sql = "INSERT INTO SalaTeatro "
                + "(CNPJ, email, senha, nome, cidade) "
                + "VALUES (?, ?, ?, ?, ?)";
        
    
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
        
    }
    
    public void removeUsuario(String email)throws SQLException{
        String sql = "DELETE FROM Usuario where email = ?";
        Connection conn = this.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1,email);
        statement.execute();
        statement.close();
        conn.close();
    }
    public void removePapel(String email)throws SQLException{
        String sql = "DELETE FROM Papel where email = ?";
        Connection conn = this.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1,email);
        statement.execute();
        statement.close();
        conn.close();
    }
    public void updateUsuario(String cnpj, String novo_email) throws SQLException{
        String sql = "UPDATE Usuario SET email = ? where email = ?";
        Connection conn = this.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, novo_email);
        SalaTeatro sala = getFromCnpj(cnpj);
        statement.setString(2,sala.getEmail());
        statement.execute();
        statement.close();
        conn.close();
    }
    
     public void updatePapel(String cnpj, String novo_email) throws SQLException{
        String sql = "UPDATE Papel SET email = ? where email = ?";
        Connection conn = this.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, novo_email);
        SalaTeatro sala = getFromCnpj(cnpj);
        statement.setString(2,sala.getEmail());
        statement.execute();
        statement.close();
        conn.close();
    }
    
    
    
    public List<SalaTeatro> getAll()throws SQLException {
        List<SalaTeatro> salas = new ArrayList<>();
        String sql = "SELECT * FROM SalaTeatro";
        

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
        
        
        return salas;
    }
    
    public void delete(SalaTeatro sala) throws SQLException{
        
        removeUsuario(getFromCnpj(sala.getCNPJ()).getEmail());
        removePapel(getFromCnpj(sala.getCNPJ()).getEmail());
        String sql = "DELETE FROM SalaTeatro WHERE CNPJ = ?";
 
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, sala.getCNPJ());
            statement.executeUpdate();
            statement.close();
            conn.close();
        
    }
    
    public void update(SalaTeatro sala) throws SQLException {
        updateUsuario(sala.getCNPJ(),sala.getEmail());
        updatePapel(sala.getCNPJ(),sala.getEmail());
        String sql = "UPDATE SalaTeatro SET "
                + "email = ?, "
                + "senha = ?, "
                + "nome = ?, "
                + "cidade = ? "
                + "WHERE CNPJ = ?";

            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, sala.getEmail());
            statement.setString(2, sala.getSenha());
            statement.setString(3, sala.getNome());
            statement.setString(4, sala.getCidade());
            statement.setString(5, sala.getCNPJ());
            statement.executeUpdate();
            
            statement.close();
            conn.close();
       
    }
    
    public SalaTeatro getFromCnpj(String CNPJ) throws SQLException{
        SalaTeatro sala = null;
        String sql = "SELECT * FROM SalaTeatro WHERE CNPJ = ?";
        

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
       
        
        return sala;
    }
    
    public List<SalaTeatro> getFromCity(String cidade) throws SQLException {
        List<SalaTeatro> salas = new ArrayList<>();
        String sql = "SELECT * FROM SalaTeatro "
                + "WHERE cidade = ?";
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, cidade);
            ResultSet resultSet = statement.executeQuery();
            
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
       
        
        return salas;
    }
}
