<%-- 
    Document   : CadastroPromocao
    Created on : 19/04/2019, 19:29:17
    Author     : Marcos Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<f:bundle basename="i18n.mensagens">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><f:message key="page.title" /></title>
    </head>
    <body>
    <center>
        <h1><f:message key="promo.title" /></h1>
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
                                    Edição<f:message key="edit.title" />
                                    <input type="hidden" name="url" value="<c:out value='${promocao.url}' />"/> 
                                    <input type="hidden" name="CNPJ" value="<c:out value='${promocao.CNPJ}' />"/>
                                    <input type="hidden" name="horario" value="<c:out value='${promocao.horario}'/>"/>                                
                                </c:if>
                                <c:if test="${promocao == null}">
                                    Cadastro<f:message key="edit.title" />    
                                    <tr>
                                        <th><f:message key="url.label" /> </th>
                                        <td>
                                            <input type="text" name="url" size="45" required
                                                   value= "<c:out value='${promocao.url}' />"       
                                                   />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><f:message key="cnpj.label" /> </th>
                                        <td>
                                            <input type="text" name="CNPJ" size="45" required
                                                   value= "<c:out value='${promocao.CNPJ}' />"
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><f:message key="data.label" /> </th>
                                        <td>
                                            <input type="date" name="data" size="45" required
                                                   value= "<c:out value='${promocao.horario}' />"
                                                   />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><f:message key="time.label" /> </th>
                                        <td>
                                            <input type="time" name="horario" size="45" required
                                                   value= "<c:out value='${promocao.horario}' />"
                                                   />
                                        </td>
                                    </tr>
                                </c:if>
                            </h2>
                        </caption>
                        <tr>
                            <th><f:message key="play.label" /> </th>
                            <td>
                                <input type="text" name="nome" size="45" required
                                       value= "<c:out value='${promocao.nome}' />"
                                       />
                            </td><br>
                        </tr>
                        <tr>
                            <th><f:message key="price.label" /></th>
                            <td>
                                <input type="number" name="preco" size="45" required
                                       value= "<c:out value='${promocao.preco}' />"
                                       />
                            </td>
                        </tr>
                        
                    </table>  
                    <br>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value=<f:message key="register.title" /> />
                        </td>
                    </tr>
                </form>
                </div>
                                       <c:if test='${mensagem_insercao}'>
                                           <script>
                                               alert("O cadastro falhou pois o teatro e/ou o site já possuem promocao neste horário");
                                               </script>
                                           </c:if>
                </body>
</f:bundle>
</html>
