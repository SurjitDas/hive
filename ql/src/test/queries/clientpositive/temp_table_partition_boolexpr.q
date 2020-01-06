--! qt:dataset:srcpart
set hive.mapred.mode=nonstrict;
-- create testing table.
create temporary table part_boolexpr_temp(key int, value string) partitioned by (dt int, ts string);

-- both the below queries should return 0 rows
select count(*) from part_boolexpr_temp where key = 'abc';
select * from part_boolexpr_temp where dt = 'abc';
explain select count(1) from srcpart where true;
explain select count(1) from srcpart where false;
explain select count(1) from srcpart where true and hr='11';
explain select count(1) from srcpart where true or hr='11';
explain select count(1) from srcpart where false or hr='11';
explain select count(1) from srcpart where false and hr='11';
explain select count(1) from srcpart where INPUT__FILE__NAME is not null;
