use mydb;


--a customer is using the web site
--they are selecting items, and adding
--to their shopping card
declare @master as PurchaseOrderType;
insert into @master
(
	po_order_id,			
	order_date	,		
	customer_id	,		
	order_total_cost,	
	create_date,
	create_user
)
values
(	10000100,
	cast(getdate() as date),
	15001,
	0,
	getdate(),
	N'person name'
)

--select * from @master


declare @details as PODetailType;
insert into @details
(
	po_order_id,		
	line_number,		
	item_id,			
	qty,				
	unit_price,		
	item_description,
	line_total_cost,
	create_user
)
values

(10000100, 1, 14, 1, 23.55, N'yard rake',	23.55,	N'person name'),
(10000100, 2, 73, 1, 43.55, N'shovel',		43.55,	N'person name'),
(10000100, 3, 86, 2, 19.55, N'yard gloves', 39.10,	N'person name'),
(10000100, 4, 33, 12, 7.99, N'plant',		95.88,	N'person name'),
(10000100, 5, 61, 2, 29.99, N'water hose',	59.98,	N'person name')

select * from @details


exec PROC_SaveShoppingCartOrder @master, @details

use mydb;

select *
from PurchaseOrder

select *
from PODetailLines