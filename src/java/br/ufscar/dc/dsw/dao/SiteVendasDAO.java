package br.ufscar.dc.dsw.dao;

import br.ufscar.dc.dsw.model.SiteVendas;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class SiteVendasDAO {

    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    public SiteVendasDAO() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    protected Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:derby://localhost:1527/VendaIngressoBD", "root", "root");
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
    public void insertPapel(String email) throws SQLException{
        String sql = "INSERT INTO Papel (email,nome) VALUES (?,?)";
        Connection conn = this.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1,email);
        statement.setString(2,"ROLE_SITE");
        statement.execute();
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
    public void updateUsuario(String url, String novo_email) throws SQLException{
        String sql = "UPDATE Usuario SET email = ? where email = ?";
        Connection conn = this.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, novo_email);
        SiteVendas site = getFromURL(url);
        statement.setString(2,site.getEmail());
        statement.execute();
        statement.close();
        conn.close();
    }
    
    public void updatePapel(String url, String novo_email) throws SQLException{
        String sql = "UPDATE Papel SET email = ? where email = ?";
        Connection conn = this.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, novo_email);
        SiteVendas site = getFromURL(url);
        statement.setString(2,site.getEmail());
        statement.execute();
        statement.close();
        conn.close();
    }
    public void insert(SiteVendas site) throws SQLException{
        insertUsuario(site.getEmail(),site.getSenha());
        insertPapel(site.getEmail());
        String sql = "INSERT INTO SiteVendas "
                + "(url, email, senha, nome, telefone) "
                + "VALUES (?, ?, ?, ?, ?)";

        
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, site.getUrl());
            statement.setString(2, site.getEmail());
            statement.setString(3, site.getSenha());
            statement.setString(4, site.getNome());
            statement.setString(5, site.getTelefone());
            statement.executeUpdate();
            statement.close();
            conn.close();

    }

    public List<SiteVendas> getAll() throws SQLException {
      List<SiteVendas> sites = new ArrayList<>();
      String sql = "SELECT * FROM SiteVendas";

        Connection conn = this.getConnection();
        Statement statement = conn.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
          String url = resultSet.getString("url");
          String email = resultSet.getString("email");
          String senha = resultSet.getString("senha");
          String nome = resultSet.getString("nome");
          String telefone = resultSet.getString("telefone");

          SiteVendas site = new SiteVendas(url, email, senha, nome, telefone);
          sites.add(site);
        }
        resultSet.close();
        conn.close();
    
      
      return sites;
    }

    public SiteVendas getFromURL(String url) throws SQLException {
        SiteVendas site = null;
        String sql = "SELECT * FROM SiteVendas "
                + "WHERE url = ?";

        
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, url);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()) {
                String email = resultSet.getString("email");
                String senha = resultSet.getString("senha");
                String nome = resultSet.getString("nome");
                String telefone = resultSet.getString("telefone");
                
                site = new SiteVendas(url, email, senha, nome, telefone);
            }
            
            resultSet.close();
            statement.close();
            conn.close();
           
       
        
        return site;
    }

    public void update(SiteVendas site) throws SQLException {
        updateUsuario(site.getUrl(),site.getEmail());
        updatePapel(site.getUrl(),site.getEmail());
        String sql = "UPDATE SiteVendas SET "
                + "email = ?, "
                + "senha = ?, "
                + "nome = ?, "
                + "telefone = ? "
                + "WHERE url = ?";
            
       
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, site.getEmail());
            statement.setString(2, site.getSenha());
            statement.setString(3, site.getNome());
            statement.setString(4, site.getTelefone());
            statement.setString(5, site.getUrl());
            statement.executeUpdate();
            
            statement.close();
            conn.close();
       
    }
    
    public void delete(SiteVendas site) throws SQLException{
        removeUsuario(getFromURL(site.getUrl()).getEmail());
       removePapel(getFromURL(site.getUrl()).getEmail());
        String sql = "DELETE FROM SiteVendas where url = ?";
        
        
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, site.getUrl());
            statement.executeUpdate();
            
            statement.close();
            conn.close();
       
    }
}
