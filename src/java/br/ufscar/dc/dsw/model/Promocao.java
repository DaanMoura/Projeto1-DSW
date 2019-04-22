/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufscar.dc.dsw.model;

import java.util.Date;

/**
 *
 * @author 743509
 */
public class Promocao {
    private String url;
    private String CNPJ;
    private String nome;
    private float preco;
    private Date horario;
    //private SiteVendas site;

    public Promocao(String url, String CNPJ, String nome, float preco, Date horario) {
        this.url = url;
        this.CNPJ = CNPJ;
        this.nome = nome;
        this.preco = preco;
        this.horario = horario;
    }

    public Promocao() {
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setCNPJ(String CNPJ) {
        this.CNPJ = CNPJ;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public void setHorario(Date horario) {
        this.horario = horario;
    }

    public String getUrl() {
        return url;
    }

    public String getCNPJ() {
        return CNPJ;
    }

    public String getNome() {
        return nome;
    }

    public float getPreco() {
        return preco;
    }

    public Date getHorario() {
        return horario;
    }
    
    
}
