use company;
SET FOREIGN_KEY_CHECKS = 0;
set unique_checks=0;

drop table if exists CodeDEX;

# codeDEX 表
# 问题、描述、等级、具体描述、解决方法和代码、是否已经解决
create table CodeDEX(
	cid int primary key,
	checker varchar(50) not null UNIQUE,
	level varchar(20) not null,
	description varchar(300) not null,
	solution varchar(1000) not null,
	isFix tinyint(1) not null
)default character set utf8;

insert into CodeDEX values(49614, 'FORWARD_NULL', 'Low', '空指针异常', '66666', 1);

SET FOREIGN_KEY_CHECKS = 1;
set unique_checks=1;
