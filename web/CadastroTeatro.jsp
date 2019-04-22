<%-- 
    Document   : CadastroSala
    Created on : 18/04/2019, 18:41:11
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
        <h1> <f:message key="sala.title" /></h1>
    </center>
    <div align="center">
        <c:if test="${sala != null}"> 
            <form action="atualizacaoTeatro" method="post">
            </c:if>
            <c:if test="${sala == null}">
                <form action="insercaoTeatro" method="post">
                </c:if>
                <form name="form">
                    <table border="1" cellpadding="5">
                        <caption>
                            <h2>
                                <c:if test="${sala != null}">
                                    <f:message key="edit.title" />
                                    <input type="hidden" name="CNPJ" value="<c:out value='${sala.CNPJ}' />" 
                                           />
                                </c:if>
                                <c:if test="${sala == null}">
                                    <f:message key="register.title" />
                                    <tr>
                                        <th><f:message key="cnpj.label" /> </th>
                                        <td>
                                            <input type="text" name="CNPJ" size="45" 
                                                   placeholder="xx.xxx.xxx/xxxx-xx" required
                                                   value= "<c:out value='${sala.CNPJ}' />"       
                                                   />
                                        </td>
                                    </tr>
                                </c:if>
                            </h2>
                        </caption>
                        <tr>
                            <th><f:message key="name.label" />: </th>
                            <td>
                                <input type="text" name="nome" size="45" required
                                       value= "<c:out value='${sala.nome}' />"
                                       />
                            </td><br>
                        </tr>
                        <tr>
                            <th><f:message key="city.label" /> </th>
                            <td>
                                <input type="text" name="cidade" size="45" required
                                       value= "<c:out value='${sala.cidade}' />"       
                                       />
                            </td>
                        </tr>
                        <tr>
                            <th><f:message key="email.label" />: </th>
                            <td>
                                <input type="text" name="email" size="45" required
                                       value= "<c:out value='${sala.email}' />"
                                       />
                            </td>
                        </tr>
                        <tr>
                            <th><f:message key="password.label" /> </th>
                            <td>
                                <input type="password" name="senha" size="45" required
                                       value= "<c:out value='${sala.senha}' />"       
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
                </body>
</f:bundle>
                </html>
