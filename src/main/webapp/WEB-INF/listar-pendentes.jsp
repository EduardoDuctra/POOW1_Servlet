<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8" />
  <title>Tarefas Pendentes</title>
</head>
<body>
<h1>Tarefas Pendentes</h1>

<c:choose>
  <c:when test="${empty tasks}">
    <p>Não há tarefas pendentes.</p>
  </c:when>
  <c:otherwise>
    <table>
      <thead>
      <tr>
        <th>ID</th>
        <th>Título</th>
        <th>Descrição</th>
        <th>Categoria</th>
        <th>Status</th>
        <th colspan="2">Ações</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="task" items="${tasks}">
        <tr>
          <td>${task.id}</td>
          <td>${task.title}</td>
          <td>${task.description}</td>
          <td>${task.category.name}</td>

          <td>
            <form action="${pageContext.request.contextPath}/tasks" method="get">
              <input type="hidden" name="action" value="editar" />
              <input type="hidden" name="id" value="${task.id}" />

              <button type="submit">Editar</button>
            </form>
          </td>
          <td>
            <form action="${pageContext.request.contextPath}/tasks" method="post">
              <input type="hidden" name="action" value="concluida" />
              <input type="hidden" name="taskId" value="${task.id}" />
              <button type="submit">Marcar como concluída</button>
            </form>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </c:otherwise>
</c:choose>

<br>

<form action="${pageContext.request.contextPath}/menu" method="get">
  <input type="hidden" name="action" value="voltar" />
  <button type="submit">Voltar</button>
</form>

</body>
</html>
