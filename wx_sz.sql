--创建数据库
CREATE DATABASE wx_sz DEFAULT CHARACTER SET UTF8;

--切换数据库
USE wx_sz;

-- 数据库表
-- 用户表 user
-- 角色表 role
-- 分类表 category
-- 收藏表 collection
-- 项目表 item

CREATE TABLE user(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
	name VARCHAR(255) NOT NULL DEFAULT 'admin' COMMENT '用户名',
	password VARCHAR(255) NOT NULL DEFAULT 'admin' COMMENT '密码',
	gender INT DEFAULT 1 COMMENT '性别 1:男/2:女 / 0:其他',
	openid VARCHAR(255) NOT NULL UNIQUE COMMENT '用户唯一openid',
	role_id INT NOT NULL COMMENT '关联角色表的主键'
)ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=UTF8 COMMENT='用户表';

CREATE TABLE role(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
	name VARCHAR(255) NOT NULL COMMENT '角色名'
)ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=UTF8 COMMENT='角色表';

INSERT INTO role(name) VALUES("public"),("admin");

--添加约束
ALTER TABLE user ADD FOREIGN KEY(role_id) REFERENCES role(id);

--分类表
CREATE TABLE category(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
	name VARCHAR(100) NOT NULL COMMENT '类目名称'
)ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=UTF8 COMMENT='类目表';

INSERT INTO category(name) VALUES("寻人启示"),("寻物启示"),("寻宠启示"),("失物招领");

--项目表
CREATE TABLE item(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
	user_id INT NOT NULL COMMENT '发布用户，关联用户表主键',
	category_id INT NOT NULL COMMENT '项目分类，关联分类表主键',
	title VARCHAR(100) NOT NULL COMMENT '信息主题',
	time VARCHAR(50) NOT NULL COMMENT '发布时间',
	style VARCHAR(255) NOT NULL COMMENT '物品类型 衣服,美女,手机,电脑等',
	areas VARCHAR(50) NOT NULL COMMENT '地区 黑龙江省-哈尔滨市',
	address VARCHAR(255) NOT NULL COMMENT '详细地址 学府路550号，理工大学对面',
	detail_desc VARCHAR(255) NOT NULL DEFAULT '详情' COMMENT '详细介绍',
	img1 VARCHAR(255) COMMENT '图片1',
	img2 VARCHAR(255) COMMENT '图片2',
	img3 VARCHAR(255) COMMENT '图片3'
)ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=UTF8 COMMENT='项目表';

ALTER TABLE item ADD FOREIGN KEY(user_id) REFERENCES user(id);
ALTER TABLE item ADD FOREIGN KEY(category_id) REFERENCES category(id);

--收藏表
CREATE TABLE collection(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
	user_id INT NOT NULL COMMENT '用户ID,关联用户表的主键',
	item_id INT NOT NULL COMMENT '项目主键关联项目表的主键'
)ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=UTF8 COMMENT='收藏表';

ALTER TABLE collection ADD FOREIGN KEY(user_id) REFERENCES user(id);
ALTER TABLE collection ADD FOREIGN KEY(item_id) REFERENCES item(id);






