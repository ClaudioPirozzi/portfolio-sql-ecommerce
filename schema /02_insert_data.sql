
-- ---------- Customers ----------
INSERT INTO customers (full_name, email, city, state, created_at) VALUES
('Ana Lima',        'ana.lima@email.com',        'São Paulo', 'SP', '2025-08-10'),
('Bruno Santos',    'bruno.s@email.com',         'Osasco',   'SP', '2025-08-12'),
('Carla Ribeiro',   'carla.r@email.com',         'Rio de Janeiro', 'RJ', '2025-08-20'),
('Diego Rocha',     'diego.rocha@email.com',     'Belo Horizonte', 'MG', '2025-09-01'),
('Eduarda Silva',   'eduarda.s@email.com',       'Curitiba', 'PR', '2025-09-03'),
('Felipe Costa',    'felipe.c@email.com',        'Campinas', 'SP', '2025-09-10'),
('Gabi Martins',    'gabi.m@email.com',          'Santos',   'SP', '2025-10-01'),
('Hugo Almeida',    'hugo.a@email.com',          'Salvador', 'BA', '2025-10-04'),
('Isabela Nunes',   'isabela.n@email.com',       'Recife',   'PE', '2025-10-07'),
('João Pereira',    'joao.p@email.com',          'São Paulo', 'SP', '2025-10-10'),
('Kelly Souza',     'kelly.s@email.com',         'Niterói',  'RJ', '2025-11-01'),
('Lucas Ferreira',  'lucas.f@email.com',         'Guarulhos','SP', '2025-11-03');

-- ---------- Products ----------
INSERT INTO products (product_name, category, price, active, created_at) VALUES
('Mouse Gamer',         'Periféricos', 129.90, 1, '2025-07-01'),
('Teclado Mecânico',    'Periféricos', 249.90, 1, '2025-07-02'),
('Headset',             'Áudio',       199.90, 1, '2025-07-10'),
('Webcam Full HD',      'Acessórios',  179.90, 1, '2025-08-01'),
('SSD 1TB',             'Hardware',    399.90, 1, '2025-08-05'),
('Monitor 24"',         'Hardware',    699.90, 1, '2025-08-08'),
('Cabo USB-C',          'Acessórios',   39.90, 1, '2025-09-01'),
('Mousepad XXL',        'Acessórios',   59.90, 1, '2025-09-02'),
('Hub USB',             'Acessórios',   89.90, 1, '2025-09-03'),
('Microfone',           'Áudio',       299.90, 1, '2025-10-01'),
('Cadeira Gamer',       'Móveis',     1199.90, 1, '2025-10-05'),
('Suporte de Monitor',  'Móveis',      149.90, 1, '2025-11-01'); -- (vamos fazer ele "nunca vendido")

-- ---------- Orders ----------
INSERT INTO orders (customer_id, order_date, status) VALUES
(1,  '2025-10-12', 'paid'),
(2,  '2025-10-13', 'shipped'),
(3,  '2025-10-13', 'delivered'),
(1,  '2025-10-20', 'canceled'),
(4,  '2025-11-02', 'delivered'),
(5,  '2025-11-03', 'paid'),
(6,  '2025-11-10', 'shipped'),
(7,  '2025-11-11', 'delivered'),
(8,  '2025-11-15', 'canceled'),
(9,  '2025-12-01', 'paid'),
(10, '2025-12-05', 'delivered');

-- ---------- Order Items ----------
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 129.90),
(1, 7, 2, 39.90),

(2, 2, 1, 249.90),

(3, 5, 1, 399.90),
(3, 7, 1, 39.90),

(4, 3, 1, 199.90), -- pedido cancelado ainda tem item (pra você decidir regra)

(5, 6, 1, 699.90),
(5, 8, 1, 59.90),

(6, 1, 1, 129.90),
(6, 9, 1, 89.90),

(7, 4, 1, 179.90),
(7, 7, 1, 39.90),

(8, 10, 1, 299.90), -- cancelado

(9, 11, 1, 1199.90),

(10, 2, 1, 249.90),
(10, 1, 1, 129.90);

-- ---------- Payments ----------
INSERT INTO payments (order_id, payment_method, paid_at, amount) VALUES
(1,  'pix',        '2025-10-12', 209.70),
(2,  'credit_card','2025-10-13', 249.90),
(3,  'boleto',     '2025-10-15', 439.80),
(4,  'pix',        NULL,         199.90),    -- cancelado, sem pago
(5,  'credit_card','2025-11-02', 759.80),
(6,  'pix',        '2025-11-03', 219.80),
(7,  'credit_card','2025-11-10', 219.80),
(8,  'boleto',     NULL,         299.90),    -- cancelado
(9,  'pix',        '2025-12-01', 1199.90),
(10, 'credit_card','2025-12-05', 379.80),
(11, 'pix',        '2025-12-05', 0.00);      -- (um “erro” proposital p/ você detectar)

-- ---------- Shipments ----------
INSERT INTO shipments (order_id, shipped_at, delivered_at, carrier, freight) VALUES
(2,  '2025-10-14', NULL,         'Jadlog', 19.90),
(3,  '2025-10-14', '2025-10-18', 'Correios', 24.90),
(5,  '2025-11-03', '2025-11-07', 'Correios', 29.90),
(7,  '2025-11-11', '2025-11-14', 'Jadlog', 21.90),
(10, '2025-12-06', '2025-12-10', 'Loggi', 18.90),
(11, NULL,         NULL,         NULL, 0.00); -- pedido entregue mas shipment “faltando” (inconsistência proposital)
