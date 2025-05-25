<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Menu de Tarefas</title>
</head>
<body>

<h1>Menu de Tarefas</h1>

Bem-vindo, ${sessionScope.user.name}
<br>
ID de Usuário: ${sessionScope.user.id}

<ul>

  <li>
    <form action="${pageContext.request.contextPath}/tasks" method="get">
      <input type="hidden" name="action" value="criar">
      <button type="submit">Criar Tarefa</button>
    </form>
  </li>

  <li>
    <form action="${pageContext.request.contextPath}/tasks" method="get">
      <input type="hidden" name="action" value="listar-concluidas">
      <button type="submit">Tarefas Concluídas</button>
    </form>
  </li>

  <li>
    <form action="${pageContext.request.contextPath}/tasks" method="get">
      <input type="hidden" name="action" value="listar-pendentes">
      <button type="submit">Tarefas Pendentes</button>
    </form>
  </li>

</ul>

<form action="${pageContext.request.contextPath}/user" method="get">
  <input type="hidden" name="action" value="atualizar" />
  <input type="submit" value="Atualizar" />
</form>

<c:if test="${not empty msg}">
  <p>${msg}</p>
</c:if>

</body>
</html>
