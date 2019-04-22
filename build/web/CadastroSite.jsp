<%-- 
    Document   : CadastroSite
    Created on : 15/04/2019, 10:19:28
    Author     : Marcos Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<f:bundle basename="i18n.mensagens">
<!DOCTYPE html>
<sec:authorize access="hasRole('ADMIN')">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><f:message key="page.title" /></title>
    </head>
    <body>
    <center>
        <h1><f:message key="site.title" /></h1>
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
                        <input type="hidden"
                               name="${_csrf.parameterName}"
                               value="${_csrf.token}"/> 
                        <caption>
                            <h2>
                                <c:if test="${site != null}">
                                    <f:message key="edit.label" />
                                    <input type="hidden" name="url" value="<c:out value='${site.url}' />" 
                                           />
                                </c:if>
                                <c:if test="${site == null}">
                                    <f:message key="register.title" />  
                                    <tr>
                                        <th><f:message key="url.label" />: </th>
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
                            <th><f:message key="name.label" /> </th>
                            <td>
                                <input type="text" name="nome" size="45" required
                                       value= "<c:out value='${site.nome}' />"
                                       />
                            </td><br>
                        </tr>
                        <tr>
                            <th><f:message key="email.label" /> </th>
                            <td>
                                <input type="text" name="email" size="45" required
                                       value= "<c:out value='${site.email}' />"
                                       />
                            </td>
                        </tr>
                        <tr>
                            <th><f:message key="password.label" /> </th>
                            <td>
                                <input type="password" name="senha" size="45" required
                                       value= "<c:out value='${site.senha}' />"       
                                       />
                            </td>    
                        </tr>
                        <tr>
                            <th><f:message key="phone.label" /> </th>
                            <td>
                                <input type="number" name="telefone" size="45"
                                       placeholder="xxxxx-xxxx" required
                                       value= "<c:out value='${site.telefone}' />"       
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
</sec:authorize>
</f:bundle>
                </html>
