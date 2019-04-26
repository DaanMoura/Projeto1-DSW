<%@page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<f:bundle basename="i18n.mensagens">
<html>
    <head>
      <title><f:message key="page.title"/> - <f:message key="error.title"/></title>
    </head>
    <body>
        <center>
            
          <h1><f:message key="msg.error"/></h1>
          <h3><f:message key="description.label"/></h3>
          <% if(response.getStatus() == 500){ %>
            <p><%= exception.getMessage()%><br/> </p>
            <%} else{ %>
            <p><%= response.getStatus()%><br/></p>
            <% } %>
        </center>	
    </body>
</html>
</f:bundle>

