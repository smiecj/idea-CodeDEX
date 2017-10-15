use company;
SET FOREIGN_KEY_CHECKS = 0;
set unique_checks=0;

drop table if exists Question;
drop table if exists CodeDEX;
drop table if exists Question_CodeDEX;

# 问题类表
# 问题、描述
create table Question(
	qid int primary key auto_increment,
	question varchar(20) not null,
	description varchar(300) not null
);

# codeDEX 表
# 问题、描述、解决方法、代码
create table CodeDEX(
	cid int primary key auto_increment,
	question varchar(25) not null UNIQUE,
	description varchar(300),
	solution varchar(300),
	code varchar(400)
);

# 问题和codeDEX外键
create table Question_CodeDEX(
	qid int,
	cid int,
	foreign key(qid) references Question(qid)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	foreign key(cid) references CodeDEX(cid)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

insert into Question values(1, '用户输入安全问题', '在项目中，我们可能要执行指令、查询数据库等。对这些操作，我们必须先检查用户的输入，避免对执行机造成危害');
insert into CodeDEX(question, description, solution, code) values('Command Injection', '命令注入，执行的指令没有经过安全校验', 
	'制作指令白名单', 'Runtime.getRuntime().exec(command);');
insert into Question_CodeDEX values(1, 1);

SET FOREIGN_KEY_CHECKS = 1;
set unique_checks=1;