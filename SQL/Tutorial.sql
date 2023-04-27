create schema atvbd1;

create table  atvbd1.clientes(
	i_id_clientes int primary key auto_increment,
    s_nome_clientes char(50) not null,
	s_telefone_clientes char(11) not null,
    s_email_clientes varchar(50) not null,
    s_endereco_clientes varchar(50) not null,
    s_cidade_clientes varchar(15) not null,
    s_cep_clientes char(8) not null
);

create table atvbd1.funcionarios(
	i_id_funcionarios int primary key auto_increment,
	s_nome_funcionarios char(50) not null,
    s_telefone_funcionarios char(11) not null,
    s_email_funcionarios varchar(50) not null,
    s_endereco_funcionarios varchar(50) not null,
    s_cidade_funcionarios varchar(15) not null,
    s_cep_funcionarios char(8) not null
);

create table atvbd1.pedidos(
	i_id_pedidos int primary key auto_increment,
    i_idCliente_pedidos int not null,
	date_data_pedidos date not null,
    date_dataEnvio_pedidos date not null,
	i_idFuncionario_pedidos int not null
);

create table atvbd1.produtos(
	i_id_produtos int primary key auto_increment,
	s_descricao_produtos text,
    f_valorCompra_produtos float(12,2) not null,
	f_estoque_produtos float(12,2) not null,
	f_valorVenda_produtos float (12,2) not null
);

create table atvbd1.itensPedidos(
	i_id_itensPedidos int primary key auto_increment,
	i_idPedido_itensPedidos int not null,
    i_idProdutos_itensPedidos int not null,
    i_quantidade_itensPedidos int not null,
    f_valorItem_itensPedidos float(12,2) not null,
	f_valorTotal_itensPedidos float(12,2) not null,
	f_desconto_itensPedidos float (12,2) not null
);

alter table atvbd1.pedidos add constraint fk_idCliente foreign key (i_idCliente_pedidos) references clientes (i_id_clientes);
alter table atvbd1.pedidos add constraint fk_idFuncionarios foreign key (i_idFuncionario_pedidos) references funcionarios (i_id_funcionarios);
alter table atvbd1.itensPedidos add constraint fk_idProdutos foreign key (i_idProdutos_itensPedidos) references produtos (i_id_produtos);
alter table atvbd1.itensPedidos add constraint fk_idPedidos foreign key (i_idPedido_itensPedidos) references pedidos (i_id_pedidos);