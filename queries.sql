select CustomerID as "codigoCliente", ContactName as "nomeContato", Address as "Endereço", Phone as "Telefone" from customers
order by  Address desc;

select ProductID, ProductName, UnitPrice as "valor unitario",  (UnitPrice *UnitsInStock ) as "totalProduto", (UnitPrice + (UnitPrice * 10) /100) as "1000%"   from products
where ProductID between 10 and 20;

select CategoryID as "cod_categoria", count(productid) as "qnt_produto"  from products  group by CategoryID order by qnt_produto desc;
select  CustomerID as "cod_cliente", 
	count(orderid) as "qnt_pedidos" from orders 
	group by CustomerID order 
	by qnt_pedidos asc ;

select * from products;
select  min(UnitPrice) as "menor valor ", 
	max(UnitPrice)as "maior valor ", avg(UnitPrice) as "Media",
	sum(UnitPrice* UnitsInStock) as "valor_total_prod",
	count(productid) as "QntItensDiferentes" from products;

select cli.CustomerID,  cli.contactName,  cli.Address, 
ord.orderid,  ord.employeeid,  ord.orderdate,
od.Quantity, od.UnitPrice, od.Discount,
prod.ProductID, prod.UnitPrice, prod.UnitsInStock
 from customers as cli inner join orders as ord 
on cli.CustomerID = ord.CustomerID 
	inner join `order details` as od
	on od.OrderID = ord.OrderID
    inner join products as prod
	on prod.ProductID = od.ProductID; 
    
select * from customers
where CustomerID NOT IN (select CustomerID from orders);

select * from customers
where CustomerID IN (select CustomerID from orders);

select ProductID, ProductName,  UnitPrice, QuantityPerUnit from products
where ProductID NOT IN (select ProductID from `order details`);


select ProductID, ProductName,  UnitPrice, QuantityPerUnit from products
where ProductID IN (select ProductID from `order details`);

insert into products (ProductID, ProductName, UnitPrice, QuantityPerUnit ) value ("82", "PRODUTO MISSAO", "120,10", "5");

select ShipperID, Phone, CompanyName FROM shippers
where ShipperID IN (select ShipVia from orders); 

insert into shippers (ShipperID, Phone, CompanyName ) value ("5", "'(503) 555-9833'", "MASHIN TRANSPORTE");

select ShipperID, Phone, CompanyName FROM shippers
where ShipperID NOT IN (select ShipVia from orders); 

select shippers.ShipperID, shippers.CompanyName, shippers.Phone,
orders.ShipVia, orders.OrderID, orders.OrderDate
from shippers left outer join orders
ON shippers.ShipperID = orders.ShipVia
where orders.ShipVia IS null;


select  customers.CustomerID, customers.ContactName,
		orders.OrderID, orders.OrderDate
from customers left outer join orders on customers.CustomerID = orders.CustomerID
where orders.CustomerID is null;



select products.ProductID, products.ProductName, products.UnitPrice, products.QuantityPerUnit,
`order details`.ProductID, `order details`.Quantity, `order details`.UnitPrice
from products left outer join `order details` ON products.ProductID = `order details`.ProductID
where `order details`.ProductID IS null;


select customers.CustomerID, customers.ContactName, 
		orders.OrderID, orders.OrderDate, 
		sum(`order details`.Quantity * `order details`.UnitPrice) as "Valor total pedidos"
        from customers inner join orders on customers.CustomerID = orders.CustomerID
        inner join `order details` on `order details`.OrderID = orders.OrderID 
        group by orders.OrderDate, orders.OrderID, customers.ContactName, customers.CustomerID;
        
select cod_fun.EmployeeID, cod_fun.FirstName,
		cod_fun.ReportsTo, cod_chef.FirstName
from employees as cod_fun inner join employees as cod_chef on 
 cod_fun.EmployeeID = cod_chef.EmployeeID
 where cod_fun.ReportsTo is not null;
 
 
