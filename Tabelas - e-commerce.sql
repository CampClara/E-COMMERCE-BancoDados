-- criação do banco de dados para o e-commerce 
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela cliente
	create table clients(
		idClient int auto_increment primary key,
        Fname varchar(10),
        Mname varchar(3),
        Lname varchar(20),
		CPF char(11) not null,
        Address varchar(30),
        constraint unique_cpf_client unique (CPF)
    );

alter table clients auto_increment=1;
desc clients;
-- criar tabela produto
	create table product(
		idProduct int auto_increment primary key,
        Pname varchar(10) not null,
		Category enum("eletrônico","vestuário","brinquedo") not null,
        Price varchar(20),
        avaliação float default 0,
        size varchar(10)
	);

-- criar tabela pagamento
	create table payments(
		idPayment int auto_increment primary key,
		idPaymentClient int,
		tipo enum("Crédito","Débito","Pix") not null,
		constraint fk_payment_client foreign key (idPaymentClient) references clients(idClient) on update cascade
    );

-- criar tabela pedido
	create table orders(
		idOrder int auto_increment primary key,
		idOrderClient int,
        idOrderPayment int,
		orderStatus enum("Em andamento", "Processando", "Enviado", "Entregue") default "processando",
		orderDescription varchar(250),
		frete float default 10,
		constraint fk_orders_client foreign key (idOrderClient) references clients(idClient) on update cascade, 
        constraint fk_orders_payment foreign key (idOrderPayment) references payments(idPayment) on update cascade
	);
    
-- criar tabela Relação produto/pedido
	create table productOrder(
		idPOproduct int,
		idPOorder int,
		Amount int not null,
		status ENUM("Disponível", "Sem estoque") default "Disponível",
		primary key (idPOproduct,idPOorder),
		constraint fk_product_seller foreign key (idPOproduct) references product(idProduct) on update cascade,
        constraint fk_product_product foreign key (idPOorder) references orders(idOrder) on update cascade
    );

-- criar tabela terceiro-vendedor
	create table seller(
		idSeller int auto_increment primary key,
        AbstractName varchar(45),
		Location varchar(45),
        SocialName varchar(45) not null,
        CNPJ char(15),
        CPF char(11),
        constraint unique_socialname_seller unique (SocialName),
        constraint unique_cnpj_seller unique (CNPJ),
        constraint unique_cpf_seller unique (CPF)
	);

-- criar tabela produtos por vendedor
	create table productSeller(
		idProSel int ,
        idPProd int ,
        Amount int not null,
        primary key (idProSel,idPProd),
        constraint fk_productSeller_seller foreign key (idProSel) references seller(idSeller) on update cascade,
        constraint fk_productSeller_product foreign key (idPProd) references product(idProduct) on update cascade
    );

-- criar tabela estoque
	create table storages(
		idStorage int auto_increment primary key,
		Location varchar(45)
	);

-- criar tabela Produto está no estoque 
	create table ProductInStorage (
		idProduct int,
		idStorage int,
		Amount int default 0,
		primary key(idProduct,idStorage),
		constraint fk_productstorage_product foreign key (idProduct) references product(idProduct) on update cascade,
		constraint fk_productstorage_storage foreign key (idStorage) references storages(idStorage) on update cascade
    );

-- criar tabela fornecedor
	create table supplier(
		idSupplier int auto_increment primary key,
        Contact char(11) not null,
        CNPJ char(15) not null,
        SocialName varchar(45) not null,
		constraint unique_cnpj_supplier unique (CNPJ),
        constraint unique_socialname_supplier unique (SocialName)
    );

-- cria taela disponibiliza (entre fornecedor e produto)
	create table available(
		idProduct int,
        idSupplier int,
		constraint fk_available_product foreign key (idProduct) references product(idProduct) on update cascade,
		constraint fk_available_supplier foreign key (idSupplier) references supplier(idSupplier) on update cascade
    );

-- criar tabela classificação cliente
	create table clienttype(
		tipo ENUM("Pf", "Pj") not null,
        CPF char(11) not null,
        idClienttype int not null,
		constraint unique_cpf_clienttype unique (CPF),
        primary key (idClienttype),
        constraint fk_clienttype_client foreign key (idClienttype) references clients(idClient) on update cascade
    );


show tables;
show databases;