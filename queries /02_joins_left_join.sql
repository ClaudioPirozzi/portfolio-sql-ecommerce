
/* =========================================================
   PERGUNTA DE NEGÓCIO:
   Quais clientes nunca compraram?
   ========================================================= */

SELECT c.full_name, 
	   c.email,
       c.city,
       o.order_id
  FROM customers AS c
       LEFT JOIN orders AS o 
       ON c.customer_id = o.customer_id
 WHERE o.order_id IS NULL
 ORDER BY full_name;
 
 /* =========================================================
   PERGUNTA DE NEGÓCIO:
   Produtos nunca vendidos?
   ========================================================= */
   
   SELECT  p.product_id,
           p.product_name,
           p.category
     FROM products AS p
	      LEFT JOIN order_items AS oi
          ON oi.product_id = p.product_id
	WHERE oi.order_item_id IS NULL 
    ORDER BY p.product_name;
    
