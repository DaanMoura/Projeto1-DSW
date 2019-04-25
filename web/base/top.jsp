<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<f:bundle basename="i18n.mensagens">
    <!DOCTYPE html>
    
        <body>
            <sec:authorize access="isAnonymous()">
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <a class="navbar-brand" href="/Avaliacao1/"><f:message key="page.title"/></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="/Avaliacao1/"> Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/Avaliacao1/teatros">Listar Teatros</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/Avaliacao1/promocao">Listar Promocoes</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </sec:authorize>	

            <sec:authorize access="hasRole('ADMIN')">

                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <a class="navbar-brand" href="#"><f:message key="page.title"/></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#"> Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Cadastrar Sites</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/Avaliacao1/CadastroTeatro.jsp">Cadastrar Teatros</a>
                            </li>
                        </ul>
                        <span class="navbar-text">
                            You are admin
                        </span>
                        <a href="/Avaliacao1/logout" class="btn btn-primary ml-2" role="button" aria-pressed="true">Logout</a>


                    </div>
                </nav>

            </sec:authorize>

            <sec:authorize access="hasRole('USER')">

                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <a class="navbar-brand" href="#"><f:message key="page.title"/></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Features</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Pricing</a>
                            </li>
                        </ul>
                    </div>
                </nav>

            </sec:authorize>
        </f:bundle>


