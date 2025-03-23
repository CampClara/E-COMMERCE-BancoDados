-- inserção de dados e queries
use ecommerce;

show tables;

insert into clients (Fname, Mname,Lname,CPF,Address)
	values ("Maria", "R", "Ferreira", 12345678911, "Rua Eulália 231, Boa Vista"),  
    ("João", "T", "Silva", 98765432100, "Av. Paulista 1000, Centro"),  
    ("Ana", "C", "Souza", 45678912322, "Rua das Flores 55, Jd América"),  
    ("Carlos", "A", "Oliveira", 32165498733, "Rua do Comércio 78, Centro"),  
    ("Fernanda", "M", "Almeida", 15975348644, "Av. Brasil 200, Copacabana"),  
    ("Roberto", "E", "Pereira", 25836914755, "Rua das Palmeiras 12, Boa V.");  
    
insert into product(Pname,Category,Price,avaliação,size)
	values ("SmartX", "eletrônico", 1999.99, 4.7, "Médio"),  
    ("NoteUltra", "eletrônico", 4599.90, 4.8, "Grande"),  
    ("CamisPolo", "vestuário", 89.99, 4.5, "M"),  
    ("JeansClás", "vestuário", 159.90, 4.6, "G"),  
    ("BabyDoll", "brinquedo", 79.50, 4.4, "Pequeno"),  
    ("CarrinhoX", "brinquedo", 129.99, 4.7, "Médio");  
    
select * from clients;
select *from product;

insert into payments(idPaymentClient,tipo)
	values (1, "Crédito"),  
    (2, "Débito"),  
    (3, "Pix"),  
    (4, "Crédito"),  
    (5, "Pix"),  
    (6, "Débito");  

select *from payments;

insert into orders(idOrderClient,idOrderPayment,orderStatus,orderDescription,frete)
	values (1, 1, "Em andamento", "Compra de um Smartphone X", 15.00),  
    (2, 2, "Processando", "Compra de uma Camiseta Polo", 10.00),  
    (3, 3, "Enviado", "Compra de um BabyDoll", 12.50),  
    (4, 4, "Entregue", "Compra de um Notebook Ultra", 20.00),  
    (5, 5, "Em andamento", "Compra de um CarrinhoX", 13.00),  
    (6, 6, "Processando", "Compra de uma Calça Jeans", 14.00); 
   
select *from orders;   

insert into productOrder(idPOproduct,idPOorder,Amount,status)
	values (1, 1, 2, "Disponível"),  
    (2, 2, 1, "Disponível"),  
    (3, 3, 3, "Sem estoque"),  
    (4, 4, 1, "Disponível"),  
    (5, 5, 2, "Sem estoque"),  
    (6, 6, 1, "Disponível");
    
 select *from  productOrder;
    
insert into storages(Location)
	values ("São Paulo - SP"),  
    ("Rio de Janeiro - RJ"),  
    ("Belo Horizonte - MG"),  
    ("Curitiba - PR"),  
    ("Porto Alegre - RS"),  
    ("Recife - PE");
    
 select *from  storages;   
    
insert into ProductInStorage(idProduct,idStorage,Amount)
	values (1, 1, 10),  
    (2, 2, 5),  
    (3, 3, 0),  
    (4, 4, 8),  
    (5, 5, 0),  
    (6, 6, 12);
    
    select *from ProductInStorage;
    
insert into supplier(Contact,CNPJ,SocialName)
	values ("11987654321", 123456780001999, "Tech Solutions LTDA"),  
    ("21998765432", 223344550001888, "Moda & Estilo Confecções"),  
    ("31912345678", 334455660001777, "Brinquedos Alegria S.A."),  
    ("41965432109", 445566770001666, "EletroMundo Comércio"),  
    ("51976543210", 556677880001555, "Distribuidora Fashion"),  
    ("81987123456", 667788990001444, "Games & Diversão Ltda");  
    
 select *from supplier;
 
insert into available(idProduct,idSupplier)
	values (1, 1),  
    (2, 2),  
    (3, 3),  
    (4, 4),  
    (5, 5),  
    (6, 6);  
    
select *from available;
    
insert into seller(AbstractName,Location,SocialName,CNPJ,CPF)
	values ("João Vendas", "São Paulo - SP", "João Comércio Ltda", 123456780001999, 12345678901),  
    ("Ana Comércio", "Rio de Janeiro - RJ", "Ana Fashion S.A.", 223344550001888, 98765432100),  
    ("Carlos Store", "Belo Horizonte - MG", "Carlos Eletro", 334455660001777, 45678912345),  
    ("Fernanda Shop", "Curitiba - PR", "Fernanda Moda Ltda", 445566770001666, 32165498765),  
    ("Roberto Sales", "Porto Alegre - RS", "Roberto Informática", 556677880001555, 15975348644),  
    ("Luana Produtos", "Recife - PE", "Luana Brinquedos Ltda", 667788990001444, 25836914755);  
    
    select *from seller;
    
insert into productSeller(idProSel,idPProd,Amount)
	values (1, 1, 50),  
    (2, 2, 30),  
    (3, 3, 20),  
    (4, 4, 15),  
    (5, 5, 40),  
    (6, 6, 25);
    
    select *from productSeller;
    
insert into clienttype(tipo,CPF,idClienttype)
	values ("Pf", 12345678901, 1),  
    ("Pf", 98765432100, 2),  
    ("Pf", 11122233344, 3),  
    ("Pf", 44455566677, 4),  
    ("Pf", 77788899900, 5),  
    ("Pf", 99900011122, 6);  
    
    select *from clienttype;
    
-- queries

select count(*) from clients;

select * from clients c, orders o where c.idClient=o.idOrderClient;
select Fname,Lname,idOrder,orderDescription,orderStatus from clients c, orders o where c.idClient=o.idOrderClient;

insert into orders(idOrderClient,idOrderPayment,orderStatus,orderDescription,frete)
	values (1, 2, "Em andamento", "Compra de um Notebook Ultra", 18.00);  
    
select * from clients c, orders o where c.idClient=o.idOrderClient
	group by idOrder;
    
select * from clients
	LEFT OUTER JOIN orders ON idClient=idOrderClient;
    
select * from clients
	INNER JOIN orders ON idClient=idOrderClient 
    inner join productorder on idPOorder=idOrder;
    
SELECT * 
FROM orders 
WHERE idOrderClient = 1;

SELECT p.Pname, ps.Amount 
FROM product p
JOIN productInStorage ps ON p.idProduct = ps.idProduct
WHERE ps.idStorage = 1;

SELECT orderStatus, orderDescription 
FROM orders 
WHERE idOrderClient = 1;

select concat(Fname," ",Lname) as complet_name, idClient,idOrder from clients,orders where orderStatus="Em andamento";


select concat(Fname," ",Lname) as complet_name, idClient,idOrderClient from clients,orders where orderStatus="Enviado"
order by idOrderClient;


SELECT p.Pname, ps.Amount 
FROM product p
JOIN productSeller ps ON p.idProduct = ps.idPProd
WHERE ps.idProSel = 1;


SELECT p.Category, COUNT(*) AS numProducts
FROM product p
GROUP BY p.Category
HAVING COUNT(*) > 1;

SELECT p.Category, COUNT(*) AS numProducts
FROM product p
GROUP BY p.Category
HAVING COUNT(*) <> 2;


SELECT orderStatus, COUNT(*) AS totalPedidos 
FROM orders 
GROUP BY orderStatus;

SELECT concat(Fname," ",Lname) as complet_name, idClient, orderStatus
FROM clients, orders; 

SELECT * 
from seller se, supplier su
where se.cnpj=su.cnpj;

SELECT c.idClient, c.Fname, COUNT(p.idOrderClient) AS total_pedidos
FROM clients c
LEFT JOIN orders p ON c.idClient = p.idOrderClient
GROUP BY c.idClient, c.Fname;

 