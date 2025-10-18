package br.com.jlgregorio.MyStore.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.init.ScriptUtils;

import javax.sql.DataSource;
import jakarta.annotation.PostConstruct;

@Configuration
public class DatabaseInitializer {

    @Value("${spring.datasource.username}")
    private String username;

    @Value("${spring.datasource.password}")
    private String password;

    private final DataSource dataSource;

    public DatabaseInitializer(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @PostConstruct
    public void initialize() {
        try {
            ScriptUtils.executeSqlScript(
                dataSource.getConnection(),
                new ClassPathResource("db/init.sql")
            );
        } catch (Exception e) {
            // Ignora erro se o banco já existir
        }
    }
}
