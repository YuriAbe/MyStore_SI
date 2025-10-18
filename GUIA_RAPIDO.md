# 🚀 Guia Rápido - MyStore

## ⚡ Comandos Rápidos

### Criar Banco (Execute APENAS UMA VEZ)
```sql
-- No pgAdmin ou psql
CREATE DATABASE mystore;
```

### Executar Aplicação
```bash
.\mvnw.cmd spring-boot:run
```

### Acessar Aplicação
- **Home**: http://localhost:8889
- **Categorias**: http://localhost:8889/categories
- **Produtos**: http://localhost:8889/products

---

## 🔑 Credenciais Padrão

**Banco de Dados:**
- Host: `localhost`
- Porta: `5432`
- Database: `mystore`
- Usuário: `postgres`
- Senha: `123456` ⚠️ **ALTERE NO application.yaml**

**Aplicação:**
- Porta: `8889`

---

## ✅ Checklist Rápido

Antes de executar, verifique:

- [ ] PostgreSQL 16 está instalado?
- [ ] PostgreSQL está rodando?
  ```powershell
  Get-Service postgresql*
  ```
- [ ] Banco `mystore` foi criado?
  ```bash
  psql -U postgres -l
  ```
- [ ] Senha do PostgreSQL está correta no `application.yaml`?

Se todos os itens estão OK, execute:
```bash
.\mvnw.cmd spring-boot:run
```

---

## 🎯 Testar Rapidamente

1. Execute a aplicação
2. Abra http://localhost:8889/categories
3. Deve ver 5 categorias já criadas
4. Abra http://localhost:8889/products
5. Deve ver 20 produtos já criados

Se vir os dados, **está tudo funcionando!** ✅

---

## 🆘 Problemas?

### PostgreSQL não inicia
```powershell
Start-Service postgresql-x64-16
```

### Porta 8889 em uso
Altere no `application.yaml`:
```yaml
server:
  port: 8890
```

### Banco não existe
```sql
CREATE DATABASE mystore;
```

---

## 📖 Documentação Completa

- `CORRECOES_REALIZADAS.md` - Todas as correções feitas
- `SETUP_DATABASE.md` - Configuração detalhada do PostgreSQL
