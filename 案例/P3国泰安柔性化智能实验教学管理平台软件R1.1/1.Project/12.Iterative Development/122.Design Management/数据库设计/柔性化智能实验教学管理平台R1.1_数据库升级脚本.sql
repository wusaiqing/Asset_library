---- （20171105）修改的表结构内容按时间分割 
---- 注明 修改删除新增字段 或添加新表------

---- 公告用户表添加id描述字段------
ALTER TABLE `yyyf_server_notice_user`
ADD COLUMN `id_remark`  text NULL COMMENT 'id 备注' AFTER `id_remark`;

---- 班级用户域设置为可空------
ALTER TABLE `yyyf_server_teach_user_bak`
MODIFY COLUMN `domain_key`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '域' AFTER `del_flag`;

---- 真题功能域设置为可空------
ALTER TABLE `yyyf_server_paper`
MODIFY COLUMN `domain_key`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '域' AFTER `id`;

ALTER TABLE `yyyf_server_paper_exam`
MODIFY COLUMN `domain_key`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '域' AFTER `id`;

---- 考核相关功能域设置为可空------
ALTER TABLE `yyyf_server_assess`
MODIFY COLUMN `domain_key`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '域' AFTER `id`;

---- 应用项目添加序号字段------
ALTER TABLE `yyyf_server_course_project`
ADD COLUMN `sequence`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '序号' AFTER `domain_key`;

---- 课程应用教师用户收藏添加备注名称字段------
ALTER TABLE `yyyf_server_course_collect`
ADD COLUMN `course_remark_name`  varchar(255) DEFAULT NULL COMMENT '应用备注名称' AFTER `course_id`;

-- ----------------------------
-- 新增表Table structure for yyyf_server_teacher_major
-- ----------------------------
DROP TABLE IF EXISTS `yyyf_server_teacher_major`;
CREATE TABLE `yyyf_server_teacher_major` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL COMMENT '[教师]用户id',
  `major_id` bigint(2) NOT NULL COMMENT '专业id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yyyf_server_course_forum 大面积更新
-- ----------------------------
DROP TABLE IF EXISTS `yyyf_server_course_forum`;
CREATE TABLE `yyyf_server_course_forum` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `school_id` int(2) NOT NULL COMMENT '学校id',
  `course_id` varchar(50) NOT NULL COMMENT '课程ID',
  `forum` text NOT NULL COMMENT '留言内容',
  `sequence` int(10) DEFAULT NULL COMMENT '楼层序号',
  `del_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0未删除1删除',
  `par_id` int(20) NOT NULL DEFAULT '0' COMMENT '父级id',
  `thumbs_up` int(2) DEFAULT '0' COMMENT '点赞数',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `status` int(2) DEFAULT '0' COMMENT '状态：0 正常',
  `creator` varchar(50) NOT NULL COMMENT '发布者',
  `created_date` datetime NOT NULL COMMENT '发布日期',
  `updater` varchar(50) DEFAULT NULL COMMENT '更新[删除]人',
  `last_modify_date` datetime DEFAULT NULL COMMENT '更新[删除]日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='课程交流讨论';

-- ----------------------------
-- Table yyyf_server_course_manage 添加discount_price字段
-- ----------------------------
ALTER TABLE `yyyf_server_course_manage`
MODIFY COLUMN `course_price`  decimal(50,2) NULL DEFAULT 0 COMMENT '课程定价' AFTER `configure`,
MODIFY COLUMN `mark`  tinyint(2) NULL DEFAULT 0 COMMENT '特殊标识 0：普通 1演示未上市' AFTER `remarks`,
ADD COLUMN `discount_price`  decimal(50,2) NULL DEFAULT 0 COMMENT '折扣价格' AFTER `course_price`;


---- 用户表添加登录次数字段------
ALTER TABLE `yyyf_server_user_info`
ADD COLUMN `login_account` int(11) DEFAULT NULL COMMENT '登录次数' AFTER `remote_head_img`;

---- 添加索引------
ALTER  TABLE  `yyyf_data_area`  ADD  UNIQUE (`id` );
ALTER  TABLE  `yyyf_data_school_lib`  ADD  UNIQUE (`id` );
ALTER  TABLE  `yyyf_data_school_lib`  ADD  INDEX  ap_id(`ap_id` );
ALTER  TABLE  `yyyf_data_school_lib`  ADD  INDEX  ac_id(`ac_id` );
ALTER  TABLE  `yyyf_server_attendance`  ADD  UNIQUE (`id` );
ALTER  TABLE  `yyyf_server_school_org`  ADD  UNIQUE (`id` );
ALTER  TABLE  `yyyf_server_user_info`  ADD  UNIQUE (`id` );
ALTER  TABLE  `yyyf_server_user_info`  ADD  UNIQUE (`a_id` );
ALTER  TABLE  `yyyf_server_user_log`  ADD  INDEX  user_id(`user_id` );

---- 后台新增 应用后台权限 ------
INSERT INTO `yyyf_server_power_res` (`id`,`ra_name`, `ra_url`, `open_mode`, `describe`, `ra_ico`, `pid`, `seq`, `ra_status`, `opened`, `ra_type`, `domain_key`, `del_flag`, `creator`, `created_date`, `updater`, `last_modify_date`) VALUES (84,'应用后台', 'back/store/backstageapp', '', '', '', '41', '6', '0', '0', '0', '', '0', '', '2017-11-02 16:53:32', '', '2017-11-02 16:53:32');

---- 实训系统案例集合表添加序号字段 ------
ALTER TABLE `yyyf_server_train_cases`
ADD COLUMN `serial_number`  int(10) NULL COMMENT '序列号，便于排序' AFTER `score`;

---- 子系统表添加授权秘钥字段 ------
ALTER TABLE `yyyf_server_train`
ADD COLUMN `auz_key`  varchar(255) NULL COMMENT '授权秘钥' AFTER `interface_url`;

---- 考试结果明细表加排序字段 ------
ALTER TABLE `yyyf_server_assess_user_task`
ADD COLUMN `serial_number`  int(10) NULL COMMENT '排序字段' AFTER `end_time`;

---- 发布考核表添加字段 ------
ALTER TABLE `yyyf_server_assess_issue`
ADD COLUMN `assess_min`  int(10) NULL COMMENT '考核分钟数' AFTER `end_date`,
ADD COLUMN `model`  tinyint(2) NULL DEFAULT 1 COMMENT '模式（1定时发布 2实时发布）' AFTER `assess_min`,
MODIFY COLUMN `assess_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '理财规划是考核主表id，银行是案例集合中的id' AFTER `id`,
ADD COLUMN `course_id`  varchar(50) NULL COMMENT '课程id' AFTER `model`;


---- 银行配置sql ----
INSERT INTO `yyyf_server_train` VALUES ('102', '2', '商业银行立体教学平台（柜面业务）', '商业银行立体教学平台（柜面业务）', NULL, NULL, NULL, '10.10.21.52:8090/BankTrain', '87DIVy348Oxzj3ha', 0, 0, NULL, 'asdfasd', '2017-10-4 10:59:52', 'asdfasd', '2017-10-23 11:00:03');
INSERT INTO `yyyf_server_train` VALUES ('103', '2', '商业银行立体教学平台（国际业务）', '商业银行立体教学平台（国际业务）', '', '', NULL, '10.10.21.52:8092/BankIS', '87DIVy348Oxzj3ha', 0, 0, '', 'asdfasd', '2017-10-4 10:59:52', 'asdfasd', '2017-10-23 11:00:03');
INSERT INTO `yyyf_server_train` VALUES ('104', '2', '商业银行立体教学平台（信贷业务）', '商业银行立体教学平台（信贷业务）', '', '', NULL, '10.10.21.52:8091/XD', '87DIVy348Oxzj3ha', 0, 0, '', 'asdfasd', '2017-10-4 10:59:52', 'asdfasd', '2017-10-23 11:00:03');
INSERT INTO `yyyf_server_train` VALUES ('105', '2', '商业银行立体教学平台（支付结算）', '商业银行立体教学平台（支付结算）', '', '', NULL, '10.10.21.52:8093/bankps', '87DIVy348Oxzj3ha', 0, 0, '', 'asdfasd', '2017-10-4 10:59:52', 'asdfasd', '2017-10-23 11:00:03');


ALTER TABLE `yyyf_server_notice`
MODIFY COLUMN `state`  tinyint(2) NULL COMMENT '要删字段' AFTER `remark`;



--------R1迭代2数据库脚本变化记录如下-----------------
-------------yyyf_server_train_cases_bak 添加serial_number 排序号 2018/4/4------------
ALTER TABLE `yyyf_server_train_cases_bak`
ADD COLUMN `serial_number`  INT(10) NULL COMMENT '排序字段' AFTER `score`;

-------------添加学校管理模块功能及权限-2018-04-13------------------------
INSERT INTO `yyyf_server_power_res` (`ra_name`, `ra_url`, `open_mode`, `describe`, `ra_ico`, `pid`, `seq`, `ra_status`, `opened`, `ra_type`, `domain_key`, `del_flag`, `creator`, `created_date`, `updater`, `last_modify_date`) 
VALUES ('学校管理', 'back/gtadmin/school', '', '', '', '48', '3', '0', '0', '0', '', '0', '', '2018-04-04 16:55:11', '', '2018-04-04 16:55:11');

--------------修改案例信息基础表 type字段描述2018-04-19------------------------
ALTER TABLE `yyyf_server_train_cases` MODIFY COLUMN `type`  int(10) NOT NULL COMMENT '类型（0内置考核相关，1用户添加考核相关，2内置练习相关，3用户自定义练习相关）' AFTER `serial_number`;   



-- ----------------------------
-- 2018年6月15日学生端登录优化开始
-- 1 增加yyyf_server_user_action表
-- 2 增加yyyf_server_user_score表
-- 3 增加Insert_into_yyyf_server_user_score存储过程
-- 4 增加 P_STU_NEW_ACTION存储过程
-- ----------------------------


-- ----------------------------
-- 增加yyyf_server_user_action表
-- ----------------------------
DROP TABLE IF EXISTS `yyyf_server_user_action`;
CREATE TABLE `yyyf_server_user_action` (
  `id` varchar(255) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `local_head_img` varchar(255) DEFAULT NULL,
  `remote_head_img` varchar(255) DEFAULT NULL,
  `school_id` varchar(255) DEFAULT NULL,
  `action_code` varchar(255) DEFAULT NULL,
  `action_name` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `action_time` datetime DEFAULT NULL,
  `action_timestamp` bigint(20) DEFAULT NULL COMMENT '行为发生时间长整型',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL COMMENT '删除标识0未删除1已删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- 增加yyyf_server_user_score表
-- ----------------------------
DROP TABLE IF EXISTS `yyyf_server_user_score`;
CREATE TABLE `yyyf_server_user_score` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `seq` int(11) DEFAULT NULL COMMENT '本表序列（自增）',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户姓名',
  `local_head_img` varchar(255) DEFAULT NULL COMMENT '本地头像地址',
  `remote_head_img` varchar(255) DEFAULT NULL COMMENT '远程头像地址',
  `train_num` int(11) DEFAULT NULL COMMENT '实训次数',
  `train_score` int(11) DEFAULT NULL COMMENT '实训次数积分',
  `online_min` int(11) DEFAULT NULL COMMENT '在线时长(分钟)',
  `online_score` int(11) DEFAULT NULL COMMENT '在线时长积分',
  `total_score` int(11) DEFAULT NULL COMMENT '总积分',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` int(11) DEFAULT NULL COMMENT '删除标识0未删除1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户积分表';

-- ----------------------------
-- 增加 P_STU_NEW_ACTION存储过程
-- ----------------------------
BEGIN
##柜面的考核
Insert into yyyf_server_user_action(id,user_id,user_name,local_head_img,remote_head_img,
			school_id,
			action_code,
			action_name,
			description,
			action_time,
			action_timestamp,
			create_time,
			update_time,
			del_flag) 
			select  replace(r.id,'-','') id,
							r.user_id,
							r.user_name,
							r.local_head_img,
							r.remote_head_img,
							null school_id,
							'n_a' action_code,
							'学生端最新动态' action_name,
							concat(user_name, '在',COURSE_NAME,assessName,typeName,'中获得100分') description,
							r.action_time,
							UNIX_TIMESTAMP(action_time) action_timestamp,
							NOW() create_time, 
							NOW() update_time,
							0 del_flag 
			from (
							SELECT
										UUID() id,
										ui.id AS user_id,
										ui.user_name  ,
										ui.local_head_img  ,
										ui.remote_head_img  ,
										CMA.COURSE_NAME  ,
										TCA. NAME AS assessName,
										au.end_time AS dynamicDate,
										au.achieve_ment_type AS type,
										case   
											when au.achieve_ment_type=0 then '练习'  
											when au.achieve_ment_type=1 then '考试'  
										end as typeName,  
										scc.course_remark_name AS coueseRemarkName,
										au.end_time action_time
									FROM
										yyyf_server_assess_user au
									RIGHT JOIN yyyf_server_user_info ui ON ui.a_id = au.user_id
									RIGHT JOIN yyyf_server_train_cases TCA ON TCA.id = au.issue_id
									RIGHT JOIN yyyf_server_course_manage cma ON cma.id = au.course_id
									LEFT JOIN yyyf_server_course_collect scc ON scc.course_id = cma.id 
									WHERE
										au.achieve_ment_type = 0
									AND au.total_score = 100
									AND au.end_time>actionTime 
									GROUP BY
										au.id
									ORDER BY
										dynamicDate DESC
			) r;

##其他的考核
				Insert into yyyf_server_user_action(id,user_id,user_name,local_head_img,remote_head_img,
				school_id,
				action_code,
				action_name,
				description,
				action_time,
				action_timestamp,
				create_time,
				update_time,
				del_flag) 
				select  replace(r1.id,'-','') id,
											r1.user_id,
											r1.user_name,
											r1.local_head_img,
											r1.remote_head_img,
											null school_id,
											'n_a' action_code,
											'学生端最新动态' action_name,
											concat(user_name, '在',courseName,assessName,typeName,'中获得100分') description,
											r1.action_time,
											UNIX_TIMESTAMP(action_time) action_timestamp,
											NOW() create_time, 
											NOW() update_time,
											0 del_flag 
							from (
									SELECT 
									 UUID() id,
									 ui.id AS  user_id,
									 ui.user_name  ,
									 ui.local_head_img  ,
									 ui.remote_head_img  ,
									 cm.course_name AS courseName,
									 a.assess_name AS assessName,
									 au.end_time AS dynamicDate,
									 au.achieve_ment_type AS type,
									 case   
										when au.achieve_ment_type=0 then '练习'  
										when au.achieve_ment_type=1 then '考试'  
										end as typeName,
									 scc.course_remark_name AS coueseRemarkName,
									 au.end_time action_time
									FROM
										yyyf_server_assess_user au
									RIGHT JOIN yyyf_server_user_info ui ON ui.a_id = au.user_id
									RIGHT JOIN yyyf_server_assess_issue ai ON ai.id = au.issue_id
									RIGHT JOIN yyyf_server_assess a ON a.id = ai.assess_id
									RIGHT JOIN yyyf_server_course_manage cm ON cm.id = a.course_id
									LEFT JOIN yyyf_server_course_collect scc
										ON   scc.course_id = cm.id 
									WHERE
										au.total_score = 100
									AND au.end_time>actionTime 
									AND a.train_id IN   ('0','102','103','104','105')
									GROUP BY
										au.id
							) r1;

    END
    
    
-- ----------------------------
-- 增加Insert_into_yyyf_server_user_score存储过程
-- ----------------------------  
BEGIN
      TRUNCATE TABLE yyyf_server_user_score;
			Insert into yyyf_server_user_score(id,user_id,user_name,local_head_img,remote_head_img,train_num,train_score,online_min,online_score,total_score,create_time,update_time,del_flag) 
			select  replace(r.id,'-','') id,
							r.user_id,
							r.user_name,
							r.local_head_img,
							r.remote_head_img,
							r.train_num,
							train_num train_score, 
							r.online_min,
							round(online_min/30,0) online_score, 
							round(online_min/30,0)+train_num total_score,
							NOW() create_time, 
							NOW() update_time,
							0 del_flag 
			from (
							select 
							UUID() id,
							uv.id user_id,
							uv.user_name,
							uv.local_head_img,
							uv.remote_head_img,
							if(assess.train_num is null,0,assess.train_num) as train_num,
							if(train.online_min is null,0,train.online_min) as online_min
							from (
								select u.id,u.a_id,u.user_name,u.local_head_img,u.remote_head_img from yyyf_server_user_info u,
								yyyf_server_school_org s,
								yyyf_server_teach_user tu ,
								yyyf_server_teach_class tc 
								where 
								u.org_id=s.id AND
								u.id = tu.user_id AND
								tu.class_id = tc.id AND 
								s.del_flag = 0 AND
								u.del_flag = 0 AND
								tu.del_flag = 0 AND
								tc.del_flag = 0 
							) uv
							LEFT JOIN 
									(SELECT a.user_id,count(1) train_num from 	yyyf_server_assess_user a GROUP BY a.user_id) assess
							ON uv.a_id=assess.user_id
							LEFT JOIN  
									(select t.user_id,sum(time) online_min from yyyf_server_user_train t where t.del_flag=0 GROUP BY t.user_id) train
							ON uv.a_id=train.user_id
			) r;
    END

-- ----------------------------
-- 2018年6月15日学生端登录优化结束
-- ----------------------------


-- ----------------------------
--2018-06-27 保险综合对接
-- ----------------------------

ALTER TABLE `yyyf_server_assess_user_task`
ADD COLUMN `right_answer`  varchar(255) NULL COMMENT '正确答案' AFTER `remarks`,
ADD COLUMN `stu_answer`  varchar(255) NULL COMMENT '学生答案' AFTER `right_answer`;

-- 考核是个人考核还是团队考核
ALTER TABLE yyyf_server_assess_issue ADD COLUMN is_person VARCHAR(1);
ALTER TABLE `yyyf_server_assess_user`
ADD COLUMN `group_id`  int NULL COMMENT '分组id' AFTER `course_id`;

ALTER TABLE `yyyf_server_train_cases_info`
ADD COLUMN `insurance_system_id`  int NULL COMMENT '实训系统id(保险综合)' AFTER `financing_type`,
ADD COLUMN `insurance_system_name`  varchar(255) NULL COMMENT '实训系统名称' AFTER `insurance_system_id`,
ADD COLUMN `insurance_id`  int NULL COMMENT '实训险种id' AFTER `insurance_system_name`,
MODIFY COLUMN `detail_desc`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情描述(注：保险综合把险种存放在这里)' AFTER `cases_id`;

ALTER TABLE `yyyf_server_train_cases_info_bak`
ADD COLUMN `insurance_system_id`  int NULL COMMENT '实训系统id(保险综合)' AFTER `financing_type`,
ADD COLUMN `insurance_system_name`  varchar(255) NULL COMMENT '实训系统名称' AFTER `insurance_system_id`,
ADD COLUMN `insurance_id`  int NULL COMMENT '实训险种id' AFTER `insurance_system_name`,
MODIFY COLUMN `detail_desc`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情描述(注：保险综合把险种存放在这里)' AFTER `cases_id`;




ALTER TABLE `yyyf_server_assess_user_project`
ADD COLUMN `project_case_desc`  text NULL COMMENT '项目案例描述' AFTER `duration_unit`;
-- ----------------------------
--2018-06-27 保险综合对接
-- ----------------------------

-- ----------------------------
--2018-07-17 菜单修改开始
-- ----------------------------

INSERT INTO `yyyf_server_power_res` VALUES (87, '最新动态', 'front/teach/useraction', 'ajax', '', '', '62', '4', '0', '0', '1', '', '0', '', '2018-07-09 16:55:11', '', '2018-07-09 16:55:11');
INSERT INTO `yyyf_server_power_res` VALUES (88, '最新动态', 'front/study/useraction', 'ajax', '', '', '58', '3', '0', '0', '1', '', '0', '', '2018-07-09 16:55:11', '', '2018-07-09 16:55:11');
INSERT INTO `yyyf_server_power_res` VALUES (89, '客户 Client', 'back/customer', '', '', '', 16, 5, 0, 0, 0, '', 0, '', '2017-11-2 16:50:45', '', '2017-11-2 16:50:45');
INSERT INTO `yyyf_server_power_res` VALUES (90, '订单 Order', 'back/order', '', '', '', 16, 6, 0, 0, 0, '', 0, '', '2017-11-2 16:51:08', '', '2017-11-2 16:51:08');
INSERT INTO `yyyf_server_power_res` VALUES (91, '实施 Implement', 'back/transmission', '', '', '', 16, 7, 0, 0, 0, '', 0, '', '2017-11-2 16:51:43', '', '2017-11-2 16:51:43');
INSERT INTO `yyyf_server_power_res` VALUES (92, '学生管理', 'front/admin/student', 'ajax', '', '', 56, 1, 0, 0, 1, '', 0, '', '2017-11-2 16:51:08', '', '2017-11-2 16:51:08');


update yyyf_server_power_res set seq=2 where id=66;
update yyyf_server_power_res set seq=1 where id=65;
update yyyf_server_power_res set seq=0 where id=64;
update yyyf_server_power_res set seq=3,ra_name="实训达人",ra_url="front/teach/training" where id=63;
update yyyf_server_power_res set seq=0 where id=60;
update yyyf_server_power_res set seq=1 where id=61;
update yyyf_server_power_res set seq=2,ra_name="实训达人",ra_url="front/study/training" where id=59;
update yyyf_server_power_res set seq=0,ra_url="back/customer/index",open_mode="",pid=89 where id=44;
update yyyf_server_power_res set seq=0,ra_url="back/order/index",open_mode="",pid=90 where id=45;
update yyyf_server_power_res set seq=0,ra_url="back/transmission/index",open_mode="",pid=91 where id=46;
update yyyf_server_power_res set ra_name="教师管理",ra_url="front/admin/teacher" where id=57;

-- ----------------------------
--2018-07-17 菜单修改结束
-- ----------------------------

-- ----------------------------
--2018-07-21 团队考核分组信息
-- ----------------------------
drop table if exists yyyf_server_group_info;
create table yyyf_server_group_info
(
   id                   varchar(50) not null,
   subsystem_id         int(11) not null auto_increment comment '对应子系统分组id',
   issue_id             varchar(50) not null comment '考核id',
   group_name           varchar(50) not null comment '小组名称',
   creater              varchar(50) comment '创建者',
   group_user_num       int(11) comment '小组成员个数',
   group_num			int(11) comment '小组编号',
   create_date          datetime comment '创建时间',
   del_flag             tinyint comment '删除标识 0  未删除 1  删除',
   primary key (id),
   UNIQUE KEY `subsystem_id` (`subsystem_id`)
) auto_increment = 1;

alter table yyyf_server_group_info comment '分组信息';


drop table if exists yyyf_server_group_user;
create table yyyf_server_group_user
(
   id                   varchar(50) not null,
   group_id             varchar(50) not null comment '所在小组id',
   user_id              varchar(50) not null comment '用户id',
   is_group_leader      char(1)  comment '是否是组长 0 是 1 不是',
   class_id             varchar(50) not null comment '所在教学班级id',
   creater              varchar(50) comment '创建者',
   created_date          datetime comment '创建时间',
   del_flag             tinyint comment '删除标识 0 未删除  1  删除',
   primary key (id)
);

alter table yyyf_server_group_user comment '小组成员';


-- ----------------------------
--2018-07-21 团队考核分组信息
-- ----------------------------
-- 查询涉及到tinyint类型的字段，长度为1的会返回true或者false
ALTER TABLE `yyyf_server_assess_issue`
MODIFY COLUMN `status`  tinyint(2) NULL DEFAULT 0 COMMENT '0待开始  1取消考核 2考核结束)' AFTER `class_id`;
ALTER TABLE `yyyf_server_assess_issue`
MODIFY COLUMN `model`  tinyint(2) NULL DEFAULT 1 COMMENT '模式（1定时发布 2实时发布）' AFTER `assess_min`;
ALTER TABLE `yyyf_server_course_manage`
MODIFY COLUMN `course_type`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '0实训应用 1理论应用' AFTER `course_name`,
MODIFY COLUMN `course_status`  tinyint(2) NOT NULL DEFAULT 1 COMMENT '0：上架 1：下架' AFTER `discount_price`,
MODIFY COLUMN `del_flag`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '0未删除1删除' AFTER `course_from`,
MODIFY COLUMN `mark`  tinyint(2) NULL DEFAULT 0 COMMENT '特殊标识 0：普通 1演示未上市' AFTER `remarks`;


ALTER TABLE `yyyf_server_course_manage`
ADD COLUMN `course_from`  INT(10) null COMMENT '应用来源 0国泰安自研  1第三方应用 2教师创建' AFTER `course_label`;
UPDATE yyyf_server_course_manage a SET a.course_from=0;
INSERT INTO `yyyf_server_train` VALUES ('106', '2', '保险公司综合业务教学软件', '保险公司综合业务教学软件', null, null, null, 'news.baidu.com', '87DIVy348Oxzj3ha', '0', '0', null, 'asdfasd', '2017-10-04 10:59:52', 'asdfasd', '2017-10-23 11:00:03');
INSERT INTO `yyyf_server_train` VALUES ('107', '2', '理论试题库管理系统', '理论试题库管理系统', null, null, null, '10.10.17.42:90/', '87DIVy348Oxzj3ha', '0', '0', null, 'asdfasd', '2017-10-04 10:59:52', 'asdfasd', '2017-10-23 11:00:03');
INSERT INTO `yyyf_server_train` VALUES ('108', '2', '金融大赛平台', '金融大赛平台', null, null, null, '10.10.17.42:90', '87DIVy348Oxzj3ha', '0', '0', null, 'asdfasd', '2017-10-04 10:59:52', 'asdfasd', '2017-10-23 11:00:03');
INSERT INTO `yyyf_server_train` VALUES ('109', '2', '理论考试管理系统', '理论考试管理系统', null, null, null, '10.10.17.42:90', '87DIVy348Oxzj3ha', '0', '0', null, 'asdfasd', '2017-10-04 10:59:52', 'asdfasd', '2017-10-23 11:00:03');
INSERT INTO `yyyf_server_train` VALUES ('110', '2', 'P2P实训系统', 'P2P实训系统', NULL, NULL, NULL, 'news.baidu.com', '87DIVy348Oxzj3ha', 0, 0, NULL, 'asdfasd', '2017-10-4 10:59:52', 'asdfasd', '2017-10-23 11:00:03');
INSERT INTO `yyyf_server_train` VALUES ('111', '2', '财务分析综合教学软件', '财务分析综合教学软件', NULL, NULL, NULL, 'news.baidu.com', '87DIVy348Oxzj3ha', 0, 0, NULL, 'asdfasd', '2017-10-4 10:59:52', 'asdfasd', '2017-10-23 11:00:03');
INSERT INTO `yyyf_server_train` VALUES ('112', '2', '财会易实训教学软件', '财会易实训教学软件', NULL, NULL, NULL, 'news.baidu.com', '87DIVy348Oxzj3ha', 0, 0, NULL, 'asdfasd', '2017-10-4 10:59:52', 'asdfasd', '2017-10-23 11:00:03');
