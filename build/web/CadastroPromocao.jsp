<%-- 
    Document   : CadastroPromocao
    Created on : 19/04/2019, 19:29:17
    Author     : Marcos Felipe
--%>

<%-- 
    Document   : Cadastropromocao
    Created on : 15/04/2019, 10:19:28
    Author     : Marcos Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Venda de Ingressos</title>
    </head>
    <body>
    <center>
        <h1>Promoções</h1>
    </center>
    <div align="center">
        <c:if test="${promocao != null}"> 
            <form action="atualizacaoPromocao" method="post">
            </c:if>
            <c:if test="${promocao == null}">
                <form action="insercaoPromocao" method="post">
                </c:if>
                <form name="form">
                    <table border="1" cellpadding="5">
                        <caption>
                            <h2>
                                <c:if test="${promocao != null}">
                                    Edição
                                    <input type="hidden" name="url" value="<c:out value='${promocao.url}' />" 
                                    <input type="hidden" name="CNPJ" value="<c:out value='${promocao.CNPJ}' />" 
                                           />
                                </c:if>
                                <c:if test="${promocao == null}">
                                    Cadastro    
                                    <tr>
                                        <th>URL do site: </th>
                                        <td>
                                            <input type="text" name="url" size="45" required
                                                   value= "<c:out value='${promocao.url}' />"       
                                                   />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>CNPJ do teatro: </th>
                                        <td>
                                            <input type="text" name="CNPJ" size="45" required
                                                   value= "<c:out value='${promocao.CNPJ}' />"
                                        </td>
                                    </tr>
                                </c:if>
                            </h2>
                        </caption>
                        <input type="hidden" name="horario" 
                               value="<c:out value='${promocao.horario}' />" 
                        />
                        <tr>
                            <th>Nome da peça: </th>
                            <td>
                                <input type="text" name="nome" size="45" required
                                       value= "<c:out value='${promocao.nome}' />"
                                       />
                            </td><br>
                        </tr>
                        <tr>
                            <th>Preço: </th>
                            <td>
                                <input type="number" name="preco" size="45" required
                                       value= "<c:out value='${promocao.preco}' />"
                                       />
                            </td>
                        </tr>
                        <tr>
                            <th>Data: </th>
                            <td>
                                <input type="date" name="dataa" size="45" required
                                       value= "<c:out value='${promocao.dataa}' />"
                                       />
                            </td>
                        </tr>
                        <tr>
                            <th>Horário: </th>
                            <td>
                                <input type="time" name="horario" size="45" required
                                       value= "<c:out value='${promocao.horario}' />"
                                       />
                            </td>
                        </tr>
                    </table>  
                    <br>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Cadastrar" />
                        </td>
                    </tr>
                </form>
                </div>
                </body>
</html>
