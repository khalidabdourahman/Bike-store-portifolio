SELECT 
    ord.order_id,
    CONCAT(cust.first_name, ' ', cust.last_name) AS 'customer_name',
    cust.city,
    cust.state,
    ord.order_date,
    SUM(ori.quantity) AS 'Total_units',
    SUM(ori.quantity * ori.list_price) AS 'Revenua',
    prd.product_name,
    cg.category_name,
    str.store_name,
    CONCAT(sf.first_name, ' ', sf.last_name) AS 'sale_rep'
FROM
    sales.orders ord
        JOIN
    sales.customers cust ON ord.customer_id = cust.customer_id
        JOIN
    sales.order_items ori ON ord.order_id = ori.order_id
        JOIN
    production.products prd ON ori.product_id = prd.product_id
        JOIN
    production.categories cg ON cg.category_id = prd.category_id
        JOIN
    sales.stores str ON ord.store_id = str.store_id
        JOIN
    sales.staffs sf ON ord.staff_id = sf.staff_id
GROUP BY ord.order_id ,
 CONCAT(cust.first_name, '_', cust.last_name) ,
 cust.city , cust.state , ord.order_date , 
 prd.product_name , cg.category_name , 
 str.store_name , 
 CONCAT(sf.first_name, ' ', last_name)

    
