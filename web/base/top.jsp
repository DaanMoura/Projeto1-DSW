<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<f:bundle basename="i18n.mensagens">
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="style/css/bootstrap.css" rel="stylesheet" type="text/css"/>
            <link href="style/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
            <link href="style/css/bootstrap.css" rel="stylesheet" type="text/css"/>
            <link href="style/css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css"/>

            <title><f:message key="page.title"/></title>
        </head>
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
                                <a class="nav-link" href="/Avaliacao1/"> Listar Teatros <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/Avaliacao1/">Listar Teatros por Cidade</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/Avaliacao1/">Listar Promocoes</a>
                            </li>
                        </ul>
                        <a href="/Avaliacao1/login" class="btn btn-primary ml-2" role="button" aria-pressed="true">Login</a>

                    </div>
                </nav>
            </sec:authorize>	

            <sec:authorize access="hasRole('ADMIN')">

                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <a class="navbar-brand" href="/Avaliacao1"><f:message key="page.title"/></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbar">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="/Avaliacao1">Teatros</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/Avaliacao1/sites">Sites</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Promoções</a>
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

