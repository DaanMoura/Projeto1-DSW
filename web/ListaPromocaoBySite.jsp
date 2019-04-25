<%-- 
    Document   : ListaPromocaoBySite
    Created on : 23/04/2019, 15:42:12
    Author     : Marcos Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<f:bundle basename="i18n.mensagens">
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title><f:message key="page.title" /></title>
        </head>
        <body>

            <div align="center">
                <c:if test="${promocao != null}"> 
                    <form action="listaBySite" method="post">
                    </c:if>
                    <c:if test="${promocao == null}">
                        <form action="listaBySite" method="post">
                        </c:if>
                        <c:if test="${promocao != null}">
                            <f:message key="edit.title" />
                            <input type="hidden" name="url" value="<c:out value='${promocao.url}' />"/> 
                            <input type="hidden" name="CNPJ" value="<c:out value='${promocao.CNPJ}' />"/>
                            <input type="hidden" name="horario" value="<c:out value='${promocao.horario}'/>"/>                                
                        </c:if>
                        <caption><h2><f:message key="listpromo.title" /></h2></caption>
                        <br><br><tr>

                        <p><f:message key="url.message" /></p>
                        <th><f:message key="url.label" /> </th>
                        <td>
                            <input type="text" name="url" size="15" required
                                   value= "<c:out value='${promocao.url}' />"
                                   />
                        </td><br>
                        </tr><br>
                        <table border="1" cellpadding="5">
                            <input type="hidden"
                               name="${_csrf.parameterName}"
                               value="${_csrf.token}"/> 
                            <tr>
                                <th><f:message key="url.label" /></th>
                                <th><f:message key="name.label" /></th>
                                <th><f:message key="date.label" /></th>
                                <th><f:message key="price.label" /></th>
                                <th><f:message key="action.label" /></th>

                            </tr>
                            <c:forEach var="promocao" items="${requestScope.ListaPromocaoBySite}">
                                <tr>
                                    <td><c:out value="${promocao.url}" /></td>
                                    <td><c:out value="${promocao.nome}" /></td>
                                    <td><c:out value="${promocao.horario}" /></td>
                                    <td><c:out value="${promocao.preco}" /></td>

                                    <td>
                                        <a href="edicaoPromocao?url=<c:out value='${promocao.url}' />&CNPJ=<c:out value='${promocao.CNPJ}'/>&horario=<c:out value='${promocao.horario}'/>&listaBySite=true"><f:message key="edit.title" /></a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="remocaoPromocao?url=<c:out value='${promocao.url}' />&CNPJ=<c:out value='${promocao.CNPJ}'/>&horario=<c:out value='${promocao.horario}'/>&listaBySite=true" 
                                           onclick="return confirm('Tem certeza de que deseja excluir este item?');">
                                            <f:message key="remove.label" />
                                        </a>                    	
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>

                        <br><tr>
                            <td colspan="2" align="center">
                                <input type="submit" value="<f:message key="search.label" />" />
                            </td>
                        </tr>
                        </div>

                        <center>    
                            <br><a href="CadastroPromocao.jsp"><f:message key="newregister.label" /></a>
                        </center>
                        </body>
                    </f:bundle>
                    </html>


