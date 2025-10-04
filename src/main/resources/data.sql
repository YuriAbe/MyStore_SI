-- Inserindo categorias
INSERT INTO categories (name) VALUES
('Eletrônicos'),
('Eletrodomésticos'),
('Móveis'),
('Livros'),
('Brinquedos');

-- Inserindo produtos
INSERT INTO products (name, category_id) VALUES
('Smartphone Samsung Galaxy S23', 1),
('Notebook Dell Inspiron 15', 1),
('Smart TV LG 55"', 1),
('Fone de Ouvido Bluetooth JBL', 1),

('Geladeira Brastemp Frost Free', 2),
('Máquina de Lavar Consul 11kg', 2),
('Fogão 4 Bocas Electrolux', 2),
('Micro-ondas Philco 30L', 2),

('Sofá Retrátil 3 Lugares', 3),
('Mesa de Jantar 6 Cadeiras', 3),
('Guarda-roupa Casal 6 Portas', 3),
('Cama Box Queen Size', 3),

('Livro: Clean Code - Robert C. Martin', 4),
('Livro: O Senhor dos Anéis - J.R.R. Tolkien', 4),
('Livro: Dom Casmurro - Machado de Assis', 4),
('Livro: A Revolução dos Bichos - George Orwell', 4),

('Lego Star Wars Millennium Falcon', 5),
('Boneca Barbie Dreamhouse', 5),
('Carrinho Hot Wheels', 5),
('Quebra-cabeça 1000 peças', 5);
