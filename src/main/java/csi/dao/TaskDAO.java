package csi.dao;

import csi.model.Task;
import csi.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TaskDAO {

    private Connection connection;

    public TaskDAO(Connection connection) {
        this.connection = connection;
    }

    public String insertTask(Task task) {
        String sql = "INSERT INTO tarefa (titulo, descricao, concluido, codUsuario, codcategoria) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setString(1, task.getTitle());
            pstmt.setString(2, task.getDescription());
            pstmt.setBoolean(3, task.isStatus());
            pstmt.setInt(4, task.getUser().getId());
            pstmt.setInt(5, task.getCategory().getId());


            pstmt.executeUpdate();
            pstmt.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return "Tarefa cadastrada com sucesso!";
    }

    public String deleteTask(int id) {
        String sql = "DELETE FROM tarefa WHERE id = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, id);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected == 0) {
                System.out.println("Nenhum usuário excluído, pois o ID não existe na tabela.");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao excluir usuário: " + e.getMessage());
        }

        return "Usuário excluído com sucesso!";
    }

    public String deleteTasksByUserId(int userId) {
        String sql = "DELETE FROM tarefa WHERE codusuario = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, userId);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected == 0) {
                return "Nenhuma tarefa encontrada para o usuário.";
            } else {
                return "Todas as tarefas do usuário foram excluídas com sucesso!";
            }

        } catch (SQLException e) {
            System.out.println("Erro ao excluir tarefas do usuário: " + e.getMessage());
            return "Erro ao excluir tarefas do usuário.";
        }
    }

    public String updateTask(Task task) {
        String sql = "UPDATE tarefa SET titulo = ?, descricao = ?, concluido = ? WHERE id = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, task.getTitle());
            pstmt.setString(2, task.getDescription());
            pstmt.setBoolean(3, task.isStatus());
            pstmt.setInt(4, task.getId());

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected == 0) {
                System.out.println("Nenhuma tarefa atualizada, pois o ID não existe na tabela.");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao atualizar tarefa: " + e.getMessage());
        }

        return "Tarefa atualizada com sucesso!";
    }

    public String deletTask(int id) {
        String sql = "DELETE FROM tarefa WHERE id = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, id);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected == 0) {
                System.out.println("Nenhuma tarefa excluída, pois o ID não existe na tabela.");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao excluir tarefa: " + e.getMessage());
        }

        return "Tarefa excluída com sucesso!";
    }

    public List<Task> getTasks(int user_id) {

        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT * FROM tarefa WHERE codusuario = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, user_id);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Task task = new Task();
                    task.setId(rs.getInt("id"));
                    task.setTitle(rs.getString("titulo"));
                    task.setDescription(rs.getString("descricao"));
                    task.setStatus(rs.getBoolean("concluido"));

                    tasks.add(task);
                }
            }
        } catch (SQLException e) {
            System.out.println("Erro ao listar tarefas por usuário: " + e.getMessage());
        }
        return tasks;
    }
}
