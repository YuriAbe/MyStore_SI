-- Inserindo categorias (apenas se não existirem)
INSERT INTO categories (name, created_at, updated_at) 
SELECT 'Eletrônicos', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Eletrônicos');

INSERT INTO categories (name, created_at, updated_at) 
SELECT 'Eletrodomésticos', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Eletrodomésticos');

INSERT INTO categories (name, created_at, updated_at) 
SELECT 'Móveis', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Móveis');

INSERT INTO categories (name, created_at, updated_at) 
SELECT 'Livros', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Livros');

INSERT INTO categories (name, created_at, updated_at) 
SELECT 'Brinquedos', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Brinquedos');

-- Inserindo produtos (apenas se não existirem)
INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Smartphone Samsung Galaxy S23', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Eletrônicos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Smartphone Samsung Galaxy S23');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Notebook Dell Inspiron 15', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Eletrônicos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Notebook Dell Inspiron 15');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Smart TV LG 55"', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Eletrônicos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Smart TV LG 55"');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Fone de Ouvido Bluetooth JBL', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Eletrônicos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Fone de Ouvido Bluetooth JBL');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Geladeira Brastemp Frost Free', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Eletrodomésticos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Geladeira Brastemp Frost Free');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Máquina de Lavar Consul 11kg', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Eletrodomésticos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Máquina de Lavar Consul 11kg');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Fogão 4 Bocas Electrolux', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Eletrodomésticos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Fogão 4 Bocas Electrolux');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Micro-ondas Philco 30L', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Eletrodomésticos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Micro-ondas Philco 30L');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Sofá Retrátil 3 Lugares', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Móveis'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Sofá Retrátil 3 Lugares');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Mesa de Jantar 6 Cadeiras', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Móveis'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Mesa de Jantar 6 Cadeiras');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Guarda-roupa Casal 6 Portas', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Móveis'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Guarda-roupa Casal 6 Portas');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Cama Box Queen Size', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Móveis'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Cama Box Queen Size');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Livro: Clean Code - Robert C. Martin', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Livros'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Livro: Clean Code - Robert C. Martin');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Livro: O Senhor dos Anéis - J.R.R. Tolkien', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Livros'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Livro: O Senhor dos Anéis - J.R.R. Tolkien');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Livro: Dom Casmurro - Machado de Assis', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Livros'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Livro: Dom Casmurro - Machado de Assis');

INSERT INTO products (name, category_id, created_at, updated_at)
SELECT 'Livro: A Revolução dos Bichos - George Orwell', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Livros'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Livro: A Revolução dos Bichos - George Orwell');

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
SELECT 'Quebra-cabeça 1000 peças', c.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM categories c WHERE c.name = 'Brinquedos'
AND NOT EXISTS (SELECT 1 FROM products WHERE name = 'Quebra-cabeça 1000 peças');
