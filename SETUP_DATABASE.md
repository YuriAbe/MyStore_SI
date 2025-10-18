# Configuração do Banco de Dados PostgreSQL

## Pré-requisitos
- PostgreSQL 16 instalado
- pgAdmin 4 (opcional, mas recomendado)

## Passos para Configuração

### 1. Criar o Banco de Dados

Abra o pgAdmin ou o psql e execute:

```sql
CREATE DATABASE mystore 
WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
```

**OU** via linha de comando (psql):

```bash
psql -U postgres
CREATE DATABASE mystore;
\q
```

### 2. Configurar Senha do PostgreSQL

No arquivo `src/main/resources/application.yaml`, ajuste as credenciais:

```yaml
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/mystore
    username: postgres
    password: 123456  # ALTERE para sua senha do PostgreSQL
```

### 3. Verificar Instalação

Teste a conexão com:

```bash
psql -U postgres -d mystore
```

Se conectar com sucesso, está tudo certo!

## Como Executar a Aplicação

### Opção 1: Via Maven Wrapper (Recomendado)

```bash
# No diretório raiz do projeto
.\mvnw.cmd clean install
.\mvnw.cmd spring-boot:run
```

### Opção 2: Via Maven direto

```bash
mvn clean install
mvn spring-boot:run
```

### Opção 3: Via IDE (IntelliJ/Eclipse)

Execute a classe `MyStoreApplication.java`

## Acesso à Aplicação

Após iniciar, acesse:
- **URL**: http://localhost:8889
- **Categorias**: http://localhost:8889/categories
- **Produtos**: http://localhost:8889/products

## O que a Aplicação Faz Automaticamente

1. **Cria as tabelas** automaticamente via JPA (Hibernate)
2. **Insere dados iniciais** de exemplo (categorias e produtos)
3. **Configura relacionamentos** entre produtos e categorias

## Estrutura das Tabelas

### Tabela: categories
- `id` (BIGSERIAL) - Chave primária
- `name` (VARCHAR 100) - Nome da categoria (único)
- `created_at` (TIMESTAMP) - Data de criação
- `updated_at` (TIMESTAMP) - Data de atualização

### Tabela: products
- `id` (BIGSERIAL) - Chave primária
- `name` (VARCHAR 100) - Nome do produto
- `category_id` (BIGINT) - Chave estrangeira para categories
- `created_at` (TIMESTAMP) - Data de criação
- `updated_at` (TIMESTAMP) - Data de atualização

## Operações CRUD Disponíveis

### Categorias
- ✅ **CREATE**: POST /categories
- ✅ **READ**: GET /categories, GET /categories/{id}/show
- ✅ **UPDATE**: PUT /categories/{id}
- ✅ **DELETE**: DELETE /categories/{id}

### Produtos
- ✅ **CREATE**: POST /products
- ✅ **READ**: GET /products, GET /products/{id}/show
- ✅ **UPDATE**: PUT /products/{id}
- ✅ **DELETE**: DELETE /products/{id}

## Problemas Comuns

### Erro de Conexão
```
org.postgresql.util.PSQLException: Connection refused
```
**Solução**: Verifique se o PostgreSQL está rodando:
```bash
# Windows
Get-Service -Name postgresql*
```

### Erro de Autenticação
```
PSQLException: password authentication failed
```
**Solução**: Corrija a senha no `application.yaml`

### Banco não existe
```
PSQLException: database "mystore" does not exist
```
**Solução**: Execute o comando CREATE DATABASE acima

## Resetar o Banco (Se necessário)

```sql
DROP DATABASE IF EXISTS mystore;
CREATE DATABASE mystore;
```

Depois reinicie a aplicação que os dados serão recriados automaticamente.
