<%-- 
    Document   : CadastroPromocao
    Created on : 19/04/2019, 19:29:17
    Author     : Marcos Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<f:bundle basename="i18n.mensagens">
    <!DOCTYPE html>
    <%@include file="base/top.jsp" %>
    <sec:authorize access="hasRole('TEATRO')">


        <div class="container">
            <c:if test="${promocao != null}"> 
                <form action="atualizacaoPromocao" method="post">
                    <h2><f:message key="edit.title" /></h2>

                </c:if>
                <c:if test="${promocao == null}">
                    <form action="insercaoPromocao" method="post">
                        <h2><f:message key="register.title" /></h2>

                    </c:if>
                    <form name="form">
                        <c:if test="${listaBySite}">
                            <input type="hidden" name="listaBySite" value="true">
                        </c:if>
                        <c:if test="${listaByTeatro}">
                            <input type="hidden" name="listaByTeatro" value="true">  
                        </c:if>
                        <input type="hidden"
                               name="${_csrf.parameterName}"
                               value="${_csrf.token}"/> 
                        <table>
                            <caption>
                                <h2>
                                    <c:if test="${promocao != null}">
                                        <input type="hidden" name="url" value="<c:out value='${promocao.url}' />"/> 
                                        <input type="hidden" name="CNPJ" value="<c:out value='${promocao.CNPJ}' />"/>
                                        <input type="hidden" name="horario" value="<c:out value='${promocao.horario}'/>"/>                                
                                    </c:if>
                                    <c:if test="${promocao == null}">
                                        <tr>
                                            <th><f:message key="url.label" /> </th>
                                            <td>
                                                <input class="form-control" type="text" name="url" size="45" required
                                                       value= "<c:out value='${promocao.url}' />"       
                                                       />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><f:message key="cnpj.label" /> </th>
                                            <td>
                                                <input class="form-control" type="text" name="CNPJ" size="45" required
                                                       value= "<c:out value='${promocao.CNPJ}' />"
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><f:message key="data.label" /> </th>
                                            <td>
                                                <input class="form-control" type="date" name="data" size="45" required
                                                       value= "<c:out value='${promocao.horario}' />"
                                                       />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><f:message key="time.label" /> </th>
                                            <td>
                                                <input class="form-control" type="time" name="horario" size="45" required
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
                                    <input class="form-control" type="text" name="nome" size="45" required
                                           value= "<c:out value='${promocao.nome}' />"
                                           />
                                </td><br>
                            </tr>
                            <tr>
                                <th><f:message key="price.label" /></th>
                                <td>
                                    <input class="form-control" type="number" name="preco" size="45" required
                                           value= "<c:out value='${promocao.preco}' />"
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
                    <c:if test='${mensagem_insercao}'>
                        <script>
                            alert("O cadastro falhou pois o teatro e/ou o site já possuem promocao neste horário");
                        </script>
                    </c:if>
                    </body>
                </sec:authorize>
            </f:bundle>
            </html>
