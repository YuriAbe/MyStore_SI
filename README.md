# MyStore - Sistema de Gerenciamento de Loja

Sistema web completo para gerenciamento de produtos e categorias desenvolvido com Spring Boot e PostgreSQL.

## 📋 Índice

- [Sobre o Projeto](#sobre-o-projeto)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Pré-requisitos](#pré-requisitos)
- [Instalação e Configuração](#instalação-e-configuração)
- [Como Executar](#como-executar)
- [Funcionalidades](#funcionalidades)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Correções Realizadas](#correções-realizadas)
- [Autor](#autor)

## 🎯 Sobre o Projeto

MyStore é uma aplicação web CRUD (Create, Read, Update, Delete) completa para gerenciar produtos e suas respectivas categorias. O sistema oferece uma interface intuitiva e responsiva com Bootstrap, validações de formulários e modais interativos.

## 🚀 Tecnologias Utilizadas

### Backend
- **Java 17**
- **Spring Boot 3.1.5**
  - Spring Web
  - Spring Data JPA
  - Spring DevTools
- **PostgreSQL 16** - Banco de dados relacional
- **Hibernate** - ORM para mapeamento objeto-relacional
- **Lombok** - Redução de código boilerplate

### Frontend
- **Thymeleaf** - Template engine
- **Bootstrap 5.3.2** - Framework CSS
- **JavaScript** - Interatividade e validações
- **HTML5** - Estruturação de páginas

## 📦 Pré-requisitos

Antes de começar, você precisa ter instalado em sua máquina:

- [Java JDK 17+](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html)
- [PostgreSQL 16+](https://www.postgresql.org/download/)
- [Maven](https://maven.apache.org/download.cgi) (ou use o Maven Wrapper incluído)
- [Git](https://git-scm.com/downloads)

## ⚙️ Instalação e Configuração

### 1. Clone o repositório

```bash
git clone https://github.com/YuriAbe/MyStore_SI.git
cd MyStore_SI
```

### 2. Configure o PostgreSQL

#### No Windows (PowerShell):
```powershell
$env:PGPASSWORD='123456'; & "C:\Program Files\PostgreSQL\16\bin\psql.exe" -U postgres -c "CREATE DATABASE mystore;"
```

#### No Linux/Mac:
```bash
sudo -u postgres psql -c "CREATE DATABASE mystore;"
```

### 3. Configure as credenciais do banco de dados

Edite o arquivo `src/main/resources/application.yaml` se necessário:

```yaml
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/mystore
    username: postgres
    password: 123456  # Altere para sua senha
```

## 🎮 Como Executar

### Usando Maven Wrapper (Recomendado)

#### Windows:
```powershell
.\mvnw.cmd clean spring-boot:run
```

#### Linux/Mac:
```bash
./mvnw clean spring-boot:run
```

### Usando Maven Instalado:
```bash
mvn clean spring-boot:run
```

### Acessar a aplicação

Após a inicialização, acesse:
- **URL**: http://localhost:8889
- **Porta**: 8889

## ✨ Funcionalidades

### Gerenciamento de Categorias
- ✅ Listar todas as categorias
- ✅ Adicionar nova categoria
- ✅ Editar categoria existente
- ✅ Excluir categoria (com validação de integridade referencial)
- ✅ Visualizar detalhes da categoria em modal
- ✅ Validação de nome único

### Gerenciamento de Produtos
- ✅ Listar todos os produtos com suas categorias
- ✅ Adicionar novo produto
- ✅ Editar produto existente
- ✅ Excluir produto
- ✅ Filtrar produtos por categoria
- ✅ Relacionamento com categorias (Foreign Key)

### Recursos Adicionais
- ✅ Interface responsiva com Bootstrap
- ✅ Mensagens toast para feedback de operações
- ✅ Modais de confirmação para exclusões
- ✅ Validações de formulário
- ✅ Tratamento de erros personalizado
- ✅ Timestamps automáticos (created_at, updated_at)

## 📁 Estrutura do Projeto

```
MyStore_SI/
├── src/
│   ├── main/
│   │   ├── java/br/com/jlgregorio/MyStore/
│   │   │   ├── config/              # Configurações da aplicação
│   │   │   ├── controller/          # Controllers REST
│   │   │   │   ├── CategoryController.java
│   │   │   │   └── ProductController.java
│   │   │   ├── exceptions/          # Tratamento de exceções
│   │   │   │   ├── CustomExceptionResponse.java
│   │   │   │   ├── GlobalHandlerExceptions.java
│   │   │   │   └── ResourceNotFoundException.java
│   │   │   ├── model/               # Entidades JPA
│   │   │   │   ├── CategoryModel.java
│   │   │   │   └── ProductModel.java
│   │   │   ├── repository/          # Repositórios JPA
│   │   │   │   ├── CategoryRepository.java
│   │   │   │   └── ProductRepository.java
│   │   │   └── MyStoreApplication.java
│   │   └── resources/
│   │       ├── application.yaml     # Configurações Spring Boot
│   │       ├── data.sql            # Dados iniciais
│   │       ├── static/             # Recursos estáticos
│   │       │   ├── img/
│   │       │   └── js/
│   │       │       └── modal.js
│   │       └── templates/          # Templates Thymeleaf
│   │           ├── _fragments/
│   │           │   └── toast.html
│   │           ├── _layouts/
│   │           │   └── base.html
│   │           ├── category/
│   │           │   ├── form.html
│   │           │   ├── index.html
│   │           │   └── show.html
│   │           ├── product/
│   │           │   ├── create.html
│   │           │   ├── edit.html
│   │           │   └── index.html
│   │           ├── error.html
│   │           ├── error404.html
│   │           └── index.html
│   └── test/                       # Testes unitários
├── pom.xml                         # Dependências Maven
└── README.md                       # Documentação
```

## 🔧 Correções Realizadas

### 1. Configuração do Banco de Dados
- **Problema**: Aplicação não inicializava por falta do banco de dados
- **Solução**: Criação do banco `mystore` no PostgreSQL
- **Arquivos**: `application.yaml`

### 2. Correção dos Modelos de Dados
- **Problema**: Tipo primitivo `long` no ID causava erro ao criar novos registros (ID = 0 em vez de null)
- **Solução**: Alterado para `Long` (objeto) em `CategoryModel` e `ProductModel`
- **Impacto**: Permitiu distinção correta entre criação (ID null) e edição (ID existente)
- **Arquivos**: 
  - `CategoryModel.java`
  - `ProductModel.java`

### 3. Correção dos Templates Thymeleaf
- **Problema**: Sintaxe incorreta nos fragmentos de layout
- **Solução**: Ajustado para usar apenas 1 parâmetro no fragmento `layout`
- **Arquivos**: `category/form.html`

### 4. Formulários de CRUD
- **Problema**: Formulário único com lógica condicional complexa causava erros na URL
- **Solução**: Separação em dois formulários distintos:
  - Formulário de criação: `POST /categories`
  - Formulário de edição: `POST /categories/{id}` com `_method=put`
- **Arquivos**: `category/form.html`

### 5. Template de Erro
- **Problema**: Tentativa de acessar métodos com prefixo `get` no Lombok
- **Solução**: Corrigido para acessar diretamente as propriedades (`timeStamp`, `message`, `details`)
- **Arquivos**: `error.html`

### 6. Problemas de Encoding
- **Problema**: Caracteres especiais portugueses (ã, é, ô, etc.) exibidos incorretamente
- **Solução**: Removidos acentos dos dados iniciais em `data.sql`
- **Arquivos**: `data.sql`

### 7. Funcionalidade de Botões
- **Problema**: Botões de editar e excluir não funcionavam na listagem de categorias
- **Solução**: 
  - Corrigida sintaxe Thymeleaf para links de edição
  - Implementado sistema de confirmação com modal para exclusão
  - Adicionado script JavaScript para validação
- **Arquivos**: 
  - `category/index.html`
  - `modal.js`

### 8. Configuração do HiddenHttpMethodFilter
- **Problema**: Métodos HTTP PUT e DELETE não funcionavam via formulários HTML
- **Solução**: Habilitado `spring.mvc.hiddenmethod.filter.enabled: true`
- **Arquivos**: `application.yaml`

## 📊 Modelo de Dados

### Entidade: Category
```sql
CREATE TABLE categories (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);
```

### Entidade: Product
```sql
CREATE TABLE products (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category_id BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);
```

## 🎨 Capturas de Tela

### Página Inicial
A página inicial apresenta links para gerenciamento de Produtos e Categorias.

### Listagem de Categorias
Interface limpa mostrando todas as categorias com opções de visualizar, editar e excluir.

### Formulário de Categoria
Formulário simples e intuitivo para adicionar/editar categorias com validação.

### Listagem de Produtos
Tabela completa de produtos mostrando nome e categoria associada.

## 🧪 Testando a Aplicação

### 1. Teste de Criação de Categoria
1. Acesse http://localhost:8889/categories
2. Clique em "Adicionar Categoria"
3. Preencha o nome (ex: "Eletronicos")
4. Clique em "Salvar"
5. Verifique a mensagem de sucesso

### 2. Teste de Edição de Categoria
1. Na listagem, clique em "Editar" em uma categoria
2. Modifique o nome
3. Clique em "Salvar"
4. Verifique a atualização

### 3. Teste de Exclusão de Categoria
1. Na listagem, clique em "Excluir"
2. Confirme a exclusão no modal
3. Verifique a remoção (não funcionará se houver produtos vinculados)

### 4. Teste de Produtos
Repita os mesmos testes para produtos, selecionando uma categoria ao criar/editar.

## 🐛 Solução de Problemas

### Erro: "FATAL: não existe o banco de dados 'mystore'"
**Solução**: Execute o comando de criação do banco de dados conforme descrito na seção de configuração.

### Erro: "Port 8889 is already in use"
**Solução**: Pare outros processos na porta 8889 ou altere a porta em `application.yaml`

### Erro de conexão com PostgreSQL
**Solução**: Verifique se o PostgreSQL está rodando e as credenciais estão corretas.

### Caracteres especiais não aparecem corretamente
**Solução**: O projeto já foi configurado para evitar este problema usando caracteres sem acento.

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

## 👤 Autor

**YuriAbe**
- GitHub: [@YuriAbe](https://github.com/YuriAbe)
- Repositório: [MyStore_SI](https://github.com/YuriAbe/MyStore_SI)

## 🤝 Contribuindo

Contribuições são sempre bem-vindas! Sinta-se à vontade para:

1. Fazer um fork do projeto
2. Criar uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abrir um Pull Request

## 📞 Suporte

Se você tiver algum problema ou sugestão, por favor abra uma [issue](https://github.com/YuriAbe/MyStore_SI/issues).

---

⌨️ Desenvolvido com ❤️ e ☕
