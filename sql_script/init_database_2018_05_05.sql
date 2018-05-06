DROP TABLE IF EXISTS ws_user;
CREATE TABLE ws_user (
  pk_id int(11) NOT NULL AUTO_INCREMENT,
  open_id int,
  name varchar(100) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  vartar VARCHAR(100),
  deleted TINYINT(1) DEFAULT 0,
  create_time TIMESTAMP DEFAULT NOW(),
  create_by int(11),
  modify_time TIMESTAMP DEFAULT NOW(),
  modify_by int(11),
  PRIMARY KEY (pk_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ws_user_address;
CREATE TABLE ws_user_address (
  pk_id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) Not NULL,
  province VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  detail VARCHAR(200),
  deleted TINYINT(1) DEFAULT 0,
  create_time TIMESTAMP DEFAULT NOW(),
  modify_time TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY (pk_id),
  FOREIGN KEY (user_id) REFERENCES ws_user(pk_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ws_goods_category;
CREATE TABLE ws_goods_category (
  pk_id int(11) NOT NULL AUTO_INCREMENT,
  name_en varchar(100) NOT NULL,
  name_cn varchar(100) NOT NULL,
  deleted TINYINT(1) DEFAULT 0,
  create_time TIMESTAMP DEFAULT NOW(),
  create_by int(11),
  modify_time TIMESTAMP DEFAULT NOW(),
  modify_by int(11),
  PRIMARY KEY (pk_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ws_area;
CREATE TABLE ws_area (
  pk_id int(11) NOT NULL AUTO_INCREMENT,
  display_name varchar(100) NOT NULL,
  deleted TINYINT(1) DEFAULT 0,
  create_time TIMESTAMP DEFAULT NOW(),
  create_by int(11),
  modify_time TIMESTAMP DEFAULT NOW(),
  modify_by int(11),
  PRIMARY KEY (pk_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ws_clothing_category;
CREATE TABLE ws_clothing_category (
  pk_id int(11) NOT NULL AUTO_INCREMENT,
  goods_category_id int(11) NOT NULL,
  name_en varchar(100) NOT NULL,
  name_cn varchar(100) NOT NULL,
  deleted TINYINT(1) DEFAULT 0,
  create_time TIMESTAMP DEFAULT NOW(),
  create_by int(11),
  modify_time TIMESTAMP DEFAULT NOW(),
  modify_by int(11),
  PRIMARY KEY (pk_id),
  FOREIGN KEY (goods_category_id) REFERENCES ws_goods_category(pk_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ws_clothing;
CREATE TABLE ws_clothing (
  pk_id int(11) NOT NULL AUTO_INCREMENT,
  area_id int(11) NOT NULL,
  title varchar(200) NOT NULL,
  clothing_desc varchar(500) NOT NULL,
  deleted TINYINT(1) DEFAULT 0,
  create_time TIMESTAMP DEFAULT NOW(),
  create_by int(11),
  modify_time TIMESTAMP DEFAULT NOW(),
  modify_by int(11),
  PRIMARY KEY (pk_id),
  FOREIGN KEY (area_id) REFERENCES ws_area(pk_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ws_clothing_and_category;
CREATE TABLE ws_clothing_and_category (
  clothing_id int(11) NOT NULL,
  clothing_category_id int(11) NOT NULL,
  deleted TINYINT(1) DEFAULT 0,
  create_time TIMESTAMP DEFAULT NOW(),
  create_by int(11),
  modify_time TIMESTAMP DEFAULT NOW(),
  modify_by int(11),
  PRIMARY KEY (clothing_id, clothing_category_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ws_clothing_size;
CREATE TABLE ws_clothing_size (
  pk_id int(11) NOT NULL AUTO_INCREMENT,
  clothing_id int(11) NOT NULL,
  size VARCHAR(11) NOT NULL,
  number int(11) NOT NULL,
  deleted TINYINT(1) DEFAULT 0,
  create_time TIMESTAMP DEFAULT NOW(),
  create_by int(11),
  modify_time TIMESTAMP DEFAULT NOW(),
  modify_by int(11),
  PRIMARY KEY (pk_id),
  FOREIGN KEY (clothing_id) REFERENCES ws_clothing(pk_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ws_clothing_Image;
CREATE TABLE ws_clothing_Image (
  pk_id int(11) NOT NULL AUTO_INCREMENT,
  clothing_id int(11) NOT NULL,
  image VARCHAR(50) NOT NULL,
  desction VARCHAR(500) NOT NULL,
  deleted TINYINT(1) DEFAULT 0,
  create_time TIMESTAMP DEFAULT NOW(),
  create_by int(11),
  modify_time TIMESTAMP DEFAULT NOW(),
  modify_by int(11),
  PRIMARY KEY (pk_id),
  FOREIGN KEY (clothing_id) REFERENCES ws_clothing(pk_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ws_clothing_comment;
CREATE TABLE ws_clothing_comment (
  pk_id int(11) NOT NULL AUTO_INCREMENT,
  clothing_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  clothind_comment VARCHAR(500) NOT NULL,
  deleted TINYINT(1) DEFAULT 0,
  create_time TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY (pk_id),
  FOREIGN KEY (clothing_id) REFERENCES ws_clothing(pk_id),
  FOREIGN KEY (user_id) REFERENCES ws_user(pk_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ws_clothing_comment_image;
CREATE TABLE ws_clothing_comment_image (
  pk_id int(11) NOT NULL AUTO_INCREMENT,
  clothing_comment_id int(11) NOT NULL,
  image VARCHAR(50) NOT NULL,
  desction VARCHAR(500),
  deleted TINYINT(1) DEFAULT 0,
  create_time TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY (pk_id),
  FOREIGN KEY (clothing_comment_id) REFERENCES ws_clothing_comment(pk_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ws_goods_shopcar;
CREATE TABLE ws_goods_shopcar (
  pk_id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  goods_id int(11) NOT NULL,
  detail_info VARCHAR(50),
  number int(11),
  status VARCHAR(10),
  create_time TIMESTAMP DEFAULT NOW(),
  modify_time TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY (pk_id),
  FOREIGN KEY (user_id) REFERENCES ws_user(pk_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ws_order;
CREATE TABLE ws_order (
  pk_id int(11) NOT NULL AUTO_INCREMENT,
  order_number VARCHAR(20) NOT NULL,
  user_id int(11) NOT NULL,
  address_id int(11) NOT NULL,
  pay_price FLOAT,
  is_pay TINYINT(1) DEFAULT 0,
  pay_time TIMESTAMP DEFAULT NOW(),
  is_ship TINYINT(1) DEFAULT 0,
  ship_time TIMESTAMP DEFAULT NOW(),
  is_receipt TINYINT(1) DEFAULT 0,
  receipt_time TIMESTAMP DEFAULT NOW(),
  status VARCHAR(10),
  PRIMARY KEY (pk_id),
  FOREIGN KEY (user_id) REFERENCES ws_user(pk_id),
  FOREIGN KEY (address_id) REFERENCES ws_user_address(pk_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ws_order_goods;
CREATE TABLE ws_order_goods (
  pk_id int(11) NOT NULL AUTO_INCREMENT,
  order_id int(11) NOT NULL,
  goods_id int(11) NOT NULL,
  goods_number int(11) NOT NULL,
  good_price_price FLOAT,
  detail_info VARCHAR(20),
  status VARCHAR(10),
  PRIMARY KEY (pk_id),
  FOREIGN KEY (order_id) REFERENCES ws_order(pk_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;