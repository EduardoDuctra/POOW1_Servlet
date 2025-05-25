<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cadastrar Usuário</title>
</head>
<body>
<h1>Cadastro de Usuário</h1>


<form action="${pageContext.request.contextPath}/user" method="POST">
  <input type="hidden" name="action" value="cadastrar" />

  <label for="nome">Nome:</label>
  <input type="text" id="nome" name="nome" required>

  <label for="email">Email:</label>
  <input type="email" id="email" name="email" required>

  <label for="password">Senha:</label>
  <input type="password" id="password" name="password" required>

  <button type="submit">Cadastrar</button>
</form>

</body>
</html>
