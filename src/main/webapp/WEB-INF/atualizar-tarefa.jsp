<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Atualizar Tarefa</title>
</head>
<body>
<h1>Atualizar Tarefa</h1>

<form action="${pageContext.request.contextPath}/tasks" method="POST">
  <input type="hidden" name="action" value="editar" />
  <input type="hidden" name="id" value="${task.id}" />

  <label for="titulo">Título:</label>
  <input type="text" id="titulo" name="titulo" value="${task.title}" required>

  <label for="descricao">Descrição:</label>
  <input type="text" id="descricao" name="descricao" value="${task.description}">

  <input type="hidden" name="concluido" value="true" />

  <button type="submit">Atualizar</button>
</form>
</body>
</html>
