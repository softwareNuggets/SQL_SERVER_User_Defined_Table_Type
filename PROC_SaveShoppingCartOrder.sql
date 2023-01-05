use myDb;
drop procedure PROC_SaveShoppingCartOrder

create procedure PROC_SaveShoppingCartOrder
(
	@master		PurchaseOrderType	READONLY,
	@details	PODetailType		READONLY
)
as
/*
	history
	9/2/2021  programmer-name	save order to PurchaseOrder - @master
								save details to PODetailLines @details
*/
begin

	declare @po_order_id bigint = (select po_order_id from @master)

	begin tran

		insert into PurchaseOrder(
				po_order_id, order_date, customer_id, order_total_cost,
				create_date, create_user)
		select
				po_order_id, order_date,  customer_id, order_total_cost,
				create_date, create_user
		from	@master;



		insert into PODetailLines ( 
				po_order_id,	line_number,	item_id,
				qty,			unit_price,		item_description, 
				line_total_cost,create_date,	create_user)
		select 
				po_order_id,	line_number,	item_id,
				qty,			unit_price,		item_description, 
				line_total_cost, getdate(),		create_user
		from	@details


		declare @order_total decimal(10,2) = 
			(select sum(line_total_cost) from @details);

		update PurchaseOrder
		set order_total_cost = @order_total
		where po_order_id = @po_order_id;

	commit;
end;