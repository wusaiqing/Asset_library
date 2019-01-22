/*
 基础框架--对象创建
*/
declare num number;
begin
    select count(1) into num from user_tables where table_name = upper('TSTU_REPORT_REGISTER_SETTING') ;
    if num > 0 then
        execute immediate 'drop table TSTU_REPORT_REGISTER_SETTING' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSTU_STUDENT_SETTING') ;
    if num > 0 then
        execute immediate 'drop table TSTU_STUDENT_SETTING' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSTU_STUDENT') ;
    if num > 0 then
        execute immediate 'drop table TSTU_STUDENT' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSTU_STUDENT_UPDATE_LOG') ;
    if num > 0 then
        execute immediate 'drop table TSTU_STUDENT_UPDATE_LOG' ;
    end if;
    
    select count(1) into num from user_tables where table_name = upper('TSTU_REWARD') ;
    if num > 0 then
        execute immediate 'drop table TSTU_REWARD' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSTU_STUDENT_SETTING_FIELDS') ;
    if num > 0 then
        execute immediate 'drop table TSTU_STUDENT_SETTING_FIELDS' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSTU_CLASS') ;
    if num > 0 then
        execute immediate 'drop table TSTU_CLASS' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSTU_REPORT') ;
    if num > 0 then
        execute immediate 'drop table TSTU_REPORT' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSTU_PUNISHMENT') ;
    if num > 0 then
        execute immediate 'drop table TSTU_PUNISHMENT' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSTU_REGISTER') ;
    if num > 0 then
        execute immediate 'drop table TSTU_REGISTER' ;
    end if;

		select count(1) into num from user_tables where table_name = upper('TSTU_ARCHIVES_REGISTER') ;
    if num > 0 then
        execute immediate 'drop table TSTU_ARCHIVES_REGISTER' ;
    end if;

		select count(1) into num from user_tables where table_name = upper('TSTU_MAJORDISTRIBUTE_STUDENT_D') ;
    if num > 0 then
        execute immediate 'drop table TSTU_MAJORDISTRIBUTE_STUDENT_D' ;
    end if;

		select count(1) into num from user_tables where table_name = upper('TSTU_APPLY_SETTING') ;
    if num > 0 then
        execute immediate 'drop table TSTU_APPLY_SETTING' ;
    end if;

		select count(1) into num from user_tables where table_name = upper('TSTU_ALIENCHANGE_PRE_CONDITION') ;
    if num > 0 then
        execute immediate 'drop table TSTU_ALIENCHANGE_PRE_CONDITION' ;
    end if;

		select count(1) into num from user_tables where table_name = upper('TSTU_ALIENCHANGE_RECORD') ;
    if num > 0 then
        execute immediate 'drop table TSTU_ALIENCHANGE_RECORD' ;
    end if;

		select count(1) into num from user_tables where table_name = upper('TSTU_MAJORDISTRIBUTE_SETTING') ;
    if num > 0 then
        execute immediate 'drop table TSTU_MAJORDISTRIBUTE_SETTING' ;
    end if;

		select count(1) into num from user_tables where table_name = upper('TSTU_ALIENCHANGE_SETTING') ;
    if num > 0 then
        execute immediate 'drop table TSTU_ALIENCHANGE_SETTING' ;
    end if;

		select count(1) into num from user_tables where table_name = upper('TSTU_MAJORDISTRIBUTE_SETTING_M') ;
    if num > 0 then
        execute immediate 'drop table TSTU_MAJORDISTRIBUTE_SETTING_M' ;
    end if;
end;
/
--报到注册设置表
/*==============================================================*/
/* Table: TSTU_REPORT_REGISTER_SETTING                          */
/*==============================================================*/
create table TSTU_REPORT_REGISTER_SETTING 
(
   SETTING_ID           NVARCHAR2(50)        not null,
   REPORT_BEGIN_DATE    DATE,                 
   REPORT_END_DATE      DATE,                
   REGISTER_BEGIN_DATE  DATE,                 
   REGISTER_END_DATE    DATE,                 
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP(6)         not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   constraint PK_TSTU_REPORT_REGISTER_SETTIN primary key (SETTING_ID)
);

--学生修改个人信息控制表
/*==============================================================*/
/* Table: TSTU_STUDENT_SETTING                                  */
/*==============================================================*/
create table TSTU_STUDENT_SETTING 
(
   SETTING_ID           NVARCHAR2(50)        not null,
   BEGIN_TIME           DATE,               
   END_TIME             DATE,                
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP(6)         not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   constraint PK_TSTU_STUDENT_SETTING primary key (SETTING_ID)
);

--学生信息表
/*==============================================================*/
/* Table: TSTU_STUDENT                                          */
/*==============================================================*/
create table TSTU_STUDENT 
(
   USER_ID              NVARCHAR2(50)        not null,
   STUDENT_NAME         NVARCHAR2(50)        not null,
   STUDENT_NO           NVARCHAR2(50)        not null,
   NAME_SPELL           NVARCHAR2(300),
   USED_NAME            NVARCHAR2(50),
   SEX_CODE             NVARCHAR2(50)        not null,
   BIRTHDAY             DATE,
   POLITICAL_STATUS_CODE NVARCHAR2(50),
   BIRTH_PROVINCE_CODE  NVARCHAR2(50),
   BIRTH_CITY_CODE      NVARCHAR2(50),
   BIRTH_AREA_CODE      NVARCHAR2(50),
   NATIVE_PLACE         NVARCHAR2(50),
   NATION_CODE          NVARCHAR2(50)        not null,
   NATIONALITY_CODE     NVARCHAR2(50),
   ID_CARD_TYPE_CODE    NVARCHAR2(50),
   ID_CARD              NVARCHAR2(50),
   OVERSEAS_CHINESE_CODE NVARCHAR2(50),
   FAITH_CODE           NVARCHAR2(50),
   BLOOD_TYPE_CODE      NVARCHAR2(50),
   MARITAL_STATUS_CODE  NVARCHAR2(50),
   HEALTH_CODE          NVARCHAR2(50),
   IS_ONLY_CHILD        INTEGER,
   QQ                   NVARCHAR2(50),
   WECHAT               NVARCHAR2(50),
   MOBILE_PHONE         NVARCHAR2(50),
   CONTACT_PERSON       NVARCHAR2(50),
   CONTACT_PHONE        NVARCHAR2(50),
   POSTAL_CODE          NVARCHAR2(50),
   EMAIL                NVARCHAR2(50),
   ADDRESS              NVARCHAR2(100),
   CANDIDATE_FEATURE    NVARCHAR2(100),
   ENTRANCE_DATE        DATE,
   ENROLL_SEASON_CODE   NVARCHAR2(50),
   ENTRANCE_WAY_CODE    NVARCHAR2(50),
   STUDENT_CATEGORY_CODE NVARCHAR2(50),
   CANDIDATE_NO         NVARCHAR2(50),
   STUDY_FORM_CODE      NVARCHAR2(50),
   TRAINING_WAY_CODE    NVARCHAR2(50),
   TRAINING_OBJECT_CODE NVARCHAR2(50),
   CLASS_ID             NVARCHAR2(50)        not null,
   GRADE                INTEGER,
   TRAINING_LEVEL_CODE  NVARCHAR2(50),
   EDUCATION_SYSTEM     INTEGER,
   ENTRANCE_SCORE       NUMBER(6,2),
   FOREIGN_LANGUAGE_CODE NVARCHAR2(50),
   CURRENT_STATUS_CODE  NVARCHAR2(50)        not null,
   SCHOOL_STATUS_CODE   NVARCHAR2(50)        not null,
   ARCHIEVES_STATUS_CODE NVARCHAR2(50)        not null,
   STUDENT_ORIGIN_CODE  NVARCHAR2(50),
   FROM_PROVINCE_CODE   NVARCHAR2(50),
   FROM_CITY_CODE       NVARCHAR2(50),
   FROM_AREA_CODE       NVARCHAR2(50),
   FILE_ID              NVARCHAR2(50),
   REMARK               NVARCHAR2(100),
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP(6)         not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   constraint PK_TSTU_STUDENT primary key (USER_ID)
);

ALTER TABLE TSTU_STUDENT ADD CONSTRAINT  UK_TSTU_STUDENT_STUDENT_NO UNIQUE (STUDENT_NO);
ALTER TABLE TSTU_STUDENT ADD CONSTRAINT  UK_TSTU_STUDENT_ID_CARD UNIQUE (ID_CARD);
ALTER TABLE TSTU_STUDENT ADD CONSTRAINT  UK_TSTU_STUDENT_CANDIDATE_NO UNIQUE (CANDIDATE_NO);

--学生信息修改日志表
/*==============================================================*/
/* Table: TSTU_STUDENT_UPDATE_LOG                               */
/*==============================================================*/
create table TSTU_STUDENT_UPDATE_LOG 
(
   LOG_ID               NVARCHAR2(50)        not null,
   USER_ID              NVARCHAR2(50)        not null,
   FIELD_NAME           NVARCHAR2(50)        not null,
   DISPLAY_NAME         NVARCHAR2(50),
   BEFORE_CONTENT       NVARCHAR2(300),
   AFTER_CONTENT        NVARCHAR2(300),
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP(6)         not null,
   constraint PK_TSTU_STUDENT_UPDATE_LOG primary key (LOG_ID)
);


--学生奖励表
/*==============================================================*/
/* Table: TSTU_REWARD                                           */
/*==============================================================*/
create table TSTU_REWARD 
(
   REWARD_ID            NVARCHAR2(50)        not null,
   USER_ID              NVARCHAR2(50)        not null,
   ACADEMIC_YEAR        INTEGER              not null,
   SEMESTER_CODE        NVARCHAR2(50)        not null,
   REWARD_NAME          NVARCHAR2(100)       not null,
   REWARD_DATE          DATE                 not null,
   REWARD_LEVEL_CODE    NVARCHAR2(50)        not null,
   REWARD_GRADE_CODE    NVARCHAR2(50)        not null,
   REWARD_CATEGORY_CODE NVARCHAR2(50)        not null,
   REWARD_MONEY         NUMBER(10,2),
   AWARD_DEPARTMENT     NVARCHAR2(100)       not null,
   DOCUMENT_SYMBOL      NVARCHAR2(50),
   REWARD_TYPE_CODE     NVARCHAR2(50),
   REWARD_WAY_CODE      NVARCHAR2(50),
   REWARD_REASON        NVARCHAR2(100),
   IS_DELETED           INTEGER,
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP(6)         not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   constraint PK_TSTU_REWARD primary key (REWARD_ID)
);


--学生修改个人信息控制字段表
/*==============================================================*/
/* Table: TSTU_STUDENT_SETTING_FIELDS                           */
/*==============================================================*/
create table TSTU_STUDENT_SETTING_FIELDS 
(
   FIELD_ID             NVARCHAR2(50)        not null,
   SETTING_ID           NVARCHAR2(50)        not null,
   FIELD_NAME           NVARCHAR2(50)        not null,
   DISPLAY_NAME         NVARCHAR2(50),
   IS_OPEN              INTEGER,
   IS_ENABLED           INTEGER,
   constraint PK_TSTU_STUDENT_SETTING_FIELDS primary key (FIELD_ID)
);


--班级信息表
/*==============================================================*/
/* Table: TSTU_CLASS                                            */
/*==============================================================*/
create table TSTU_CLASS 
(
   CLASS_ID             NVARCHAR2(50)        not null,
   GRADE                INTEGER              not null,
   CAMPUS_ID            NVARCHAR2(50)        not null,
   MAJOR_ID             NVARCHAR2(50)        not null,
   CLASS_NO             NVARCHAR2(50)        not null,
   CLASS_NAME           NVARCHAR2(50)        not null,
   PRESET_NUMBER        INTEGER,
   VENUE_ID             NVARCHAR2(50),
   USER_ID              NVARCHAR2(50),
   IS_DELETED           INTEGER,
   IS_ENABLED           INTEGER,
   REMARK               NVARCHAR2(1000),
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP(6)         not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   constraint PK_TSTU_CLASS primary key (CLASS_ID)
);

create index IX_TSTU_STUDENT_CLASS_ID on TSTU_STUDENT (CLASS_ID);

--学生报到表
/*==============================================================*/
/* Table: TSTU_REPORT                                           */
/*==============================================================*/
create table TSTU_REPORT 
(
   REPORT_ID            NVARCHAR2(50)        not null,
   USER_ID              NVARCHAR2(50)        not null,
   ACADEMIC_YEAR        INTEGER              not null,
   SEMESTER_CODE        NVARCHAR2(50)        not null,
   CLASS_ID             NVARCHAR2(50)        not null,
   REPORT_STATUS        INTEGER,
   REMARK               NVARCHAR2(200),
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP(6)         not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   constraint PK_TSTU_REPORT primary key (REPORT_ID)
);


--学生处分表

/*==============================================================*/
/* Table: TSTU_PUNISHMENT                                       */
/*==============================================================*/
create table TSTU_PUNISHMENT 
(
   PUNISHMENT_ID        NVARCHAR2(50)        not null,
   USER_ID              NVARCHAR2(50)        not null,
   ACADEMIC_YEAR        INTEGER              not null,
   SEMESTER_CODE        NVARCHAR2(50)        not null,
   VIOLATION_CATEGORY_CODE NVARCHAR2(50)        not null,
   VIOLATION_DATE       DATE                 not null,
   VIOLATION_BRIEF_DESCRIPTION NVARCHAR2(100)       not null,
   PUNISHMENT_NAME_CODE NVARCHAR2(50),
   PUNISHMENT_DOCUMENT_SYMBOL NVARCHAR2(50),
   PUNISHMENT_DATE      DATE,
   PUNISHMENT_REASON    NVARCHAR2(100),
   IS_REVOKED           INTEGER,
   REVOCATION_DOCUMENT_SYMBOL NVARCHAR2(50),
   REVOCATION_DATE      DATE,
   IS_DELETED           INTEGER,
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP(6)         not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   constraint PK_TSTU_PUNISHMENT primary key (PUNISHMENT_ID)
);


--学生注册表
/*==============================================================*/
/* Table: TSTU_REGISTER                                         */
/*==============================================================*/
create table TSTU_REGISTER 
(
   REGISTER_ID          NVARCHAR2(50)        not null,
   USER_ID              NVARCHAR2(50)        not null,
   ACADEMIC_YEAR        INTEGER              not null,
   SEMESTER_CODE        NVARCHAR2(50)        not null,
   CLASS_ID             NVARCHAR2(50)        not null,
   REGISTER_STATUS      INTEGER,
   IS_FORCED            INTEGER,
   REMARK               NVARCHAR2(200),
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP(6)         not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   constraint PK_TSTU_REGISTER primary key (REGISTER_ID)
);


--学籍注册表
/*==============================================================*/
/* Table: TSTU_ARCHIVES_REGISTER                                */
/*==============================================================*/
create table TSTU_ARCHIVES_REGISTER 
(
   ARCHIVES_REGISTER_ID NVARCHAR2(50)        not null,
   USER_ID              NVARCHAR2(50)        not null,
   ACADEMIC_YEAR        INTEGER              not null,
   SEMESTER_CODE        NVARCHAR2(50)        not null,
   CLASS_ID             NVARCHAR2(50)        not null,
   SCHOOL_STATUS_CODE   NVARCHAR2(50)        not null,
   ARCHIEVES_STATUS_CODE NVARCHAR2(50)        not null,
   REMARK               NVARCHAR2(100),
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP(6)         not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   constraint PK_TSTU_ARCHIVES_REGISTER primary key (ARCHIVES_REGISTER_ID)
);

create index IX_TSTU_A_R_YEAR_S_CODE on TSTU_ARCHIVES_REGISTER (ACADEMIC_YEAR,SEMESTER_CODE);
create index IX_TSTU_CLASS_USER on TSTU_ARCHIVES_REGISTER (CLASS_ID, USER_ID, SCHOOL_STATUS_CODE);

--开放学生申请控制表
/*==============================================================*/
/* Table: TSTU_APPLY_SETTING                                    */
/*==============================================================*/
create table TSTU_APPLY_SETTING 
(
   SETTING_ID           NVARCHAR2(50)        not null,
   APPLY_TYPE           NVARCHAR2(50)        not null,
   BEGIN_TIME           DATE                 not null,
   END_TIME             DATE                 not null,
   ACADEMIC_YEAR        INTEGER              not null,
   SEMESTER_CODE        NVARCHAR2(50)        not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   constraint PK_TSTU_APPLY_SETTING primary key (SETTING_ID)
);


--异动前置条件表
/*==============================================================*/
/* Table: TSTU_ALIENCHANGE_PRE_CONDITION                        */
/*==============================================================*/
create table TSTU_ALIENCHANGE_PRE_CONDITION 
(
   CONDITION_ID         NVARCHAR2(50)        not null,
   CATEGORY_CODE        NVARCHAR2(50)        not null,
   PRE_CATEGORY_CODE    NVARCHAR2(50),
   constraint PK_TSTU_ALIENCHANGE_PRE_CONDIT primary key (CONDITION_ID)
);

--异动记录表
/*==============================================================*/
/* Table: TSTU_ALIENCHANGE_RECORD                               */
/*==============================================================*/
create table TSTU_ALIENCHANGE_RECORD 
(
   RECORD_ID            NVARCHAR2(50)        not null,
   USER_ID              NVARCHAR2(50)        not null,
   ACADEMIC_YEAR        INTEGER              not null,
   SEMESTER_CODE        NVARCHAR2(50)        not null,
   DATA_SOURCE_CODE     NVARCHAR2(50)        not null,
   APPLY_DATE           DATE                 not null,
   ALIENCHANGE_CATEGORY_CODE NVARCHAR2(50)        not null,
   ALIENCHANGE_REASON_CODE NVARCHAR2(50)        not null,
   REMARK               NVARCHAR2(200),
   BEFORE_GRADE         INTEGER,
   BEFORE_DEPARTMENT_ID NVARCHAR2(50),
   BEFORE_MAJOR_ID      NVARCHAR2(50),
   BEFORE_CLASS_ID      NVARCHAR2(50),
   BEFORE_SCHOOL_STATUS_CODE NVARCHAR2(50),
   BEFORE_CURRENT_STATUS_CODE NVARCHAR2(50),
   BEFORE_ARCHIEVES_STATUS_CODE NVARCHAR2(50),
   AFTER_GRADE          INTEGER,
   AFTER_DEPARTMENT_ID  NVARCHAR2(50),
   AFTER_MAJOR_ID       NVARCHAR2(50),
   AFTER_CLASS_ID       NVARCHAR2(50),
   AFTER_SCHOOL_STATUS_CODE NVARCHAR2(50),
   AFTER_CURRENT_STATUS_CODE NVARCHAR2(50),
   AFTER_ARCHIEVES_STATUS_CODE NVARCHAR2(50),
   ALIENCHANGE_DATE     DATE,
   IS_CANCEL            INTEGER,
   DOCUMENT_SYMBOL      NVARCHAR2(50),
   ISSUE_DATE           DATE,
   DEAL_STATUS          INTEGER,
   IS_DELETED           INTEGER,
   APPLY_USER_ID        NVARCHAR2(50)        not null,
   APPLY_TIME           TIMESTAMP(6)         not null,
   DEAL_USER_ID         NVARCHAR2(50),
   DEAL_TIME            TIMESTAMP(6),
   CHOICE_PROCESS_STATUS INTEGER,
   constraint PK_TSTU_ALIENCHANGE_RECORD primary key (RECORD_ID)
);

--异动类别设置表
/*==============================================================*/
/* Table: TSTU_ALIENCHANGE_SETTING                              */
/*==============================================================*/
create table TSTU_ALIENCHANGE_SETTING 
(
   SETTING_ID           NVARCHAR2(50)        not null,
   CATEGORY_CODE        NVARCHAR2(50),
   CATEGORY_NAME        NVARCHAR2(50)        not null,
   IS_AFFIRM_SCORE      INTEGER              not null,
   SCHOOL_STATUS_CODE   NVARCHAR2(50)        not null,
   CURRENT_STATUS_CODE  NVARCHAR2(50)        not null,
   ARCHIEVES_STATUS_CODE NVARCHAR2(50)        not null,
   CAN_BE_CONFIRMED_CLASS INTEGER              not null,
   CONFIRM_CLASS_CODE   NVARCHAR2(50),
   TRAINING_LEVEL_CODE  NVARCHAR2(50),
   IS_ENABLED           INTEGER,
   CAN_BE_MODIFIED_REASON INTEGER,
   CAN_BE_MODIFIED_DEPARTMENT INTEGER,
   CAN_BE_MODIFIED_MAJOR INTEGER,
   CAN_BE_MODIFIED_CLASS INTEGER,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   constraint PK_TSTU_ALIENCHANGE_SETTING primary key (SETTING_ID)
);

--学生报到视图
/*==============================================================*/
/* VIEW: VSTU_REPORT                              */
/*==============================================================*/
CREATE OR REPLACE VIEW VSTU_REPORT
AS
SELECT a.ARCHIVES_REGISTER_ID,s.STUDENT_NAME,s.STUDENT_NO,s.SEX_CODE,c.CLASS_ID ,c.CLASS_NAME,c.grade, m.MAJOR_ID,  m.MAJOR_NO,m.MAJOR_NAME, m.DEPARTMENT_ID,d.DEPARTMENT_NAME ,
(CASE WHEN r.REPORT_STATUS IS NULL THEN -1 ELSE r.REPORT_STATUS END) AS REPORT_STATUS,r.REMARK,a.USER_ID,a.ACADEMIC_YEAR,a.SEMESTER_CODE,s.TRAINING_LEVEL_CODE,s.CURRENT_STATUS_CODE,a.ARCHIEVES_STATUS_CODE
FROM TSTU_ARCHIVES_REGISTER a
INNER JOIN TSTU_STUDENT s ON a.USER_ID=s.USER_ID
LEFT JOIN TSTU_REPORT r ON (a.USER_ID=r.USER_ID and a.ACADEMIC_YEAR=r.ACADEMIC_YEAR and a.SEMESTER_CODE=r.SEMESTER_CODE)
INNER JOIN TSTU_CLASS c ON c.CLASS_ID=a.CLASS_ID
INNER  JOIN TSYS_MAJOR m ON c.MAJOR_ID=m.MAJOR_ID
INNER  JOIN TSYS_DEPARTMENT d ON d.DEPARTMENT_ID=m.DEPARTMENT_ID
;
--学生注册视图
/*==============================================================*/
/* VIEW: VSTU_REGISTER                              */
/*==============================================================*/
CREATE OR REPLACE VIEW VSTU_REGISTER
AS
SELECT a.ARCHIVES_REGISTER_ID,s.STUDENT_NAME,s.STUDENT_NO,s.SEX_CODE,c.CLASS_ID ,c.CLASS_NAME,c.grade,m.MAJOR_ID, m.MAJOR_NO,m.MAJOR_NAME, m.DEPARTMENT_ID,d.DEPARTMENT_NAME ,
(CASE WHEN r.REGISTER_STATUS IS NULL THEN -1 ELSE r.REGISTER_STATUS END) AS REGISTER_STATUS,r.REMARK,(CASE WHEN r.IS_FORCED IS NULL THEN 0 ELSE r.IS_FORCED END) AS IS_FORCED,
(CASE WHEN r1.REPORT_STATUS IS NULL THEN -1 ELSE r1.REPORT_STATUS END) AS REPORT_STATUS,a.USER_ID,a.ACADEMIC_YEAR,a.SEMESTER_CODE,s.TRAINING_LEVEL_CODE,s.CURRENT_STATUS_CODE,a.ARCHIEVES_STATUS_CODE
FROM TSTU_ARCHIVES_REGISTER a
INNER JOIN TSTU_STUDENT s ON a.USER_ID=s.USER_ID
LEFT JOIN TSTU_REGISTER r ON (a.USER_ID=r.USER_ID and a.ACADEMIC_YEAR=r.ACADEMIC_YEAR and a.SEMESTER_CODE=r.SEMESTER_CODE)
LEFT JOIN TSTU_REPORT r1 ON (a.USER_ID=r1.USER_ID and a.ACADEMIC_YEAR=r1.ACADEMIC_YEAR and a.SEMESTER_CODE=r1.SEMESTER_CODE)
INNER JOIN TSTU_CLASS c ON c.CLASS_ID=a.CLASS_ID
INNER  JOIN TSYS_MAJOR m ON c.MAJOR_ID=m.MAJOR_ID
INNER  JOIN TSYS_DEPARTMENT d ON d.DEPARTMENT_ID=m.DEPARTMENT_ID;

/*==============================================================*/
/* VIEW: VSTU_STUDENTROLL   学生名册视图        */
/*==============================================================*/
CREATE OR REPLACE VIEW VSTU_STUDENTROLL
AS
SELECT
	A .ARCHIVES_REGISTER_ID,
	CONCAT (
		CONCAT (A .ACADEMIC_YEAR, '_'),
		A .SEMESTER_CODE
	) AS ACADEMICYEARSEMESTER,
	s.USER_ID,
	s.STUDENT_NAME,
	s.STUDENT_NO,
	s.NATION_CODE,
	s.BIRTHDAY,
	s.SEX_CODE,
	c.CLASS_NAME,
	c.GRADE,
	M .MAJOR_NAME,
	D .DEPARTMENT_NAME,
	D .DEPARTMENT_NO,
	s.TRAINING_LEVEL_CODE,
	tProvince.CANTON_NAME AS PROVINCE,
	tCity.CANTON_NAME AS CITY,
	tArea.CANTON_NAME AS AREA,
	A .SCHOOL_STATUS_CODE,
	A .ARCHIEVES_STATUS_CODE,
	s.REMARK,
	s.ID_CARD,
	c.CAMPUS_ID,
	c.CLASS_ID,
	D .DEPARTMENT_ID,
	M .MAJOR_ID
FROM
	TSTU_ARCHIVES_REGISTER A
INNER JOIN TSTU_STUDENT s ON A .USER_ID = s.USER_ID
INNER JOIN TSTU_CLASS c ON c.CLASS_ID = A .CLASS_ID
INNER JOIN TSYS_MAJOR M ON c.MAJOR_ID = M .MAJOR_ID
INNER JOIN TSYS_DEPARTMENT D ON D .DEPARTMENT_ID = M .DEPARTMENT_ID
LEFT JOIN TSYS_CANTON tProvince ON tProvince.CANTON_CODE = s.FROM_PROVINCE_CODE
LEFT JOIN TSYS_CANTON tCity ON tCity.CANTON_CODE = s.FROM_CITY_CODE
LEFT JOIN TSYS_CANTON tArea ON tArea.CANTON_CODE = s.FROM_AREA_CODE;

commit;


/*
 学籍管理--数据初始化
*/
/*
 学籍管理--删除原有菜单
*/ 
delete  TSYS_MENU t where t.MENU_ID in 
(
select menu_id from tsys_menu where parent_id_list like '%,d4bca07168f440c6957e61551abbb2a9%'
) ;
commit;
-- 生成学籍菜单
insert into tsys_menu values ('d4bca07168f440c6957e61551abbb2a9', '学籍管理', 1, 'fa fa-users', '', 'StudentArchives', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 4, '0', '0,d4bca07168f440c6957e61551abbb2a9', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('97f3764b85bd4255a69dff9b35d76a97', '学籍信息', 1, 'fa fa-address-card-o', '', 'StudentArchives_Information', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 5, 'd4bca07168f440c6957e61551abbb2a9', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('9d3cbab371eb4405be6089a61d979413', '班级信息', 2, 'fa fa-language', 'studentarchives/class/html/list.html', 'StudentArchives_Information_Class', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 6, '97f3764b85bd4255a69dff9b35d76a97', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97,97f3764b85bd4255a69dff9b35d76a97,9d3cbab371eb4405be6089a61d979413', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('7904564ff9e44c2b961feba2e46aa4d7', '新增', 3, 'fa fa-th', '', 'StudentArchives_Information_Class_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '9d3cbab371eb4405be6089a61d979413', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97,97f3764b85bd4255a69dff9b35d76a97,9d3cbab371eb4405be6089a61d979413,9d3cbab371eb4405be6089a61d979413,7904564ff9e44c2b961feba2e46aa4d7', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('2956ba74c88c453fb4b2f47af0e73d31', '修改', 3, 'fa fa-th', '', 'StudentArchives_Information_Class_Update', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '9d3cbab371eb4405be6089a61d979413', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97,97f3764b85bd4255a69dff9b35d76a97,9d3cbab371eb4405be6089a61d979413,9d3cbab371eb4405be6089a61d979413,2956ba74c88c453fb4b2f47af0e73d31', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('d09d0f808e734e07b974466e047ea4fb', '删除', 3, 'fa fa-th', '', 'StudentArchives_Information_Class_Delete', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '9d3cbab371eb4405be6089a61d979413', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97,97f3764b85bd4255a69dff9b35d76a97,9d3cbab371eb4405be6089a61d979413,9d3cbab371eb4405be6089a61d979413,d09d0f808e734e07b974466e047ea4fb', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('f52a09565c8f442b99f5327cf624a2ef', '批量删除', 3, 'fa fa-th', '', 'StudentArchives_Information_Class_BatchDelete', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '9d3cbab371eb4405be6089a61d979413', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97,97f3764b85bd4255a69dff9b35d76a97,9d3cbab371eb4405be6089a61d979413,9d3cbab371eb4405be6089a61d979413,f52a09565c8f442b99f5327cf624a2ef', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('84afe7274f9f48db9f0df823b8cd3604', '导出', 3, 'fa fa-th', '', 'StudentArchives_Information_Class_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '9d3cbab371eb4405be6089a61d979413', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97,97f3764b85bd4255a69dff9b35d76a97,9d3cbab371eb4405be6089a61d979413,9d3cbab371eb4405be6089a61d979413,84afe7274f9f48db9f0df823b8cd3604', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('13e014573dc6487588fa1e561b6eb3fe', '学生名单', 3, 'fa fa-users', '', 'StudentArchives_Information_Class_StudentRoll', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '9d3cbab371eb4405be6089a61d979413', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97,97f3764b85bd4255a69dff9b35d76a97,9d3cbab371eb4405be6089a61d979413,9d3cbab371eb4405be6089a61d979413,13e014573dc6487588fa1e561b6eb3fe', 6, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('c803b58e4f7348c59181c39cb7eed7f2', '学生修改个人信息控制', 2, 'fa fa-expeditedssl', 'studentarchives/student/html/setting.html', 'StudentArchives_Information_Setting', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '97f3764b85bd4255a69dff9b35d76a97', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97,97f3764b85bd4255a69dff9b35d76a97,c803b58e4f7348c59181c39cb7eed7f2', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('96fa1baee8d5421089c98ab5f3fec76c', '学生信息维护', 2, 'fa fa-user-plus', 'studentarchives/student/html/list.html', 'StudentArchives_Information_Student', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 7, '97f3764b85bd4255a69dff9b35d76a97', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97,97f3764b85bd4255a69dff9b35d76a97,96fa1baee8d5421089c98ab5f3fec76c', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
insert into tsys_menu values ('63fdb5dcb29f4de5ba46ce9e546e1da2', '新增', 3, 'fa fa-th', '', 'StudentArchives_Information_Student_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '96fa1baee8d5421089c98ab5f3fec76c', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97,97f3764b85bd4255a69dff9b35d76a97,96fa1baee8d5421089c98ab5f3fec76c,96fa1baee8d5421089c98ab5f3fec76c,63fdb5dcb29f4de5ba46ce9e546e1da2', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('8ed01a84d69941a8acb691450ae72eb3', '修改', 3, 'fa fa-th', '', 'StudentArchives_Information_Student_Update', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '96fa1baee8d5421089c98ab5f3fec76c', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97,97f3764b85bd4255a69dff9b35d76a97,96fa1baee8d5421089c98ab5f3fec76c,96fa1baee8d5421089c98ab5f3fec76c,8ed01a84d69941a8acb691450ae72eb3', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('a5ec8fb3d2474e039986d3deb4df8d34', '批量修改', 3, 'fa fa-th', '', 'StudentArchives_Information_Student_BatchUpdate', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '96fa1baee8d5421089c98ab5f3fec76c', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97,97f3764b85bd4255a69dff9b35d76a97,96fa1baee8d5421089c98ab5f3fec76c,96fa1baee8d5421089c98ab5f3fec76c,a5ec8fb3d2474e039986d3deb4df8d34', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('449a4b8e25854c0f8b80ab8cc268a60f', '删除', 3, 'fa fa-th', '', 'StudentArchives_Information_Student_Delete', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '96fa1baee8d5421089c98ab5f3fec76c', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97,97f3764b85bd4255a69dff9b35d76a97,96fa1baee8d5421089c98ab5f3fec76c,96fa1baee8d5421089c98ab5f3fec76c,449a4b8e25854c0f8b80ab8cc268a60f', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('004946c87ef1472fa06d1cef5f90e558', '批量删除', 3, 'fa fa-th', '', 'StudentArchives_Information_Student_BatchDelete', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '96fa1baee8d5421089c98ab5f3fec76c', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97,97f3764b85bd4255a69dff9b35d76a97,96fa1baee8d5421089c98ab5f3fec76c,96fa1baee8d5421089c98ab5f3fec76c,004946c87ef1472fa06d1cef5f90e558', 6, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('81d5f0a4d00843739f7592a8b88db768', '详情', 3, 'fa fa-th', '', 'StudentArchives_Information_Student_Detail', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '96fa1baee8d5421089c98ab5f3fec76c', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97,97f3764b85bd4255a69dff9b35d76a97,96fa1baee8d5421089c98ab5f3fec76c,96fa1baee8d5421089c98ab5f3fec76c,81d5f0a4d00843739f7592a8b88db768', 7, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('54dbde4af51345a2bb25b79dae9a5364', '导出', 3, 'fa fa-th', '', 'StudentArchives_Information_Student_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '96fa1baee8d5421089c98ab5f3fec76c', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97,97f3764b85bd4255a69dff9b35d76a97,96fa1baee8d5421089c98ab5f3fec76c,96fa1baee8d5421089c98ab5f3fec76c,54dbde4af51345a2bb25b79dae9a5364', 9, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('5db2d1e0b7a54ed292dac5c990d1f49b', '导入学生信息', 2, 'fa fa-upload', 'studentarchives/student/html/importExcel.html', 'StudentArchives_Information_ImportExcel', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '97f3764b85bd4255a69dff9b35d76a97', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97,97f3764b85bd4255a69dff9b35d76a97,5db2d1e0b7a54ed292dac5c990d1f49b', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('3764e9ec70d1494cb84f5ab4713bb6af', '导入学生照片', 2, 'fa fa-file-image-o', 'studentarchives/student/html/importPhoto.html', 'StudentArchives_Information_ImportPhoto', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '97f3764b85bd4255a69dff9b35d76a97', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,97f3764b85bd4255a69dff9b35d76a97,97f3764b85bd4255a69dff9b35d76a97,3764e9ec70d1494cb84f5ab4713bb6af', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('6ca6e919c57549adb34d830272b80b8d', '报到注册', 1, 'fa fa-modx', '', 'StudentArchives_ReportRegister', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 5, 'd4bca07168f440c6957e61551abbb2a9', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,6ca6e919c57549adb34d830272b80b8d', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('e48039ff938c42739b0d66ae70d51413', '报到注册设置', 2, 'fa fa-modx', 'studentarchives/register/html/setting.html', 'StudentArchives_ReportRegister_Setting', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '6ca6e919c57549adb34d830272b80b8d', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,6ca6e919c57549adb34d830272b80b8d,6ca6e919c57549adb34d830272b80b8d,e48039ff938c42739b0d66ae70d51413', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
insert into tsys_menu values ('e8c1a505dad0453a9922d4490ade336b', '办理学生报到', 2, 'fa fa-street-view', 'studentarchives/register/html/reportList.html', 'StudentArchives_ReportRegister_Report', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 2, '6ca6e919c57549adb34d830272b80b8d', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,6ca6e919c57549adb34d830272b80b8d,6ca6e919c57549adb34d830272b80b8d,e8c1a505dad0453a9922d4490ade336b', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('faad108ccdb84efa9201319c8f33efb9', '办理报到', 3, 'fa fa-th', '', 'StudentArchives_ReportRegister_Report_Report', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, 'e8c1a505dad0453a9922d4490ade336b', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,6ca6e919c57549adb34d830272b80b8d,6ca6e919c57549adb34d830272b80b8d,e8c1a505dad0453a9922d4490ade336b,e8c1a505dad0453a9922d4490ade336b,faad108ccdb84efa9201319c8f33efb9', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('c4d6363e78cf4539a53900ec64116f6b', '撤销报到', 3, 'fa fa-th', '', 'StudentArchives_ReportRegister_Report_Revoke', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, 'e8c1a505dad0453a9922d4490ade336b', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,6ca6e919c57549adb34d830272b80b8d,6ca6e919c57549adb34d830272b80b8d,e8c1a505dad0453a9922d4490ade336b,e8c1a505dad0453a9922d4490ade336b,c4d6363e78cf4539a53900ec64116f6b', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('790d826193a949d38e064b7f677d54af', '批量注册', 2, 'fa fa-dropbox', 'studentarchives/register/html/batchRegister.html', 'StudentArchives_ReportRegister_BatchRegister', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '6ca6e919c57549adb34d830272b80b8d', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,6ca6e919c57549adb34d830272b80b8d,6ca6e919c57549adb34d830272b80b8d,790d826193a949d38e064b7f677d54af', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('db5dfd48d3c74ebf9c239991086e8b4f', '办理学生注册', 2, 'fa fa-bandcamp', 'studentarchives/register/html/registerlist.html', 'StudentArchives_ReportRegister_Register', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 2, '6ca6e919c57549adb34d830272b80b8d', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,6ca6e919c57549adb34d830272b80b8d,6ca6e919c57549adb34d830272b80b8d,db5dfd48d3c74ebf9c239991086e8b4f', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('673c0a8c57914973bb7e684f51179d15', '办理注册', 3, 'fa fa-th', '', 'StudentArchives_ReportRegister_Register_Register', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, 'db5dfd48d3c74ebf9c239991086e8b4f', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,6ca6e919c57549adb34d830272b80b8d,6ca6e919c57549adb34d830272b80b8d,db5dfd48d3c74ebf9c239991086e8b4f,db5dfd48d3c74ebf9c239991086e8b4f,673c0a8c57914973bb7e684f51179d15', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('032fcb0118fb416cbf4d543ee4113722', '撤销注册', 3, 'fa fa-th', '', 'StudentArchives_ReportRegister_Register_Revoke', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, 'db5dfd48d3c74ebf9c239991086e8b4f', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,6ca6e919c57549adb34d830272b80b8d,6ca6e919c57549adb34d830272b80b8d,db5dfd48d3c74ebf9c239991086e8b4f,db5dfd48d3c74ebf9c239991086e8b4f,032fcb0118fb416cbf4d543ee4113722', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('4933a25c99cb4f1db4aacedd066c8abe', '报到学生名单', 2, 'fa fa-window-restore', 'studentarchives/register/html/reportRollList.html', 'StudentArchives_ReportRegister_ReportStudentRoll', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 1, '6ca6e919c57549adb34d830272b80b8d', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,6ca6e919c57549adb34d830272b80b8d,6ca6e919c57549adb34d830272b80b8d,4933a25c99cb4f1db4aacedd066c8abe', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('52e0ef6137f243719ba55ba5df6ad79b', '导出', 3, 'fa fa-th', '', 'StudentArchives_ReportRegister_ReportStudentRoll_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '4933a25c99cb4f1db4aacedd066c8abe', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,6ca6e919c57549adb34d830272b80b8d,6ca6e919c57549adb34d830272b80b8d,4933a25c99cb4f1db4aacedd066c8abe,4933a25c99cb4f1db4aacedd066c8abe,52e0ef6137f243719ba55ba5df6ad79b', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('1fd86fef09a947c3a24cd6dfeb595d23', '注册学生名单', 2, 'fa fa-clone', 'studentarchives/register/html/registerRollList.html', 'StudentArchives_ReportRegister_RegisterStudentRoll', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 1, '6ca6e919c57549adb34d830272b80b8d', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,6ca6e919c57549adb34d830272b80b8d,6ca6e919c57549adb34d830272b80b8d,1fd86fef09a947c3a24cd6dfeb595d23', 6, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('ae90092202bf4c8b8280b27c88b3614c', '导出', 3, 'fa fa-th', '', 'StudentArchives_ReportRegister_RegisterStudentRoll_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '1fd86fef09a947c3a24cd6dfeb595d23', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,6ca6e919c57549adb34d830272b80b8d,6ca6e919c57549adb34d830272b80b8d,1fd86fef09a947c3a24cd6dfeb595d23,1fd86fef09a947c3a24cd6dfeb595d23,ae90092202bf4c8b8280b27c88b3614c', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('13d50d7ae2c84d52b41b66f3ac69af75', '学籍异动', 1, 'fa fa-magnet', '', 'StudentArchives_AlienChange', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 4, 'd4bca07168f440c6957e61551abbb2a9', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,13d50d7ae2c84d52b41b66f3ac69af75', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('895a1c67381345dbaf9e813cb00a76cd', '开放学生申请异动控制', 2, 'fa fa-expeditedssl', 'studentarchives/alienChange/html/apply.html', 'StudentArchives_AlienChange_ApplySetting', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '13d50d7ae2c84d52b41b66f3ac69af75', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,13d50d7ae2c84d52b41b66f3ac69af75,13d50d7ae2c84d52b41b66f3ac69af75,895a1c67381345dbaf9e813cb00a76cd', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('7b025ae27e0e4aca8dd729078d6bbb11', '异动规定设置', 2, 'fa fa-cog', 'studentarchives/alienChange/html/settingList.html', 'StudentArchives_AlienChange_RuleSetting', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 3, '13d50d7ae2c84d52b41b66f3ac69af75', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,13d50d7ae2c84d52b41b66f3ac69af75,13d50d7ae2c84d52b41b66f3ac69af75,7b025ae27e0e4aca8dd729078d6bbb11', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('e06b9b1532ea4b2ba60a762a280e4743', '设置', 3, 'fa fa-th', '', 'StudentArchives_AlienChange_RuleSetting_Setting', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '7b025ae27e0e4aca8dd729078d6bbb11', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,13d50d7ae2c84d52b41b66f3ac69af75,13d50d7ae2c84d52b41b66f3ac69af75,7b025ae27e0e4aca8dd729078d6bbb11,7b025ae27e0e4aca8dd729078d6bbb11,e06b9b1532ea4b2ba60a762a280e4743', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('7d23f666565d4cb4b40978ec8acdaded', '启用', 3, 'fa fa-th', '', 'StudentArchives_AlienChange_RuleSetting_Enable', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '7b025ae27e0e4aca8dd729078d6bbb11', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,13d50d7ae2c84d52b41b66f3ac69af75,13d50d7ae2c84d52b41b66f3ac69af75,7b025ae27e0e4aca8dd729078d6bbb11,7b025ae27e0e4aca8dd729078d6bbb11,7d23f666565d4cb4b40978ec8acdaded', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('4c58ebf8ea484f42b30df39c5691d2ad', '禁用', 3, 'fa fa-th', '', 'StudentArchives_AlienChange_RuleSetting_Disable', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '7b025ae27e0e4aca8dd729078d6bbb11', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,13d50d7ae2c84d52b41b66f3ac69af75,13d50d7ae2c84d52b41b66f3ac69af75,7b025ae27e0e4aca8dd729078d6bbb11,7b025ae27e0e4aca8dd729078d6bbb11,4c58ebf8ea484f42b30df39c5691d2ad', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('85cc986091dc47aaa9f486f6b5c9a352', '异动申请登记', 2, 'fa fa-pencil-square-o', 'studentarchives/alienChange/html/registerList.html', 'StudentArchives_AlienChange_ApplyRegister', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 4, '13d50d7ae2c84d52b41b66f3ac69af75', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,13d50d7ae2c84d52b41b66f3ac69af75,13d50d7ae2c84d52b41b66f3ac69af75,85cc986091dc47aaa9f486f6b5c9a352', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('f73ce3e3b75044ff8e3ab75e385f17b0', '登记', 3, 'fa fa-th', '', 'StudentArchives_AlienChange_ApplyRegister_Register', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '85cc986091dc47aaa9f486f6b5c9a352', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,13d50d7ae2c84d52b41b66f3ac69af75,13d50d7ae2c84d52b41b66f3ac69af75,85cc986091dc47aaa9f486f6b5c9a352,85cc986091dc47aaa9f486f6b5c9a352,f73ce3e3b75044ff8e3ab75e385f17b0', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('ffb854248954409eaf5b729b661ee874', '修改', 3, 'fa fa-th', '', 'StudentArchives_AlienChange_ApplyRegister_Update', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '85cc986091dc47aaa9f486f6b5c9a352', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,13d50d7ae2c84d52b41b66f3ac69af75,13d50d7ae2c84d52b41b66f3ac69af75,85cc986091dc47aaa9f486f6b5c9a352,85cc986091dc47aaa9f486f6b5c9a352,ffb854248954409eaf5b729b661ee874', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('987c429ebbd443eb97f4c3bddf554805', '删除', 3, 'fa fa-th', '', 'StudentArchives_AlienChange_ApplyRegister_Delete', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '85cc986091dc47aaa9f486f6b5c9a352', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,13d50d7ae2c84d52b41b66f3ac69af75,13d50d7ae2c84d52b41b66f3ac69af75,85cc986091dc47aaa9f486f6b5c9a352,85cc986091dc47aaa9f486f6b5c9a352,987c429ebbd443eb97f4c3bddf554805', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('3a2c5f6c255147caa7c403fa357440bb', '导出', 3, 'fa fa-th', '', 'StudentArchives_AlienChange_ApplyRegister_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '85cc986091dc47aaa9f486f6b5c9a352', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,13d50d7ae2c84d52b41b66f3ac69af75,13d50d7ae2c84d52b41b66f3ac69af75,85cc986091dc47aaa9f486f6b5c9a352,85cc986091dc47aaa9f486f6b5c9a352,3a2c5f6c255147caa7c403fa357440bb', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('cff392dd3ecc48d3aea40b4eb9eac8d0', '异动申请处理', 2, 'fa fa-check-square-o', 'studentarchives/alienChange/html/dealList.html', 'StudentArchives_AlienChange_ApplyDeal', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 3, '13d50d7ae2c84d52b41b66f3ac69af75', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,13d50d7ae2c84d52b41b66f3ac69af75,13d50d7ae2c84d52b41b66f3ac69af75,cff392dd3ecc48d3aea40b4eb9eac8d0', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
insert into tsys_menu values ('38424ee2a3174556a971a6546208c59c', '异动处理', 3, 'fa fa-th', '', 'StudentArchives_AlienChange_ApplyDeal_Deal', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, 'cff392dd3ecc48d3aea40b4eb9eac8d0', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,13d50d7ae2c84d52b41b66f3ac69af75,13d50d7ae2c84d52b41b66f3ac69af75,cff392dd3ecc48d3aea40b4eb9eac8d0,cff392dd3ecc48d3aea40b4eb9eac8d0,38424ee2a3174556a971a6546208c59c', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('82d4934300564863a90087e2e095357b', '取消异动', 3, 'fa fa-th', '', 'StudentArchives_AlienChange_ApplyDeal_Cancel', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, 'cff392dd3ecc48d3aea40b4eb9eac8d0', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,13d50d7ae2c84d52b41b66f3ac69af75,13d50d7ae2c84d52b41b66f3ac69af75,cff392dd3ecc48d3aea40b4eb9eac8d0,cff392dd3ecc48d3aea40b4eb9eac8d0,82d4934300564863a90087e2e095357b', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('d52371f70b02486987c87d0106e43da2', '导出', 3, 'fa fa-th', '', 'StudentArchives_AlienChange_ApplyDeal_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, 'cff392dd3ecc48d3aea40b4eb9eac8d0', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,13d50d7ae2c84d52b41b66f3ac69af75,13d50d7ae2c84d52b41b66f3ac69af75,cff392dd3ecc48d3aea40b4eb9eac8d0,cff392dd3ecc48d3aea40b4eb9eac8d0,d52371f70b02486987c87d0106e43da2', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('ed25932934d441e9b159032e5795a139', '学籍报表', 1, 'fa fa-server', '', 'StudentArchives_Statistics', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 4, 'd4bca07168f440c6957e61551abbb2a9', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,ed25932934d441e9b159032e5795a139', 6, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('77e8eecf100c4893a4c604f3656f1655', '打印学籍卡', 2, 'fa fa-print', 'studentarchives/statistics/html/studentArchivesCardList.html', 'StudentArchives_Statistics_StudentArchivesCard', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 2, 'ed25932934d441e9b159032e5795a139', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,ed25932934d441e9b159032e5795a139,ed25932934d441e9b159032e5795a139,77e8eecf100c4893a4c604f3656f1655', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('f24bb37fcc5a43f4930210e883854b85', '打印', 3, 'fa fa-th', '', 'StudentArchives_Statistics_StudentArchivesCard_Print', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '77e8eecf100c4893a4c604f3656f1655', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,ed25932934d441e9b159032e5795a139,ed25932934d441e9b159032e5795a139,77e8eecf100c4893a4c604f3656f1655,77e8eecf100c4893a4c604f3656f1655,f24bb37fcc5a43f4930210e883854b85', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
insert into tsys_menu values ('6ac0c37e00fa4aac96cabf17f5707e4f', '导出', 3, 'fa fa-th', '', 'StudentArchives_Statistics_StudentArchivesCard_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '77e8eecf100c4893a4c604f3656f1655', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,ed25932934d441e9b159032e5795a139,ed25932934d441e9b159032e5795a139,77e8eecf100c4893a4c604f3656f1655,77e8eecf100c4893a4c604f3656f1655,6ac0c37e00fa4aac96cabf17f5707e4f', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
insert into tsys_menu values ('18fa035cae9c431ebddcbd3bc2817cf9', '学生名册', 2, 'fa fa-th', 'studentarchives/statistics/html/studentRollList.html', 'StudentArchives_Statistics_StudentRoll', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 1, 'ed25932934d441e9b159032e5795a139', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,ed25932934d441e9b159032e5795a139,ed25932934d441e9b159032e5795a139,18fa035cae9c431ebddcbd3bc2817cf9', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('f7b453ba9e794b47a5785db6d5bf1e12', '导出', 3, 'fa fa-th', '', 'StudentArchives_Statistics_StudentRoll_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '18fa035cae9c431ebddcbd3bc2817cf9', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,ed25932934d441e9b159032e5795a139,ed25932934d441e9b159032e5795a139,18fa035cae9c431ebddcbd3bc2817cf9,18fa035cae9c431ebddcbd3bc2817cf9,f7b453ba9e794b47a5785db6d5bf1e12', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('c5df0dcd7b594e1285c8728ae270a8f5', '按班级统计在校学生数', 2, 'fa fa-area-chart', 'studentarchives/statistics/html/numberOfClassList.html', 'StudentArchives_Statistics_StudentNumberOfClass', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 1, 'ed25932934d441e9b159032e5795a139', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,ed25932934d441e9b159032e5795a139,ed25932934d441e9b159032e5795a139,c5df0dcd7b594e1285c8728ae270a8f5', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('c2675617ee284846933610576e76be4d', '导出', 3, 'fa fa-th', '', 'StudentArchives_Statistics_StudentNumberOfClass_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, 'c5df0dcd7b594e1285c8728ae270a8f5', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,ed25932934d441e9b159032e5795a139,ed25932934d441e9b159032e5795a139,c5df0dcd7b594e1285c8728ae270a8f5,c5df0dcd7b594e1285c8728ae270a8f5,c2675617ee284846933610576e76be4d', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('456c6bca432e4e3f8869c0dcedf32a3c', '按院系统计在校学生数', 2, 'fa fa-industry', 'studentarchives/statistics/html/numberOfDepartmentList.html', 'StudentArchives_Statistics_StudentNumberOfDepartment', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 1, 'ed25932934d441e9b159032e5795a139', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,ed25932934d441e9b159032e5795a139,ed25932934d441e9b159032e5795a139,456c6bca432e4e3f8869c0dcedf32a3c', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('c65d439d46fc4a41afb669fac2bf76d4', '导出', 3, 'fa fa-th', '', 'StudentArchives_Statistics_StudentNumberOfDepartment_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '456c6bca432e4e3f8869c0dcedf32a3c', '0,d4bca07168f440c6957e61551abbb2a9,d4bca07168f440c6957e61551abbb2a9,ed25932934d441e9b159032e5795a139,ed25932934d441e9b159032e5795a139,456c6bca432e4e3f8869c0dcedf32a3c,456c6bca432e4e3f8869c0dcedf32a3c,c65d439d46fc4a41afb669fac2bf76d4', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);


/*
 学籍管理--删除教务系统管理员角色原有的菜单权限
*/ 
delete from TSYS_ROLE_MENU_PERMISSION WHERE ROLE_ID = '2' AND MENU_ID IN (select MENU_ID from tsys_menu where parent_id_list like '%,d4bca07168f440c6957e61551abbb2a9%');
commit;

/*
 学籍管理--给教务系统管理员角色授予毕业系统菜单权限
*/ 
insert into TSYS_ROLE_MENU_PERMISSION  select SYS_GUID(),'2',MENU_ID from tsys_menu where parent_id_list like '%,d4bca07168f440c6957e61551abbb2a9%';
commit;

--初始化学生修改个人信息控制
-- 如果存在信息控制先删除
DELETE  tstu_student_setting t where t.SETTING_ID='6855b596c08e4013871496fa448cfe1e';
DELETE  tstu_student_setting_fields t where t.SETTING_ID in ('6855b596c08e4013871496fa448cfe1e');
INSERT INTO tstu_student_setting VALUES ('6855b596c08e4013871496fa448cfe1e',NULL,NULL,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO tstu_student_setting_fields values('b986755883fa47b19d9cd741075e6c03','6855b596c08e4013871496fa448cfe1e','NAME_SPELL','姓名拼音',0,1);
INSERT INTO tstu_student_setting_fields values('40f0b9044c46434ab88ceb42ef71e168','6855b596c08e4013871496fa448cfe1e','USED_NAME','曾用名',0,1);
INSERT INTO tstu_student_setting_fields values('3a9e187a267d4efca668ccea490ecded','6855b596c08e4013871496fa448cfe1e','SEX_CODE','性别',0,1);
INSERT INTO tstu_student_setting_fields values('3344531e385c4e0995a23123a33ca320','6855b596c08e4013871496fa448cfe1e','BIRTHDAY','出生日期',0,1);
INSERT INTO tstu_student_setting_fields values('31006e43182944928d5cc4738b7d18c8','6855b596c08e4013871496fa448cfe1e','POLITICAL_STATUS_CODE','政治面貌',0,1);
INSERT INTO tstu_student_setting_fields values('d78fcad41cf047caaac6e6b9ec7c73bd','6855b596c08e4013871496fa448cfe1e','BIRTH_PROVINCE_CODE','出生地',0,1);
INSERT INTO tstu_student_setting_fields values('464a096419e249b8b215a6a3346b696e','6855b596c08e4013871496fa448cfe1e','NATIVE_PLACE','籍贯',0,1);
INSERT INTO tstu_student_setting_fields values('9a9c84d9e32d4e229f9db5831808da27','6855b596c08e4013871496fa448cfe1e','NATION_CODE','民族',0,1);
INSERT INTO tstu_student_setting_fields values('951db010f7944de6900004398a10c523','6855b596c08e4013871496fa448cfe1e','NATIONALITY_CODE','国籍',0,1);
INSERT INTO tstu_student_setting_fields values('7cb7dd9b60994f8fb3abbcdf19db5fea','6855b596c08e4013871496fa448cfe1e','OVERSEAS_CHINESE_CODE','港澳台侨胞',0,1);
INSERT INTO tstu_student_setting_fields values('1deff1ff70b147779750399683dbbc07','6855b596c08e4013871496fa448cfe1e','FAITH_CODE','宗教信仰',0,1);
INSERT INTO tstu_student_setting_fields values('1e2ce97a5df64b27bd2bf56cf2a7d143','6855b596c08e4013871496fa448cfe1e','MARITAL_STATUS_CODE','婚姻状况',0,1);
INSERT INTO tstu_student_setting_fields values('2848d4c6af2c440fad27974f545d89d7','6855b596c08e4013871496fa448cfe1e','HEALTH_CODE','健康状况',0,1);
INSERT INTO tstu_student_setting_fields values('4804bfe1c84f4b03853d77149058f858','6855b596c08e4013871496fa448cfe1e','IS_ONLY_CHILD','是否独生子女',0,1);
INSERT INTO tstu_student_setting_fields values('1bcb3e9b44af49cbbd9496bc131796c2','6855b596c08e4013871496fa448cfe1e','QQ','QQ号码',0,1);
INSERT INTO tstu_student_setting_fields values('01ef50b80534499cb43996a2961bf6f0','6855b596c08e4013871496fa448cfe1e','WECHAT','微信号码',0,1);
INSERT INTO tstu_student_setting_fields values('f7d9a75035ad4748a6054097eceadbef','6855b596c08e4013871496fa448cfe1e','MOBILE_PHONE','手机号码',0,1);
INSERT INTO tstu_student_setting_fields values('a31a8ed07e1a4f29bf642d882ad2d467','6855b596c08e4013871496fa448cfe1e','CONTACT_PERSON','联系人',0,1);
INSERT INTO tstu_student_setting_fields values('0234f4ce10824e89a6665d303e9b3fc5','6855b596c08e4013871496fa448cfe1e','CONTACT_PHONE','联系人电话',0,1);
INSERT INTO tstu_student_setting_fields values('f3643bb40cfc4b9abf06e73320d75983','6855b596c08e4013871496fa448cfe1e','POSTAL_CODE','邮政编码',0,1);
INSERT INTO tstu_student_setting_fields values('76432df943ae439092eb15e836cfefd5','6855b596c08e4013871496fa448cfe1e','EMAIL','电子邮箱',0,1);
INSERT INTO tstu_student_setting_fields values('fbc636a13b0341439dfc579c1c326ca2','6855b596c08e4013871496fa448cfe1e','ADDRESS','联系地址',0,1);
INSERT INTO tstu_student_setting_fields values('d81bb935d83c4d5aaa4ad3e6fdb30e09','6855b596c08e4013871496fa448cfe1e','FILE_ID','允许上传照片',0,1);
INSERT INTO tstu_student_setting_fields values('233e725aa5a7432ab77753f58ae338e6','6855b596c08e4013871496fa448cfe1e','FROM_PROVINCE_CODE','生源地区',0,1);
INSERT INTO tstu_student_setting_fields values('64f5f8cc87014187aa26fac994262293','6855b596c08e4013871496fa448cfe1e','REMARK','备注',0,1);
--初始化异动规定设置
-- 如果存在设置先删除
DELETE  TSTU_ALIENCHANGE_SETTING;
DELETE  TSTU_ALIENCHANGE_PRE_CONDITION;
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('caf0b29c613c45048ce223fd296543d2','01','公派留学',0,'002','13','001',0,'0','',1,1,0,0,0,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('de24425537744a4caae8ce82c42e1275','02','留级',0,'001','01','001',1,'1','',1,1,1,1,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('687b59f5a52e4394bc4abe183f57837d','03','降级',0,'001','01','001',1,'2','',1,1,1,1,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('945494f3606f4458b72043accb7d8b72','04','跳级',0,'001','01','001',1,'-1','',1,1,1,1,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('d041f733f79f4d50a8c9274938a32158','05','试读',0,'001','01','002',0,'0','',1,1,0,0,0,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('c7ce44bcd519470b9e6e303dfc94e3c3','06','延长年限',0,'001','01','001',1,'7','',1,1,1,1,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('cdcb11c0065f4bc0bef0693f420447dd','07','试读通过',0,'001','01','001',1,'0','',1,1,1,1,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('440cf64b23b0464e966a45d7833c58db','08','回国复学',0,'001','05','001',1,'7','',1,1,1,1,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('9670c41ee5a74e37905f8e6110e616ce','11','休学',0,'002','02','001',0,'0','',1,1,0,0,0,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('049e1f601e4842538022bdfbc83beb48','12','复学',0,'001','05','001',1,'7','',1,1,1,1,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('cad1fa1f88504ed19cdafd79a1d0255d','13','停学',0,'002','04','001',0,'0','',1,1,0,0,0,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('f3ccfe72f96c46c6b1df8f206d905433','14','保留入学资格',0,'002','12','001',0,'0','',1,1,0,0,0,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('76854073de93479489988ad2294c6911','15','恢复入学资格',0,'001','01','001',1,'7','',1,1,1,1,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('47a6cc1479d746c2be9139d0ee9ab08c','16','取消入学资格',0,'002','03','002',0,'0','',1,1,0,0,0,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('5f7ea4c5a65c40b080d48d57b4b200ce','17','恢复学籍',0,'001','01','001',1,'7','',1,1,1,1,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('1a1183df253046d5b112af1e5ff4e5c8','18','取消学籍',0,'002','03','002',0,'0','',1,1,0,0,0,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('2a388148126b4eee872f1d1f0bec52ce','19','保留学籍',0,'002','04','001',0,'0','',1,1,0,0,0,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('3f68e9c6079940e6b556cf9332f46473','21','转学（转出）',0,'002','10','002',0,'0','',1,1,0,0,0,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('c928ac2a610b4f84a4df58ec8f3eac8c','22','转学（转入）',0,'001','01','001',1,'7','',1,1,1,1,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('cad2d714c3f94e6599b4c56d0b9fadad','23','转专业',1,'001','01','001',1,'0','',1,1,1,1,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('f79395e079d741a8a0f5a477ab2bf251','24','专升本',0,'001','01','001',1,'7','3',1,1,1,1,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('d1b5b98cc3524f028db974facc8d56be','25','本转专',0,'001','01','001',1,'7','4',1,1,1,1,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('2b3dd111c69d41f88d39297223564469','26','转系',0,'001','01','001',1,'0','',1,1,1,1,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('bf252dcacedb44558ac6d1412c2b8aac','29','转班级',0,'001','01','001',1,'0','',1,1,1,1,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('406a3bddf4f34aa3aadee383a22e097b','31','退学',0,'002','03','002',0,'0','',1,1,0,0,0,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('756092e44370413383afb1be73fadab7','42','开除学籍',0,'002','14','002',0,'0','',1,1,0,0,0,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('c0af2d0879fe44b6bad97697c9f03b87','51','死亡',0,'002','11','002',0,'0','',1,1,0,0,0,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('4b265ec838324e1388501051c782a1f9','64','国内访学',0,'002','01','001',0,'0','',1,1,0,0,0,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('32b9ba8a93a941d29a58ffe7279de54b','65','国内访学后返校',0,'001','01','001',1,'7','',1,1,1,1,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
INSERT INTO TSTU_ALIENCHANGE_SETTING VALUES ('d3855cd2fdb445af8ebd49cab11ab0b5','99','其他',0,'-1','-1','-1',1,'0','',0,1,1,1,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);
--初始化异动类别前置条件
INSERT INTO TSTU_ALIENCHANGE_PRE_CONDITION VALUES ('c68981e83605499f86a96074897004ed','07','05');
INSERT INTO TSTU_ALIENCHANGE_PRE_CONDITION VALUES ('fda8839d0bf04c2bab085a50da6420ad','08','01');
INSERT INTO TSTU_ALIENCHANGE_PRE_CONDITION VALUES ('effd48d4223b49c399ed3acba666bc48','12','11');
INSERT INTO TSTU_ALIENCHANGE_PRE_CONDITION VALUES ('1c39469a0f994d86819145ee33e00830','12','13');
INSERT INTO TSTU_ALIENCHANGE_PRE_CONDITION VALUES ('1f90d742ce714fd18979b5d27a6671c5','15','14');
INSERT INTO TSTU_ALIENCHANGE_PRE_CONDITION VALUES ('0a3e084067d64627ad4f8868a567d1de','16','14');
INSERT INTO TSTU_ALIENCHANGE_PRE_CONDITION VALUES ('a7d21d43a8084a988086b11399be61dd','17','19');
INSERT INTO TSTU_ALIENCHANGE_PRE_CONDITION VALUES ('e0ed1cee2f4c4161a7337cf0def0bb98','18','19');
INSERT INTO TSTU_ALIENCHANGE_PRE_CONDITION VALUES ('2b39b8c9239e4996b3a923187d8b4b1b','65','64');


CREATE OR REPLACE VIEW VSTU_STUDENTCOUNT AS 
select rawtohex(sys_guid()) AS ID,ACADEMICYEARSEMESTER,DEPARTMENT_ID,DEPARTMENT_NAME,DEPARTMENT_NO,CLASS_ID,CLASS_NAME,TRAINING_LEVEL_CODE,count(*) as STUDENTCOUNT 
from VSTU_STUDENTROLL where SCHOOL_STATUS_CODE='001' group BY ACADEMICYEARSEMESTER,DEPARTMENT_ID,DEPARTMENT_NAME,DEPARTMENT_NO,CLASS_NAME,CLASS_ID,TRAINING_LEVEL_CODE;


commit;
