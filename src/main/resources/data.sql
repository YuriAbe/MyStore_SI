-- Inserindo categorias (apenas se não existirem)
INSERT INTO categories (name, created_at, updated_at) 
SELECT 'Eletronicos', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Eletronicos');

INSERT INTO categories (name, created_at, updated_at) 
SELECT 'Eletrodomesticos', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Eletrodomesticos');

INSERT INTO categories (name, created_at, updated_at) 
SELECT 'Moveis', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Moveis');

INSERT INTO categories (name, created_at, updated_at) 
SELECT 'Livros', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Livros');

INSERT INTO categories (name, created_at, updated_at) 
SELECT 'Brinquedos', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Brinquedos');

-- Inserindo produtos (apenas se não existirem)
INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Smartphone Samsung Galaxy S23', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Eletronicos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Smartphone Samsung Galaxy S23');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Notebook Dell Inspiron 15', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Eletronicos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Notebook Dell Inspiron 15');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Smart TV LG 55"', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Eletronicos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Smart TV LG 55"');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Fone de Ouvido Bluetooth JBL', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Eletronicos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Fone de Ouvido Bluetooth JBL');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Geladeira Brastemp Frost Free', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Eletrodomesticos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Geladeira Brastemp Frost Free');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Maquina de Lavar Consul 11kg', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Eletrodomesticos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Maquina de Lavar Consul 11kg');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Fogao 4 Bocas Electrolux', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Eletrodomesticos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Fogao 4 Bocas Electrolux');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Micro-ondas Philco 30L', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Eletrodomesticos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Micro-ondas Philco 30L');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Sofa Retratil 3 Lugares', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Moveis'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Sofa Retratil 3 Lugares');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Mesa de Jantar 6 Cadeiras', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Moveis'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Mesa de Jantar 6 Cadeiras');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Guarda-roupa Casal 6 Portas', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Moveis'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Guarda-roupa Casal 6 Portas');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Cama Box Queen Size', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Moveis'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Cama Box Queen Size');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Livro: Clean Code - Robert C. Martin', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Livros'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Livro: Clean Code - Robert C. Martin');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Livro: O Senhor dos Aneis - J.R.R. Tolkien', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Livros'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Livro: O Senhor dos Aneis - J.R.R. Tolkien');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Livro: Dom Casmurro - Machado de Assis', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Livros'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Livro: Dom Casmurro - Machado de Assis');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Livro: A Revolucao dos Bichos - George Orwell', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Livros'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Livro: A Revolucao dos Bichos - George Orwell');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Lego Star Wars Millennium Falcon', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Brinquedos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Lego Star Wars Millennium Falcon');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Boneca Barbie Dreamhouse', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Brinquedos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Boneca Barbie Dreamhouse');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Carrinho Hot Wheels', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Brinquedos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Carrinho Hot Wheels');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Quebra-cabeca 1000 pecas', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Brinquedos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Quebra-cabeca 1000 pecas');
