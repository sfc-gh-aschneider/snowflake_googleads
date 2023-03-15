use role accountadmin;

create or replace role loader;
create or replace role transformer;
create or replace role reporter;
grant role loader to role sysadmin;
grant role transformer to role sysadmin;
grant role reporter to role sysadmin;

use role sysadmin;


/*
CREATE WAREHOUSE loading 
WITH WAREHOUSE_SIZE = 'XSMALL'
WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 
AUTO_RESUME = TRUE 
MIN_CLUSTER_COUNT = 1 
MAX_CLUSTER_COUNT = 1 
SCALING_POLICY = 'STANDARD';
*/

CREATE OR REPLACE WAREHOUSE transforming 
WITH WAREHOUSE_SIZE = 'XSMALL'
WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 
AUTO_RESUME = TRUE 
MIN_CLUSTER_COUNT = 1 
MAX_CLUSTER_COUNT = 1 
SCALING_POLICY = 'STANDARD';

CREATE OR REPLACE WAREHOUSE reporting 
WITH WAREHOUSE_SIZE = 'XSMALL'
WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 60 
AUTO_RESUME = TRUE 
MIN_CLUSTER_COUNT = 1 
MAX_CLUSTER_COUNT = 1 
SCALING_POLICY = 'STANDARD';

-- grant usage on warehouse loading to role loader;
grant usage on warehouse transforming to role transformer;
grant usage on warehouse reporting to role reporter;

create or replace database raw;
grant ownership on database raw to role loader;
grant ownership on schema public to role loader;
grant usage on database raw to role transformer;
grant usage on schema raw.public to role transformer;
grant select on all tables in schema raw.public to role transformer;


create or replace database analytics;
grant ownership on database analytics to role transformer;
grant ownership on schema public to role transformer;
grant usage on database analytics to role reporter;

use role loader;
use database raw;

create or replace table raw_customers (
id number,
first_name varchar,
last_name varchar,
email varchar);

create or replace table raw_orders (
id number,
user_id number,
order_date date,
status varchar);

create or replace table raw_payments (
id number,
order_id number,
payment_method varchar,
amount number);


