<%-- 
    Document   : CadastroSite
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
        <h1>Cadastro de sites</h1>
    </center>
    <div align="center">
        <c:if test="${site != null}"> 
            <form action="atualizacao" method="post">
            </c:if>
            <c:if test="${site == null}">
                <form action="insercao" method="post">
                </c:if>
                <form name="form">
                    <table border="1" cellpadding="5">
                        <caption>
                            <h2>
                                <c:if test="${site != null}">
                                    Edição
                                    <input type="hidden" name="url" value="<c:out value='${site.url}' />" 
                                           />
                                </c:if>
                                <c:if test="${site == null}">
                                    Cadastro    
                                    <tr>
                                        <th>URL: </th>
                                        <td>
                                            <input type="text" name="url" size="45" required
                                                   value= "<c:out value='${site.url}' />"       
                                                   />
                                        </td>
                                    </tr>
                                </c:if>
                            </h2>
                        </caption>
                        <tr>
                            <th>Nome: </th>
                            <td>
                                <input type="text" name="nome" size="45" required
                                       value= "<c:out value='${site.nome}' />"
                                       />
                            </td><br>
                        </tr>
                        <tr>
                            <th>E-mail: </th>
                            <td>
                                <input type="text" name="email" size="45" required
                                       value= "<c:out value='${site.email}' />"
                                       />
                            </td>
                        </tr>
                        <tr>
                            <th>Senha: </th>
                            <td>
                                <input type="password" name="senha" size="45" required
                                       value= "<c:out value='${site.senha}' />"       
                                       />
                            </td>    
                        </tr>
                        <tr>
                            <th>Telefone: </th>
                            <td>
                                <input type="number" name="telefone" size="45" required
                                       value= "<c:out value='${site.telefone}' />"       
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
