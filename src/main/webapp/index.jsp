<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<html>
<body>
<h2>Logar no sistema</h2>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <label for="email">
                <b>Email</b>
            </label>
            <input type="email" placeholder="email" name="email" >

            </br>
            </br>

            <label for="password">
                <b>Senha</b>
            </label>
            <input type="password" placeholder="password" name="password" >


            <br/>
            </br>


            <button type="submit" name="action" value="logar">Logar</button>
            <button type="submit" name="action" value="cadastrar">Cadastrar Usuário</button>

        </form>

<c:if test="${not empty msg}">
    <h2>${msg}</h2>
</c:if>


</body>
</html>
