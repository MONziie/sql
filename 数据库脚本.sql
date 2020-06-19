#通过cmd连接数据库 mysql -u 账号 -p密码
#主流软件 Oracle，mysql,sqlsever

#------------------------------------------#
#语法规则：创建一个数据库
#CREATE DATABASE 库名；
CREATE DATABASE dt33;
#删除指定数据库 drop database 库名；
DROP DATABASE dt33;
#在创建库时，希望指定编码：create database 库名 character set 编码名；
CREATE DATABASE dt33 CHARACTER SET utf8;

#------------------------------------------#
#语法规则：创建一个表:
#create table 表名(
#	字段1 数据类型,
#	字段2 数据类型, 
#	...	
#)
#由于是先有库database，然后再库中创建表table
#选中某一个数据库：Use 库名；
USE dt33;
CREATE TABLE 数据分析成绩表(
	姓名 VARCHAR(40),
	班级 VARCHAR(20), 
	成绩 FLOAT
); 

#删除指定表 drop table 库名；
DROP TABLE 数据分析成绩表;

#-----往表中添加、删除、修改、查询数据（CRUD）--#
#往指定的表中添加数据：

#插入数据第一种语法： insert into 表名（字段1，字段2...） values (值1，值2...);

#“=”是放在set关键词后，则是“赋值运算符”
INSERT INTO `数据分析成绩表`(姓名,班级,成绩) VALUES('臭猪','5班',99.5);
INSERT INTO `数据分析成绩表`(姓名) VALUES('傻猪猪');
INSERT INTO `数据分析成绩表` VALUES('大猪猪','5班',90.5);


#第二种语法： insert into `数据分析成绩表` set 姓名=‘猪猪’

INSERT INTO `数据分析成绩表` SET 姓名='猪猪'; 

#第三种语法：同时插入多条数据

INSERT INTO `数据分析成绩表`(姓名,班级,成绩)
VALUES('小猪猪','5班',92.5),('憨猪猪','5班',93.5),('猪猪仔','5班',96.5);

#删除数据： delete from 表名 where 条件

#“=”是放在where关键词后，则是“关系运算符”
DELETE FROM `数据分析成绩表`WHERE 姓名='傻猪猪'

#------------------关系运算符---------------------------#
#在mysql中常用的关系运算符： =、>、<、>=、<=、!=
#在mysql中关系运算符要放在where关键字之后
#查询的语法规则：select 字段1,字段2,...from 表名 [where 条件];
#1.查询某一张表中的所有数据记录
SELECT 姓名,班级,成绩 FROM `数据分析成绩表`;
SELECT 姓名 FROM `数据分析成绩表`;
SELECT * FROM `数据分析成绩表`;#*代表查询某一张表中的所有字段


#查看成绩大于等于90的所有同学的名字
SELECT 姓名 FROM `数据分析成绩表` WHERE 成绩>=90;
SELECT 姓名 AS 名字 FROM `数据分析成绩表` WHERE 成绩>=90;#as: 查询时给字段取别名
SELECT 姓名 名字 FROM `数据分析成绩表` WHERE 成绩>=90;#省略as

#------------逻辑运算符-----------#
#在mysql中常见的逻辑运算有：and,or,not与或非
#查询’数据分析成绩表`表中班级=7班并且成绩在90~60之间的数据
SELECT * FROM `数据分析成绩表` WHERE 班级='7班' AND 成绩>=70 AND 成绩<=100

#给表取别名
#SELECT * from 数据分析成绩表 班级成绩表;
#SELECT 班级成绩表.`姓名`, 班级成绩表.`成绩`FROM 数据分析成绩表 班级成绩表;


#--------对表中数据的增insert删delete改update查select----------------------------#
#修改： update 表名 set 字段名1=值1,字段名2=值2....where 条件
UPDATE 数据分析成绩表 SET 姓名='臭臭臭猪' WHERE 成绩=70
#删除表中的所有数据：
DELETE FROM 数据分析成绩表 WHERE 1=1


#-------------------对sql语句进行分类-----------------------#
#数据库查询语言DQL (database query language)：对 表的查询语句，select
#数据库定义语言DDL(database defined language) : create database, drop database, create table, drop table等
#数据库操作语言DML(database manage language) : update,insert,delete


#DDL 操作数据库：
#添加数据库：create 库名 【character set utf8/gbk】
#删除指定的数据库：drop database 库名；
#查询指定库的详细信息：
		（1） SHOW CREATE DATABASE 库名；查看某个数据库的详细信息
			SHOW CREATE DATABASE dt55;
		（2） SHOW DATABASES :查看mysql服务器软件下所有的库
		（3） SELECT DATABASES () 查看：当前用户链接的是哪个数据库
		（4） SHOW TABLES;查看指定的数据库下有哪些表

#修改指定库的编码：alter database 库名 character set 新编码名；
SHOW CREATE DATABASE dt33_count;
ALTER DATABASE dt33_count CHARACTER SET utf8;

#-----------DDL对表的增删改查-----------------#
#创建一张表：
CREATE TABLE 表名(字段名1 数据类型,字段名2 数据类型...);

#删除表：drop table 表名;

#查询：
（1）查询某一张表的结构：desc 表格
	DESC bank； 
（2）打印某一张表sql创建信息： SHOW CREATE TABLE 表名；
	SHOW CREATE TABLE bank;
#修改表：
（1）对已存在的表进行重命名：rename TABLE 旧表名 TO 新表名；
	RENAME TABLE 数据分析成绩表 TO 成绩表; #dt55
	
  （2）往已存在的表中添加字段信息：alter TABLE 表名 ADD 字段名 数据类型
	ALTER TABLE bank ADD gender VARCHAR(2); 
	
(3)删除某一张表中的字段： ALTER TABLE 表名 DROP 被删除的字段名
	ALTER TABLEbank DROP gender;
	
（4）对表中字段进行重命名： ALTER TABLE 表名 CHANGE 旧字段民 新字段名 新字段名数据类型
ALTER TABLE bank CHANGE 傻猪 大猪猪 VARCHAR(40);

（5）修改某一字段的数据类型长度： ALTER 表名 CHANGE 旧字段名 新字段名 数据类型长度
ALTER TABLE bank CHANGE 姓名 姓名 VARCHAR(30);


#-------------往bank表中添加提个字段birthday-------------------------#
 ALTER TABLE 数据分析成绩表  DATE;#date类型只有年月日
 UPDATE 数据分析成绩表 SET birthday='2018-1-10' WHERE 1=1;
 ALTER TABLE 数据分析成绩表 CHANGE birthday birthday DATETIME;
#调试窗口双击时间可选择
#datetime包含年月日时分秒
 
 
 
 #----------对某一数据库的备份与还原---------#
 #考虑安全性
 #第一种方法通过cmd命令：mysqldump -uroot -p密码 需要备份的数据库名>d盘:\备份后的sql脚本名;
 mysqldump -uroot -p123123 dt55_account>d:\dt55_account_back.sql
 
 还原备份的文件数据： 首先需要进入MySQL环境--->创建一个库---->在库下还原数据--->source 备份的数据库脚本
 #第二钟方法通过sqlyog工具 右键sql转储导出-->保存路径修改名称_back--->使用时在工具文件打开-->CtrlA-->调试刷新
 
 
#=======DAY2=======#
#----------数据类型的属性----#
#MySQL中常见的数据类型：varchar(n),float,int(n),bignit(n),date,datetime,text
#默认值：DEFAULT '默认值' 
#非空：not NULL(如果某一字段被not null修饰后，添加数据时，此字段必须填写)
#自动增长：auto_increment （数据类型是数字,尽量作用在int类型的字段上） 
#主键：primary key(必须是1)，不能够重复，一张表中只有一个字段可以作为主键
#唯一键：unique，被unique修饰的数据不能够重复

DROP TABLE students;
CREATE TABLE students(
	#id int(20)DEFAULT '0' comment '学生编号',
	id INT(20) AUTO_INCREMENT PRIMARY KEY COMMENT '学生编号',#此时id有3个属性：注释，主键（id那一列），自增
	stuname VARCHAR(40) COMMENT '学生姓名',
	gender VARCHAR(2) DEFAULT '男' COMMENT '性别'
)

#delete可以删除整张表，但是删除数据后，自增数列不会从1开始，而是从上一次计数的数值开始
DELETE FROM students WHERE id=3
DELETE FROM students WHERE 1=1

#如果要删除一整张表的数据使用truncate，使用它删除数据后，如果字段有自增的，重新开始计数
TRUNCATE TABLE students;

CREATE TABLE students(
	
	id BIGINT(20) AUTO_INCREMENT PRIMARY KEY COMMENT '学生编号',
	stuname VARCHAR(40) COMMENT '学生姓名',
	gender VARCHAR(2) DEFAULT '男' COMMENT '性别',
	className VARCHAR(20) NOT NULL COMMENT '班级',
	idcard BIGINT(20) UNIQUE COMMENT '身份证号'
)

#--------排序(order by 降序/升序)-------------------#
#排序时字段类型可以是数值类型，也可以是varchar类型（中文不可以排序，英文可以排序）

#降序(desc)
SELECT * FROM students ORDER BY id DESC;
#升序(asc)
SELECT * FROM students ORDER BY id ASC;


#---------聚合函数-------#
#在mysql中函数使用select关键字调用：select 函数名(字段）FROM 表名
#找出最大值：max（字段名）
SELECT MAX(phone) FROM students;
SELECT MAX(phone) AS 最高分 FROM students;

#找出最小值：min(字段名)
SELECT MIN(phone) AS 最低分 FROM students;
SELECT MIN(phone) AS 最低分,className FROM students;

SELECT * FROM students;

#平均值：avg(字段名)
SELECT AVG(className) FROM students;
SELECT AVG(className) AS 平均分 FROM students;

#求和：sum(字段名)
SELECT SUM(className) AS 总分 FROM students;

#统计记录：count（字段名）
#如果字段的值为null，则次字段对应的数据条数不在统计之内；
#解决上述问题，在统计某一张表中的所有数据记录时，最好使用count（*）
SELECT COUNT(phone) AS 总条数 FROM students;

SELECT COUNT(*) AS 总条数 FROM students;

#----------------常用--------------------#
#----------时间函数---------#
#now():获取当前系统时间，时间格式包括年月日时分秒
SELECT NOW() AS 当前系统时间;

#curtime():只获取系统的时分秒
SELECT CURTIME(); 

#curdate():只获取系统的年月日

SELECT CURDATE(); 

#-----------数学函数-----------#
#向上取舍
SELECT CEIL(2.3)

#向下取舍
SELECT FLOOR(2.3)

#随机数：rand()：不用接收参数，返回的是0-1之间的小数
SELECT RAND()
SELECT RAND()*100000

#获取一个随机的5位数，没有小数
SELECT CEIL(RAND()*100000)

#-------------同时查询多条记录----------------------------#
#获取id=1/2/4
SELECT * FROM students WHERE id!=3 AND id!=5
SELECT * FROM students WHERE id IN(1,2,4)
#in(数据1，数据2...)：判断表中某一个字段是否在in后面的参数列表之中
SELECT * FROM students WHERE id NOT IN(3,5)
SELECT * FROM students WHERE id NOT IN(3,5) ORDER BY phone ASC;

#--------------分组查询（group by）分类字段------------------#

CREATE TABLE gugu(
	id BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
	gname VARCHAR(40) COMMENT '商品名称',
	gcategory VARCHAR(20) COMMENT '商品种类'

)

#查询gugU表中商品的种类
SELECT * FROM gugu GROUP BY gcategory

 
 SELECT gcategory FROM gugu GROUP BY gcategory

#查询gugu表中是否有种类为书籍的类型
#如果一个查询语句中使用了group by，则后面的条件需要使用having关键字
SELECT gcategory FROM gugu GROUP BY gcategory HAVING gcategory='书籍'

#——--------------分页（limit起始下标，每页显示的数据量）-----------------------#
#表中有6条数据记录，分4页，每页分别有1，2，3条数据
#语法：
SELECT * FROM 表名 LIMIT 下标（index）,数据量（pagesize）; 
#SELECT * FROM 表名 LIMIT (pageNO-1)*pagesize,pagesize; 
#起始下标为0，第一行第一列
#获取第一页的数据
SELECT * FROM gugu LIMIT 0,1;
#获取第二页的数据
SELECT * FROM gugu LIMIT 1,2; 
#获取第三页的数据
SELECT * FROM gugu LIMIT 3,3; 

#----------------------#
#往指定表中添加一个字段
ALTER TABLE `students` ADD price FLOAT;
#修改字段名
ALTER TABLE `students` CHANGE className age VARCHAR(20);
#复制某一张指定的表以及表数据
CREATE TABLE aaa(
	SELECT * FROM `students`  #不要加分号

)


#---------------时间格式函数--------------------------------------#
DROP TABLE person;
CREATE TABLE person(
	id BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '排名',
	personname VARCHAR(40) COMMENT '人名',
	birthday DATETIME 
	
)

SELECT personname, DATE_FORMAT(birthday,'%Y年%m月%d日') AS birthday FROM `person`;#%H:%i:%s 时分秒


#——---------------子查询----------------------#
#嵌套select

SELECT * FROM students WHERE id IN(1,3,4);
 #最大值
 SELECT MAX(age) AS oldest, stuname FROM students;# 错误，聚合函数不要和字段名一起查询
 SELECT MIN(age) AS smallest FROM students;
 
 SELECT stuname FROM students WHERE age=2;
 #解决上述问题，用联表查询
  
 #同时查询多张表（联表查询）
SELECT * FROM 表1，表2...表n WHERE 条件 #表1和表n可以是同张表 
SELECT * FROM students st,(SELECT MIN(age) AS smallest FROM students) temp WHERE st.age=temp.smallest

SELECT st.stuname,temp.smallest FROM students st,(SELECT MIN(age) AS smallest FROM students) temp WHERE st.age=temp.smallest#难度5颗星


#--------------------#
#部门表（dept）
CREATE TABLE dept(
	ID BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '部门编号',
	deptname VARCHAR(20) COMMENT'部门名称'
	
	
)
#员工表（emp）
CREATE TABLE emp(
	id BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT'员工编号',
	empname VARCHAR(40) COMMENT'员工',
	salary FLOAT COMMENT '薪水',
	deptid BIGINT(20)COMMENT'部门编号'

)

#查询部门编号=1 的部门下的所有员工
SELECT * FROM emp WHERE deptID=1

#查询所有部门中的所有员工
SELECT 字段名1...字段名n FROM 表1，表2...表N WHERE 条件

SELECT * FROM dept d,emp p WHERE d.id=p.deptid

#1.查询部门编号=1的部门下的所有员工
SELECT * FROM emp WHERE deptid=1

#2.查询所有部门中的所有员工
SELECT 字段名1...字段名n FROM 表1，表2...表n WHERE 条件

SELECT d.deptname,e.empname,e.salary FROM dept d,emp e WHERE d.id=e.deptid AND d.deptname='数据部' 

#3.找出‘开发部’所有员工的名称、部门、薪水

SELECT * FROM dept d, emp e WHERE d.id=e.deptid AND d.deptname='数据部'
 
 #4.同时找出开发部和测试部的所有员工的名称，薪水，部门
 #方法一
SELECT d.deptname,e.empname,e.salary FROM dept d,emp e WHERE d.id=e.deptid AND d.deptname IN('开发部','测试部' )
#方法二
SELECT d.deptname,e.empname,e.salary FROM dept d,emp e WHERE d.id=e.deptid AND (d.deptname='开发部' OR d.deptname='测试部') 
#方法三
#union \union all：可以将两个查询语句的结果进行合并，合并的前提是两个查询语句的数据结构相同（两个虚表的字段名相同）
#union：可以自动去重
#union all:不能够去重

SELECT d.deptname,e.empname,e.salary FROM dept d,emp e WHERE d.id=e.deptid AND d.deptname='开发部' 

UNION 
		
SELECT d.deptname,e.empname,e.salary FROM dept d,emp e WHERE d.id=e.deptid AND d.deptname='测试部'  


#-------------------------------------------------------#
#多表查询语法1：select *from 表1，表2...表N where 条件
#多表查询方式2：通过链接关键字
		#内连接
		#外连接
			#左外连接
			#右外连接
#内连接：表1 inner join 表2  on 条件
#（on直接多个表之间有关联的条件）

#1.查询所有部门的所有员工
SELECT * FROM dept d, emp e WHERE d.id=e.dept

SELECT * FROM dept d INNER JOIN emp e ON d.id=e.dept

SELECT d.deptname, e.salary, e.empname FROM dept d INNER JOIN emp e ON d.id=e.deptid

#2.找出开发部字段名的所有员工名、薪水、部门名

SELECT d.deptname, e.salary, e.empname FROM dept d INNER JOIN emp e ON d.deptname='开发部'

#3.找出‘开发部’所有员工的名称、部门、薪水


#4.同时找出开发部和测试部的所有员工的名称，薪水，部门



#--------------模糊查询------------------------------#

#查询students中以“王xxx”开头的所有数据
SELECT * FROM `gugu` WHERE gname LIKE '王%'

#查询students中以“王xxx”开头的人物
SELECT * FROM `gugu` WHERE gname LIKE '王%' AND gcategory='人物' 

#查询students中以“xxx王”结尾的所有数据
SELECT * FROM `gugu` WHERE gname LIKE '%王'

#查询students中包含‘王’字的所有数据
SELECT * FROM `gugu` WHERE gname LIKE '%王%' 



#========内连接==========#
SELECT 字段名1，字段名2....字段名n FROM 表1 别名1 INNER JOIN 表2 别名  ON 条件 WHERE 条件
#(要有关联的字段，左右两个表条件要同时满足条件才能有搜索结果)

#例如：
SELECT d.deptname, e.salary, e.empname FROM dept d INNER JOIN emp e ON d.deptname='开发部'
#=========================#



#---------------------外连接---------------------------#


#======左外连接 left join========

SELECT 字段名1，字段名2....字段名n FROM 表1 别名1 LEFT JOIN 表2 别名  ON 条件 WHERE 条件  
#（左边的表满足条件的数据都会连接起来）
#左外链接当条件不满足时，以左边的表为主

#例如：
SELECT d.deptname, e.salary, e.empname FROM dept d LEFT JOIN emp e ON d.deptname='开发部'

SELECT d.deptname, e.salary, e.empname FROM dept d LEFT JOIN emp e ON d.`ID`=e.deptid

#======右外连接  right join========
#右外链接当条件不满足时，以右边的表为主
SELECT 字段名1，字段名2....字段名n FROM 表1 别名1 RIGHT JOIN 表2 别名  ON 条件 WHERE 条件 
#（右边的表满足条件的数据都会连接起来，不满足的连接起来会显示null）

#例如：
SELECT d.deptname, e.salary, e.empname FROM dept d RIGHT JOIN emp e ON d.`ID`=e.deptid

SELECT d.deptname, e.salary, e.empname FROM dept d RIGHT JOIN emp e ON e.deptid=d.ID WHERE e.deptid=2


 
#---------------表查询（难度系数5颗星）-------------------#
#求出teacherid=3的平均得分
#得到总分数

SELECT SUM(score) AS totalscore FROM questionscore WHERE teacherid=3

SELECT * FROM teacher t INNER JOIN questionscore qs ON t.teacherid=qs.teacherid 


SELECT temp1.totalscore/temp2.num AS 平均分 FROM 
(SELECT SUM(score) AS totalscore FROM questionscore WHERE teacherid=3) temp1,
(SELECT COUNT(*) AS num FROM `questionscore` WHERE teacherid=2 ) temp2 

#----查询语句层层嵌套---#
#----两个没有相同字段名的表可创建一张新表来求值---#


 #三张表内连接
 SELECT * FROM 表1 INNER JOIN 表2 INNER JOIN 表3 ON 条件


#----视图-（金融行业以下语句很常用）-----#
#视图：在真实表上构建的一张虚表（比如在银行，客户的隐私是很重要）

#有1，2表，要求查询所有的员工信息，还包括部门信息

#创建视图语法：create view 视图名 as 查询语句；

CREATE VIEW view_all
AS SELECT g.gname,g.gcategory,d.deptname FROM dept d INNER JOIN gugu g ON d.id=g.id

SELECT * FROM view_all;

#删除视图： drop view 视图名
DROP VIEW view_all;

#查询某一视图中的数据
SELECT * FROM view_all WHERE deptname='开发部';

#删除视图中的某一数据
CREATE VIEW view_gugu AS SELECT * FROM gugu;
DELETE FROM view_gugu WHERE gname='狮王';

#往视图中添加数据
INSERT INTO view_gugu SET gname='狮子';
SELECT * FROM view_gugu;#(view_emp 在这里只是一个构建出来虚表，是没有查询结果的)

#修改视图
UPDATE `view_gugu` SET gname='芒果' WHERE id=8;
 
#(CREATE OR REPLACE VIEW `view_gugu` AS SELECT * FROM gugu;
# alter view view_gugu as select '名王子' from gugu;
# desc view_gugu)

#视图的应用场景：金融行业，保险行业，财务行业等 
 
 
#-----------_建模_----------#
#数据库建模(powerDesigner):sybase,oracle,microsoft,
 
#使用数据建模可以更加直观地理解表与表之间的联系，并且建完模之后会自动生成sql语言

#power designer 建模fole--->new mmodel -->physical data model


#-----开启事务、回滚与提交事务-----#


#丽丽给万万转20W
UPDATE bank SET money=money-20 WHERE bankNO='119';
UPDATE bank SET money=money+20 WHERE bankNO='120';

	#事务：多组操作要么全部成功，要么全部失败，就说这个操作具有事务性；（多组操作要满足这个特性：如何满足-->在提交事务和提交食物之间才能满足，通过在之间的rollback回滚事务）；如果一个操作成功一个操作失败则不具有事务性
	
	#具有4大特性
#1.原子性（automic）：所有语句（同一个事务中多重操作）必须是一个整体，不可不可分割

#2，一致性（consistent）：事务操作前与后数据总量是一样的
	 
#3.隔离性（isolation）：事务与事务之间互不干扰 		   	
	#(在mysql中事务有4中隔离级别：read uncommited（读取未提交）, read commited（读取提交）, repeatable red, serializable)
				#查看MySQL软件的事务隔离级别：select@@global.transaction_isolation;或者SELECT @@transaction_isolation;（8.0版本） (select@@tx_isolation;-->5.7版本）
					SELECT @@transaction_isolation;
#（以上查看隔离级别查看各事务之间的联系有多大，是否完全无关系）	
#修改mysql软件默认的隔离级别：set global transaction isolation level 隔离级别;			
SET GLOBAL TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	#--------------------------------------------------#
	 
#不同的隔离级别会引发不同的问题：#隔离级别越大，性能耗费越大；	
#当mysql事务的隔离级别为read uncommitted 时，会引发脏读：	
			#脏读：一个事务可以读取另一个未提交事务的数据
	#(如何解决脏读问题：可以将数据库事务的隔离级别改为：read committed)
	SET GLOBAL TRANSACTION ISOLATION LEVEL READ COMMITTED;
#当mysql软件的事务隔离级别为read committed的时候，会引发不可重复读；在同一事务中多次读取的结果会不一样
#如何解决不可重复读：将事物的隔离级别改为repeatable read
SET GLOBAL TRANSACTION ISOLATION LEVEL REPEATABLE READ;

#当nysql软件的事务隔离级别为read repeatable时，会引发虚读（幻读）
			#虚读与幻读
			#不可重复读
#4.持久性（durable）：数据一旦进入到库中、表中，就永久存在


				
  #用cmd查看数据库的命令：show databases--use dt--show tables--describe tb;
  
  
  #start transaction 开启事务
  #commit 提交事务：提交之后数据才会真正发生改变 在前面的操作都成功之后才能提交事务，并且提交之后再也无法进行回滚
  
  #rollback 回滚：只能在start transaction 和 commit之间进行回滚
  
 #可爱给万万转账40W
 UPDATE bank SET money=money-40 WHERE bankNO='134';
 UPDATE bank SET money=money+40 WHERE bankNO='120';
 
 
 #-----------------------------------存储过程---------------------------------------#
 
 #存储过程语法：
 DELIMITER// #分隔号
 CREATE PROCEDURE 存储过程名（参数名1 参数类型1，参数名2 参数类型2）
 BEGIN
	sql代码块
END//
DELIMITER ;

#书写一个加薪的存储过程
#存储过程是一组sql语句的集合
DELIMITER// #分隔号

CREATE PROCEDURE addsalary (money FLOAT, idd BIGINT)
BEGIN  #相当于{ 此括号
	UPDATE `emp` SET salary=salary+money WHERE id=idd;
END// #(双斜杠也可用$$ 中间是一个整体)，相当于}此括号

DELIMITER ;

#调用存储过程： call 存储过程名（）
 CALL `addsalary`(100,3)#括号里对应的是参数(salary，id)
 
 #删除存储过程
 DROP PROCEDURE 存储过程名;
 DROP PROCEDURE `addsalary`;
 
 #--------------------带返回值的存储过程--------------------------------------#
 #test1:传递两个float类型的形参，返回两个数的和
  DELIMITER //
 CREATE PROCEDURE test1( i FLOAT,  j FLOAT, num FLOAT)  #in 表示参数数据从代码块外面传送进来，OUT 表示参数数据从代码块里面传送出去
 BEGIN
		RETURN num=i+j;
 
 END //
 DELIMITER ;
 
 
 
 DELIMITER //
 CREATE PROCEDURE test1(IN i FLOAT, IN j FLOAT,OUT num FLOAT)  
 #in 表示参数数据从代码块外面传送进来，OUT 表示参数数据从代码块里面传送出去
 BEGIN
	 	SET num=i+j;
 
 END //
 DELIMITER ;# 这一句表示返回
 
 CALL `test1`(10,20,@result)
 SELECT @result
 
 
 #------------------------MYSQL数据库高级部分之存储过程-----------------#
 #存储过程的基本语法：
 DELIMITER//
 CREATE PROCEDURE 存储过程名（IN 输入参数名 参数类型; OUT 输出参数名 参数类型 ）
 BEGIN
 
		sql语句集;
 END //
 DELIMITER;
 
 #删除存储过程：drop procedure 【if exists】 存储过程名；
 DROP PROCEDURE 【if exists】 dt55_bank；
 DROP PROCEDURE IF EXISTS users; #如果没有加if exists会报错
 
 #调用存储过程
 CALL 存储过程名(参数1...参数n);
 
 #带if语句的存储过程
 #加薪的存储过程，传递两个参数；id、m（只能传递正数，不能传递负数）
SELECT '金额不能为负数' AS '友情提示'; 
 
DROP PROCEDURE IF EXISTS pro_addSalary;

DELIMITER //
CREATE PROCEDURE pro_addSalary(idd BIGINT, m FLOAT)
BEGIN
	IF m>1 THEN   #if 与then 之间加条件，如果条件为false则if endif 之间不会执行
		UPDATE users SET money=money+m WHERE id=idd; #代码块；
	END IF;
	
END//
DELIMITER ;

 
 #带if...else的存储过程
 
 
DELIMITER //
CREATE PROCEDURE pro_addSalary(idd BIGINT, m FLOAT)
BEGIN
	IF m>0 THEN   #if 与then 之间加条件，如果条件为false则if endif 之间不会执行
		UPDATE users SET money=moneey+m WHERE id=idd; #代码块；
	ELSE
	SELECT '金额不能为负数' AS '友情提示'; 
	END IF;
	
END//
DELIMITER ;

CALL `pro_addSalary`(1,-1200);


#带if...else if...else的存储过程

#存储过程名：pro_buycar（money，float ）如果money>500W则买保时捷；否则如果money>300W,则买宝马；否则,如果money>300W，买宝马。

 DELIMITER //
 CREATE PROCEDURE pro_buycar(money FLOAT)
 BEGIN
	IF money>500 THEN 
		SELECT '买保时捷' AS 'buywhat';
	ELSEIF  money>300 THEN
		SELECT '买宝马'AS'buywhat';
	ELSEIF money>10 THEN
		SELECT '买奥拓' AS 'buywhat';
	ELSE
		SELECT '买单车' AS 'buywhat';
	END IF
 END//
 DELIMITER;
 
 CALL `pro_buycar` (600);


#------------------case 选择分支结构---------------
#练习题：存储过程名：pro_case(i int),如果i=1则打印星期一，i=2则打印星期二

DELIMITER//
CREATE PROCEDURE pro_case(i INT)
BEGIN 
	CASE i
		WHEN 1 THEN 
			SELECT '星期一' AS '日期'；
		WHEN 2 THEN 
			SELECT '星期二' AS ' 日期';
		ELSE
			SELECT '我也不知道' AS '日期';
			END CASE;
END//
DELIMITER ;

CALL `pro_case` (3);

#case 练习：存储过程名：pro_case2(i int)
#如果i=1,则拨打爸爸的电话，如果i=2，则拨打妈妈的电话；否则，您打错了

 
#while 循环
#存储过程名pro_while(i int),如果 i=100，则计算1到100之间的所有数之和，返回最终结果
#同时往users表中插入100条数据

DELIMITER//
CREATE PROCEDURE pro_while(IN i INT, OUT total INT)
BEGIN
	DECLARE a INT DEFAULT 1;# 申明变量，边申明边赋值
	#DECLARE a INT set a=1 先申明再赋值
	WHILE a<=i DO
	INSERT INTO `users` SET username='test', money=100;
	SET a=a+1;
	END WHILE;
 
END//
DELIMITER ;
CALL pro_while(10);
SELECT COUNT(*) FROM users;
TRUNCATE TABLE users;

#@aaa 全局变量

#loop循环
CREATE PROCEDURE 存储过程名()
BEGIN
	LOOP 循环别名： LOOP 
		循环体

	LEAVE LOOP 循环别名
END LOOP


#——---------------#
#通过loop循环在users表中同时添加100条记录，当数据添加到21条时，终止循环。

DELIMITER//
CREATE PROCEDURE pro_loop(IN i INT)
BEGIN
	DECLARE 1i INT DEFAULT 0;
	loop_test1: LOOP
	INSERT INTO ·users· SET username='admin'
,money=200	
	SET i=i+1;
	IF i=100 THEN
	LEAVE loop_test1;
END IF;
	END LOOP
	 
END//
DELIMITER ;
CALL `pro_loop`();


#-------------找出1-100之间能够被3整除的所有数之和------#
DELIMITER//
CREATE PROCEDURE pro_sum()
BEGIN
	DECLARE i INT DEFAULT 1;
	DECLARE total INT DEFAULT 0;
	WHILE i<=100 DO
	IF i MOD 3=0 THEN
		SET total=total+i;
		END IF;
		SET i=i+1;#循环结束条件
	END WHILE;
	SELECT total;
END//
DELIMITER;


#书写一个存储过程，将·users·表中的所有money之和返回

DELIMITER//
CREATE PROCEDURE pro_sum(OUT total FLOAT)
BEGIN
SELECT SUM(money) INTO total FROM `users`; # into 插入形参表示直接返回形参
END//
DELIMITER ;
CALL pro_sum(@a);
SELECT @a;





`Number of Pet Households (in 1000)`,
`Percentage of Dog Owners`,
`Dog Owning Households (1000s)`,
`Mean Number of Dogs per household`,
`Dog Population (in 1000)`,
`Percentage of Cat Owners`,
`Cat Owning Households`,
`Mean Number of Cats`,
`Cat Population`,