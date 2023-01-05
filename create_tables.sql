use MyDB;
create table PurchaseOrder
(
	row_id				bigint			identity(1,1) not null primary key,
	po_order_id			bigint			not null,
	order_date			date			not null,
	customer_id			int				not null,
	order_total_cost	decimal(10,2)   default 0.00,
	create_date			datetime		not null,
	create_user			nvarchar(30)	not null,
	update_date			datetime,
	update_user			nvarchar(30)
);


create table PODetailLines
(
	po_order_id			bigint not null,
	line_number			int	not null,
	item_id				int not null,
	qty					int not null,
	unit_price			decimal(10,2),
	item_description	nvarchar(100),
	line_total_cost		decimal(10,2),
	row_ts				timestamp,
	create_date			datetime		not null,
	create_user			nvarchar(30)	not null,
	update_date			datetime,
	update_user			nvarchar(30)
);


create type PurchaseOrderType as Table
(
	po_order_id			bigint			not null,
	order_date			datetime		not null,
	customer_id			int				not null,
	order_total_cost	decimal(10,2),
	create_date			datetime		not null,
	create_user			nvarchar(30)	not null
);


create type PODetailType as Table
(
	po_order_id			bigint not null,
	line_number			int	not null,
	item_id				int not null,
	qty					int not null,
	unit_price			decimal(10,2),
	item_description	nvarchar(100),
	line_total_cost		decimal(10,2),
	create_user			nvarchar(30)
);