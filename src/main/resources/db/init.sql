-- Execute este script APENAS para criar o banco de dados manualmente
-- No pgAdmin ou psql (antes de iniciar a aplicação)

-- Conecte-se ao PostgreSQL como usuário postgres e execute:
CREATE DATABASE mystore 
WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

-- Após criar o banco, a aplicação Spring Boot criará as tabelas automaticamente
