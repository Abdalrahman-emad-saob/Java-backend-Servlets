package com.example.webengproject.utils;

import org.postgresql.ds.PGSimpleDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class PostgreSQLDataSource {
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/SE432-database";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "0000";

    private static DataSource dataSource;

    private PostgreSQLDataSource() {
    }

    private static DataSource getDataSource() {
        if (dataSource == null) {
            PGSimpleDataSource pgDataSource = new PGSimpleDataSource();
            pgDataSource.setUrl(DB_URL);
            pgDataSource.setUser(DB_USER);
            pgDataSource.setPassword(DB_PASSWORD);
            dataSource = pgDataSource;
        }
        return dataSource;
    }

    public static Connection getConnection() throws SQLException {
        return getDataSource().getConnection();
    }
}
