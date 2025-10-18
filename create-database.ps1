# Script para criar o banco de dados mystore no PostgreSQL
# Execute como: .\create-database.ps1

Write-Host "=== Criando banco de dados mystore ===" -ForegroundColor Cyan

# Tenta encontrar o psql.exe
$possiblePaths = @(
    "C:\Program Files\PostgreSQL\16\bin\psql.exe",
    "C:\Program Files\PostgreSQL\15\bin\psql.exe",
    "C:\Program Files\PostgreSQL\14\bin\psql.exe",
    "C:\Program Files (x86)\PostgreSQL\16\bin\psql.exe",
    "C:\Program Files (x86)\PostgreSQL\15\bin\psql.exe"
)

$psqlPath = $null
foreach ($path in $possiblePaths) {
    if (Test-Path $path) {
        $psqlPath = $path
        Write-Host "PostgreSQL encontrado em: $psqlPath" -ForegroundColor Green
        break
    }
}

if ($null -eq $psqlPath) {
    Write-Host "ERRO: PostgreSQL não encontrado!" -ForegroundColor Red
    Write-Host "Por favor, instale o PostgreSQL ou adicione ao PATH" -ForegroundColor Yellow
    exit 1
}

# Cria o banco de dados
Write-Host "`nCriando banco 'mystore'..." -ForegroundColor Yellow

$env:PGPASSWORD = "123456"

try {
    # Verifica se o banco já existe
    $checkDb = & $psqlPath -U postgres -t -c "SELECT 1 FROM pg_database WHERE datname = 'mystore';"
    
    if ($checkDb -match "1") {
        Write-Host "Banco 'mystore' já existe!" -ForegroundColor Green
    } else {
        # Cria o banco
        & $psqlPath -U postgres -c "CREATE DATABASE mystore;"
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Banco 'mystore' criado com sucesso!" -ForegroundColor Green
        } else {
            Write-Host "Erro ao criar banco!" -ForegroundColor Red
            exit 1
        }
    }
    
    Write-Host "`n=== Configuração completa ===" -ForegroundColor Cyan
    Write-Host "Banco: mystore" -ForegroundColor White
    Write-Host "Usuário: postgres" -ForegroundColor White
    Write-Host "Senha: 123456" -ForegroundColor White
    Write-Host "Porta: 5432" -ForegroundColor White
    Write-Host "`nAgora você pode executar: .\mvnw.cmd spring-boot:run" -ForegroundColor Green
    
} catch {
    Write-Host "Erro: $_" -ForegroundColor Red
    exit 1
} finally {
    Remove-Item Env:\PGPASSWORD
}
