/*
 基础数据--对象创建
*/
declare
      num   number;
begin
    select count(1) into num from user_tables where table_name = upper('TSYS_SCHOOL') ;
    if num > 0 then
        execute immediate 'drop table TSYS_SCHOOL' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSYS_CAMPUS') ;
    if num > 0 then
        execute immediate 'drop table TSYS_CAMPUS' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSYS_DEPARTMENT') ;
    if num > 0 then
        execute immediate 'drop table TSYS_DEPARTMENT' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSYS_TEACHER') ;
    if num > 0 then
        execute immediate 'drop table TSYS_TEACHER' ;
    end if;
    
    select count(1) into num from user_tables where table_name = upper('TSYS_MAJOR') ;
    if num > 0 then
        execute immediate 'drop table TSYS_MAJOR' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSYS_BUILDING') ;
    if num > 0 then
        execute immediate 'drop table TSYS_BUILDING' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSYS_VENUE') ;
    if num > 0 then
        execute immediate 'drop table TSYS_VENUE' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSYS_SCHOOL_CALENDAR') ;
    if num > 0 then
        execute immediate 'drop table TSYS_SCHOOL_CALENDAR' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSYS_DATA_AUTHORITY_DETAIL') ;
    if num > 0 then
        execute immediate 'drop table TSYS_DATA_AUTHORITY_DETAIL' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSYS_FILE') ;
    if num > 0 then
        execute immediate 'drop table TSYS_FILE' ;
    end if;
	
	select count(1) into num from user_tables where table_name = upper('TSYS_DEPARTMENT_USER') ;
    if num > 0 then
        execute immediate 'drop table TSYS_DEPARTMENT_USER' ;
    end if;
	
	select count(1) into num from user_tables where table_name = upper('TSYS_SUBJECT') ;
    if num > 0 then
        execute immediate 'drop table TSYS_SUBJECT' ;
    end if;
	
	select count(1) into num from user_tables where table_name = upper('TSYS_CANTON') ;
    if num > 0 then
        execute immediate 'drop table TSYS_CANTON' ;
    end if;
end;
/


/*==============================================================*/
/* Table: TSYS_CAMPUS                                           */
/*==============================================================*/
create table TSYS_CAMPUS 
(
   CAMPUS_ID            NVARCHAR2(50)        not null,
   CAMPUS_NAME          NVARCHAR2(50)        not null,
   CAMPUS_NO            NVARCHAR2(50)        not null,
   ADDRESS              NVARCHAR2(100),
   POSTAL_CODE          NVARCHAR2(50),
   TELEPHONE            NVARCHAR2(50),
   FAX                  NVARCHAR2(50),
   SUPERINTENDENT       NVARCHAR2(50),
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP(6)         not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   IS_DELETED           INTEGER              not null,
   constraint PK_TSYS_CAMPUS primary key (CAMPUS_ID)
);

/*==============================================================*/
/* Table: TSYS_SCHOOL                                         */
/*==============================================================*/
create table TSYS_SCHOOL 
(
   SCHOOL_ID            NVARCHAR2(50)        not null,
   SCHOOL_CODE          NVARCHAR2(50)        not null,
   SCHOOL_NAME          NVARCHAR2(100)       not null,
   ENGLISH_NAME         NVARCHAR2(200),
   SCHOOL_QUALITY_CODE  NVARCHAR2(50)        not null,
   SCHOOL_TYPE_CODE     NVARCHAR2(50)        not null,
   SPONSOR_CODE         NVARCHAR2(50),
   MANAGEMENT_DEPARTMENT NVARCHAR2(50),
   LEGAL_PERSON_NO      NVARCHAR2(50),
   LEGAL_PERSON_CERTIFICATE_NO NVARCHAR2(50),
   PRINCIPAL            NVARCHAR2(50),
   PARTYCOMMITTEE_SUPERINTENDENT NVARCHAR2(50),
   SCHOOL_CREATE_YEAR   DATE,
   SCHOOL_CREATE_DAY    NVARCHAR2(50),
   SUBJECT_CATEGORY_AMOUNT INTEGER,
   HISTORY              NVARCHAR2(1000),
   PROVINCE             NVARCHAR2(50),
   CITY                 NVARCHAR2(50),
   AREA                 NVARCHAR2(50),
   TELEPHONE            NVARCHAR2(50),
   FAX                  NVARCHAR2(50),
   EMAIL                NVARCHAR2(50),
   POSTAL_CODE          NVARCHAR2(50),
   SCHOOL_ADDRESS       NVARCHAR2(100),
   WEBSITE              NVARCHAR2(100),
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP(6)         not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   constraint PK_TSYS_SCHOOL primary key (SCHOOL_ID)
);

/*==============================================================*/
/* Table: TSYS_DEPARTMENT                                    */
/*==============================================================*/
create table TSYS_DEPARTMENT 
(
   DEPARTMENT_ID        NVARCHAR2(50)        not null,
   DEPARTMENT_NAME      NVARCHAR2(100)       not null,
   DEPARTMENT_NO        NVARCHAR2(100)       not null,
   ENGLISH_NAME         NVARCHAR2(100),
   SHORT_NAME           NVARCHAR2(50),
   PARENT_ID            NVARCHAR2(50),
   DEPARTMENT_CLASS_CODE NVARCHAR2(50),
   DEPARTMENT_TYPE_CODE NVARCHAR2(50),
   STARTUP_TYPE_CODE    NVARCHAR2(50)        not null,
   CAMPUS_ID            NVARCHAR2(50)        not null,
   SUPERINTENDENT       NVARCHAR2(50),
   IS_VALIDITY          INTEGER,
   IS_ENTITY            INTEGER,
   OUTVALIDITY_TIME     date,
   STARTUP_TIME         date,
   ADDRESS              NVARCHAR2(100),
   REMARK               NVARCHAR2(200),
   IS_EDUCATION_ADMINISTRATION INTEGER,
   IS_DELETED           INTEGER              not null,
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP(6)         not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   CHILD_COUNT          INTEGER              not null,
   PARENT_ID_LIST       NVARCHAR2(300)       not null,
   IS_START_CLASS       INTEGER              default 1,
   constraint PK_TSYS_DEPARTMENT primary key (DEPARTMENT_ID)
);

/*==============================================================*/
/* Table: TSYS_USER  教师信息                                            */
/*==============================================================*/
create table TSYS_TEACHER 
(
   USER_ID              NVARCHAR2(50)        not null,
   TEACHER_NO           NVARCHAR2(50)        not null,
   TEACHER_NAME         NVARCHAR2(50)        not null,
   USED_NAME            NVARCHAR2(50),
   SEX_CODE             NVARCHAR2(50)        not null,
   ID_CARD_TYPE_CODE    NVARCHAR2(50),
   ID_CARD              NVARCHAR2(50)        not null,
   BIRTHDAY             DATE,
   NATIVE_PLACE         NVARCHAR2(200),
   NATION_CODE          NVARCHAR2(50),
   NATIONALITY_CODE     NVARCHAR2(50),
   FILE_ID              NVARCHAR2(50),
   MARITAL_STATUS_CODE  NVARCHAR2(50),
   OVERSEAS_CHINESE_CODE NVARCHAR2(50),
   POLITICAL_STATUS_CODE NVARCHAR2(50),
   HEALTH_CODE          NVARCHAR2(50),
   CAMPUS_ID            NVARCHAR2(50),
   HIGHEST_EDUCATION_CODE NVARCHAR2(50),
   HIGHEST_DEGREE_CODE  NVARCHAR2(50),
   HIGHEST_TITLE_CODE   NVARCHAR2(50),
   ADMINISTRATIVE_DUTY  NVARCHAR2(100),
   TEACHER_TYPE_CODE    NVARCHAR2(50),
   WORKING_DATE         DATE,
   ARRIVAL_DATE         DATE,
   TEACHING_DATE        DATE,
   COMPILATION_CATEGORY_CODE NVARCHAR2(50),
   STAFF_CATEGORY_CODE  NVARCHAR2(50),
   CLASSROOM_SITUATION_CODE NVARCHAR2(50),
   CURRENT_STATE        NVARCHAR2(50),
   RESEARCH_DIRECTION   NVARCHAR2(50),
   OFFICE_PHONE         NVARCHAR2(50),
   MOBILE_PHONE         NVARCHAR2(50),
   FAX                  NVARCHAR2(50),
   EMAIL                NVARCHAR2(50),
   QQ                   NVARCHAR2(50),
   WECHAT               NVARCHAR2(50),
   POSTAL_CODE          NVARCHAR2(50),
   ADDRESS              NVARCHAR2(200),
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP(6)         not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   constraint PK_TSYS_TEACHER primary key (USER_ID)
);
ALTER TABLE TSYS_TEACHER ADD CONSTRAINT  UK_TSYS_TEACHER_TEACHER_NO UNIQUE (TEACHER_NO);


/*==============================================================*/
/* Table: TSYS_MAJOR                                          */
/*==============================================================*/
create table TSYS_MAJOR 
(
   MAJOR_ID             NVARCHAR2(50)        not null,
   MAJOR_NO             NVARCHAR2(50)        not null,
   MAJOR_NAME           NVARCHAR2(50)        not null,
   SHORT_NAME           NVARCHAR2(50),
   ENGLISH_NAME         NVARCHAR2(100),
   DEPARTMENT_ID        NVARCHAR2(50)        not null,
   ESTABLISH_TIME       DATE,
   EDUCATION_SYSTEM     INTEGER              not null,
   TRAINING_LEVEL_CODE  NVARCHAR2(50)        not null,
   SUBJECT_CODE         NVARCHAR2(50)        not null,
   SUBJECT_CATEGORY_CODE NVARCHAR2(50),
   IS_DELETED           INTEGER              not null,
   PROFESSIONAL_DEGREE_ID NVARCHAR2(50),
   REMARK               NVARCHAR2(100),
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP(6)         not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   constraint PK_TSYS_MAJOR primary key (MAJOR_ID)
);

/*==============================================================*/
/* Table: TSYS_BUILDING                                        */
/*==============================================================*/
create table TSYS_BUILDING 
(
   BUILDING_ID          NVARCHAR2(50)        not null,
   BUILDING_NO          NVARCHAR2(50)        not null,
   BUILDING_NAME        NVARCHAR2(50)        not null,
   CAMPUS_ID            NVARCHAR2(50)        not null,
   BUILDING_TYPE_CODE   NVARCHAR2(50)        not null,
   FLOORS_QUANTITY      INTEGER,
   IS_ENABLED           INTEGER              not null,
   IS_DELETED           INTEGER              not null,
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP(6)         not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   constraint PK_TSYS_BUILDING primary key (BUILDING_ID)
);

/*==============================================================*/
/* Table: TSYS_VENUE                                             */
/*==============================================================*/
create table TSYS_VENUE 
(
   VENUE_ID             NVARCHAR2(50)        not null,
   VENUE_NO             NVARCHAR2(50)        not null,
   VENUE_NAME           NVARCHAR2(50)        not null,
   DEPARTMENT_ID        NVARCHAR2(50)        not null,
   CAMPUS_ID            NVARCHAR2(50)        not null,
   BUILDING_ID          NVARCHAR2(50)        not null,
   FLOOR                INTEGER              not null,
   VENUE_TYPE_CODE      NVARCHAR2(50)        not null,
   SEAT_AMOUNT          INTEGER              not null,
   EFFECTIVE_SEAT_AMOUNT INTEGER              not null,
   EXAMS_SEAT_AMOUNT    INTEGER              not null,
   IS_ENABLED           INTEGER              not null,
   IS_DELETED           INTEGER              not null,
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP(6)         not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   constraint PK_TSYS_VENUE primary key (VENUE_ID)
);

/*==============================================================*/
/* Table: TSYS_SCHOOL_CALENDAR                                  */
/*==============================================================*/
create table TSYS_SCHOOL_CALENDAR 
(
   SCHOOL_CALENDAR_ID   NVARCHAR2(50)        not null,
   ACADEMIC_YEAR        INTEGER              not null,
   SEMESTER_CODE        NVARCHAR2(50),
   CLASS_START_DATE     DATE,
   CLASS_STOP_DATE      DATE,
   VACATION_START_DATE  DATE,
   VACATION_STOP_DATE   DATE,
   IS_CURRENT_SEMESTER  INTEGER,
   REMARK               NVARCHAR2(500),
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP(6)         not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP(6)         not null,
   WEEK_START_DAY       INTEGER,
   constraint PK_TSYS_SCHOOL_CALENDAR primary key (SCHOOL_CALENDAR_ID)
);

/*==============================================================*/
/* Table: TSYS_SUBJECT                             */
/*==============================================================*/
create table TSYS_SUBJECT 
(
   SUBJECT_CODE         NVARCHAR2(50)        not null,
   SUBJECT_NAME         NVARCHAR2(50),
   PARENT_CODE          NVARCHAR2(50),
   IS_ENABLED           INTEGER,
   constraint PK_TSYS_SUBJECT primary key (SUBJECT_CODE)
);

/*==============================================================*/
/* Table: TSYS_CANTON                                             */
/*==============================================================*/
create table TSYS_CANTON 
(
   CANTON_CODE          NVARCHAR2(50)        not null,
   CANTON_NAME          NVARCHAR2(50),
   PARENT_CODE          NVARCHAR2(50),
   IS_ENABLED           INTEGER,
   constraint PK_TSYS_CANTON primary key (CANTON_CODE)
);

/*==============================================================*/
/* Table: TSYS_FILE                                  */
/*==============================================================*/
create table TSYS_FILE 
(
   FILE_ID              NVARCHAR2(50)        not null,
   FILE_NAME            NVARCHAR2(50)        not null,
   FILE_SIZE            INTEGER              not null,
   UPLOAD_TIME          TIMESTAMP(6)         not null,
   FILE_URL             NVARCHAR2(500)       not null,
   FILE_TYPE            INTEGER              not null,
   BUSINESS_MODULE      INTEGER              not null,
   UPLOAD_USER_ID       NVARCHAR2(50)        not null,
   constraint PK_TSYS_FILE primary key (FILE_ID)
);

/*==============================================================*/
/* Table: TSYS_DATA_AUTHORITY_DETAIL                                  */
/*==============================================================*/
create table TSYS_DATA_AUTHORITY_DETAIL 
(
   DATA_AUTHORITY_DETAIL_ID NVARCHAR2(50)        not null,
   USER_ID              NVARCHAR2(50),
   OBJECT_ID            NVARCHAR2(50)        not null,
   OBJECT_TYPE          INTEGER              not null,
   constraint PK_TSYS_DATA_AUTHORITY_DETAIL primary key (DATA_AUTHORITY_DETAIL_ID)
);

/*==============================================================*/
/* Table: TSYS_DEPARTMENT_USER                                  */
/*==============================================================*/
create table TSYS_DEPARTMENT_USER 
(
   DEPARTMENT_USER_ID     NVARCHAR2(50)        not null,
   DEPARTMENT_ID        NVARCHAR2(50),
   USER_ID              NVARCHAR2(50),
   RELATION_TYPE        INTEGER              not null,
   constraint PK_TAPP_DEPT_USER primary key (DEPARTMENT_USER_ID)
);


/*
 基础数据--数据初始化
*/
-- 菜单
/*
 基础数据--删除原有菜单
*/ 
delete  TSYS_MENU t where t.MENU_ID in 
(
select menu_id from tsys_menu where parent_id_list like '%,42d35feae3ae434eafc85519f0c92ade%'
) ;
commit;
										
INSERT INTO TSYS_MENU VALUES ('42d35feae3ae434eafc85519f0c92ade', '基础数据', 1, 'fa fa-university', NULL, 'BaseData', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 9, '0', '0,42d35feae3ae434eafc85519f0c92ade', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('c05ee308ff664c0a819b241e2aa286d1', '场地信息', 2, 'fa fa-map-o', 'udf/venue/html/list.html', 'BaseData_Venue', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 5, '42d35feae3ae434eafc85519f0c92ade', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,c05ee308ff664c0a819b241e2aa286d1', 7, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('542a61b2db504cfab231c03435b934af', '楼房信息', 2, 'fa fa-building-o', 'udf/building/html/list.html', 'BaseData_Building', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 3, '42d35feae3ae434eafc85519f0c92ade', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,542a61b2db504cfab231c03435b934af', 6, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('4bf34c0e05b94693ae57d24ce8caa05f', '学校信息', 2, 'fa fa-university', 'udf/school/html/list.html', 'BaseData_School', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, '42d35feae3ae434eafc85519f0c92ade', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,4bf34c0e05b94693ae57d24ce8caa05f', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('227a8cf2e5e4461a872ab0e825983a83', '校区信息', 2, 'fa fa-industry', 'udf/campus/html/list.html', 'BaseData_Campus', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 3, '42d35feae3ae434eafc85519f0c92ade', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,227a8cf2e5e4461a872ab0e825983a83', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('41a412c5a2ac4f5b884ae58cad0c2b57', '单位信息', 2, 'fa fa-sitemap', 'udf/department/html/list.html', 'BaseData_Department', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 5, '42d35feae3ae434eafc85519f0c92ade', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,41a412c5a2ac4f5b884ae58cad0c2b57', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('0d203a84f29244ad8d92604023731dd5', '教师信息', 2, 'fa fa-id-card-o', 'udf/teacher/html/list.html', 'BaseData_Teacher', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 5, '42d35feae3ae434eafc85519f0c92ade', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,0d203a84f29244ad8d92604023731dd5', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('18a9dda95cbc4b8991063524886c8543', '专业信息', 2, 'fa fa-graduation-cap', 'udf/major/html/list.html', 'BaseData_Major', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 5, '42d35feae3ae434eafc85519f0c92ade', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,18a9dda95cbc4b8991063524886c8543', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);


-- 场地管理按钮
INSERT INTO TSYS_MENU VALUES ('650bf98c90f4442f9251cde1fd32e148', '新增', 3, 'fa fa-th', NULL, 'BaseData_Venue_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'c05ee308ff664c0a819b241e2aa286d1', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,c05ee308ff664c0a819b241e2aa286d1,c05ee308ff664c0a819b241e2aa286d1,650bf98c90f4442f9251cde1fd32e148', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('db93fcd034f24bc3afc2c5f4a1807cb5', '修改', 3, 'fa fa-th', NULL, 'BaseData_Venue_Update', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'c05ee308ff664c0a819b241e2aa286d1', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,c05ee308ff664c0a819b241e2aa286d1,c05ee308ff664c0a819b241e2aa286d1,db93fcd034f24bc3afc2c5f4a1807cb5', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('aa643bc2cd224b11945e204a0c0bca2d', '删除', 3, 'fa fa-th', NULL, 'BaseData_Venue_Delete', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'c05ee308ff664c0a819b241e2aa286d1', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,c05ee308ff664c0a819b241e2aa286d1,c05ee308ff664c0a819b241e2aa286d1,aa643bc2cd224b11945e204a0c0bca2d', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('7587be223cc54c3089642b93cd563316', '导入', 3, 'fa fa-th', NULL, 'BaseData_Venue_Import', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'c05ee308ff664c0a819b241e2aa286d1', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,c05ee308ff664c0a819b241e2aa286d1,c05ee308ff664c0a819b241e2aa286d1,7587be223cc54c3089642b93cd563316', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('d281000f807148e7b16936c748a6874a', '导出', 3, 'fa fa-th', NULL, 'BaseData_Venue_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'c05ee308ff664c0a819b241e2aa286d1', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,c05ee308ff664c0a819b241e2aa286d1,c05ee308ff664c0a819b241e2aa286d1,d281000f807148e7b16936c748a6874a', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);

-- 楼房信息按钮
INSERT INTO TSYS_MENU VALUES ('89a4d58237ee4a42bd34a25c91675692', '新增', 3, 'fa fa-th', NULL, 'BaseData_Building_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '542a61b2db504cfab231c03435b934af', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,542a61b2db504cfab231c03435b934af,542a61b2db504cfab231c03435b934af,89a4d58237ee4a42bd34a25c91675692', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('0493308042e34f8cbae2a8899521797a', '修改', 3, 'fa fa-th', NULL, 'BaseData_Building_Update', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '542a61b2db504cfab231c03435b934af', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,542a61b2db504cfab231c03435b934af,542a61b2db504cfab231c03435b934af,0493308042e34f8cbae2a8899521797a', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('b99a4c4b732642639713271469a3848d', '删除', 3, 'fa fa-th', NULL, 'BaseData_Building_Delete', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '542a61b2db504cfab231c03435b934af', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,542a61b2db504cfab231c03435b934af,542a61b2db504cfab231c03435b934af,b99a4c4b732642639713271469a3848d', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);

-- 学校信息按钮
INSERT INTO TSYS_MENU VALUES ('a88aa8642c694648b069da30ef1b6fe4', '保存', 3, 'fa fa-th', NULL, 'BaseData_School_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '4bf34c0e05b94693ae57d24ce8caa05f', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,4bf34c0e05b94693ae57d24ce8caa05f,4bf34c0e05b94693ae57d24ce8caa05f,a88aa8642c694648b069da30ef1b6fe4', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);

-- 校区信息按钮
INSERT INTO TSYS_MENU VALUES ('8d5a5dff4de843c8b95ec2c7c6b50cc2', '新增', 3, 'fa fa-th', NULL, 'BaseData_Campus_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '227a8cf2e5e4461a872ab0e825983a83', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,227a8cf2e5e4461a872ab0e825983a83,227a8cf2e5e4461a872ab0e825983a83,8d5a5dff4de843c8b95ec2c7c6b50cc2', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('1e28d9f2b80e436f99006c398410147d', '修改', 3, 'fa fa-th', NULL, 'BaseData_Campus_Update', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '227a8cf2e5e4461a872ab0e825983a83', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,227a8cf2e5e4461a872ab0e825983a83,227a8cf2e5e4461a872ab0e825983a83,1e28d9f2b80e436f99006c398410147d', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('f080947ec6524a98a564d1630f825b15', '删除', 3, 'fa fa-th', NULL, 'BaseData_Campus_Delete', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '227a8cf2e5e4461a872ab0e825983a83', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,227a8cf2e5e4461a872ab0e825983a83,227a8cf2e5e4461a872ab0e825983a83,f080947ec6524a98a564d1630f825b15', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);

-- 单位管理按钮
INSERT INTO TSYS_MENU VALUES ('4e276ed8ffd44a6a91efba403d4f14a6', '新增', 3, 'fa fa-th', NULL, 'BaseData_Department_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '41a412c5a2ac4f5b884ae58cad0c2b57', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,41a412c5a2ac4f5b884ae58cad0c2b57,41a412c5a2ac4f5b884ae58cad0c2b57,4e276ed8ffd44a6a91efba403d4f14a6', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('8d6251b1a99d42339542242a59e6190a', '导入', 3, 'fa fa-th', NULL, 'BaseData_Department_Import', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '41a412c5a2ac4f5b884ae58cad0c2b57', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,41a412c5a2ac4f5b884ae58cad0c2b57,41a412c5a2ac4f5b884ae58cad0c2b57,8d6251b1a99d42339542242a59e6190a', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('22509cb0080a4e88b7bac7caa7566051', '修改', 3, 'fa fa-th', NULL, 'BaseData_Department_Update', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '41a412c5a2ac4f5b884ae58cad0c2b57', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,41a412c5a2ac4f5b884ae58cad0c2b57,41a412c5a2ac4f5b884ae58cad0c2b57,22509cb0080a4e88b7bac7caa7566051', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('6fd7f15e66bc41c7a75eba2e1584441a', '删除', 3, 'fa fa-th', NULL, 'BaseData_Department_Delete', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '41a412c5a2ac4f5b884ae58cad0c2b57', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,41a412c5a2ac4f5b884ae58cad0c2b57,41a412c5a2ac4f5b884ae58cad0c2b57,6fd7f15e66bc41c7a75eba2e1584441a', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('7d44b81c26b14a7aaa5163693a41b72f', '导出', 3, 'fa fa-th', NULL, 'BaseData_Department_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '41a412c5a2ac4f5b884ae58cad0c2b57', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,41a412c5a2ac4f5b884ae58cad0c2b57,41a412c5a2ac4f5b884ae58cad0c2b57,7d44b81c26b14a7aaa5163693a41b72f', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);

-- 专业管理按钮
INSERT INTO TSYS_MENU VALUES ('a5efe7fe827c4b1d891163be66fa88b6', '新增', 3, 'fa fa-th', NULL, 'BaseData_Major_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '18a9dda95cbc4b8991063524886c8543', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,18a9dda95cbc4b8991063524886c8543,18a9dda95cbc4b8991063524886c8543,a5efe7fe827c4b1d891163be66fa88b6', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('4c2c0011b653433093be8b618c97377e', '修改', 3, 'fa fa-th', NULL, 'BaseData_Major_Update', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '18a9dda95cbc4b8991063524886c8543', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,18a9dda95cbc4b8991063524886c8543,18a9dda95cbc4b8991063524886c8543,4c2c0011b653433093be8b618c97377e', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('f99a3596ec6b4018b92dd8b4d0015abb', '删除', 3, 'fa fa-th', NULL, 'BaseData_Major_Delete', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '18a9dda95cbc4b8991063524886c8543', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,18a9dda95cbc4b8991063524886c8543,18a9dda95cbc4b8991063524886c8543,f99a3596ec6b4018b92dd8b4d0015abb', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('3d7ecd554a6e461bb6ddb4a757aef123', '导入', 3, 'fa fa-th', NULL, 'BaseData_Major_Import', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '18a9dda95cbc4b8991063524886c8543', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,18a9dda95cbc4b8991063524886c8543,18a9dda95cbc4b8991063524886c8543,3d7ecd554a6e461bb6ddb4a757aef123', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('c99a1291129e40f18ec728d5ae564f18', '导出', 3, 'fa fa-th', NULL, 'BaseData_Major_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '18a9dda95cbc4b8991063524886c8543', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,18a9dda95cbc4b8991063524886c8543,18a9dda95cbc4b8991063524886c8543,c99a1291129e40f18ec728d5ae564f18', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);

-- 教师管理按钮
INSERT INTO TSYS_MENU VALUES ('9db15ead4acc452ca369ea94a0e034e3', '新增', 3, 'fa fa-th', NULL, 'BaseData_Teacher_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '0d203a84f29244ad8d92604023731dd5', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,0d203a84f29244ad8d92604023731dd5,0d203a84f29244ad8d92604023731dd5,9db15ead4acc452ca369ea94a0e034e3', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('7b1674adf9a64eec99450099a5845d91', '修改', 3, 'fa fa-th', NULL, 'BaseData_Teacher_Update', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '0d203a84f29244ad8d92604023731dd5', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,0d203a84f29244ad8d92604023731dd5,0d203a84f29244ad8d92604023731dd5,7b1674adf9a64eec99450099a5845d91', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('271ea10c0f5f43f1a3c6e36529c6b36f', '删除', 3, 'fa fa-th', NULL, 'BaseData_Teacher_Delete', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '0d203a84f29244ad8d92604023731dd5', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,0d203a84f29244ad8d92604023731dd5,0d203a84f29244ad8d92604023731dd5,271ea10c0f5f43f1a3c6e36529c6b36f', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('79ba97e4b9bb4f8c81f951d763d32886', '导入', 3, 'fa fa-th', NULL, 'BaseData_Teacher_Import', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '0d203a84f29244ad8d92604023731dd5', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,0d203a84f29244ad8d92604023731dd5,0d203a84f29244ad8d92604023731dd5,79ba97e4b9bb4f8c81f951d763d32886', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO TSYS_MENU VALUES ('b8a775a40fda426db07a37f2e74ab1e8', '导出', 3, 'fa fa-th', NULL, 'BaseData_Teacher_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '0d203a84f29244ad8d92604023731dd5', '0,42d35feae3ae434eafc85519f0c92ade,42d35feae3ae434eafc85519f0c92ade,0d203a84f29244ad8d92604023731dd5,0d203a84f29244ad8d92604023731dd5,b8a775a40fda426db07a37f2e74ab1e8', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);


--校历设置按钮
delete from TSYS_MENU t where t.menu_id in ('158a1d13357e43b09c3660a297efddd4','35fc1761701e4e03ab35c95fcf8c1350','1d78f8b30284484ea5bc337e9c2419fb');

insert into TSYS_MENU (MENU_ID, MENU_NAME, MENU_TYPE, IMAGE_CLASS, URL, PERMISSION_CODE, IS_ENABLED, IS_EXPAND, IS_SYSTEM, CAN_BE_ASSIGNED, OWNER_USER_ID, TAG, TARGET, DESCRIPTION, CHILD_COUNT, PARENT_ID, PARENT_ID_LIST, ORDER_NO, CREATE_USER_ID, CREATE_TIME, UPDATE_USER_ID, UPDATE_TIME)
values ('158a1d13357e43b09c3660a297efddd4', '教学周', 3, 'fa fa-th', '', 'BaseData_SchoolCalendar_TeachingWeek', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '38c39ae63ecc441a87fca943feb0e426', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,38c39ae63ecc441a87fca943feb0e426,38c39ae63ecc441a87fca943feb0e426,158a1d13357e43b09c3660a297efddd4', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);

insert into TSYS_MENU (MENU_ID, MENU_NAME, MENU_TYPE, IMAGE_CLASS, URL, PERMISSION_CODE, IS_ENABLED, IS_EXPAND, IS_SYSTEM, CAN_BE_ASSIGNED, OWNER_USER_ID, TAG, TARGET, DESCRIPTION, CHILD_COUNT, PARENT_ID, PARENT_ID_LIST, ORDER_NO, CREATE_USER_ID, CREATE_TIME, UPDATE_USER_ID, UPDATE_TIME)
values ('1d78f8b30284484ea5bc337e9c2419fb', '新增', 3, 'fa fa-th', '', 'BaseData_SchoolCalendar_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '38c39ae63ecc441a87fca943feb0e426', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,38c39ae63ecc441a87fca943feb0e426,38c39ae63ecc441a87fca943feb0e426,1d78f8b30284484ea5bc337e9c2419fb', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);

insert into TSYS_MENU (MENU_ID, MENU_NAME, MENU_TYPE, IMAGE_CLASS, URL, PERMISSION_CODE, IS_ENABLED, IS_EXPAND, IS_SYSTEM, CAN_BE_ASSIGNED, OWNER_USER_ID, TAG, TARGET, DESCRIPTION, CHILD_COUNT, PARENT_ID, PARENT_ID_LIST, ORDER_NO, CREATE_USER_ID, CREATE_TIME, UPDATE_USER_ID, UPDATE_TIME)
values ('35fc1761701e4e03ab35c95fcf8c1350', '修改', 3, 'fa fa-th', '', 'BaseData_SchoolCalendar_Update', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '38c39ae63ecc441a87fca943feb0e426', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,38c39ae63ecc441a87fca943feb0e426,38c39ae63ecc441a87fca943feb0e426,35fc1761701e4e03ab35c95fcf8c1350', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);



/*
 基础数据--删除教务系统管理员角色原有的菜单权限
*/ 
delete from TSYS_ROLE_MENU_PERMISSION WHERE ROLE_ID = '2' AND MENU_ID IN (select MENU_ID from tsys_menu where parent_id_list like '%,42d35feae3ae434eafc85519f0c92ade%');

/*
 基础数据--给教务系统管理员角色授予毕业系统菜单权限
*/ 
insert into TSYS_ROLE_MENU_PERMISSION  select SYS_GUID(),'2',MENU_ID from tsys_menu where parent_id_list like '%,42d35feae3ae434eafc85519f0c92ade%';
commit;

delete from TSYS_SCHOOL;

insert into TSYS_SCHOOL(SCHOOL_ID,SCHOOL_CODE,SCHOOL_NAME,SCHOOL_QUALITY_CODE,SCHOOL_TYPE_CODE,CREATE_USER_ID,CREATE_TIME,UPDATE_USER_ID,UPDATE_TIME) values('00000','00000','国泰安大学','01','411','1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92',sysdate);



--提交
COMMIT;
