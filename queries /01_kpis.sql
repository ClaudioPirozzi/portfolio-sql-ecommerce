
/* =========================================================
   PERGUNTA DE NEGÓCIO:
   Qual foi a receita bruta mensal baseada nos itens vendidos,
   desconsiderando pedidos cancelados?
   ========================================================= */

SELECT
       DATE_FORMAT(o.order_date, '%Y-%m') AS revenue_month,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
  FROM orders AS o
        LEFT JOIN order_items AS oi 
		ON oi.order_id = o.order_id
  WHERE o.status <> 'canceled'
  GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
  ORDER BY revenue_month;
  
  
  /* =========================================================
   PERGUNTA DE NEGÓCIO:
   Qual foi o ticket médio mensal?
   ========================================================= */

WITH order_totals AS (
  SELECT
    o.order_id,
    o.order_date,
    SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders AS o
		 JOIN order_items AS oi 
         ON oi.order_id = o.order_id
   WHERE o.status <> 'canceled'
   GROUP BY o.order_id, o.order_date
)
SELECT
  DATE_FORMAT(order_date, '%Y-%m') AS y_month,
  ROUND(AVG(order_total), 2) AS avg_ticket
FROM order_totals
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY y_month;
