<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<f:bundle basename="i18n.mensagens">
    <!DOCTYPE html>

    <%@include file="base/top.jsp" %>
    <div class="container">
        <center>
            <h1 class="display-3">¯\_(ツ)_/¯</h1>
            <h1><f:message key="msg.error"/></h1>
            <h3><f:message key="description.label"/></h3>
            <% if (response.getStatus() == 500) {%>
            <p><%= exception.getMessage()%><br/> </p>
                <%} else {%>
            <p><%= response.getStatus()%><br/></p>
                <% }%>
        </center>	
    </div>
    <%@include file="base/bottom.jsp" %>
</f:bundle>

