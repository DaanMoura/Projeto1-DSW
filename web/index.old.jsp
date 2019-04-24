
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@include file="base/top.jsp" %>
<f:bundle basename="i18n.mensagens">

    <center>
        <h1><f:message key="avaliacao.title" /></h1>

        <div style="margin-top: 110px;"> 
            <h3>
                Sites
            </h3>
            <a href="CadastroSite.jsp"><font face="verdana" size="4" color="red"></font><f:message key="register.title" /></a>
            &nbsp;&nbsp;&nbsp;
            <a href="admin"><f:message key="list.title" /></a>
        </div>

        <div style="margin: 30px;">
            <h3>
                <f:message key="promo.title" />
            </h3>
            <a href="CadastroPromocao.jsp"><font face="verdana" size="4" color="red"></font><f:message key="register.title" /></a>
            &nbsp;&nbsp;&nbsp;
            <a href="PromocaoController"><f:message key="list.title" /></a>
            &nbsp;&nbsp;&nbsp;
            <a href="ListaPromocaoByTeatro.jsp"><f:message key="search.label" /></a>
        </div>

        <div style="margin: 30px;">
            <h3>
                <f:message key="sala.title" />
            </h3>
            <a href="CadastroTeatro.jsp"><font face="verdana" size="4" color="red"></font><f:message key="register.title" /></a>
            &nbsp;&nbsp;&nbsp;
            <a href="SalaTeatroController"><f:message key="list.title" /></a>
        </div>

    </center>
</f:bundle>
<%@include file="base/bottom.jsp" %>



