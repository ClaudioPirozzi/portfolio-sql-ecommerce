/* =========================================================
   PERGUNTA DE NEGÓCIO:
   Taxa de cancelamento mensal?
   ========================================================= */
   
SELECT
      DATE_FORMAT(order_date, '%Y-%m') AS ymonth,
      COUNT(*) AS total_orders,
      SUM(CASE WHEN status = 'canceled' THEN 1 ELSE 0 END) AS canceled_orders,
	  ROUND(
              100 * SUM(CASE WHEN status = 'canceled' THEN 1 ELSE 0 END) / COUNT(*),
              2
			    ) AS cancel_rate_pct
  FROM orders
 GROUP BY DATE_FORMAT(order_date, '%Y-%m')
 ORDER BY ymonth;
 
 /* =========================================================
   PERGUNTA DE NEGÓCIO:
   Tempo médio de entrega?
   ========================================================= */
 
 SELECT
		    ROUND(AVG(DATEDIFF(s.delivered_at, s.shipped_at)), 2) AS avg_delivery_days
   FROM orders o
        JOIN shipments s 
        ON s.order_id = o.order_id
  WHERE o.status = 'delivered'
        AND s.shipped_at IS NOT NULL
        AND s.delivered_at IS NOT NULL;
 
