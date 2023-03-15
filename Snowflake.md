## Alternate Tutorial Steps for Snowflake 

The [dbt tutorial](https://tutorial.getdbt.com/tutorial/setting-up) has a clear set of instructions to follow based on using Google BigQuery as the analytic database. The following instruction are meant as a replacement when using [Snowflake](https://www.snowflake.com).

The title of the section in the dbt tutorial is listed below with alternate instructions when required for use with Snowflake.

## Alternate Steps

### Create a BigQuery Project - Alternate Step: Create a Database, Schema, and Tables in Snowflake

Snowflake provides a Cloud Data Warehouse delivered as a service and therefore requires an account. If you have access to a Snowflake account, simply log in and follow the instructions below. You can obtain a Snowflake trial account [here](https:trial.snowflake.com).

#### Create a database, schema and tables for the dbt tutorial

Once logged into your Snowflake account:
- select _Worksheets_ in the ribbon. You can either copy the contents of [dml_snowflake.sql](/Snowflake/dml_snowflake.sql) and paste it into a worksheet in the Snowflake UI, or click the down arrow next to the new worksheet *+* sign, select _Load Script_, and open `dml_snowflake.sql`.

The script follows best practices for [using dbt with Snowflake](https://community.snowflake.com/s/article/Use-Case-How-We-Configure-Snowflake-at-Fishtown-Analytics) from the makers of dbt, [Fishtown Analytics](https://fishtownanalytics.com).

- Run all commands in the script. If you are unable to use the accountadmin role to create new users and roles, you can simply create the raw tables and adjust the configuration script accordingly.


