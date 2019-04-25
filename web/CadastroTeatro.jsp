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
    <%@include file="base/top.jsp" %>
    <div class="container">
        <c:if test="${sala != null}"> 
            <form action="atualizacaoTeatro" method="post">
                <h2><f:message key="edit.title" /></h2>
            </c:if>

            <c:if test="${sala == null}">
                <form action="insercaoTeatro" method="post">
                    <h2><f:message key="register.title" /></h2>
                </c:if>


                <form name="form">
                    <table>
                        <input type="hidden"
                               name="${_csrf.parameterName}"
                               value="${_csrf.token}"/>
                        <caption>
                            <h2>
                                <c:if test="${sala != null}">
                                    <input type="hidden" name="CNPJ" value="<c:out value='${sala.CNPJ}' />"/>
                                </c:if>

                                <c:if test="${sala == null}">
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
                            <input class="btn btn-primary" type="submit" value=<f:message key="register.title" /> />
                        </td>
                    </tr>
                </form>
                </div>
                </div>

                </body>
            </f:bundle>
            </html>
