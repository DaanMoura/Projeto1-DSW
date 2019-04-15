/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufscar.dc.dsw.modo;

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

    public Promocao(String url, String CNPJ, String nome, float preco, Date horario) {
        this.url = url;
        this.CNPJ = CNPJ;
        this.nome = nome;
        this.preco = preco;
        this.horario = horario;
    }

    public Promocao() {
    }
    
    
}
