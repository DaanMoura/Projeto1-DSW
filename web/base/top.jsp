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

            <!--Navbar para visitantes-->
            <sec:authorize access="isAnonymous()">
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <a class="navbar-brand" href="/Avaliacao1/"><f:message key="page.title"/></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="/Avaliacao1/"> Teatros <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/Avaliacao1/promocao">Promoções</a>
                            </li>
                        </ul>
                        <a href="/Avaliacao1/login" class="btn btn-primary ml-2" role="button" aria-pressed="true">Login</a>

                    </div>
                </nav>
            </sec:authorize>	

            <!--Navbar para admin-->
            <sec:authorize access="hasRole('ADMIN')">

                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <a class="navbar-brand" href="/Avaliacao1"><f:message key="page.title"/></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbar">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="/Avaliacao1"><f:message key="teatros.title"/></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/Avaliacao1/sites"><f:message key="listsite.title"/></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/Avaliacao1/promocao"><f:message key="promos.title"/></a>
                            </li>

                        </ul>
                        <span class="navbar-text">
                          <f:message key="avisoAdmin.message" />
                        </span>
                        <a href="/Avaliacao1/logout" class="btn btn-primary ml-2" role="button" aria-pressed="true">Logout</a>


                    </div>
                </nav>

            </sec:authorize>

            <!--Navbar para sites-->
            <sec:authorize access="hasRole('SITE')">

                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <a class="navbar-brand" href="/Avaliacao1"><f:message key="page.title"/></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbar">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="/Avaliacao1"><f:message key="teatros.title"/></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/Avaliacao1/promocao"><f:message key="promos.title"/></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/Avaliacao1/listaBySite"><f:message key="suasPromo.title"/></a>
                            </li>
                            
                        </ul>
                        <span class="navbar-text">
                                <f:message key="avisoSite.message" />
                        </span>
                        <a href="/Avaliacao1/logout" class="btn btn-primary ml-2" role="button" aria-pressed="true">Logout</a>


                    </div>
                </nav>
            </sec:authorize>

                <!--Navbar para teatros-->
                <sec:authorize access="hasRole('TEATRO')">

                    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                        <a class="navbar-brand" href="/Avaliacao1"><f:message key="page.title"/></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbar">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="/Avaliacao1"><f:message key="teatros.title"/></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/Avaliacao1/promocao"><f:message key="promos.title"/></a>
                                </li>
                                 <li class="nav-item">
                                <a class="nav-link" href="/Avaliacao1/listaTeatro"><f:message key="suasPromo.title"/></a>
                            </li>

                            </ul>
                            <span class="navbar-text">
                                <f:message key="avisoTeatro.message" />
                            </span>
                            <a href="/Avaliacao1/logout" class="btn btn-primary ml-2" role="button" aria-pressed="true"><f:message key="sair.message"/></a>


                        </div>
                    </nav>

                </sec:authorize>
        </f:bundle>


