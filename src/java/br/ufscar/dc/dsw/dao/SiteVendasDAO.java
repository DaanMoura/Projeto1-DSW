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

public class SiteVendasDAO {

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

    public void insert(SiteVendas site) {
        String sql = "INSERT INTO SiteVendas "
                + "(url, email, senha, nome, telefone) "
                + "VALUES (?, ?, ?, ?, ?)";

        try {
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
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public List<SiteVendas> getAll() {
      List<SiteVendas> sites = new ArrayList<>();
      String sql = "SELECT * FROM SiteVendas";

      try {
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
      } catch (SQLException e) {
        throw new RuntimeException(e);
      }
      
      return sites;
    }

    public SiteVendas getFromURL(String url) {
        SiteVendas site = null;
        String sql = "SELECT * FROM SiteVendas "
                + "WHERE url = ?";

        try {
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
           
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        
        return site;
    }

    public void update(SiteVendas site) {
        String sql = "UPDATE SiteVendas SET "
                + "email = ?, "
                + "senha = ?, "
                + "nome = ?, "
                + "telefone = ? "
                + "WHERE url = ?";
        
        try {
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
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public void delete(SiteVendas site) {
        String sql = "DELETE FROM SiteVendas where url = ?";
        
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, site.getUrl());
            statement.executeUpdate();
            
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
