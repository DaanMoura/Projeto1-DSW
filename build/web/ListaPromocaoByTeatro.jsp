<%-- 
    Document   : ListaPromocaoByTeatro
    Created on : 21/04/2019, 18:25:15
    Author     : Marcos Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Venda de Ingressos</title>
    </head>
    <body>

        <div align="center">
            <c:if test="${promocao != null}"> 
                <form action="listaTeatro" method="post">
                </c:if>
                <c:if test="${promocao == null}">
                    <form action="listaTeatro" method="post">
                    </c:if>
                        <c:if test="${promocao != null}">
                                    Edição
                                    <input type="hidden" name="url" value="<c:out value='${promocao.url}' />"/> 
                                    <input type="hidden" name="CNPJ" value="<c:out value='${promocao.CNPJ}' />"/>
                                    <input type="hidden" name="horario" value="<c:out value='${promocao.horario}'/>"/>                                
                                </c:if>
                    <caption><h2>Lista promoções</h2></caption>
                    <br><br><tr>
                        
                    <p>Por favor, digite o cnpj do teatro em que deseja buscar as promoções</p>
                        <th>CNPJ: </th>
                        <td>
                            <input type="text" name="CNPJ" size="15" required
                                   value= "<c:out value='${promocao.CNPJ}' />"
                                   />
                        </td><br>
                    </tr><br>
                    <table border="1" cellpadding="5">
                        <tr>
                            <th>URL</th>
                            <th>Nome</th>
                            <th>Data</th>
                            <th>Preço</th>
                            <th>Ações</th>

                        </tr>
                        <c:forEach var="promocao" items="${requestScope.ListaPromocaoByTeatro}">
                            <tr>
                                <td><c:out value="${promocao.url}" /></td>
                                <td><c:out value="${promocao.nome}" /></td>
                                <td><c:out value="${promocao.horario}" /></td>
                                <td><c:out value="${promocao.preco}" /></td>

                                <td>
                                    <a href="edicaoPromocao?CNPJ=<c:out value='${promocao.CNPJ}' />&url=<c:out value='${promocao.url}'/>&horario=<c:out value='${promocao.horario}'/>">Edição</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="remocaoPromocao?CNPJ=<c:out value='${promocao.CNPJ}' />&url=<c:out value='${promocao.url}'/>&horario=<c:out value='${promocao.horario}'/>" 
                           onclick="return confirm('Tem certeza de que deseja excluir este item?');">
                            Remoção
                        </a>                    	
                                </td>
                            </tr>
                        </c:forEach>
                    </table>

                    <br><tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Buscar" />
                        </td>
                    </tr>
                    </div>

                    <center>    
                        <br><a href="CadastroPromocao.jsp">Cadastrar nova promoção</a>
                    </center>
                    </body>
                    </html>

