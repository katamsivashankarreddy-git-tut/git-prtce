select a.edi_type, c.name, c2.name
from account a 
join client c 
on a.client_id = c.id 
join carrier c2 
on a.carrier_id = c2.id ;

select distinct a.is_active
from account a ;
use trace;

select c.name as client_name, count(a.id) as active_accounts
from account a 
join client c 
on a.client_id = c.id 
where a.is_active = 1
group by c.name;

select c.name as client_name, c2.name as carrier_name, count(a.id) as active_accounts
from account a 
join client c 
on a.client_id = c.id 
join carrier c2 
on a.carrier_id = c2.id 
WHERE a.is_active = 1
GROUP by c.name, c2.name ;

select DISTINCT i.created_date
from invoice i 
limit 10;

select count(i.id)
from invoice i 
where i.created_date BETWEEN '2021-12-01 00:00:00' and '2021-12-31 23:59:59';

select c.name as carrier_name, count(i.id) as invoices_count
from invoice i , carrier c 
where i.carrier_id = c.id and i.created_date BETWEEN '2021-12-01 00:00:00'and '2021-12-31 23:59:59'
group by c.name ;

select DISTINCT i.status
from invoice i ;

select c.name as carrier_name, count(i.id) as invoices_count
FROM invoice i , carrier c 
where i.carrier_id = c.id and i.created_date between '2021-12-01 00:00:00'and '2021-12-31 23:59:59' and i.status != 'done'
GROUP by c.name;
SELECT DISTINCT i.control_number
from invoice i ;

SELECT DISTINCT  c.id as carrier_id , c.name as carrier_name, i.control_number 
from invoice i , carrier c 
where i.carrier_id = c.id and i.control_number  is NOT null;

select distinct i.payment_number
from invoice i ;

SELECT distinct c.name as carrier_name, i.payment_number
from invoice i , carrier c 
where i.carrier_id = c.id and i.payment_number is not null;
select i.carrier_invoice_amount
from invoice i 
limit 30;
select i.invoice_amount
from invoice i 
limit 30;

select i.invoice_amount, i.carrier_invoice_amount, (i.carrier_invoice_amount - i.invoice_amount) as diference
from invoice i 
where i.carrier_invoice_amount <> i.invoice_amount 
limit 10;

select * from client c 
where c.id = 62143;

 select a.carrier_id, c.name
 from account a , carrier c 
 where a.carrier_id = c.id  and a.client_id = 621;
 
select * from account a where a.client_id = 621;

select c.name FROM account a , carrier c 
where a.client_id = c.id and a.client_id = 621;

select c.name  as client_name, c2.name as carrier_name, count(i.id) as invoice_count
from invoice i , client c , carrier c2 
where i.carrier_id = c2.id and c.id = 1 and i.created_date between '2020-12-01 00:00:00'and '2020-12-31 23:59:59' 
group by c2.name , c.name ;

select i.control_number, c.name as client_name, c2.name as carrier_name, count(i.id) as invoice_count
from invoice i  , client c , carrier c2 
where i.carrier_id = c2.id and c.id = 1 and i.created_date BETWEEN '2020-12-01 00:00:00'and '2020-12-31 23:59:59'
group by c.name , c2.name , i.control_number ;

SELECT c.name as client_name, c2.name as carrier_name, a.currency_code 
from account a , client c , carrier c2 
where a.client_id = c.id and a.carrier_id = c2.id and a.created_date BETWEEN '2020-12-01 00:00:00'and '2020-12-31 23:59:59';

select i.invoice_amount, id.total_charges, tnd.net_amount
from invoice i , invoice_details id, tracking_number_details tnd 
where i.id = id.invoice_id and id.id = tnd.invoicedetails_id 
limit 15;

select i.id , i.invoice_amount, sum(id.total_charges ) as total_charges
from invoice i , invoice_details id 
where i.id = id.invoice_id and i.created_date BETWEEN '2020-12-01 00:00:00'and '2020-12-31 23:59:59'
group by i.id , i.invoice_amount
having  i.invoice_amount <> sum(id.total_charges)
limit 10;


select i.id
from invoice i where i.created_date BETWEEN '2020-12-01 00:00:00'and '2020-12-31 23:59:59'
limit 10;
SELECT i.invoice_number
from invoice i where i.created_date BETWEEN '2020-12-01 00:00:00'and '2020-12-31 23:59:59'
limit 10;

select i.id, sum(tnd.net_amount) as net_amount_sum
from invoice i , invoice_details id , tracking_number_details tnd 
where i.id = id.invoice_id and id.invoice_id = tnd.invoicedetails_id 
group by i.id;
-- 

select i.id, i.invoice_amount, sum(tnd.net_amount) as total_net_amount
from invoice i , invoice_details id ,tracking_number_details tnd 
where i.id = id.invoice_id and id.invoice_id = tnd.invoicedetails_id and i.created_date
BETWEEN '2020-12-01 00:00:00'and '2020-12-31 23:59:59'
GROUP by i.id , i.invoice_amount 
HAVING i.invoice_amount <> sum(tnd.net_amount );

SELECT i.id, i.invoice_amount, sum(id.total_charges) as total_charges_sum, sum(tnd.net_amount) as total_net_amount_sum
from invoice i , invoice_details id , tracking_number_details tnd 
where i.id = id.invoice_id and id.invoice_id = tnd.invoicedetails_id 
and i.created_date BETWEEN '2019-12-01 00:00:00'and '2019-12-31 23:59:59'
group by i.id, i.invoice_amount 
HAVING i.invoice_amount <> sum(id.total_charges ) and i.invoice_amount <> sum(tnd.net_amount );
use shipbob;
SELECT * from business_partner bp limit 5;
SELECT COUNT(*) from business_partner bp ;
use trace;
select * from account
limit 4;
select * from client c 
limit 4;

select i.invoice_amount, sum(id.total_charges), sum(tnd.net_amount)
from invoice i , invoice_details id, tracking_number_details tnd 
where i.id = id.invoice_id and id.id = tnd.invoicedetails_id 
limit 15;

select a.name from account a  limit 10;
SELECT * from account a limit 10;

select * from carrier c where c.name like '%fedex%';

limit 10;
 select * from carrier c where c.name like '%ups%'
limit 10;

select i.id , i.invoice_amount, sum(id.total_charges ) as total_charges
from invoice i , invoice_details id 
where i.id = id.invoice_id and i.created_date BETWEEN '2020-12-01 00:00:00'and '2020-12-31 23:59:59'
group by i.id , i.invoice_amount
having  i.invoice_amount <> sum(id.total_charges)
limit 10;

select i.id , i.invoice_amount, sum(id.total_charges ) as total_charges
from invoice i , invoice_details id 
where i.id = id.invoice_id and i.created_date BETWEEN '2020-12-01 00:00:00'and '2020-12-31 23:59:59'
group by i.id , i.invoice_amount
having  i.invoice_amount = sum(id.total_charges)
limit 10;


select i.id, i.invoice_amount, sum(tnd.net_amount) as total_net_amount
from invoice i , invoice_details id ,tracking_number_details tnd 
where i.id = id.invoice_id and i.id  = tnd.invoicedetails_id and i.created_date
BETWEEN '2020-12-01 00:00:00'and '2020-12-31 23:59:59'
GROUP by i.id , i.invoice_amount ;

SELECT COUNT(*)
FROM invoice_details id, tracking_number_details tnd 
where id.id = tnd.invoicedetails_id and id.created_date BETWEEN '2020-12-01 00:00:00'and '2020-12-31 23:59:59' ;
desc invoice_details;

select c.name as carrier_name, dabd.incentive_amount
from carrier c , dashboards_accesorials_bill_date dabd 
where c.id = dabd.carrier_id 
and c.name in ('fedex', 'ups');

select c.name as carrier_name, sum(dabd.incentive_amount) as incentive_amount
from carrier c , dashboards_accesorials_bill_date dabd 
where c.id = dabd.carrier_id 
and c.name in ('fedex', 'ups')
group by c.name ;

select c.name as carrier_name, sum(dabd.incentive_amount) as incentive_amount
from carrier c , dashboards_accesorials_bill_date dabd 
where c.id = dabd.carrier_id 
and c.name = 'FedEx'
group by c.name ;

select c.name as carrier_name, dabd.incentive_amount
from carrier c , dashboards_accesorials_bill_date dabd 
where c.id = dabd.carrier_id and dabd.incentive_amount != null
and c.name = 'fedex'
limit 10;

--using case 
select sum(case when c.name = 'ups' then dabd.incentive_amount else 0 end) as ups_incentive,
       sum(case when c.name = 'fedex' then dabd.incentive_amount else 0 end) as fedex_incentive
from carrier c , dashboards_accesorials_bill_date dabd 
where c.id = dabd.carrier_id ;

select TABLE_SCHEMA table_name, column_name
from information_schema.`COLUMNS` c 
where column_name =  'accessorials';

select * from tracking_number_details tnd limit 10;
select * from carrier c where c.name in ('ups', 'fedex');
show create table invoice_details;

SELECT distinct tnd.bucket_name
from invoice_details id , tracking_number_details tnd , carrier c 
where tnd.invoicedetails_id = id.id and id.carrier_id = c.id and c.name in ('ups', 'fedex')
order by tnd.bucket_name ;

select * from invoice i limit 10;

select distinct tnd.bucket_name
from invoice i , carrier c , tracking_number_details tnd 
where i.control_number = tnd.control_number and i.carrier_id = c.id and c.name in ('ups','fedex')
order by tnd.bucket_name; 

select DISTINCT  tnd.bucket_name 
from invoice i ,invoice_details id, tracking_number_details tnd 
where i.id = id.invoice_id and id.id = tnd.invoicedetails_id and i.carrier_id in (1, 2)
order by tnd.bucket_name ;




