DROP TABLE IF EXISTS user;
CREATE TABLE user
(
    `USER_AutoID`       int NOT NULL AUTO_INCREMENT,
    `USERNAME`          varchar(16) DEFAULT NULL,
    `PASSWORD`          varchar(16) DEFAULT NULL,
    `USER_CREATE_TIME`  datetime    DEFAULT NULL,
    `USER_REFRESH_TIME` datetime    DEFAULT NULL COMMENT '同步时间',
    `USER_REFRESH_MARK` tinyint     DEFAULT '0' COMMENT '同步标志（0未同步，1已同步）',
    `USER_DEL`          tinyint     DEFAULT '0' COMMENT '删除标志（0代表不删除，1代表删除）',
    `USER_UUID`         varchar(40) DEFAULT NULL,
    `ROLE_ID`           int         DEFAULT NULL,
    PRIMARY KEY (`USER_AutoID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

LOCK TABLES user WRITE;
INSERT INTO user
VALUES (1, 'admin', '123456', '2018-06-19 11:57:33', '2018-06-19 11:57:33', '0', '0',
        '217be8ba-1eec-44ac-a337-ae42e7e54f90', '1'),
       (2, 'noadmin', '123456', '2018-06-19 11:57:33', '2018-06-19 11:57:33', '0', '0',
        '970231ce-7a66-413f-8c6c-6c8e0d4bd96b', '2');
UNLOCK TABLES;

DROP TABLE IF EXISTS role;
CREATE TABLE role
(
    `ROLE_AutoID`      int NOT NULL AUTO_INCREMENT,
    `ROLE_DESCRIPTION` varchar(255) DEFAULT NULL,
    `ROLE_NAME`        varchar(25) DEFAULT NULL,
    PRIMARY KEY (`ROLE_AutoID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

LOCK TABLES role WRITE;
INSERT INTO role
VALUES (1, 'ADMIN ROLE', '超级管理员'),
       (2, 'NOT ADMIN ROLE', '管理员');
UNLOCK TABLES;

DROP TABLE IF EXISTS user_role;
CREATE TABLE user_role
(
    `USER_AutoID` int NOT NULL,
    `ROLE_AutoID` int NOT NULL,
    PRIMARY KEY (`USER_AutoID`, `ROLE_AutoID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

LOCK TABLES user_role WRITE;
INSERT INTO user_role
VALUES (1, 1),
       (2, 2);
UNLOCK TABLES;

DROP TABLE IF EXISTS permission;
CREATE TABLE permission
(
    `PERMISSION_AutoID`      int NOT NULL AUTO_INCREMENT,
    `PERMISSION_NAME`        varchar(255) DEFAULT NULL,
    `PERMISSION_DESCRIPTION` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`PERMISSION_AutoID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

LOCK TABLES permission WRITE;
INSERT INTO permission
VALUES (1, "user:add", "用户添加"),
       (2, "user:change", "用户管理"),
       (3, "user:delete", "用户删除");
UNLOCK TABLES;

DROP TABLE IF EXISTS role_permission;
CREATE TABLE role_permission
(
    `ROLE_AutoID`       int NOT NULL,
    `PERMISSION_AutoID` int NOT NULL,
    PRIMARY KEY (`PERMISSION_AutoID`, `ROLE_AutoID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

LOCK TABLES role_permission WRITE;
INSERT INTO role_permission
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (2, 2);
UNLOCK TABLES;



