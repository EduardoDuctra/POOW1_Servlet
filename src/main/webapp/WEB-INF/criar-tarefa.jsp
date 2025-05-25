<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Criar Tarefa</title>
</head>
<body>
<h1>Criar Tarefa</h1>


<form action="${pageContext.request.contextPath}/tasks" method="POST">
  <input type="hidden" name="action" value="criar" />

  <input type="hidden" name="id" value="${task.id}" />

  <label for="titulo">Titulo:</label>
  <input type="text" id="titulo" name="titulo" required>

  <label for="descricao">Descrição:</label>
  <input type="text" id="descricao" name="descricao">

  <label for="categoria">Categoria:</label>
  <select id="categoria" name="categoria">
    <option value=""> </option>
    <option value="trabalho">Trabalho</option>
    <option value="pessoal">Pessoal</option>
    <option value="estudo">Estudo</option>
  </select>


  <input type="hidden" name="userId" value="${sessionScope.user.id}" />
  <input type="hidden" name="concluido" value="true" />



  <button type="submit">Criar</button>
</form>

</body>
</html>
