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
    PRIMARY KEY (`USER_AutoID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

LOCK TABLES user WRITE;
INSERT INTO user
VALUES (null, 'admin', '123456', '2018-06-19 11:57:33', '2018-06-19 11:57:33', '0', '0',
        '217be8ba-1eec-44ac-a337-ae42e7e54f90'),
       (null, 'user', '123456', '2018-06-19 11:57:33', '2018-06-19 11:57:33', '0', '0',
        '970231ce-7a66-413f-8c6c-6c8e0d4bd96b');
UNLOCK TABLES;

DROP TABLE IF EXISTS role;
CREATE TABLE role
(
    `ROLE_AutoID`      int NOT NULL AUTO_INCREMENT,
    `ROLE_NAME`        varchar(25) DEFAULT NULL,
    `ROLE_UUID`        varchar(40) DEFAULT NULL,
    `ROLE_DEL`         tinyint(1)  DEFAULT '0' COMMENT '删除标志（0代表不删除，1代表删除）',
    `ROLE_CREATE_TIME` datetime    DEFAULT NULL,
    PRIMARY KEY (`ROLE_AutoID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

LOCK TABLES role WRITE;
INSERT INTO role
VALUES (null, '超级管理员', 'admin-001', '0', '2018-06-22 15:39:45'),
       (null, '站长', 'zhanzhang-002', '0', '2018-06-22 16:39:45');
UNLOCK TABLES;

DROP TABLE IF EXISTS user_role;
CREATE TABLE user_role
(
    `UR_AutoID`      int NOT NULL AUTO_INCREMENT,
    `USER_UUID`      varchar(40) DEFAULT NULL,
    `ROLE_UUID`      varchar(40) DEFAULT NULL,
    `UR_UUID`        varchar(40) DEFAULT NULL,
    `UR_CREATE_TIME` datetime    DEFAULT NULL,
    `UR_DEL`         tinyint     DEFAULT '0',
    PRIMARY KEY (`UR_AutoID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

LOCK TABLES user_role WRITE;
INSERT INTO user_role
VALUES (null, '217be8ba-1eec-44ac-a337-ae42e7e54f90', 'admin-001', 'ur-001', '2018-06-22 15:39:45', '0'),
       (null, '970231ce-7a66-413f-8c6c-6c8e0d4bd96b', 'zhanzhang-002', 'ur-002', '2018-06-22 15:39:45', '0');
UNLOCK TABLES;

DROP TABLE IF EXISTS permission;
CREATE TABLE permission
(
    `PERMISSION_AutoID`      int NOT NULL AUTO_INCREMENT,
    `PERMISSION_NAME`        varchar(255) DEFAULT NULL,
    `PERMISSION_URL`         varchar(255) DEFAULT NULL,
    `PERMISSION_CREATE_TIME` datetime     DEFAULT NULL,
    `PERMISSION_UUID`        varchar(40)  DEFAULT NULL,
    `PERMISSION_TYPE`        tinyint      DEFAULT NULL COMMENT '分为三类：1 系统，2 导航，3 菜单(打开某个功能)',
    `PERMISSION_PARENT_UUID` varchar(40)  DEFAULT NULL COMMENT '父级权限uuid',
    `PERMISSION_DEL`         tinyint      DEFAULT '0',
    PRIMARY KEY (`PERMISSION_AutoID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

LOCK TABLES permission WRITE;
INSERT INTO permission
VALUES (null, '系统管理', null, '2019-03-04 10:41:11', 'pms-1-001', '2', null, '0'),
       (null, '数据管理', null, '2019-03-04 10:41:11', 'pms-1-002', '2', null, '0'),
       (null, '运营分析', null, '2019-03-04 10:41:11', 'pms-1-003', '2', null, '0'),
       (null, '安全预警', null, '2019-03-04 10:41:11', 'pms-1-004', '2', null, '0'),
       (null, '权限管理', null, '2019-03-04 10:41:11', 'pms-2-001', '2', 'pms-1-001', '0'),
       (null, '设备管理', null, '2019-03-04 10:41:11', 'pms-2-002', '2', 'pms-1-001', '0'),
       (null, '日志管理', null, '2019-03-04 10:41:11', 'pms-2-003', '3', 'pms-1-001', '0'),
       (null, '接口管理', null, '2019-03-04 10:41:11', 'pms-2-004', '3', 'pms-1-001', '0'),
       (null, '站点管理', null, '2019-03-04 10:41:11', 'pms-2-005', '3', 'pms-1-001', '0'),
       (null, '客户管理', null, '2019-03-04 10:41:11', 'pms-2-006', '3', 'pms-1-001', '0'),
       (null, '用户基本信息', 'user/index', '2019-03-04 10:41:11', 'pms-3-001', '3', 'pms-2-001', '0'),
       (null, '权限分类设置', 'permission/index', '2019-03-04 10:41:11', 'pms-3-002', '3', 'pms-2-001', '0'),
       (null, '摄像头注册', 'user/index', '2019-03-04 10:41:11', 'pms-3-003', '3', 'pms-2-002', '0'),
       (null, '油机注册', 'user/index', '2019-03-04 10:41:11', 'pms-3-004', '3', 'pms-2-002', '0'),
       (null, '摄像头数据', null, '2019-03-04 10:41:11', 'pms-2-007', '2', 'pms-1-002', '0'),
       (null, '油机数据', 'user/index', '2019-03-04 10:41:11', 'pms-2-008', '3', 'pms-1-002', '0'),
       (null, '画像数据', null, '2019-03-04 10:41:11', 'pms-2-009', '3', 'pms-1-002', '0'),
       (null, '导入导出', null, '2019-03-04 10:41:11', 'pms-2-010', '2', 'pms-1-002', '0'),
       (null, '干道车流数据', null, '2019-03-04 10:41:11', 'pms-3-009', '3', 'pms-2-007', '0'),
       (null, '进口车牌数据', null, '2019-03-04 10:41:11', 'pms-3-010', '3', 'pms-2-007', '0'),
       (null, '出口车牌数据', null, '2019-03-04 10:41:11', 'pms-3-011', '3', 'pms-2-007', '0'),
       (null, '车道车牌数据（1-6）', null, '2019-03-04 10:41:11', 'pms-3-012', '3', 'pms-2-007', '0'),
       (null, '便利店人流数据', null, '2019-03-04 10:41:11', 'pms-3-013', '3', 'pms-2-007', '0'),
       (null, '便利店人脸数据', null, '2019-03-04 10:41:11', 'pms-3-014', '3', 'pms-2-007', '0'),
       (null, '卸油区视频数据（1-2）', null, '2019-03-04 10:41:11', 'pms-3-015', '3', 'pms-2-007', '0'),
       (null, '数据导入', null, '2019-03-04 10:41:11', 'pms-3-018', '3', 'pms-2-010', '0'),
       (null, '数据导出', null, '2019-03-04 10:41:11', 'pms-3-019', '3', 'pms-2-010', '0');
    UNLOCK TABLES;

DROP TABLE IF EXISTS role_permission;
CREATE TABLE role_permission
(
    `RP_AutoID`       int NOT NULL AUTO_INCREMENT,
    `ROLE_UUID`       varchar(40) DEFAULT NULL,
    `PERMISSION_UUID` varchar(40) DEFAULT NULL,
    `RP_CREATE_TIME`  datetime    DEFAULT NULL,
    `RP_DEL`          tinyint     DEFAULT '0',
    `RP_UUID`         varchar(40) DEFAULT NULL,
    PRIMARY KEY (`RP_AutoID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

LOCK TABLES role_permission WRITE;
INSERT INTO role_permission
VALUES (null, 'admin-001', 'pms-1-001', '2018-06-22 15:39:45', '0', 'rp-001'),
       (null, 'admin-001', 'pms-1-002', '2018-06-22 15:39:45', '0', 'rp-002'),
       (null, 'admin-001', 'pms-1-003', '2018-06-22 15:39:45', '0', 'rp-003'),
       (null, 'admin-001', 'pms-1-004', '2018-06-22 15:39:45', '0', 'rp-004'),
       (null, 'admin-001', 'pms-2-001', '2018-06-22 15:39:45', '0', 'rp-005'),
       (null, 'admin-001', 'pms-2-002', '2018-06-22 15:39:45', '0', 'rp-006'),
       (null, 'admin-001', 'pms-2-003', '2018-06-22 15:39:45', '0', 'rp-007'),
       (null, 'admin-001', 'pms-2-004', '2018-06-22 15:39:45', '0', 'rp-008'),
       (null, 'admin-001', 'pms-2-005', '2018-06-22 15:39:45', '0', 'rp-009'),
       (null, 'admin-001', 'pms-2-006', '2018-06-22 15:39:45', '0', 'rp-010'),
       (null, 'admin-001', 'pms-2-007', '2018-06-22 15:39:45', '0', 'rp-011'),
       (null, 'admin-001', 'pms-2-008', '2018-06-22 15:39:45', '0', 'rp-012'),
       (null, 'admin-001', 'pms-2-009', '2018-06-22 15:39:45', '0', 'rp-013'),
       (null, 'admin-001', 'pms-2-010', '2018-06-22 15:39:45', '0', 'rp-014'),
       (null, 'admin-001', 'pms-3-001', '2018-06-22 15:39:45', '0', 'rp-015'),
       (null, 'admin-001', 'pms-3-002', '2018-06-22 15:39:45', '0', 'rp-016'),
       (null, 'admin-001', 'pms-3-003', '2018-06-22 15:39:45', '0', 'rp-017'),
       (null, 'admin-001', 'pms-3-004', '2018-06-22 15:39:45', '0', 'rp-018'),
       (null, 'admin-001', 'pms-3-005', '2018-06-22 15:39:45', '0', 'rp-019'),
       (null, 'admin-001', 'pms-3-006', '2018-06-22 15:39:45', '0', 'rp-020'),
       (null, 'admin-001', 'pms-3-007', '2018-06-22 15:39:45', '0', 'rp-021'),
       (null, 'admin-001', 'pms-3-008', '2018-06-22 15:39:45', '0', 'rp-022');
UNLOCK TABLES;



