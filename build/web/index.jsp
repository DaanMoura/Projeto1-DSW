

<%-- 
    Document   : ListaTeatros
    Created on : 18/04/2019, 19:07:47
    Author     : Marcos Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<f:bundle basename="i18n.mensagens">
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="style/css/bootstrap.css" rel="stylesheet" type="text/css"/>
            <link href="style/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
            <link href="style/css/bootstrap.css" rel="stylesheet" type="text/css"/>
            <link href="style/css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css"/>

            <title><f:message key="page.title"/></title>
        </head>
        <%@include file="base/top.jsp" %>
        <div class="container">
            <h1 class="display-4"><f:message key="welcome.index"/></h1>  
            <p class="lead"><f:message key="message.index"/></p>

            <%@include file="ListaTeatros.jsp" %>
        </div>

    </body>
    <script src="style/js/bootstrap.js"></script>
    <script src="style/js/bootstrap.bundle.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>


</f:bundle>





