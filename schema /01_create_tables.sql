
-- =========================
-- PROJETO PORTFÓLIO: E-commerce Analytics (MySQL)
-- =========================

DROP DATABASE IF EXISTS portfolio_sql;
CREATE DATABASE portfolio_sql;
USE portfolio_sql;

-- ---------- Customers ----------
CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  full_name   VARCHAR(120) NOT NULL,
  email       VARCHAR(150) NOT NULL UNIQUE,
  city        VARCHAR(80)  NOT NULL,
  state       CHAR(2)      NOT NULL,
  created_at  DATE         NOT NULL
);

-- ---------- Products ----------
CREATE TABLE products (
  product_id  INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(140) NOT NULL,
  category     VARCHAR(60)  NOT NULL,
  price        DECIMAL(10,2) NOT NULL,
  active       TINYINT(1) NOT NULL DEFAULT 1,
  created_at   DATE NOT NULL
);

-- ---------- Orders ----------
CREATE TABLE orders (
  order_id     INT AUTO_INCREMENT PRIMARY KEY,
  customer_id  INT NOT NULL,
  order_date   DATE NOT NULL,
  status       ENUM('paid','shipped','delivered','canceled') NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- ---------- Order Items ----------
CREATE TABLE order_items (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id      INT NOT NULL,
  product_id    INT NOT NULL,
  quantity      INT NOT NULL,
  unit_price    DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ---------- Payments (1 por pedido aqui) ----------
CREATE TABLE payments (
  payment_id   INT AUTO_INCREMENT PRIMARY KEY,
  order_id     INT NOT NULL UNIQUE,
  payment_method ENUM('pix','credit_card','boleto') NOT NULL,
  paid_at      DATE NULL,
  amount       DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- ---------- Shipments (1 por pedido aqui) ----------
CREATE TABLE shipments (
  shipment_id  INT AUTO_INCREMENT PRIMARY KEY,
  order_id     INT NOT NULL UNIQUE,
  shipped_at   DATE NULL,
  delivered_at DATE NULL,
  carrier      VARCHAR(60) NULL,
  freight      DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
