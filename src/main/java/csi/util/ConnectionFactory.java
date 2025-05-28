package csi.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

    public static Connection getConnection() throws SQLException {

        try {
            Class.forName("org.postgresql.Driver");
            System.out.print("Driver carregado com sucesso!\n");

            String host = System.getenv("DB_HOST");
            String port = System.getenv("DB_PORT");
            String dbName = System.getenv("DB_NAME");
            String user = System.getenv("DB_USER");
            String password = System.getenv("DB_PASS");

            // Valores padrão caso as variáveis de ambiente não estejam definidas
            if (host == null) host = "localhost";
            if (port == null) port = "5432";
            if (dbName == null) dbName = "tarefas";
            if (user == null) user = "postgres";
            if (password == null) password = "2016010124";

            String url = "jdbc:postgresql://" + host + ":" + port + "/" + dbName;

            return DriverManager.getConnection(url, user, password);

        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver do PostgreSQL não encontrado", e);
        } catch (SQLException e) {
            throw new SQLException("Erro ao conectar ao banco de dados", e);
        }
    }
}
