declare
      num   number;
begin
    select count(1) into num from user_tables where table_name = upper('TCOUP_TIME_SETTINGS') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_TIME_SETTINGS' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TCOUP_SCHEDULE_SETTINGS') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_SCHEDULE_SETTINGS' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TCOUP_LINK_TEACHER') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_LINK_TEACHER' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TCOUP_LINK_CLASS_WEEK') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_LINK_CLASS_WEEK' ;
    end if;
    
    select count(1) into num from user_tables where table_name = upper('TCOUP_PRACTICAL_TEACHER') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_PRACTICAL_TEACHER' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TCOUP_PRACTICAL_STUDENT') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_PRACTICAL_STUDENT' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TCOUP_ADJUST_SHUT') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_ADJUST_SHUT' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TCOUP_BATCH_ADJUST_SHUT') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_BATCH_ADJUST_SHUT' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TCOUP_PRACTICAL_ARRANGE') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_PRACTICAL_ARRANGE' ;
    end if;
  
  select count(1) into num from user_tables where table_name = upper('TCOUP_THEORETICAL_TASK') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_THEORETICAL_TASK' ;
    end if;
  
  select count(1) into num from user_tables where table_name = upper('TCOUP_THEORETICAL_STARTCLASS') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_THEORETICAL_STARTCLASS' ;
    end if;
  
  select count(1) into num from user_tables where table_name = upper('TCOUP_TEACHING_GROUP') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_TEACHING_GROUP' ;
    end if;
  select count(1) into num from user_tables where table_name = upper('TCOUP_THEORETICAL_CLASS') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_THEORETICAL_CLASS' ;
    end if;
  
  select count(1) into num from user_tables where table_name = upper('TCOUP_THEORETICAL_TEACHERS') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_THEORETICAL_TEACHERS' ;
    end if;
  
  select count(1) into num from user_tables where table_name = upper('TCOUP_MAJOR_FORBIDDEN') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_MAJOR_FORBIDDEN' ;
    end if;
  select count(1) into num from user_tables where table_name = upper('TCOUP_COURSE_SOLID_FORBIDDEN') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_COURSE_SOLID_FORBIDDEN' ;
    end if;
  
  select count(1) into num from user_tables where table_name = upper('TCOUP_CLASSROOM_FORBIDDEN') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_CLASSROOM_FORBIDDEN' ;
    end if;
  
  select count(1) into num from user_tables where table_name = upper('TCOUP_TEACHER_SOLID_FORBIDDEN') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_TEACHER_SOLID_FORBIDDEN' ;
    end if;
  select count(1) into num from user_tables where table_name = upper('TCOUP_SCHEDULING_TASK') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_SCHEDULING_TASK' ;
    end if;
  
  select count(1) into num from user_tables where table_name = upper('TCOUP_SCHEDULE_TEACHER') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_SCHEDULE_TEACHER' ;
    end if;
  
  select count(1) into num from user_tables where table_name = upper('TCOUP_SCHEDULE_PUBLISH') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_SCHEDULE_PUBLISH' ;
    end if;
  
  select count(1) into num from user_tables where table_name = upper('TCOUP_SCHEDULE_SECTION') ;
    if num > 0 then
        execute immediate 'drop table TCOUP_SCHEDULE_SECTION' ;
    end if;
  
   
end;
/

/*==============================================================*/
/* Table: TCOUP_TIME_SETTINGS                                   */
/*==============================================================*/
create table TCOUP_TIME_SETTINGS  (
   TIME_SETTINGS_ID     NVARCHAR2(50)                   not null,
   ACADEMIC_YEAR        INTEGER                         not null,
   SEMESTER_CODE        NVARCHAR2(50),
   CURRENT_SEMESTER     INTEGER,
   SCHOOL_WEEK          INTEGER,
   WEEK_COURSE_DAYS     INTEGER,
   AM_SECTION_NUMBER    INTEGER,
   PM_SECTION_NUMBER    INTEGER,
   NIGHT_SECTION_NUMBER INTEGER,
   CREATE_USER_ID       NVARCHAR2(50)                   not null,
   CREATE_TIME          TIMESTAMP                       not null,
   UPDATE_USER_ID       NVARCHAR2(50)                   not null,
   UPDATE_TIME          TIMESTAMP                       not null,
   constraint PK_TCOUP_TIME_SETTINGS primary key (TIME_SETTINGS_ID)
);


/*==============================================================*/
/* Table: TCOUP_SCHEDULE_SETTINGS                               */
/*==============================================================*/
create table TCOUP_SCHEDULE_SETTINGS  (
   SCHEDULE_SETTINGS_ID NVARCHAR2(50)                   not null,
   ACADEMIC_YEAR        INTEGER                         not null,
   SEMESTER_CODE        NVARCHAR2(50),
   PRACTICE_TASK_START_TIME DATE                            not null,
   PRACTICE_TASK_END_TIME DATE                            not null,
   PRACTICAL_ARRANGE_START_TIME DATE                            not null,
   PRACTICAL_ARRANGE_END_TIME DATE                            not null, 
   THEORETICAL_TASK_START_TIME DATE                            not null,
   THEORETICAL_TASK_END_TIME DATE                            not null,
   SCHEDULE_ARRANGE_START_TIME DATE                            not null,
   SCHEDULE_ARRANGE_END_TIME DATE                            not null,
   CREATE_USER_ID       NVARCHAR2(50)                   not null,
   CREATE_TIME          TIMESTAMP                       not null,
   UPDATE_USER_ID       NVARCHAR2(50)                   not null,
   UPDATE_TIME          TIMESTAMP                       not null,
   constraint PK_TCOUP_SCHEDULE_SETTINGS primary key (SCHEDULE_SETTINGS_ID)
);
 

/*==============================================================*/
/* Table: TCOUP_LINK_TEACHER                                    */
/*==============================================================*/
create table TCOUP_LINK_TEACHER  (
   LINK_TEACHER_ID      NVARCHAR2(50)                   not null,
   ACADEMIC_YEAR        INTEGER                         not null,
   SEMESTER_CODE        NVARCHAR2(50),
   COURSE_ID            NVARCHAR2(50)                   not null,
   TEACHER_ID           NVARCHAR2(50)                   not null,
   constraint PK_TCOUP_LINK_TEACHER primary key (LINK_TEACHER_ID)
);

 

/*==============================================================*/
/* Table: TCOUP_PRACTICAL_ARRANGE                               */
/*==============================================================*/
create table TCOUP_PRACTICAL_ARRANGE  (
   PRACTICAL_ARRANGE_ID NVARCHAR2(50)                   not null,
   ACADEMIC_YEAR        INTEGER                         not null,
   SEMESTER_CODE        NVARCHAR2(50),
   GRADE                INTEGER                         not null,
   MAJOR_ID             NVARCHAR2(50),
   COURSE_ID            NVARCHAR2(50)                   not null,
   GROUP_NO             INTEGER,
   MEMBER_COUNT         INTEGER,
   LINK_TITLE           NVARCHAR2(50),
   LINK_CONTENT         NVARCHAR2(500),
   CREATE_USER_ID       NVARCHAR2(50)                   not null,
   CREATE_TIME          TIMESTAMP                       not null,
   UPDATE_USER_ID       NVARCHAR2(50)                   not null,
   UPDATE_TIME          TIMESTAMP                       not null,
   constraint PK_TCOUP_PRACTICAL_ARRANGE primary key (PRACTICAL_ARRANGE_ID)
);

 

/*==============================================================*/
/* Table: TCOUP_LINK_CLASS_WEEK                                 */
/*==============================================================*/
create table TCOUP_LINK_CLASS_WEEK  (
   LINK_CLASS_WEEK_ID   NVARCHAR2(50)                   not null,
   ACADEMIC_YEAR        INTEGER                         not null,
   SEMESTER_CODE        NVARCHAR2(50),
   COURSE_ID            NVARCHAR2(50)                   not null,
   CLASS_ID             NVARCHAR2(50)                   not null,
   PRACTICE_WEEKS       NVARCHAR2(100)                  not null,
   constraint PK_TCOUP_LINK_CLASS_WEEK primary key (LINK_CLASS_WEEK_ID)
);

 

/*==============================================================*/
/* Table: TCOUP_PRACTICAL_TEACHER                              */
/*==============================================================*/
create table TCOUP_PRACTICAL_TEACHER  (
   PRACTICAL_TEACHERS_ID NVARCHAR2(50)                   not null,
   PRACTICAL_ARRANGE_ID NVARCHAR2(50)                   not null,
   TEACHER_ID           NVARCHAR2(50)                   not null,
   constraint PK_TCOUP_PRACTICAL_TEACHER primary key (PRACTICAL_TEACHERS_ID)
);

 

/*==============================================================*/
/* Table: TCOUP_PRACTICAL_STUDENT                              */
/*==============================================================*/
create table TCOUP_PRACTICAL_STUDENT  (
   PRACTICAL_STUDENTS_ID NVARCHAR2(50)                   not null,
   PRACTICAL_ARRANGE_ID NVARCHAR2(50)                   not null,
   STUDENT_ID           NVARCHAR2(50)                   not null,
   constraint PK_TCOUP_PRACTICAL_STUDENT primary key (PRACTICAL_STUDENTS_ID)
);

 

/*==============================================================*/
/* Table: TCOUP_ADJUST_SHUT                                     */
/*==============================================================*/
create table TCOUP_ADJUST_SHUT  (
   ADJUST_SHUT_ID       NVARCHAR2(50)                   not null,
   ACADEMIC_YEAR        INTEGER                         not null,
   SEMESTER_CODE        NVARCHAR2(50),
   SCHEDULING_TASK_ID   NVARCHAR2(50),
   THEORETICAL_TASK_ID 	NVARCHAR2(50)					not null,
   ADJUST_SHUT_TYPE     INTEGER ,
   ADJUST_SHUT_OPTION   INTEGER,
   CLASS_CLASH_STATUS   INTEGER,
   TEACHER_CLASH_STATUS INTEGER,
   TEACHROOM_CLASH_STATUS INTEGER ,
   ADJUST_BEFORE_WEEK   NVARCHAR2(50),
   ADJUST_WEEK          NVARCHAR2(50),
   ADJUST_TO_WEEK       NVARCHAR2(50),
   SHUT_SECTION         NVARCHAR2(50),
   ADJUST_BEFORE_SECTION NVARCHAR2(50),
   ADJUST_TO_SECTION    NVARCHAR2(50),
   ADJUST_BEFORE_CLASSROOM NVARCHAR2(50),
   ADJUST_TO_CLASSROOM  NVARCHAR2(50) ,
   ADJUST_BEFORE_TEACHER NVARCHAR2(1000),
   ADJUST_TO_TEACHER    NVARCHAR2(1000),
   ADJUST_SHUT_REASON   NVARCHAR2(100),
   BATCH_ADJUST_SHUT_ID NVARCHAR2(50),
   HANDING_STATUS       INTEGER,
   HANDING_OPINION      NVARCHAR2(100),
   CREATE_USER_ID       NVARCHAR2(50) ,
   CREATE_TIME          TIMESTAMP ,
   DISPOSE_USER_ID      NVARCHAR2(50),
   DISPOSE_TIME         TIMESTAMP,
   constraint PK_TCOUP_ADJUST_SHUT primary key (ADJUST_SHUT_ID)
);

create index IX_TCOUP_ADJUST_THEORETICAL on TCOUP_ADJUST_SHUT (THEORETICAL_TASK_ID);
create index IX_TCOUP_ADJUST_SEMESTER on TCOUP_ADJUST_SHUT (ACADEMIC_YEAR,SEMESTER_CODE);
create index IX_TCOUP_ADJUST_TYPE on TCOUP_ADJUST_SHUT (ADJUST_SHUT_TYPE);
create index IX_TCOUP_ADJUST_OPTION on TCOUP_ADJUST_SHUT (ADJUST_SHUT_OPTION);
 

/*==============================================================*/
/* Table: TCOUP_BATCH_ADJUST_SHUT                               */
/*==============================================================*/
create table TCOUP_BATCH_ADJUST_SHUT  (
   BATCH_ADJUST_SHUT_ID NVARCHAR2(50)                   not null,
   ACADEMIC_YEAR   		INTEGER              		    not null,
   SEMESTER_CODE 		NVARCHAR2(50)  					not null,
   ADJUST_SHUT_TYPE     INTEGER                         not null,
   ADJUST_WEEK          NVARCHAR2(50)                   not null,
   ADJUST_TO_WEEK       NVARCHAR2(50)                   ,
   ADJUST_WEEK_DAYS     NVARCHAR2(50)                   not null,
   ADJUST_TO_WEEK_DAYS  NVARCHAR2(50)                   ,
   ADJUST_SHUT_REASON   NVARCHAR2(100)                   not null,
   CREATE_USER_ID       NVARCHAR2(50)                   not null,
   CREATE_TIME          TIMESTAMP                       not null,
   UPDATE_USER_ID       NVARCHAR2(50)                   not null,
   UPDATE_TIME          TIMESTAMP                       not null,
   constraint PK_TCOUP_BATCH_ADJUST_SHUT primary key (BATCH_ADJUST_SHUT_ID)
);
 

/*==============================================================*/
/* Table: TCOUP_THEORETICAL_TASK                                */
/*==============================================================*/
create table TCOUP_THEORETICAL_TASK  (
   THEORETICAL_TASK_ID  NVARCHAR2(50)                   not null,
   ACADEMIC_YEAR        INTEGER                         not null,
   SEMESTER_CODE        NVARCHAR2(50)					not null,
   COURSE_ID            NVARCHAR2(50)                   not null,
   TEACHING_CLASS_NO    NVARCHAR2(50)                   not null,
   TEACHING_CLASS_MEMBER_COUNT INTEGER                  not null,
   TEACHING_METHODS_CODE NVARCHAR2(50)                  not null,
   WEEKLY_HOURS         INTEGER                         not null,
   CONTIN_BLWDWN_COUNT  INTEGER                         not null,
   ARRANGE_WEEKS        NVARCHAR2(50)                   not null,
   ARRANGE_WEEK_LIST    NVARCHAR2(50)                   not null,
   ARRANGE_WEEK_NUMBER  INTEGER                         not null,
   SINGLE_OR_DOUBLE_WEEK INTEGER                        not null,
   TEACHING_GROUP_ID    NVARCHAR2(50),
   USER_ID_LIST         NVARCHAR2(500),
   TEACHROOM_TYPE_CODE  NVARCHAR2(50),
   CAMPUS_ID            NVARCHAR2(50),
   BUILDING_ID          NVARCHAR2(50),
   TEACHROOM_ID         NVARCHAR2(50),
   SOLID_LINE_SECTION   NVARCHAR2(1000),
   FORBIDDEN_LINE_SECTION NVARCHAR2(1000),
   SOLID_FORBIDDEN_SECTION NVARCHAR2(200),
   CHOICE_LIMIT         INTEGER,
   IS_DELETED           INTEGER              			not null,
   CREATE_USER_ID       NVARCHAR2(50)                   not null,
   CREATE_TIME          TIMESTAMP                       not null,
   UPDATE_USER_ID       NVARCHAR2(50)                   not null,
   UPDATE_TIME          TIMESTAMP                       not null,
   constraint PK_TCOUP_THEORETICAL_TASK primary key (THEORETICAL_TASK_ID)
);

create index IX_TCOUP_THEORETICAL_SEMESTER on TCOUP_THEORETICAL_TASK (ACADEMIC_YEAR,SEMESTER_CODE);
 
 

/*==============================================================*/
/* Table: TCOUP_THEORETICAL_STARTCLASS                          */
/*==============================================================*/
create table TCOUP_THEORETICAL_STARTCLASS  (
   THEORETICAL_STARTCLASS_ID NVARCHAR2(50)                   not null,
   THEORETICAL_TASK_ID  NVARCHAR2(50)                   not null,
   STARTCLASS_PLAN_ID   NVARCHAR2(50)                   not null,
   constraint PK_TCOUP_THEORETICAL_STARTCLAS primary key (THEORETICAL_STARTCLASS_ID)
);

create index IX_TCOUP_THEORETICAL_PLAN on TCOUP_THEORETICAL_STARTCLASS (THEORETICAL_TASK_ID);
 

/*==============================================================*/
/* Table: TCOUP_TEACHING_GROUP                                  */
/*==============================================================*/
create table TCOUP_TEACHING_GROUP  (
   TEACHING_GROUP_ID    NVARCHAR2(50)                   not null,
   ACADEMIC_YEAR        INTEGER                         not null,
   SEMESTER_CODE        NVARCHAR2(50),
   COURSE_ID            NVARCHAR2(50)                   not null,
   TEACHING_GROUP_NAME  NVARCHAR2(50)                   not null,
   IS_SAME_PLACE        INTEGER                         not null,
   CREATE_USER_ID       NVARCHAR2(50)                   not null,
   CREATE_TIME          TIMESTAMP                       not null,
   UPDATE_USER_ID       NVARCHAR2(50)                   not null,
   UPDATE_TIME          TIMESTAMP                       not null,
   constraint PK_TCOUP_TEACHING_GROUP primary key (TEACHING_GROUP_ID)
);

 

/*==============================================================*/
/* Table: TCOUP_THEORETICAL_CLASS                               */
/*==============================================================*/
create table TCOUP_THEORETICAL_CLASS  (
   THEORETICAL_CLASS_ID NVARCHAR2(50)                   not null,
   THEORETICAL_TASK_ID  NVARCHAR2(50)                   not null,
   CLASS_ID             NVARCHAR2(50)                   not null,
   constraint PK_TCOUP_THEORETICAL_CLASS primary key (THEORETICAL_CLASS_ID)
);

create index IX_TCOUP_THEORETICAL_CLASS on TCOUP_THEORETICAL_CLASS (THEORETICAL_TASK_ID);
create index IX_TCOUP_THEORETICAL_CLASSINFO on TCOUP_THEORETICAL_CLASS (CLASS_ID);

/*==============================================================*/
/* Table: TCOUP_THEORETICAL_TEACHERS                            */
/*==============================================================*/
create table TCOUP_THEORETICAL_TEACHERS  (
   THEORETICAL_TEACHERS_ID NVARCHAR2(50)                   not null,
   THEORETICAL_TASK_ID  NVARCHAR2(50)                   not null,
   TEACHER_ID           NVARCHAR2(50)                   not null,
   constraint PK_TCOUP_THEORETICAL_TEACHERS primary key (THEORETICAL_TEACHERS_ID)
);

create index IX_TCOUP_THEORETICAL_TASK_ID on TCOUP_THEORETICAL_TEACHERS (THEORETICAL_TASK_ID);
create index IX_TCOUP_THEORETICAL_TEACHER on TCOUP_THEORETICAL_TEACHERS (TEACHER_ID);
 

/*==============================================================*/
/* Table: TCOUP_MAJOR_FORBIDDEN                                 */
/*==============================================================*/
create table TCOUP_MAJOR_FORBIDDEN  (
   MAJOR_FORBIDDEN_LINE_ID NVARCHAR2(50)                   not null,
   ACADEMIC_YEAR        INTEGER                         not null,
   SEMESTER_CODE        NVARCHAR2(50)                   not null,
   GRADE_MAJOR_ID       NVARCHAR2(50)                   not null,
   DAY_COURSE_SECTION_COUNT INTEGER,
   FORBIDDEN_LINE_SECTION NVARCHAR2(1000),
   SOLID_FORBIDDEN_SECTION NVARCHAR2(200),
   REMARK               NVARCHAR2(100),
   CREATE_USER_ID       NVARCHAR2(50)                   not null,
   CREATE_TIME          TIMESTAMP                       not null,
   UPDATE_USER_ID       NVARCHAR2(50)                   not null,
   UPDATE_TIME          TIMESTAMP                       not null,
   constraint PK_TCOUP_MAJOR_FORBIDDEN primary key (MAJOR_FORBIDDEN_LINE_ID)
);

 

/*==============================================================*/
/* Table: TCOUP_COURSE_SOLID_FORBIDDEN                          */
/*==============================================================*/
create table TCOUP_COURSE_SOLID_FORBIDDEN  (
   COURSE_SOLID_FORBIDDEN_LINE_ID NVARCHAR2(50)                   not null,
   ACADEMIC_YEAR        INTEGER                         not null,
   SEMESTER_CODE        NVARCHAR2(50)                   not null,
   COURSE_ID            NVARCHAR2(50)                   not null,
   SOLID_LINE_SECTION   NVARCHAR2(1000),
   FORBIDDEN_LINE_SECTION NVARCHAR2(1000),
   SOLID_FORBIDDEN_SECTION NVARCHAR2(200),
   REMARK               NVARCHAR2(100),
   CREATE_USER_ID       NVARCHAR2(50)                   not null,
   CREATE_TIME          TIMESTAMP                       not null,
   UPDATE_USER_ID       NVARCHAR2(50)                   not null,
   UPDATE_TIME          TIMESTAMP                       not null,
   constraint PK_TCOUP_COURSE_SOLID_FORBIDDE primary key (COURSE_SOLID_FORBIDDEN_LINE_ID)
);

 

/*==============================================================*/
/* Table: TCOUP_CLASSROOM_FORBIDDEN                             */
/*==============================================================*/
create table TCOUP_CLASSROOM_FORBIDDEN  (
   CLASSROOM_FORBIDDEN_LINE_ID NVARCHAR2(50)                   not null,
   ACADEMIC_YEAR        INTEGER                         not null,
   SEMESTER_CODE        NVARCHAR2(50)                   not null,
   VENUE_ID             NVARCHAR2(50)                   not null,
   RETENTION_WEEK       NVARCHAR2(50),
   FORBIDDEN_LINE_SECTION NVARCHAR2(200),
   SOLID_FORBIDDEN_SECTION NVARCHAR2(200),
   REMARK               NVARCHAR2(100),
   CREATE_USER_ID       NVARCHAR2(50)                   not null,
   CREATE_TIME          TIMESTAMP                       not null,
   UPDATE_USER_ID       NVARCHAR2(50)                   not null,
   UPDATE_TIME          TIMESTAMP                       not null,
   constraint PK_TCOUP_CLASSROOM_FORBIDDEN primary key (CLASSROOM_FORBIDDEN_LINE_ID)
);

 

/*==============================================================*/
/* Table: TCOUP_TEACHER_SOLID_FORBIDDEN                         */
/*==============================================================*/
create table TCOUP_TEACHER_SOLID_FORBIDDEN  (
   TEACHER_SOLID_FORBIDDEN_ID NVARCHAR2(50)                   not null,
   ACADEMIC_YEAR        INTEGER                         not null,
   SEMESTER_CODE        NVARCHAR2(50)                   not null,
   USER_ID              NVARCHAR2(50)                   not null,
   DAY_COURSE_SECTION_COUNT INTEGER,
   SOLID_LINE_SECTION   NVARCHAR2(1000),
   FORBIDDEN_LINE_SECTION NVARCHAR2(1000),
   SOLID_FORBIDDEN_SECTION NVARCHAR2(200),
   REMARK               NVARCHAR2(100),
   CREATE_USER_ID       NVARCHAR2(50)                   not null,
   CREATE_TIME          TIMESTAMP                       not null,
   UPDATE_USER_ID       NVARCHAR2(50)                   not null,
   UPDATE_TIME          TIMESTAMP                       not null,
   constraint PK_TCOUP_TEACHER_SOLID_FORBIDD primary key (TEACHER_SOLID_FORBIDDEN_ID)
);

 

/*==============================================================*/
/* Table: TCOUP_SCHEDULING_TASK                                 */
/*==============================================================*/
create table TCOUP_SCHEDULING_TASK  (
   SCHEDULING_TASK_ID   NVARCHAR2(50)                   not null,
   ACADEMIC_YEAR        INTEGER                         not null,
   SEMESTER_CODE        NVARCHAR2(50)                   not null,
   COURSE_ID            NVARCHAR2(50)                   not null,
   THEORETICAL_TASK_ID    NVARCHAR2(50)                   not null,
   COURSE_ARRANGE_WEEKLY NVARCHAR2(50)                   not null,
   COURSE_ARRANGE_WEEK_LIST NVARCHAR2(50)                   not null,
   ARRANGE_WEEK_NUMBER  INTEGER                         not null,
   COURSE_ARRANGE_WEEK  NVARCHAR2(50)                   not null,
   COURSE_ARRANGE_SECTION NVARCHAR2(100)                   not null,
   SINGLE_OR_DOUBLE_WEEK INTEGER                         not null,
   CONTIN_BLWDWN_COUNT  INTEGER                         not null,
   CAMPUS_ID            NVARCHAR2(50),
   BUILDING_ID          NVARCHAR2(50),
   VENUE_TYPE_CODE      NVARCHAR2(50),
   VENUE_ID             NVARCHAR2(50),
   SCHEDULING_TYPE      INTEGER                         not null,
   LOCK_STATUS          INTEGER                         not null,
   TEACHER_ID           NVARCHAR2(2000),
   CREATE_USER_ID       NVARCHAR2(50)                   not null,
   CREATE_TIME          TIMESTAMP                       not null,
   UPDATE_USER_ID       NVARCHAR2(50)                   not null,
   UPDATE_TIME          TIMESTAMP                       not null,
   constraint PK_TCOUP_SCHEDULING_TASK primary key (SCHEDULING_TASK_ID)
);

create index IX_TCOUP_SCHEDULE_SEMESTER on TCOUP_SCHEDULING_TASK (ACADEMIC_YEAR,SEMESTER_CODE);
create index IX_TCOUP_SCHEDULE_THEORETICAL on TCOUP_SCHEDULING_TASK (THEORETICAL_TASK_ID);
 

 /*==============================================================*/
/* Table: TCOUP_SCHEDULE_TEACHER                                */
/*==============================================================*/
create table TCOUP_SCHEDULE_TEACHER  (
   SCHEDULE_TEACHER_ID  NVARCHAR2(50)                   not null,
   SCHEDULING_TASK_ID   NVARCHAR2(50)                   not null,
   TEACHER_ID           NVARCHAR2(50)                   not null,
   constraint PK_TCOUP_SCHEDULE_TEACHER primary key (SCHEDULE_TEACHER_ID)
);

create index IX_TCOUP_SCHEDULE_TASK on TCOUP_SCHEDULE_TEACHER (SCHEDULING_TASK_ID);


/*==============================================================*/
/* Table: TCOUP_SCHEDULE_PUBLISH                                */
/*==============================================================*/
create table TCOUP_SCHEDULE_PUBLISH  (
   SCHEDULE_PUBLISH_ID  NVARCHAR2(50)                   not null,
   TIME_SETTINGS_ID     NVARCHAR2(50)                   not null,
   PUBLISH_STATUS       INTEGER                         not null,
   CREATE_USER_ID       NVARCHAR2(50)                   not null,
   CREATE_TIME          TIMESTAMP                       not null,
   UPDATE_USER_ID       NVARCHAR2(50)                   not null,
   UPDATE_TIME          TIMESTAMP                       not null,
   constraint PK_TCOUP_SCHEDULE_PUBLISH primary key (SCHEDULE_PUBLISH_ID)
);

 

/*==============================================================*/
/* Table: TCOUP_SCHEDULE_SECTION                                */
/*==============================================================*/
create table TCOUP_SCHEDULE_SECTION  (
   SCHEDULE_SECTION_ID  NVARCHAR2(50)                   not null,
   SCHEDULING_TASK_ID   NVARCHAR2(50)                   not null,
   SECTION              INTEGER                         not null,
   constraint PK_TCOUP_SCHEDULE_SECTION primary key (SCHEDULE_SECTION_ID)
);



/*===============================									视图开始									========================================*/
-- 
/*==============================================================*/
/* VIEW: VCOUP_STARTCLASSPLAN_MAJOR                             */
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_STARTCLASSPLAN_MAJOR
AS
SELECT  
	TM.MAJOR_ID,
	TM.MAJOR_NAME,
	TD.DEPARTMENT_ID,
	TD.DEPARTMENT_NAME,
	TGM.GRADE,
	TSP.STARTCLASS_PLAN_ID,
	tsp.ACADEMIC_YEAR,
	tsp.SEMESTER_CODE,
	TSP.WEEK_NUM,
	TSP.COURSE_ID 
FROM
	TTRAP_STARTCLASS_PLAN TSP
LEFT JOIN TTRAP_GRADE_MAJOR TGM ON TGM.GRADE_MAJOR_ID = TSP.GRADE_MAJOR_ID
LEFT JOIN TSYS_MAJOR TM ON TM.MAJOR_ID = TGM.MAJOR_ID
LEFT JOIN TSYS_DEPARTMENT TD ON TD.DEPARTMENT_ID = TM.DEPARTMENT_ID
;
commit;

-- 
/*==============================================================*/
/* VIEW: VCOUP_CLASS_STUDENT_SIZE         班级人数*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_CLASS_STUDENT_SIZE AS
SELECT
	REG.ACADEMIC_YEAR,
	REG.SEMESTER_CODE,
	REG.CLASS_ID,
	COUNT (REG.USER_ID) STUDENT_COUNT
FROM
	TSTU_ARCHIVES_REGISTER REG
WHERE
	  REG.SCHOOL_STATUS_CODE = '001'
GROUP BY
	REG.ACADEMIC_YEAR,
	REG.SEMESTER_CODE,
	REG.CLASS_ID 
;
commit;

-- 
/*==============================================================*/
/* VIEW: VCOUP_CLASSWEEKLYSETTING               hr               	*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_CLASSWEEKLYSETTING
AS
SELECT
	spm.ACADEMIC_YEAR,
	spm.SEMESTER_CODE,
	SPM.STARTCLASS_PLAN_ID,
	-- 开课计划id
	spm.COURSE_ID,
	--课程id
	spm.GRADE,
	--年级id
	SPM.DEPARTMENT_ID,
	--院系id
	SPM.DEPARTMENT_NAME,
	--院系名称
	SPM.MAJOR_ID,
	--专业id
	SPM.MAJOR_NAME,
	--专业名称
	c.CLASS_ID,
	--班级id
	c.CLASS_NO,
	--班级号
	c.CLASS_NAME,
	--班级名称
	SPM.WEEK_NUM,
	--周次
	(
		CASE
		WHEN vcss.Student_Count IS NULL THEN
			c.PRESET_NUMBER
		ELSE
			vcss.Student_Count
		END
	) PRESET_NUMBER,--人数
	lcw.PRACTICE_WEEKS,
	--实践周次
	lcw.LINK_CLASS_WEEK_ID --周次设置id
FROM
	TSTU_CLASS c
INNER JOIN VCOUP_STARTCLASSPLAN_MAJOR spm ON (
	c.GRADE = SPM.GRADE
	AND c.MAJOR_ID = SPM.MAJOR_ID
)
LEFT JOIN TCOUP_LINK_CLASS_WEEK lcw ON (
	lcw.COURSE_ID = spm.COURSE_ID
	AND lcw.CLASS_ID = c.CLASS_ID
	and spm.ACADEMIC_YEAR=lcw.ACADEMIC_YEAR
    and spm.SEMESTER_CODE=lcw.SEMESTER_CODE 
)
LEFT JOIN VCOUP_CLASS_STUDENT_SIZE vcss ON (
	vcss.ACADEMIC_YEAR = spm.ACADEMIC_YEAR
	AND vcss.SEMESTER_CODE = spm.SEMESTER_CODE
	AND vcss.CLASS_ID = c.CLASS_ID
)
;
commit;

-- 
/*==============================================================*/
/* VIEW: VCOUP_CLASSLINKWEEK_DEPARTMENT         hr                     	*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_CLASSLINKWEEK_DEPARTMENT
AS
SELECT
	--	环节班级周次设置-按开课单位
	SCP.STARTCLASS_PLAN_IDS,
	-- 开课计划ID集合
	SCP.ACADEMIC_YEAR,
	-- 学年
	SCP.SEMESTER_CODE,
	-- 学期
	CSE.DEPARTMENT_ID,
	-- 开课单位Id
	DPM.DEPARTMENT_NAME,
	-- 开课单位名称 
	SCP.COURSE_ID,
	-- 环节Id
	CSE.COURSE_NO,
	-- 环节号
	CSE."NAME" AS COURSE_NAME,
	-- 环节名称
	CSE.TACHE_TYPE_CODE,
	-- 环节类别
	CSE.CREDIT,
	-- 学分 
	(
		SELECT
			WMSYS.WM_CONCAT (
				TO_CHAR (
					'[' || TCR.TEACHER_NO || ']' || TCR.TEACHER_NAME
				)
			)
		FROM
			TCOUP_LINK_TEACHER LT
		LEFT JOIN TSYS_TEACHER TCR -- 教师表
		ON TCR.USER_ID = LT.TEACHER_ID
		WHERE
			LT.ACADEMIC_YEAR = SCP.ACADEMIC_YEAR -- 学年
		AND LT.SEMESTER_CODE = SCP.SEMESTER_CODE -- 学期
		AND LT.COURSE_ID = SCP.COURSE_ID -- 课程 
	) TEACHERS,
	-- 	任课教师 
	"NVL" (vcw.CT, 0) AS SETSTATE -- 状态 
FROM
	(
		SELECT DISTINCT
			ACADEMIC_YEAR,
			SEMESTER_CODE,
			COURSE_ID,
			WMSYS.WM_CONCAT (
				TO_CHAR (STARTCLASS_PLAN_ID)
			) OVER (
				PARTITION BY ACADEMIC_YEAR,
				SEMESTER_CODE,
				COURSE_ID
			) STARTCLASS_PLAN_IDS
		FROM
			TTRAP_STARTCLASS_PLAN
		WHERE
			TEMP_FLAG = 0
		AND CLASS_TYPE = 2 -- 开课计划表 非临时数据 且 是环节
	) SCP
LEFT JOIN TTRAP_COURSE CSE -- 课程环节表
ON CSE.COURSE_ID = SCP.COURSE_ID
LEFT JOIN TSYS_DEPARTMENT DPM -- 部门表
ON DPM.DEPARTMENT_ID = CSE.DEPARTMENT_ID
LEFT JOIN (
	SELECT
		COUNT (0) CT,
		vcw.ACADEMIC_YEAR,
		vcw.SEMESTER_CODE,
		vcw.COURSE_ID
	FROM
		VCOUP_CLASSWEEKLYSETTING vcw
	WHERE
		vcw.PRACTICE_WEEKS IS NULL
	GROUP BY
		vcw.ACADEMIC_YEAR,
		vcw.SEMESTER_CODE,
		vcw.COURSE_ID
) vcw ON vcw.COURSE_ID = SCP.COURSE_ID
AND vcw.ACADEMIC_YEAR = SCP.ACADEMIC_YEAR
AND vcw.SEMESTER_CODE = SCP.SEMESTER_CODE
;
commit;
 
-- 
/*==============================================================*/
/* VIEW: VCOUP_CLASSLINKWEEK_GRADEMAJOR            hr                   	*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_CLASSLINKWEEK_GRADEMAJOR
AS
SELECT
	--班级周次设置-按年级专业
	SCP.STARTCLASS_PLAN_ID,
	-- 开课计划id
	SCP.ACADEMIC_YEAR,
	-- 学年
	SCP.SEMESTER_CODE,
	-- 学期
	CSE.DEPARTMENT_ID,
	-- 开课单位Id
	DPM.DEPARTMENT_NAME,
	-- 开课单位名称 
	SCP.COURSE_ID,
	-- 环节Id
	CSE.COURSE_NO,
	-- 环节号
	CSE."NAME" AS COURSE_NAME,
	-- 环节名称
	CSE.TACHE_TYPE_CODE,
	-- 环节类别
	CSE.CREDIT,
	-- 学分 
	(
		SELECT
			WMSYS.WM_CONCAT (
				TO_CHAR (
					'[' || TCR.TEACHER_NO || ']' || TCR.TEACHER_NAME
				)
			)
		FROM
			TCOUP_LINK_TEACHER LT
		LEFT JOIN TSYS_TEACHER TCR -- 教师表
		ON TCR.USER_ID = LT.TEACHER_ID
		WHERE
			LT.ACADEMIC_YEAR = SCP.ACADEMIC_YEAR -- 学年
		AND LT.SEMESTER_CODE = SCP.SEMESTER_CODE -- 学期
		AND LT.COURSE_ID = SCP.COURSE_ID -- 课程 
	) TEACHERS,
	-- 指导教师
	"NVL"(vcw.CT, 0) AS SETSTATE,
	-- 设置状态
	gm.grade,
	-- 年级
	gm.MAJOR_ID,
	-- 专业id
	M .MAJOR_NAME,
	-- 专业名称
	M .DEPARTMENT_ID YXDEPARTMENT_ID,
	-- 院系id
	yxdw.DEPARTMENT_NAME YXDEPARTMENT_NAME -- 院系
FROM
	TTRAP_STARTCLASS_PLAN SCP
LEFT JOIN TTRAP_GRADE_MAJOR gm --年级专业
ON SCP.GRADE_MAJOR_ID = GM.GRADE_MAJOR_ID
LEFT JOIN TSYS_MAJOR M ON gm.MAJOR_ID = M .MAJOR_ID
LEFT JOIN TSYS_DEPARTMENT yxdw --院系
ON yxdw.DEPARTMENT_ID = M .DEPARTMENT_ID
LEFT JOIN TTRAP_COURSE CSE -- 课程环节表
ON CSE.COURSE_ID = SCP.COURSE_ID
LEFT JOIN TSYS_DEPARTMENT DPM -- 部门表
ON DPM.DEPARTMENT_ID = CSE.DEPARTMENT_ID
LEFT JOIN (
	SELECT
		COUNT (0) CT,
		vcw.COURSE_ID,
		vcw.STARTCLASS_PLAN_ID
	FROM
		VCOUP_CLASSWEEKLYSETTING vcw
	WHERE
		vcw.PRACTICE_WEEKS IS NULL
	GROUP BY
		vcw.COURSE_ID,
		vcw.STARTCLASS_PLAN_ID
) vcw ON vcw.COURSE_ID = SCP.COURSE_ID
AND vcw.startclass_Plan_ID = SCP.STARTCLASS_PLAN_ID
WHERE
	TEMP_FLAG = 0
AND CLASS_TYPE = 2 -- 开课计划表 非临时数据 且 是环节
;
commit;

-- 环节教师设置视图
/*==============================================================*/
/* VIEW: VCOUP_LINK_TEACHER                             		*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_LINK_TEACHER
AS
SELECT
	(
		"TO_CHAR" (SCP.ACADEMIC_YEAR) || "TO_CHAR" (SCP.SEMESTER_CODE) || "TO_CHAR" (SCP.COURSE_ID) || "TO_CHAR" (LT.TEACHER_ID)
	) AS LINK_ID,
	SCP.ACADEMIC_YEAR,
	SCP.SEMESTER_CODE,
	CSE.DEPARTMENT_ID,
	DPM.DEPARTMENT_NAME,
	SCP.COURSE_ID,
	CSE.COURSE_NO,
	CSE."NAME" AS COURSE_NAME,
	CSE.TACHE_TYPE_CODE,
	CSE.CREDIT,
	LT.TEACHER_ID,
	LT.TEACHER_NO,
	LT.TEACHER_NAME,
	LT.TEACHERS	-- 将环节设置教师拼接为一个字符串
FROM
	(
		SELECT DISTINCT
			ACADEMIC_YEAR,
			SEMESTER_CODE,
			COURSE_ID
		FROM
			TTRAP_STARTCLASS_PLAN
		WHERE
			TEMP_FLAG = 0
		AND CLASS_TYPE = 2 -- 开课计划表 非临时数据 且 是环节
	) SCP 
LEFT JOIN TTRAP_COURSE CSE ON CSE.COURSE_ID = SCP.COURSE_ID	-- 获取课程表信息
LEFT JOIN TSYS_DEPARTMENT DPM ON DPM.DEPARTMENT_ID = CSE.DEPARTMENT_ID	-- 获取单位表信息
LEFT JOIN (
	SELECT
		LINT.ACADEMIC_YEAR,
		LINT.SEMESTER_CODE,
		LINT.COURSE_ID,LINT.TEACHER_ID,
		TCR.TEACHER_NO,TCR.TEACHER_NAME,
		WMSYS.WM_CONCAT (
			TO_CHAR (
				'[' || TCR.TEACHER_NO || ']' || TCR.TEACHER_NAME
			)
		) OVER (
			PARTITION BY LINT.ACADEMIC_YEAR,
			LINT.SEMESTER_CODE,
			LINT.COURSE_ID
		) TEACHERS
	FROM
		TCOUP_LINK_TEACHER LINT
	LEFT JOIN TSYS_TEACHER TCR ON TCR.USER_ID = LINT.TEACHER_ID --	获取教师表信息
ORDER BY LINT.ACADEMIC_YEAR,
			LINT.SEMESTER_CODE,
			LINT.COURSE_ID,TCR.TEACHER_NO
) LT ON LT.ACADEMIC_YEAR = SCP.ACADEMIC_YEAR	-- 获取环节教师设置表信息
AND LT.SEMESTER_CODE = SCP.SEMESTER_CODE
AND LT.COURSE_ID = SCP.COURSE_ID
;
commit;

-- 
/*==============================================================*/
/* VIEW: VCOUP_MAJOR_CLASS    年级、专业、班级、开课单位                       		*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_MAJOR_CLASS
AS
SELECT
	DEPARTMENT.DEPARTMENT_NAME,
	DEPARTMENT.DEPARTMENT_ID,
	TC.MAJOR_ID,
	MAJOR.MAJOR_NAME,
	TC.CLASS_NAME,
	TC.CLASS_ID, 
	TC.PRESET_NUMBER,
	TC.GRADE,
	TC.CLASS_NO
FROM
	TSTU_CLASS TC
LEFT JOIN TSYS_MAJOR MAJOR ON MAJOR.MAJOR_ID = TC.MAJOR_ID
LEFT JOIN TSYS_DEPARTMENT DEPARTMENT ON DEPARTMENT.DEPARTMENT_ID = MAJOR.DEPARTMENT_ID 
WHERE
	TC.IS_DELETED = 0
AND TC.IS_ENABLED = 1
;
commit; 

-- 
/*==============================================================*/
/* VIEW: VCOUP_NOPRACTICALTACHESTUDENT      hr                  */
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_NOPRACTICALTACHESTUDENT
AS
SELECT
    r.CLASS_ID, -- 班级id
	c.CLASS_No, --班级编号
	c.CLASS_NAME, --班级名称
	s.USER_ID, -- 用户id
	s.STUDENT_NO, -- 学号
	s.STUDENT_NAME, -- 姓名
	s.SEX_CODE, -- 性别代码
	c.major_id, -- 专业id
	r.ACADEMIC_YEAR, -- 学年
	r.SEMESTER_CODE, -- 学期
	c.GRADE, -- 年级
	mc.DEPARTMENT_ID,-- 部门id
  cw.COURSE_ID , -- 环节
  d.TACHE_TYPE_CODE , --环节类别
  cw.PRACTICE_WEEKS, -- 实践周次
	pas.group_No, -- 小组号
	dep.DEPARTMENT_NAME, --部门名称
	mc.major_NAME  --专业名称 
FROM
	TSTU_STUDENT s
left JOIN TSTU_ARCHIVES_REGISTER r ON s.USER_ID = r.USER_ID and r.SCHOOL_STATUS_CODE='001' -- 在校
left JOIN TSTU_CLASS c ON  c.CLASS_ID = r.CLASS_ID
left JOIN TSYS_MAJOR mc ON mc.major_id = c.MAJOR_ID  
inner JOIN TCOUP_LINK_CLASS_WEEK cw on cw.CLASS_ID=c.CLASS_ID and cw.ACADEMIC_YEAR=r.ACADEMIC_YEAR  and  cw.SEMESTER_CODE= r.SEMESTER_CODE 
LEFT JOIN TTRAP_COURSE d on d.COURSE_ID=CW.COURSE_ID
left join (
	select pa.ACADEMIC_YEAR,pa.SEMESTER_CODE,pa.grade, pa.major_id ,pa.course_id,ps.student_id,pa.group_no from TCOUP_PRACTICAL_ARRANGE pa 
	left join TCOUP_PRACTICAL_STUDENT ps on pa.PRACTICAL_ARRANGE_ID =  ps.PRACTICAL_ARRANGE_ID
)pas on pas.ACADEMIC_YEAR=r.ACADEMIC_YEAR and  pas.SEMESTER_CODE=r.SEMESTER_CODE and pas.grade=c.grade   and pas.major_id=c.major_id and pas.course_id=cw.course_id and pas.student_id=s.user_id 
left join TSYS_DEPARTMENT dep on dep.DEPARTMENT_ID=mc.DEPARTMENT_ID
;
commit;

-- 
/*==============================================================*/
/* VIEW: VCOUP_PRACTICALARRANGE_STATI                            */
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_PRACTICALARRANGE_STATI
AS
SELECT --实践安排查询
	TO_CHAR (
		D .PRACTICAL_ARRANGE_ID || ',' || b.USER_ID
	) PRACTICAL_ARRANGE_ID_USER_ID,
	--实践安排学生id
	b.user_id,
	-- 学生id 
	b.Student_No,
	-- 学号	 
	b.STUDENT_NAME,
	-- 姓名
	c.class_ID,
	-- 班级id
	c.Class_Name,
	-- 班级名称
	D .COURSE_ID,
	-- 环节id
	E .COURSE_NO,
	-- 环节号
	E . NAME COURSE_NAME,
	-- 环节名称
	E .TACHE_TYPE_CODE,
	-- 环节类别
	E .CREDIT,
	-- 学分
	E .week_Num,
	-- 周数
	E .DEPARTMENT_ID KDEPARTMENT_ID,
	-- 开课单位id
	f.DEPARTMENT_NAME KDEPARTMENT_NAME,
	-- 开课单位名称
	D .group_NO,
	-- 小组号
    PT.USERID_LIST,
	-- 指导老师
	D .LINK_TITLE,
	-- 题目 
	v.PRACTICE_WEEKS,
	-- 实践周次
	c.grade,
	--年级
	H .DEPARTMENT_ID,
	--院系id
	i.DEPARTMENT_NAME,
	--院系名称
	H .major_id,
	--专业id
	H .major_NO,
	--专业编号
	H .major_NAME,
	--专业名称
	G .ACADEMIC_YEAR,
	--学年
	G .SEMESTER_CODE --学期
FROM
	TCOUP_PRACTICAL_STUDENT A
INNER JOIN TCOUP_PRACTICAL_ARRANGE D ON A .PRACTICAL_ARRANGE_ID = D .PRACTICAL_ARRANGE_ID
LEFT JOIN TSTU_STUDENT b ON A .student_id = b.user_id
INNER JOIN TSTU_ARCHIVES_REGISTER G ON (
	G .USER_ID = A .student_id
	AND G .ACADEMIC_YEAR = D .ACADEMIC_YEAR
	AND G .SEMESTER_CODE = D .SEMESTER_CODE
)
LEFT  JOIN TSTU_CLASS c ON c.Class_Id = G .Class_Id
LEFT JOIN TSYS_MAJOR H ON H .major_id = c.major_ID
LEFT JOIN TSYS_DEPARTMENT i ON i.DEPARTMENT_ID = H .DEPARTMENT_ID
LEFT JOIN TTRAP_COURSE E ON E .COURSE_ID = D .COURSE_ID
LEFT JOIN TSYS_DEPARTMENT f ON f.DEPARTMENT_ID = E .DEPARTMENT_ID
LEFT JOIN (
   	SELECT
			"REPLACE" (
				WMSYS.WM_CONCAT (
					TO_CHAR (
						'[' || TCR.TEACHER_NO || ']' || TCR.TEACHER_NAME
					)
				),
				',',
				'、'
			) USERID_LIST ,
    PRACTICAL_ARRANGE_ID
		FROM
			TCOUP_PRACTICAL_TEACHER PT
		LEFT JOIN TSYS_TEACHER TCR ON TCR.USER_ID = PT.TEACHER_ID -- 教师表
   group BY PRACTICAL_ARRANGE_ID
) PT ON PT.PRACTICAL_ARRANGE_ID = D .PRACTICAL_ARRANGE_ID	-- 获取环节教师设置表信息
INNER JOIN VCOUP_NOPRACTICALTACHESTUDENT v ON (
	D .ACADEMIC_YEAR = v.ACADEMIC_YEAR
	AND D .SEMESTER_CODE = v.SEMESTER_CODE
	AND v.USER_ID = A .STUDENT_ID
	AND D .COURSE_ID = v.COURSE_ID
) 
;
commit;


-- 
/*==============================================================*/
/* VIEW: VCOUP_PRACTICALARRANGETACHE   hr                             */
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_PRACTICALARRANGETACHE
AS
select t.PRACTICAL_ARRANGE_ID, -- 实践设置ID
t.ACADEMIC_YEAR, -- 学年
t.SEMESTER_CODE, -- 学期
t.COURSE_ID, -- 环节ID
c.COURSE_NO, -- 环节号
c.NAME COURSE_NAME, -- 环节名称
c.TACHE_TYPE_CODE, -- 环节类别
t.GRADE, -- 年级
m.DEPARTMENT_ID, --  院系Id
d.DEPARTMENT_NAME, -- 院系名称
t.MAJOR_ID, -- 专业ID
m.MAJOR_NAME, -- 专业名称 
t.GROUP_NO, -- 小组号
PN.MEMBER_COUNT, -- 人数
PT.USERID_LIST  ,-- 指导老师
t.LINK_TITLE-- 题目 
from TCOUP_PRACTICAL_ARRANGE  t 
LEFT JOIN TTRAP_COURSE c on c.COURSE_ID = t.COURSE_ID
LEFT JOIN TSYS_MAJOR m on t.MAJOR_ID = m.MAJOR_ID
LEFT JOIN TSYS_DEPARTMENT d on  d.DEPARTMENT_ID=m.DEPARTMENT_ID 
LEFT JOIN (
 SELECT "REPLACE"(WMSYS.WM_CONCAT (TO_CHAR ('[' || TCR.TEACHER_NO || ']' || TCR.TEACHER_NAME )), ',', '、') USERID_LIST, PRACTICAL_ARRANGE_ID 
	 from TCOUP_PRACTICAL_TEACHER PT 
		LEFT JOIN TSYS_TEACHER TCR ON TCR.USER_ID = PT.TEACHER_ID -- 教师表 
group by PRACTICAL_ARRANGE_ID 
)PT ON PT.PRACTICAL_ARRANGE_ID=t.PRACTICAL_ARRANGE_ID
LEFT JOIN (
 select count(0) MEMBER_COUNT ,A.PRACTICAL_ARRANGE_ID,B.ACADEMIC_YEAR ,B.SEMESTER_CODE,C.MAJOR_ID,C.GRADE  from TCOUP_PRACTICAL_STUDENT A 
 INNER JOIN TSTU_ARCHIVES_REGISTER B ON (A.STUDENT_ID =B.USER_ID and b.SCHOOL_STATUS_CODE='001' )
 INNER JOIN TSTU_CLASS C ON B.CLASS_ID =C.CLASS_ID 
 GROUP BY   A.PRACTICAL_ARRANGE_ID,B.ACADEMIC_YEAR ,B.SEMESTER_CODE,C.MAJOR_ID,C.GRADE 
)PN ON PN.PRACTICAL_ARRANGE_ID=t.PRACTICAL_ARRANGE_ID AND t.ACADEMIC_YEAR=PN.ACADEMIC_YEAR  AND t.SEMESTER_CODE=PN.SEMESTER_CODE AND T.MAJOR_ID =PN.MAJOR_ID AND T.GRADE=PN.GRADE
;
commit;

 
-- 
/*==============================================================*/
/* VIEW: VCOUP_PRACTICALTACHESTUDENT        hr                     */
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_PRACTICALTACHESTUDENT
AS
SELECT
	TO_CHAR (b.PRACTICAL_ARRANGE_id) || ',' || TO_CHAR (USER_ID) STUDENTID_PRACTICALARRANGEID,
	b.PRACTICAL_ARRANGE_id,
	-- 实践环节id
	c.CLASS_ID,
	-- 班级id
	c.CLASS_No,
	--班级编号
	c.CLASS_NAME,
	--班级名称
	c.USER_ID,
	-- 用户id
	c.STUDENT_NO,
	-- 学号
	c.STUDENT_NAME,
	-- 姓名
	c.SEX_CODE,
	-- 性别代码
	c.major_id,
	-- 专业id
	c.ACADEMIC_YEAR,
	-- 学年
	c.SEMESTER_CODE,
	-- 学期
	c.GRADE,
	-- 年级
	c.DEPARTMENT_ID,
	-- 部门id
	c.COURSE_ID,
	-- 环节
	c.TACHE_TYPE_CODE,
	--环节类别
	c.PRACTICE_WEEKS,
	-- 实践周次
	c.DEPARTMENT_NAME,
	--部门名称
	c.major_NAME,
	--专业名称
	A .link_title,
	--标题
	pt.TEACHER_IDs --4000
FROM
	TCOUP_PRACTICAL_ARRANGE A
LEFT JOIN TCOUP_PRACTICAL_STUDENT b ON A .PRACTICAL_ARRANGE_id = b.PRACTICAL_ARRANGE_id
LEFT JOIN (
	SELECT
		WMSYS.WM_CONCAT (TO_CHAR(TEACHER_id)) TEACHER_IDs,
		PRACTICAL_ARRANGE_id
	FROM
		TCOUP_PRACTICAL_TEACHER
	GROUP BY
		PRACTICAL_ARRANGE_id
) pt ON pt.PRACTICAL_ARRANGE_id = b.PRACTICAL_ARRANGE_id
INNER JOIN VCOUP_NOPRACTICALTACHESTUDENT c ON (
	A .ACADEMIC_YEAR = c.ACADEMIC_YEAR
	AND A .SEMESTER_CODE = c.SEMESTER_CODE
	AND c.USER_ID = b.STUDENT_ID
	AND A .COURSE_ID = c.COURSE_ID
)
;
commit;


-- 
/*==============================================================*/
/* VIEW: VCOUP_PRACTICESTATISTIC     hr                           		*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_PRACTICESTATISTIC
AS
SELECT --实践任务查询
(tlcw.COURSE_ID||','||tlcw.CLASS_ID) CLASS_ID_COURSE_ID,
tlcw.COURSE_ID,--环节id
co.COURSE_NO,-- 环节号
co.NAME COURSE_NAME, --环节名称
co.TACHE_TYPE_CODE , --环节类别
CO.CREDIT, -- 学分
CO.Week_NUM,--周数
co.DEPARTMENT_ID KDEPARTMENT_ID, --开课单位id
d.DEPARTMENT_NAME KDEPARTMENT_NAME, --开课单位名称
tlcw.CLASS_ID, --班级id
c.CLASS_NAME, -- 班级名称
c.GRADE, --年级
c.MAJOR_ID, -- 专业id
m.MAJOR_NO, --专业号
m.MAJOR_NAME, --专业名称
m.DEPARTMENT_ID DEPARTMENT_ID, --院系id
yxd.DEPARTMENT_NAME DEPARTMENT_NAME, --院系名称
LT.USERID_LIST,--指导教师 
tlcw.ACADEMIC_YEAR, --学年
tlcw.SEMESTER_CODE, -- 学期
tlcw.PRACTICE_WEEKS --实践周次
FROM TCOUP_LINK_CLASS_WEEK tlcw  
LEFT JOIN TTRAP_COURSE co on co.COURSE_ID = tlcw.COURSE_ID
LEFT JOIN TSYS_DEPARTMENT d on d.DEPARTMENT_ID=co.DEPARTMENT_ID
LEFT JOIN TSTU_CLASS c on c.CLASS_ID=TLCW.CLASS_ID 
LEFT JOIN TSYS_MAJOR m on m.MAJOR_ID=c.MAJOR_ID 
LEFT JOIN TSYS_DEPARTMENT yxd on yxd.DEPARTMENT_ID= m.DEPARTMENT_ID 
LEFT JOIN (
	SELECT
			WMSYS.WM_CONCAT (
				TO_CHAR (
					'[' || TCR.TEACHER_NO || ']' || TCR.TEACHER_NAME
				)
			)USERID_LIST,ACADEMIC_YEAR,SEMESTER_CODE,COURSE_ID
		FROM
			TCOUP_LINK_TEACHER LT
		LEFT JOIN TSYS_TEACHER TCR -- 教师表
		ON TCR.USER_ID = LT.TEACHER_ID  
		GROUP BY ACADEMIC_YEAR,SEMESTER_CODE,COURSE_ID
)LT ON 	LT.ACADEMIC_YEAR = tlcw.ACADEMIC_YEAR -- 学年
		AND LT.SEMESTER_CODE = tlcw.SEMESTER_CODE -- 学期
		AND LT.COURSE_ID = tlcw.COURSE_ID -- 课程
;
commit;


-- 
/*==============================================================*/
/* VIEW: VCOUP_PRACTICETACHE     hr                         		*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_PRACTICETACHE
AS
SELECT
      scp.course_id,
      -- 环节Id
      scp.course_No,
      -- 环节号
      scp. NAME AS COURSE_NAME,
      -- 环节名称
      c.TACHE_TYPE_CODE -- 环节类别
      ,
      scp.academic_Year -- 学年
      ,
      scp.semester_Code --学期
      ,
      SCP.grade,
      -- 年级
      scp.DEPARTMENT_ID,
      --院系
      scp.major_id--, -- 专业
			--s.aa
    FROM
      VTRAP_STARTNOCLASSPLAN scp
    LEFT JOIN TTRAP_COURSE c ON c.COURSE_ID = scp.COURSE_ID 
    WHERE
      SCP.CLASS_TYPE = 2 
		  and  scp.course_id in (
				select course_id from TCOUP_LINK_CLASS_WEEK  a 
					left join TSTU_CLASS b ON a.class_id = b.class_id
					left join TSYS_MAJOR c on b.major_id =c.major_id 
					where   a.academic_Year=scp.academic_Year -- 学年
					and  a.semester_Code=scp.semester_Code --学期
					and b.grade=SCP.grade
					and c.DEPARTMENT_ID=scp.DEPARTMENT_ID
					and  b.major_id=scp.major_id
)
;
commit;


-- 
/*==============================================================*/
/* VIEW: VCOUP_PRACTICETACHECLASS    hr                              	*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_PRACTICETACHECLASS
AS
SELECT
	c.CLASS_ID, -- 班级ID
	c.GRADE, -- 年级
	c.MAJOR_ID, -- 专业ID 
	c.CLASS_NO, -- 班号
	c.CLASS_NAME -- 班级名称 
FROM
	TSTU_CLASS c 
inner join TCOUP_LINK_CLASS_WEEK w on c.CLASS_ID=w.CLASS_ID
;
commit;


-- 排课结果发布视图
/*==============================================================*/
/* VIEW: VCOUP_SCHEDULE_PUBLISH                              	*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_SCHEDULE_PUBLISH
AS
SELECT
	SETTING.TIME_SETTINGS_ID,
	SETTING.ACADEMIC_YEAR,
	SETTING.SEMESTER_CODE,
	PUBLISH.SCHEDULE_PUBLISH_ID,
	PUBLISH.PUBLISH_STATUS,
	PUBLISH.UPDATE_TIME
FROM
	TCOUP_TIME_SETTINGS SETTING
LEFT JOIN TCOUP_SCHEDULE_PUBLISH PUBLISH ON PUBLISH.TIME_SETTINGS_ID = SETTING.TIME_SETTINGS_ID
;
commit;


-- 排课任务视图
/*==============================================================*/
/* VIEW: VCOUP_SCHEDULING_TASK                              	*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_SCHEDULING_TASK
AS
SELECT DISTINCT
	SCHT.SCHEDULING_TASK_ID,
	SCHT.ACADEMIC_YEAR,
	SCHT.SEMESTER_CODE,
	COU.DEPARTMENT_ID,
	DEP.DEPARTMENT_NAME,
	SCHT.COURSE_ID,
	COU.COURSE_NO,
	COU."NAME",
	SCHT.THEORETICAL_TASK_ID,
	THET.TEACHING_CLASS_NO,
	THET.TEACHING_CLASS_MEMBER_COUNT,
	THET.TEACHING_GROUP_ID,
	SCHT.COURSE_ARRANGE_WEEKLY,
	SCHT.COURSE_ARRANGE_SECTION,
	SCHT.SINGLE_OR_DOUBLE_WEEK,
	SCHT.CAMPUS_ID,
	CAMPUS.CAMPUS_NAME,
	SCHT.BUILDING_ID,
	BUILDING.BUILDING_NAME,
	SCHT.VENUE_TYPE_CODE,
	SCHT.VENUE_ID,
	VENUE.VENUE_NAME,
	SCHT.SCHEDULING_TYPE,
	SCHT.LOCK_STATUS,
	"DECODE"(TEACR.SCHEDULE_TEACHERS, null,TTS.TEACHERS, TEACR.SCHEDULE_TEACHERS) TEACHERS,
	"DECODE"(TEACR.SCHEDULE_TEACHERS, null,TTS.USER_ID, TEACR.USER_ID) TEACHER_ID,
	"DECODE"(TEACR.SCHEDULE_TEACHERS, null,TTS.USER_IDS, TEACR.USER_IDS) TEACHER_IDS,
	"DECODE"(TEACR.SCHEDULE_TEACHERS, null,TTS.TEACHER_NO, TEACR.TEACHER_NO) TEACHER_NO,
	"DECODE"(TEACR.SCHEDULE_TEACHERS, null,TTS.TEACHER_NAME, TEACR.TEACHER_NAME) TEACHER_NAME
FROM
	TCOUP_SCHEDULING_TASK SCHT
LEFT JOIN TCOUP_THEORETICAL_TASK THET ON THET.THEORETICAL_TASK_ID = SCHT.THEORETICAL_TASK_ID
LEFT JOIN TTRAP_COURSE COU ON COU.COURSE_ID = SCHT.COURSE_ID
LEFT JOIN TSYS_DEPARTMENT DEP ON DEP.DEPARTMENT_ID = COU.DEPARTMENT_ID
LEFT JOIN ( -- 关联理论任务教师
	SELECT DISTINCT
		THETE.THEORETICAL_TASK_ID,
		TCR.USER_ID,
		TCR.TEACHER_NO,
		TCR.TEACHER_NAME,
		(
			WMSYS.WM_CONCAT (TO_CHAR (
					'[' || TCR.TEACHER_NO || ']' || TCR.TEACHER_NAME
				)) OVER (
				PARTITION BY THETE.THEORETICAL_TASK_ID
			)
		) TEACHERS,
		(
			WMSYS.WM_CONCAT (TO_CHAR ( TCR.USER_ID)) OVER (
				PARTITION BY THETE.THEORETICAL_TASK_ID
			)
		) USER_IDS
	FROM
		TCOUP_THEORETICAL_TEACHERS THETE
	LEFT JOIN TSYS_TEACHER TCR ON TCR.USER_ID = THETE.TEACHER_ID
) TTS ON TTS.THEORETICAL_TASK_ID = THET.THEORETICAL_TASK_ID
LEFT JOIN ( -- 关联调代课教师
	SELECT DISTINCT
		TEA.SCHEDULING_TASK_ID,
		TCR.USER_ID,
		TCR.TEACHER_NO,
		TCR.TEACHER_NAME,
		(
			WMSYS.WM_CONCAT (TO_CHAR (
					'[' || TCR.TEACHER_NO || ']' || TCR.TEACHER_NAME
				)) OVER (
				PARTITION BY TEA.SCHEDULING_TASK_ID
			)
		) SCHEDULE_TEACHERS,
		(
			WMSYS.WM_CONCAT (TO_CHAR ( TCR.USER_ID )) OVER (
				PARTITION BY TEA.SCHEDULING_TASK_ID
			)
		) USER_IDS
	FROM
		TCOUP_SCHEDULE_TEACHER TEA
	LEFT JOIN TSYS_TEACHER TCR ON TCR.USER_ID = TEA.TEACHER_ID
) TEACR ON TEACR.SCHEDULING_TASK_ID = SCHT.SCHEDULING_TASK_ID
LEFT JOIN TSYS_CAMPUS CAMPUS ON CAMPUS.CAMPUS_ID = SCHT.CAMPUS_ID
LEFT JOIN TSYS_BUILDING BUILDING ON BUILDING.BUILDING_ID = SCHT.BUILDING_ID
LEFT JOIN TSYS_VENUE VENUE ON VENUE.VENUE_ID = SCHT.VENUE_ID
;
commit;

-- 排课任务-调代课查询
/*==============================================================*/
/* VIEW: VCOUP_SCHEDULE_FOR_LESSON                              	*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_SCHEDULE_FOR_LESSON AS
SELECT
SCHT.SCHEDULING_TASK_ID ||  THET.THEORETICAL_TASK_ID || THEC.CLASS_ID || TTS.TEACHER_ID || TEA.TEACHER_ID ID,
	SCHT.SCHEDULING_TASK_ID,
	THET.THEORETICAL_TASK_ID,
	SCHT.COURSE_ARRANGE_WEEKLY,
	SCHT.COURSE_ARRANGE_WEEK_LIST,
	SCHT.ARRANGE_WEEK_NUMBER,
	SCHT.COURSE_ARRANGE_WEEK,
	SCHT.COURSE_ARRANGE_SECTION,
	THEC.CLASS_ID,
	"DECODE" (
		TEA.TEACHER_ID,
		NULL,
		TTS.TEACHER_ID,
		TEA.TEACHER_ID
	) TEACHER_ID,
	SCHT.ACADEMIC_YEAR,
	SCHT.SEMESTER_CODE,
	SCHT.VENUE_ID ROOM_ID,
	SCHT.SINGLE_OR_DOUBLE_WEEK
FROM
	TCOUP_SCHEDULING_TASK SCHT
LEFT JOIN TCOUP_THEORETICAL_TASK THET ON THET.THEORETICAL_TASK_ID = SCHT.THEORETICAL_TASK_ID
LEFT JOIN TCOUP_THEORETICAL_TEACHERS TTS ON TTS.THEORETICAL_TASK_ID = THET.THEORETICAL_TASK_ID
LEFT JOIN TCOUP_SCHEDULE_TEACHER TEA ON TEA.SCHEDULING_TASK_ID = SCHT.SCHEDULING_TASK_ID
LEFT JOIN TCOUP_THEORETICAL_CLASS THEC ON THEC.THEORETICAL_TASK_ID = THET.THEORETICAL_TASK_ID
;
commit;



-- 
/*==============================================================*/
/* VIEW: VCOUP_STARTCLASSPLAN_SETTINGS  查询开课计划对应需要设置的理论任务数据*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_STARTCLASSPLAN_SETTINGS
AS
SELECT
  SP.ACADEMIC_YEAR,
  SP.SEMESTER_CODE,
  DEPARTMENT.DEPARTMENT_ID,
  DEPARTMENT.DEPARTMENT_NAME,
  COURSE.COURSE_ID,
  COURSE.COURSE_NO,
  COURSE. NAME COURSE_NAME,
  SP.COURSE_TYPE_CODE,
  SP.COURSE_ATTRIBUTE_CODE,
  COURSE.CREDIT,
  SP.TOTAL_PERIOD,
  SP.THEORY_PERIOD,
  SP.EXPERI_PERIOD,
  SP.PRACTICE_PERIOD,
  SP.OTHER_PERIOD,
  SP.WEEK_PERIOD,
  SP.CHECK_WAY_CODE,
  replace(wm_concat(DISTINCT(to_char(MAJOR.MAJOR_NAME))), ',', '、') MAJOR_NAME,
  wm_concat(DISTINCT(to_char(MAJOR.MAJOR_ID))) MAJOR_ID,
  wm_concat(DISTINCT(to_char(SP.STARTCLASS_PLAN_ID))) STARTCLASS_PAN_ID,
  wm_concat(DISTINCT(to_char(GM.GRADE))) GRADE,
  wm_concat(DISTINCT(to_char(GM.MAJOR_ID||'#'||GM.GRADE))) MAJOR_GRADE,
  COUNT (DISTINCT STUCLASS.CLASS_ID) UN_SETTING_COUNT,
  COUNT (DISTINCT SETTING.CLASS_ID) SETTING_COUNT
FROM
  TTRAP_STARTCLASS_PLAN SP
JOIN TTRAP_COURSE COURSE ON COURSE.COURSE_ID = SP.COURSE_ID
JOIN TSYS_DEPARTMENT DEPARTMENT ON DEPARTMENT.DEPARTMENT_ID = COURSE.DEPARTMENT_ID
JOIN TTRAP_GRADE_MAJOR GM ON GM.GRADE_MAJOR_ID = SP.GRADE_MAJOR_ID
JOIN TSYS_MAJOR MAJOR ON MAJOR.MAJOR_ID = GM.MAJOR_ID
LEFT JOIN TSTU_CLASS STUCLASS ON STUCLASS.MAJOR_ID = MAJOR.MAJOR_ID AND STUCLASS.IS_DELETED = 0 AND STUCLASS.IS_ENABLED = 1 AND STUCLASS.GRADE = GM.GRADE
LEFT JOIN 
(
SELECT 
  DISTINCT TTC1.CLASS_ID,
  TSP1.ACADEMIC_YEAR,
  TSP1.SEMESTER_CODE,
  TSP1.COURSE_ID,
  TC1.MAJOR_ID,
  TC1.GRADE
 FROM TCOUP_THEORETICAL_CLASS TTC1
      INNER join TCOUP_THEORETICAL_TASK TASK1 ON TASK1.THEORETICAL_TASK_ID = TTC1.THEORETICAL_TASK_ID AND TASK1.IS_DELETED = 0 
      INNER JOIN TCOUP_THEORETICAL_STARTCLASS TTS1 on TTS1.THEORETICAL_TASK_ID = TASK1.THEORETICAL_TASK_ID
      INNER JOIN TTRAP_STARTCLASS_PLAN TSP1 on TTS1.STARTCLASS_PLAN_ID = TSP1.STARTCLASS_PLAN_ID
      INNER JOIN TTRAP_GRADE_MAJOR GM1 ON GM1.GRADE_MAJOR_ID = TSP1.GRADE_MAJOR_ID
      INNER JOIN TSTU_CLASS TC1 ON TC1.CLASS_ID = TTC1.CLASS_ID  
) SETTING ON (
  SETTING.ACADEMIC_YEAR = SP.ACADEMIC_YEAR 
  AND SETTING.SEMESTER_CODE = SP.SEMESTER_CODE 
  AND SETTING.COURSE_ID = SP.COURSE_ID
  AND SETTING.MAJOR_ID = GM.MAJOR_ID
  AND SETTING.GRADE = GM.GRADE
 )
WHERE  SP.TEMP_FLAG = 0 AND SP.CLASS_TYPE = 1 -- 开课计划表 非临时数据 且 是环节
GROUP BY
  SP.ACADEMIC_YEAR,
  SP.SEMESTER_CODE,
  DEPARTMENT.DEPARTMENT_ID,
  DEPARTMENT.DEPARTMENT_NAME,
  COURSE.COURSE_ID,
  COURSE.COURSE_NO,
  COURSE. NAME,
  SP.COURSE_TYPE_CODE,
  SP.COURSE_ATTRIBUTE_CODE,
  COURSE.CREDIT,
  SP.TOTAL_PERIOD,
  SP.THEORY_PERIOD,
  SP.EXPERI_PERIOD,
  SP.PRACTICE_PERIOD,
  SP.OTHER_PERIOD,
  SP.CHECK_WAY_CODE,
  SP.WEEK_PERIOD
;
commit;


-- 
/*==============================================================*/
/* VIEW: VCOUP_TEACHCLASS_DEPARTMENT  理论任务-根据开课单位查询*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_TEACHCLASS_DEPARTMENT
AS
SELECT
	DISTINCT TASK.THEORETICAL_TASK_ID,
	PLANINFO.ACADEMIC_YEAR,
	PLANINFO.SEMESTER_CODE,
	DEPT.DEPARTMENT_NAME,
	DEPT.DEPARTMENT_ID,
	COURSE.NAME COURSE_NAME,
	COURSE.COURSE_NO,
	COURSE.CREDIT,
	CASE WHEN PLANINFO.TOTAL_PERIOD IS NULL THEN 0 ELSE PLANINFO.TOTAL_PERIOD END TOTAL_PERIOD,
 	CASE WHEN PLANINFO.THEORY_PERIOD IS NULL THEN 0 ELSE PLANINFO.THEORY_PERIOD END THEORY_PERIOD,
	CASE WHEN PLANINFO.EXPERI_PERIOD IS NULL THEN 0 ELSE PLANINFO.EXPERI_PERIOD END EXPERI_PERIOD,
 	CASE WHEN PLANINFO.PRACTICE_PERIOD IS NULL THEN 0 ELSE PLANINFO.PRACTICE_PERIOD END PRACTICE_PERIOD,
  CASE WHEN PLANINFO.OTHER_PERIOD IS NULL THEN 0 ELSE PLANINFO.OTHER_PERIOD END OTHER_PERIOD,
	TASK.TEACHING_METHODS_CODE,
	TASK.WEEKLY_HOURS,
	TASK.CONTIN_BLWDWN_COUNT,
	TASK.ARRANGE_WEEKS,
	TASK.SINGLE_OR_DOUBLE_WEEK,
	PLANINFO.CHECK_WAY_CODE,
	TASK.TEACHING_CLASS_NO,
	TASK.TEACHING_CLASS_MEMBER_COUNT,
	TASK.CAMPUS_ID,
	TASK.BUILDING_ID,
	TASK.TEACHROOM_ID,
	TASK.SOLID_LINE_SECTION,
	TASK.FORBIDDEN_LINE_SECTION,
	TASK.TEACHROOM_TYPE_CODE,
	CAMPUS.CAMPUS_NAME,
	BUILDING.BUILDING_NAME,
	VENUE.VENUE_NAME TEACHROOM_NAME,
	TEACHER.USER_ID TEACHER_ID,
	TEACHER.TEACHER_NAME,
	TEACHER.TEACHER_NO,
(
	select
wm_concat(DISTINCT(to_char('['||TEACHERINFO.TEACHER_NO||']'||TEACHERINFO.TEACHER_NAME)))
from
TCOUP_THEORETICAL_TEACHERS TT
LEFT JOIN TSYS_TEACHER TEACHERINFO ON TEACHERINFO.USER_ID = TT.TEACHER_ID
where  TT.THEORETICAL_TASK_ID = TASK.THEORETICAL_TASK_ID
) TEACHER_NAME_ALL,
(
	select
wm_concat(DISTINCT(to_char(TEACHERINFO.USER_ID)))
from
TCOUP_THEORETICAL_TEACHERS TT
LEFT JOIN TSYS_TEACHER TEACHERINFO ON TEACHERINFO.USER_ID = TT.TEACHER_ID
where  TT.THEORETICAL_TASK_ID = TASK.THEORETICAL_TASK_ID
) TEACHER_ID_ALL
FROM
	TSYS_DEPARTMENT DEPT
JOIN TTRAP_COURSE COURSE ON COURSE.DEPARTMENT_ID = DEPT.DEPARTMENT_ID
JOIN TTRAP_STARTCLASS_PLAN PLANINFO ON PLANINFO.COURSE_ID = COURSE.COURSE_ID
JOIN TCOUP_THEORETICAL_STARTCLASS STARTCLASS ON STARTCLASS.STARTCLASS_PLAN_ID = PLANINFO.STARTCLASS_PLAN_ID
JOIN TCOUP_THEORETICAL_TASK TASK ON TASK.THEORETICAL_TASK_ID = STARTCLASS.THEORETICAL_TASK_ID AND TASK.IS_DELETED = 0
LEFT JOIN TSYS_VENUE VENUE ON VENUE.VENUE_ID = TASK.TEACHROOM_ID
LEFT JOIN TSYS_BUILDING BUILDING ON BUILDING.BUILDING_ID = TASK.BUILDING_ID
LEFT JOIN TSYS_CAMPUS CAMPUS ON CAMPUS.CAMPUS_ID = TASK.CAMPUS_ID
LEFT JOIN TCOUP_THEORETICAL_TEACHERS TT ON TT.THEORETICAL_TASK_ID = TASK.THEORETICAL_TASK_ID
LEFT JOIN TSYS_TEACHER TEACHER ON TEACHER.USER_ID = TT.TEACHER_ID
;
commit;


-- 
/*==============================================================*/
/* VIEW: VCOUP_TEACHCLASS_GRADEMAJOR     理论任务-根据年级专业查询*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_TEACHCLASS_GRADEMAJOR
AS
SELECT
	TASK.THEORETICAL_TASK_ID ,
	DEPT.DEPARTMENT_NAME,
	DEPT.DEPARTMENT_ID,
	MAJOR.MAJOR_NAME,
	MAJOR.MAJOR_ID,
	DEPARTMENT.DEPARTMENT_NAME AS DEPARTMENT,
	GM.GRADE,
	COURSE.NAME COURSE_NAME,
	COURSE.COURSE_NO,
	COURSE.CREDIT,
	SP.ACADEMIC_YEAR,
	SP.SEMESTER_CODE,
	SP.STARTCLASS_PLAN_ID,
	CASE WHEN sp.TOTAL_PERIOD IS NULL THEN 0 ELSE sp.TOTAL_PERIOD END TOTAL_PERIOD,
 	CASE WHEN sp.THEORY_PERIOD IS NULL THEN 0 ELSE sp.THEORY_PERIOD END THEORY_PERIOD,
	CASE WHEN sp.EXPERI_PERIOD IS NULL THEN 0 ELSE sp.EXPERI_PERIOD END EXPERI_PERIOD,
 	CASE WHEN sp.PRACTICE_PERIOD IS NULL THEN 0 ELSE sp.PRACTICE_PERIOD END PRACTICE_PERIOD,
  CASE WHEN sp.OTHER_PERIOD IS NULL THEN 0 ELSE sp.OTHER_PERIOD END OTHER_PERIOD,
	TASK.TEACHING_METHODS_CODE,
	TASK.WEEKLY_HOURS,
	TASK.CONTIN_BLWDWN_COUNT,
	TASK.ARRANGE_WEEKS,
	TASK.SINGLE_OR_DOUBLE_WEEK,
	SP.CHECK_WAY_CODE,
	TASK.TEACHING_CLASS_NO,
	TASK.TEACHING_CLASS_MEMBER_COUNT,
	CAMPUS.CAMPUS_NAME,
	BUILDING.BUILDING_NAME,
	VENUE.VENUE_NAME TEACHROOM_NAME,
	TASK.SOLID_LINE_SECTION,
	TASK.FORBIDDEN_LINE_SECTION,
	TASK.TEACHROOM_TYPE_CODE,
	TEACHER.USER_ID TEACHER_ID,
	TEACHER.TEACHER_NAME,
	TEACHER.TEACHER_NO,
(
	select
wm_concat(DISTINCT(to_char('['||TEACHERINFO.TEACHER_NO||']'||TEACHERINFO.TEACHER_NAME)))
from
TCOUP_THEORETICAL_TEACHERS TT
LEFT JOIN TSYS_TEACHER TEACHERINFO ON TEACHERINFO.USER_ID = TT.TEACHER_ID
where  TT.THEORETICAL_TASK_ID = TASK.THEORETICAL_TASK_ID
) TEACHER_NAME_ALL,
(
	select
wm_concat(DISTINCT(to_char(TEACHERINFO.USER_ID)))
from
TCOUP_THEORETICAL_TEACHERS TT
LEFT JOIN TSYS_TEACHER TEACHERINFO ON TEACHERINFO.USER_ID = TT.TEACHER_ID
where  TT.THEORETICAL_TASK_ID = TASK.THEORETICAL_TASK_ID
) TEACHER_ID_ALL
FROM TSYS_DEPARTMENT DEPT
JOIN TSYS_MAJOR MAJOR ON DEPT.DEPARTMENT_ID = MAJOR.DEPARTMENT_ID
JOIN TTRAP_GRADE_MAJOR GM ON GM.MAJOR_ID = MAJOR.MAJOR_ID
JOIN TTRAP_STARTCLASS_PLAN SP ON SP.GRADE_MAJOR_ID = GM.GRADE_MAJOR_ID
JOIN TTRAP_COURSE COURSE ON COURSE.COURSE_ID = SP.COURSE_ID
JOIN TSYS_DEPARTMENT DEPARTMENT ON DEPARTMENT.DEPARTMENT_ID = COURSE.DEPARTMENT_ID
JOIN TCOUP_THEORETICAL_STARTCLASS STARTCLASS ON STARTCLASS.STARTCLASS_PLAN_ID = SP.STARTCLASS_PLAN_ID 
JOIN TCOUP_THEORETICAL_TASK TASK ON TASK.THEORETICAL_TASK_ID = STARTCLASS.THEORETICAL_TASK_ID AND TASK.IS_DELETED = 0
LEFT JOIN TSYS_VENUE VENUE ON VENUE.VENUE_ID = TASK.TEACHROOM_ID
LEFT JOIN TSYS_BUILDING BUILDING ON BUILDING.BUILDING_ID = TASK.BUILDING_ID
LEFT JOIN TSYS_CAMPUS CAMPUS ON CAMPUS.CAMPUS_ID = TASK.CAMPUS_ID
LEFT JOIN TCOUP_THEORETICAL_TEACHERS TT ON TT.THEORETICAL_TASK_ID = TASK.THEORETICAL_TASK_ID
LEFT JOIN TSYS_TEACHER TEACHER ON TEACHER.USER_ID = TT.TEACHER_ID
;
commit;


-- 
/*==============================================================*/
/* VIEW: VCOUP_TEACHERINFO      指导老师信息                   		*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_TEACHERINFO
AS
SELECT
	DISTINCT TEACHER.USER_ID,
	TEACHER.TEACHER_NAME,
	TEACHER.TEACHER_NO,
	DEPT.DEPARTMENT_NAME,
	DEPT.DEPARTMENT_ID,
	TEACHER.SEX_CODE,
	TEACHER.TEACHER_TYPE_CODE
FROM
	TSYS_TEACHER TEACHER
LEFT JOIN TSYS_DEPARTMENT_USER DEPTUSER ON DEPTUSER.USER_ID = TEACHER.USER_ID
AND DEPTUSER.RELATION_TYPE = 1
LEFT JOIN TSYS_DEPARTMENT DEPT ON DEPT.DEPARTMENT_ID = DEPTUSER.DEPARTMENT_ID
;
commit;


-- 
/*==============================================================*/
/* VIEW: VCOUP_TEACHROOM                              			*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_TEACHROOM
AS
SELECT
	CAMPUS.CAMPUS_ID,
	CAMPUS.CAMPUS_NAME,
	BUILDING.BUILDING_ID,
	BUILDING.BUILDING_NAME,
	VENUE.VENUE_ID,
	VENUE.VENUE_NO,
	VENUE.VENUE_NAME,
	VENUE.DEPARTMENT_ID,
	VENUE.VENUE_TYPE_CODE,
	VENUE.EFFECTIVE_SEAT_AMOUNT,
	VENUE.IS_ENABLED
FROM
	TSYS_VENUE VENUE
LEFT JOIN TSYS_CAMPUS CAMPUS ON CAMPUS.CAMPUS_ID = VENUE.CAMPUS_ID
LEFT JOIN TSYS_BUILDING BUILDING ON BUILDING.BUILDING_ID = VENUE.BUILDING_ID
WHERE
	VENUE.IS_DELETED = 0-- 未删除的场地信息
; 
commit;


-- 
/*==============================================================*/
/* VIEW: VCOUP_THEORETICAL_ALL                              	*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_THEORETICAL_ALL
AS
SELECT
	TASK.THEORETICAL_TASK_ID,
	wm_concat ( DISTINCT (TO_CHAR(TEACHER.TEACHER_ID)) ) TEACHER_ID 
FROM
	TCOUP_THEORETICAL_TASK TASK
LEFT JOIN TCOUP_THEORETICAL_TEACHERS   TEACHER ON TEACHER.THEORETICAL_TASK_ID = TASK.THEORETICAL_TASK_ID
WHERE TASK.IS_DELETED = 0
GROUP BY TASK.THEORETICAL_TASK_ID
;
commit;


-- 排课时间设置进度获取视图
/*==============================================================*/
/* VIEW: VCOUP_CURRENTSCHEDULESETTING                              	*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_CURRENTSCHEDULESETTING
AS
SELECT
	s."SCHEDULE_SETTINGS_ID",
	s."ACADEMIC_YEAR",
	s."SEMESTER_CODE",
	s."PRACTICE_TASK_START_TIME",
	s."PRACTICE_TASK_END_TIME",
	s."PRACTICAL_ARRANGE_START_TIME",
	s."PRACTICAL_ARRANGE_END_TIME",
	s."THEORETICAL_TASK_START_TIME",
	s."THEORETICAL_TASK_END_TIME",
	s."SCHEDULE_ARRANGE_START_TIME",
	s."SCHEDULE_ARRANGE_END_TIME",
	s."CREATE_USER_ID",
	s."CREATE_TIME",
	s."UPDATE_USER_ID",
	s."UPDATE_TIME"
FROM
	TCOUP_SCHEDULE_SETTINGS s ----获取当前排课学年学期的排课进度设置
INNER JOIN TCOUP_TIME_SETTINGS T ON s.ACADEMIC_YEAR = T .ACADEMIC_YEAR
AND s.SEMESTER_CODE = T .SEMESTER_CODE
AND T .CURRENT_SEMESTER = 1
;
commit;


-- 理论任务班级信息视图
/*==============================================================*/
/* VIEW: VCOUP_THEORETICAL_CLASS                              	*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_THEORETICAL_CLASS
AS
SELECT DISTINCT
	THEOC.THEORETICAL_CLASS_ID,
	THEOC.THEORETICAL_TASK_ID,
	CLA.CLASS_ID,
	CLA.CLASS_NO,
	CLA.CLASS_NAME,
	CLA.CAMPUS_ID,
	MAJ.DEPARTMENT_ID
FROM
	TCOUP_THEORETICAL_CLASS THEOC -- 理论任务和班级中间表
LEFT JOIN TSTU_CLASS CLA ON CLA.CLASS_ID = THEOC.CLASS_ID -- 班级信息表
LEFT JOIN TSYS_MAJOR MAJ ON MAJ.MAJOR_ID = CLA.MAJOR_ID
;
commit;


-- 班级课表视图
/*==============================================================*/
/* VIEW: VCOUP_CLASS_SCHEDULE                              	*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_CLASS_SCHEDULE
AS
SELECT DISTINCT
	(
		SCHT.SCHEDULING_TASK_ID || CLAS.CLASS_ID
	) SCHEDULING_TASK_ID,
	SCHT.THEORETICAL_TASK_ID,
	SCHT.ACADEMIC_YEAR,
	SCHT.SEMESTER_CODE,
	SCHT.COURSE_ARRANGE_WEEKLY,
	SCHT.COURSE_ARRANGE_SECTION,
	SCHT.SINGLE_OR_DOUBLE_WEEK,
	COUR."NAME" COURSE_NAME,
	BUILDING.BUILDING_NAME,
	VENUE.VENUE_NAME,
	"DECODE" (
		TEACR.SCHEDULE_TEACHERS,
		NULL,
		TTS.TEACHERS,
		TEACR.SCHEDULE_TEACHERS
	) TEACHERS,
	-- 周次查询
	(
		',' || SCHT.COURSE_ARRANGE_WEEK_LIST || ','
	) WEEK_NO,
	-- 班级ID查询
	CLAS.CLASS_ID,
	-- 班级查询
	CLAS.CLASS_NAME,
	-- 校区查询
	CAMP.CAMPUS_ID,
	-- 单位查询
	MAJO.DEPARTMENT_ID,
	DEPA.DEPARTMENT_NAME,
	-- 年级查询
	CLAS.GRADE,
	-- 专业查询
	CLAS.MAJOR_ID,
	MAJO.MAJOR_NAME,
	-- 通识课查询
	THES.IS_CORE_CURRICULUM,
	PRA.CLASS_PRACTICE_WEEK
FROM
	TSTU_CLASS CLAS -- 班级信息表
LEFT JOIN TCOUP_THEORETICAL_CLASS THEC ON THEC.CLASS_ID = CLAS.CLASS_ID -- 理论任务和班级中间表
INNER JOIN TCOUP_SCHEDULING_TASK SCHT ON SCHT.THEORETICAL_TASK_ID = THEC.THEORETICAL_TASK_ID -- 排课任务表
LEFT JOIN TSYS_BUILDING BUILDING ON BUILDING.BUILDING_ID = SCHT.BUILDING_ID -- 楼房信息表
LEFT JOIN TSYS_VENUE VENUE ON VENUE.VENUE_ID = SCHT.VENUE_ID -- 场地信息表
LEFT JOIN TTRAP_COURSE COUR ON COUR.COURSE_ID = SCHT.COURSE_ID -- 课程信息表
LEFT JOIN TSYS_MAJOR MAJO ON MAJO.MAJOR_ID = CLAS.MAJOR_ID -- 专业信息表
LEFT JOIN TSYS_DEPARTMENT DEPA ON DEPA.DEPARTMENT_ID = MAJO.DEPARTMENT_ID -- 单位（院系）信息表
LEFT JOIN TSYS_CAMPUS CAMP ON CAMP.CAMPUS_ID = CLAS.CAMPUS_ID -- 校区信息表
LEFT JOIN (
	SELECT DISTINCT
		THESTART.THEORETICAL_TASK_ID,
		STARTPLAN.IS_CORE_CURRICULUM
	FROM
		TCOUP_THEORETICAL_STARTCLASS THESTART
	LEFT JOIN TTRAP_STARTCLASS_PLAN STARTPLAN ON STARTPLAN.STARTCLASS_PLAN_ID = THESTART.STARTCLASS_PLAN_ID
) THES ON THES.THEORETICAL_TASK_ID = SCHT.THEORETICAL_TASK_ID
LEFT JOIN (
	-- 关联理论任务教师
	SELECT DISTINCT
		THETE.THEORETICAL_TASK_ID,
		(
			WMSYS.WM_CONCAT (TO_CHAR(TCR.TEACHER_NAME)) OVER (
				PARTITION BY THETE.THEORETICAL_TASK_ID
			)
		) TEACHERS
	FROM
		TCOUP_THEORETICAL_TEACHERS THETE
	LEFT JOIN TSYS_TEACHER TCR ON TCR.USER_ID = THETE.TEACHER_ID
) TTS ON TTS.THEORETICAL_TASK_ID = SCHT.THEORETICAL_TASK_ID
LEFT JOIN (
	-- 关联调代课教师
	SELECT DISTINCT
		TEA.SCHEDULING_TASK_ID,
		(
			WMSYS.WM_CONCAT (TO_CHAR(TCR.TEACHER_NAME)) OVER (
				PARTITION BY TEA.SCHEDULING_TASK_ID
			)
		) SCHEDULE_TEACHERS
	FROM
		TCOUP_SCHEDULE_TEACHER TEA
	LEFT JOIN TSYS_TEACHER TCR ON TCR.USER_ID = TEA.TEACHER_ID
) TEACR ON TEACR.SCHEDULING_TASK_ID = SCHT.SCHEDULING_TASK_ID
LEFT JOIN (
	SELECT DISTINCT
		ACADEMIC_YEAR,
		SEMESTER_CODE,
		CLASS_ID,
		(
			WMSYS.WM_CONCAT (
				TO_CHAR ("NAME") || '（第' || TO_CHAR (PRACTICE_WEEKS) || '周）'
			) OVER (
				PARTITION BY ACADEMIC_YEAR,
				SEMESTER_CODE,
				CLASS_ID
			)
		) CLASS_PRACTICE_WEEK
	FROM
		(
			SELECT DISTINCT
				LIN.ACADEMIC_YEAR,
				LIN.SEMESTER_CODE,
				LIN.CLASS_ID,
				LINKCOU."NAME",
				LIN.PRACTICE_WEEKS
			FROM
				TCOUP_LINK_CLASS_WEEK LIN
			LEFT JOIN TTRAP_COURSE LINKCOU ON LINKCOU.COURSE_ID = LIN.COURSE_ID
			ORDER BY
				LIN.ACADEMIC_YEAR,
				LIN.SEMESTER_CODE,
				LIN.CLASS_ID,
				LINKCOU."NAME"
		)
) PRA ON PRA.ACADEMIC_YEAR = SCHT.ACADEMIC_YEAR
AND PRA.SEMESTER_CODE = SCHT.SEMESTER_CODE
AND PRA.CLASS_ID = CLAS.CLASS_ID
UNION
	(
		SELECT DISTINCT
			(
				PRA.ACADEMIC_YEAR || PRA.SEMESTER_CODE || CLAS.CLASS_ID
			) SCHEDULING_TASK_ID,
			SCHTA.THEORETICAL_TASK_ID,
			PRA.ACADEMIC_YEAR,
			PRA.SEMESTER_CODE,
			NULL COURSE_ARRANGE_WEEKLY,
			NULL COURSE_ARRANGE_SECTION,
			NULL SINGLE_OR_DOUBLE_WEEK,
			NULL COURSE_NAME,
			NULL BUILDING_NAME,
			NULL VENUE_NAME,
			NULL TEACHERS,
			-- 周次查询
			NULL WEEK_NO,
			-- 班级ID查询
			CLAS.CLASS_ID,
			-- 班级查询
			CLAS.CLASS_NAME,
			-- 校区查询
			CAMP.CAMPUS_ID,
			-- 单位查询
			MAJO.DEPARTMENT_ID,
			DEPA.DEPARTMENT_NAME,
			-- 年级查询
			CLAS.GRADE,
			-- 专业查询
			CLAS.MAJOR_ID,
			MAJO.MAJOR_NAME,
			-- 通识课查询
			3 IS_CORE_CURRICULUM,
			PRA.CLASS_PRACTICE_WEEK
		FROM
			TSTU_CLASS CLAS -- 班级信息表
		LEFT JOIN TSYS_MAJOR MAJO ON MAJO.MAJOR_ID = CLAS.MAJOR_ID -- 专业信息表
		LEFT JOIN TSYS_DEPARTMENT DEPA ON DEPA.DEPARTMENT_ID = MAJO.DEPARTMENT_ID -- 单位（院系）信息表
		LEFT JOIN TSYS_CAMPUS CAMP ON CAMP.CAMPUS_ID = CLAS.CAMPUS_ID -- 校区信息表
		INNER JOIN (
			SELECT DISTINCT
				ACADEMIC_YEAR,
				SEMESTER_CODE,
				CLASS_ID,
				(
					WMSYS.WM_CONCAT (
						TO_CHAR ("NAME") || '（第' || TO_CHAR (PRACTICE_WEEKS) || '周）'
					) OVER (
						PARTITION BY ACADEMIC_YEAR,
						SEMESTER_CODE,
						CLASS_ID
					)
				) CLASS_PRACTICE_WEEK
			FROM
				(
					SELECT DISTINCT
						LIN.ACADEMIC_YEAR,
						LIN.SEMESTER_CODE,
						LIN.CLASS_ID,
						LINKCOU."NAME",
						LIN.PRACTICE_WEEKS
					FROM
						TCOUP_LINK_CLASS_WEEK LIN
					LEFT JOIN TTRAP_COURSE LINKCOU ON LINKCOU.COURSE_ID = LIN.COURSE_ID
					ORDER BY
						LIN.ACADEMIC_YEAR,
						LIN.SEMESTER_CODE,
						LIN.CLASS_ID,
						LINKCOU."NAME"
				)
		) PRA ON PRA.CLASS_ID = CLAS.CLASS_ID
		LEFT JOIN (
			SELECT
				SCHT.THEORETICAL_TASK_ID,
				SCHT.ACADEMIC_YEAR,
				SCHT.SEMESTER_CODE,
				THEC.CLASS_ID
			FROM
				TCOUP_SCHEDULING_TASK SCHT -- 排课任务表
			LEFT JOIN TCOUP_THEORETICAL_CLASS THEC ON THEC.THEORETICAL_TASK_ID = SCHT.THEORETICAL_TASK_ID
		) SCHTA ON SCHTA.ACADEMIC_YEAR = PRA.ACADEMIC_YEAR
		AND SCHTA.SEMESTER_CODE = PRA.SEMESTER_CODE
		AND SCHTA.CLASS_ID = CLAS.CLASS_ID -- 理论任务和班级中间表
		WHERE
			SCHTA.THEORETICAL_TASK_ID IS NULL
	)
;

commit;


-- 教师课表视图
/*==============================================================*/
/* VIEW: VCOUP_TEACHER_SCHEDULE                              	*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_TEACHER_SCHEDULE AS
SELECT
	*
FROM
	(
		SELECT DISTINCT
			(
				SCHT.SCHEDULING_TASK_ID || "DECODE" (
					TEACR.SCHEDULE_TEACHERS,
					NULL,
					TTS.USER_ID,
					TEACR.USER_ID
				)
			) SCHEDULING_TASK_ID,
			SCHT.THEORETICAL_TASK_ID,
			SCHT.ACADEMIC_YEAR,
			SCHT.SEMESTER_CODE,
			SCHT.COURSE_ARRANGE_WEEKLY,
			SCHT.COURSE_ARRANGE_SECTION,
			SCHT.SINGLE_OR_DOUBLE_WEEK,
			COUR."NAME" COURSE_NAME,
			BUILDING.BUILDING_NAME,
			VENUE.VENUE_NAME,
			"DECODE" (
				THES.COURSE_TYPE,
				'13',
				THET.TEACHING_CLASS_NO,
				''
			) CLASSES,
			"DECODE" (
				TEACR.SCHEDULE_TEACHERS,
				NULL,
				TTS.TEACHERS,
				TEACR.SCHEDULE_TEACHERS
			) TEACHERS,
			"DECODE" (
				TEACR.SCHEDULE_TEACHERS,
				NULL,
				TTS.USER_ID,
				TEACR.USER_ID
			) TEACHER_ID,
			"DECODE" (
				TEACR.SCHEDULE_TEACHERS,
				NULL,
				TTS.TEACHER_NO,
				TEACR.TEACHER_NO
			) TEACHER_NO,
			"DECODE" (
				TEACR.SCHEDULE_TEACHERS,
				NULL,
				TTS.TEACHER_NAME,
				TEACR.TEACHER_NAME
			) TEACHER_NAME,
			"DECODE" (
				TEACR.SCHEDULE_TEACHERS,
				NULL,
				TTS.DEPARTMENT_ID,
				TEACR.DEPARTMENT_ID
			) DEPARTMENT_ID,
			"DECODE" (
				TEACR.SCHEDULE_TEACHERS,
				NULL,
				TTS.DEPARTMENT_NAME,
				TEACR.DEPARTMENT_NAME
			) DEPARTMENT_NAME,
			"DECODE" (
				TEACR.SCHEDULE_TEACHERS,
				NULL,
				TTS.CLASS_PRACTICE_WEEK,
				TEACR.CLASS_PRACTICE_WEEK
			) TEACHER_PRACTICE_WEEK,
			(
				',' || SCHT.COURSE_ARRANGE_WEEK_LIST || ','
			) WEEK_NO -- 周次查询
		FROM
			TCOUP_SCHEDULING_TASK SCHT -- 排课任务表
		LEFT JOIN TSYS_BUILDING BUILDING ON BUILDING.BUILDING_ID = SCHT.BUILDING_ID -- 楼房信息表
		LEFT JOIN TSYS_VENUE VENUE ON VENUE.VENUE_ID = SCHT.VENUE_ID -- 场地信息表
		LEFT JOIN TTRAP_COURSE COUR ON COUR.COURSE_ID = SCHT.COURSE_ID -- 课程信息表
		LEFT JOIN TCOUP_THEORETICAL_TASK THET ON THET.THEORETICAL_TASK_ID = SCHT.THEORETICAL_TASK_ID -- 理论任务信息表
		LEFT JOIN (
			-- 关联理论任务教师
			SELECT DISTINCT
				THETE.THEORETICAL_TASK_ID,
				TCR.USER_ID,
				TCR.TEACHER_NO,
				TCR.TEACHER_NAME,
				(
					WMSYS.WM_CONCAT (
						TO_CHAR (
							'[' || TCR.TEACHER_NO || ']' || TCR.TEACHER_NAME
						)
					) OVER (
						PARTITION BY THETE.THEORETICAL_TASK_ID
					)
				) TEACHERS,
				DEPA.DEPARTMENT_ID,
				DEPA.DEPARTMENT_NAME,
				PRA.CLASS_PRACTICE_WEEK
			FROM
				TCOUP_THEORETICAL_TEACHERS THETE
			LEFT JOIN TSYS_TEACHER TCR ON TCR.USER_ID = THETE.TEACHER_ID
			LEFT JOIN TCOUP_THEORETICAL_TASK THET ON THET.THEORETICAL_TASK_ID = THETE.THEORETICAL_TASK_ID
			LEFT JOIN TSYS_DEPARTMENT_USER DEPAUSER ON DEPAUSER.USER_ID = THETE.TEACHER_ID
			AND DEPAUSER.RELATION_TYPE = 1
			LEFT JOIN TSYS_DEPARTMENT DEPA ON DEPA.DEPARTMENT_ID = DEPAUSER.DEPARTMENT_ID
			LEFT JOIN (
				SELECT
					ACADEMIC_YEAR,
					SEMESTER_CODE,
					TEACHER_ID,
					(
						WMSYS.WM_CONCAT (
							TO_CHAR ("NAME") || '_' || TO_CHAR (CLASS_PRACTICE_WEEK)
						) OVER (
							PARTITION BY ACADEMIC_YEAR,
							SEMESTER_CODE,
							TEACHER_ID
						)
					) CLASS_PRACTICE_WEEK
				FROM
					(
						SELECT DISTINCT
							PRAAR.ACADEMIC_YEAR,
							PRAAR.SEMESTER_CODE,
							PRAT.TEACHER_ID,
							PRAAR."NAME",
							"REPLACE" (
								(
									WMSYS.WM_CONCAT (
										TO_CHAR (PRAAR.PRACTICE_WEEKS)
									) OVER (
										PARTITION BY PRAAR.ACADEMIC_YEAR,
										PRAAR.SEMESTER_CODE,
										PRAT.TEACHER_ID,
										PRAAR."NAME"
									)
								),
								',',
								'、'
							) CLASS_PRACTICE_WEEK
						FROM
							TCOUP_PRACTICAL_TEACHER PRAT
						LEFT JOIN (
							SELECT
								PRACTICAL_ARRANGE_ID,
								ACADEMIC_YEAR,
								SEMESTER_CODE,
								"NAME",
								(
									WMSYS.WM_CONCAT (TO_CHAR(PRACTICE_WEEKS)) OVER (
										PARTITION BY PRACTICAL_ARRANGE_ID
									)
								) PRACTICE_WEEKS
							FROM
								(
									SELECT DISTINCT
										PRAA.PRACTICAL_ARRANGE_ID,
										PRAA.ACADEMIC_YEAR,
										PRAA.SEMESTER_CODE,
										LINKCOU."NAME",
										LIN.PRACTICE_WEEKS
									FROM
										TCOUP_PRACTICAL_ARRANGE PRAA
									LEFT JOIN TTRAP_COURSE LINKCOU ON LINKCOU.COURSE_ID = PRAA.COURSE_ID
									LEFT JOIN TCOUP_PRACTICAL_STUDENT PRAS ON PRAS.PRACTICAL_ARRANGE_ID = PRAA.PRACTICAL_ARRANGE_ID
									LEFT JOIN TSTU_ARCHIVES_REGISTER ARCR ON ARCR.ACADEMIC_YEAR = PRAA.ACADEMIC_YEAR
									AND ARCR.SEMESTER_CODE = PRAA.SEMESTER_CODE
									AND ARCR.USER_ID = PRAS.STUDENT_ID
									LEFT JOIN TCOUP_LINK_CLASS_WEEK LIN ON LIN.ACADEMIC_YEAR = PRAA.ACADEMIC_YEAR
									AND LIN.SEMESTER_CODE = PRAA.SEMESTER_CODE
									AND LIN.COURSE_ID = PRAA.COURSE_ID
									AND LIN.CLASS_ID = ARCR.CLASS_ID
								)
						) PRAAR ON PRAAR.PRACTICAL_ARRANGE_ID = PRAT.PRACTICAL_ARRANGE_ID
					)
			) PRA ON PRA.ACADEMIC_YEAR = THET.ACADEMIC_YEAR
			AND PRA.SEMESTER_CODE = THET.SEMESTER_CODE
			AND PRA.TEACHER_ID = TCR.USER_ID
		) TTS ON TTS.THEORETICAL_TASK_ID = SCHT.THEORETICAL_TASK_ID
		LEFT JOIN (
			-- 关联调代课教师
			SELECT DISTINCT
				TEA.SCHEDULING_TASK_ID,
				TCR.USER_ID,
				TCR.TEACHER_NO,
				TCR.TEACHER_NAME,
				(
					WMSYS.WM_CONCAT (
						TO_CHAR (
							'[' || TCR.TEACHER_NO || ']' || TCR.TEACHER_NAME
						)
					) OVER (
						PARTITION BY TEA.SCHEDULING_TASK_ID
					)
				) SCHEDULE_TEACHERS,
				DEPA.DEPARTMENT_ID,
				DEPA.DEPARTMENT_NAME,
				PRA.CLASS_PRACTICE_WEEK
			FROM
				TCOUP_SCHEDULE_TEACHER TEA
			LEFT JOIN TSYS_TEACHER TCR ON TCR.USER_ID = TEA.TEACHER_ID
			LEFT JOIN TCOUP_SCHEDULING_TASK SCHT ON SCHT.SCHEDULING_TASK_ID = TEA.SCHEDULING_TASK_ID
			LEFT JOIN TSYS_DEPARTMENT_USER DEPAUSER ON DEPAUSER.USER_ID = TEA.TEACHER_ID
			AND DEPAUSER.RELATION_TYPE = 1
			LEFT JOIN TSYS_DEPARTMENT DEPA ON DEPA.DEPARTMENT_ID = DEPAUSER.DEPARTMENT_ID
			LEFT JOIN (
				SELECT
					ACADEMIC_YEAR,
					SEMESTER_CODE,
					TEACHER_ID,
					(
						WMSYS.WM_CONCAT (
							TO_CHAR ("NAME") || '_' || TO_CHAR (CLASS_PRACTICE_WEEK)
						) OVER (
							PARTITION BY ACADEMIC_YEAR,
							SEMESTER_CODE,
							TEACHER_ID
						)
					) CLASS_PRACTICE_WEEK
				FROM
					(
						SELECT DISTINCT
							PRAAR.ACADEMIC_YEAR,
							PRAAR.SEMESTER_CODE,
							PRAT.TEACHER_ID,
							PRAAR."NAME",
							"REPLACE" (
								(
									WMSYS.WM_CONCAT (
										TO_CHAR (PRAAR.PRACTICE_WEEKS)
									) OVER (
										PARTITION BY PRAAR.ACADEMIC_YEAR,
										PRAAR.SEMESTER_CODE,
										PRAT.TEACHER_ID,
										PRAAR."NAME"
									)
								),
								',',
								'、'
							) CLASS_PRACTICE_WEEK
						FROM
							TCOUP_PRACTICAL_TEACHER PRAT
						LEFT JOIN (
							SELECT
								PRACTICAL_ARRANGE_ID,
								ACADEMIC_YEAR,
								SEMESTER_CODE,
								"NAME",
								(
									WMSYS.WM_CONCAT (TO_CHAR(PRACTICE_WEEKS)) OVER (
										PARTITION BY PRACTICAL_ARRANGE_ID
									)
								) PRACTICE_WEEKS
							FROM
								(
									SELECT DISTINCT
										PRAA.PRACTICAL_ARRANGE_ID,
										PRAA.ACADEMIC_YEAR,
										PRAA.SEMESTER_CODE,
										LINKCOU."NAME",
										LIN.PRACTICE_WEEKS
									FROM
										TCOUP_PRACTICAL_ARRANGE PRAA
									LEFT JOIN TTRAP_COURSE LINKCOU ON LINKCOU.COURSE_ID = PRAA.COURSE_ID
									LEFT JOIN TCOUP_PRACTICAL_STUDENT PRAS ON PRAS.PRACTICAL_ARRANGE_ID = PRAA.PRACTICAL_ARRANGE_ID
									LEFT JOIN TSTU_ARCHIVES_REGISTER ARCR ON ARCR.ACADEMIC_YEAR = PRAA.ACADEMIC_YEAR
									AND ARCR.SEMESTER_CODE = PRAA.SEMESTER_CODE
									AND ARCR.USER_ID = PRAS.STUDENT_ID
									LEFT JOIN TCOUP_LINK_CLASS_WEEK LIN ON LIN.ACADEMIC_YEAR = PRAA.ACADEMIC_YEAR
									AND LIN.SEMESTER_CODE = PRAA.SEMESTER_CODE
									AND LIN.COURSE_ID = PRAA.COURSE_ID
									AND LIN.CLASS_ID = ARCR.CLASS_ID
								)
						) PRAAR ON PRAAR.PRACTICAL_ARRANGE_ID = PRAT.PRACTICAL_ARRANGE_ID
					)
			) PRA ON PRA.ACADEMIC_YEAR = SCHT.ACADEMIC_YEAR
			AND PRA.SEMESTER_CODE = SCHT.SEMESTER_CODE
			AND PRA.TEACHER_ID = TCR.USER_ID
		) TEACR ON TEACR.SCHEDULING_TASK_ID = SCHT.SCHEDULING_TASK_ID
		LEFT JOIN (
			SELECT DISTINCT
				THEOS.THEORETICAL_TASK_ID,
				(
					STARP.COURSE_TYPE_CODE || STARP.COURSE_ATTRIBUTE_CODE
				) COURSE_TYPE
			FROM
				TCOUP_THEORETICAL_STARTCLASS THEOS
			LEFT JOIN TTRAP_STARTCLASS_PLAN STARP ON STARP.STARTCLASS_PLAN_ID = THEOS.STARTCLASS_PLAN_ID
		) THES ON THES.THEORETICAL_TASK_ID = SCHT.THEORETICAL_TASK_ID
		LEFT JOIN (
			SELECT DISTINCT
				THEOC.THEORETICAL_TASK_ID,
				(
					WMSYS.WM_CONCAT (TO_CHAR(CLAS.CLASS_NAME)) OVER (
						PARTITION BY THEOC.THEORETICAL_TASK_ID
					)
				) CLASSES
			FROM
				TCOUP_THEORETICAL_CLASS THEOC -- 理论任务和班级中间表
			LEFT JOIN TSTU_CLASS CLAS ON CLAS.CLASS_ID = THEOC.CLASS_ID -- 班级信息表
		) THEC ON THEC.THEORETICAL_TASK_ID = SCHT.THEORETICAL_TASK_ID
	)
WHERE
	TEACHER_ID IS NOT NULL
UNION
	(
		SELECT
			PRATE.TEACHER_ID SCHEDULING_TASK_ID,
			NULL THEORETICAL_TASK_ID,
			PRATE.ACADEMIC_YEAR,
			PRATE.SEMESTER_CODE,
			NULL COURSE_ARRANGE_WEEKLY,
			NULL COURSE_ARRANGE_SECTION,
			NULL SINGLE_OR_DOUBLE_WEEK,
			NULL COURSE_NAME,
			NULL BUILDING_NAME,
			NULL VENUE_NAME,
			NULL CLASSES,
			NULL TEACHERS,
			PRATE.TEACHER_ID,
			TCR.TEACHER_NO,
			TCR.TEACHER_NAME,
			DEPA.DEPARTMENT_ID,
			DEPA.DEPARTMENT_NAME,
			(
				WMSYS.WM_CONCAT (
					TO_CHAR (PRATE."NAME") || '_' || TO_CHAR (PRATE.CLASS_PRACTICE_WEEK)
				) OVER (
					PARTITION BY PRATE.ACADEMIC_YEAR,
					PRATE.SEMESTER_CODE,
					PRATE.TEACHER_ID
				)
			) CLASS_PRACTICE_WEEK,
			NULL WEEK_NO
		FROM
			(
				SELECT DISTINCT
					PRAAR.ACADEMIC_YEAR,
					PRAAR.SEMESTER_CODE,
					PRAT.TEACHER_ID,
					PRAAR."NAME",
					"REPLACE" (
						(
							WMSYS.WM_CONCAT (
								TO_CHAR (PRAAR.PRACTICE_WEEKS)
							) OVER (
								PARTITION BY PRAAR.ACADEMIC_YEAR,
								PRAAR.SEMESTER_CODE,
								PRAT.TEACHER_ID,
								PRAAR."NAME"
							)
						),
						',',
						'、'
					) CLASS_PRACTICE_WEEK
				FROM
					TCOUP_PRACTICAL_TEACHER PRAT
				LEFT JOIN (
					SELECT
						PRACTICAL_ARRANGE_ID,
						ACADEMIC_YEAR,
						SEMESTER_CODE,
						"NAME",
						(
							WMSYS.WM_CONCAT (TO_CHAR(PRACTICE_WEEKS)) OVER (
								PARTITION BY PRACTICAL_ARRANGE_ID
							)
						) PRACTICE_WEEKS
					FROM
						(
							SELECT DISTINCT
								PRAA.PRACTICAL_ARRANGE_ID,
								PRAA.ACADEMIC_YEAR,
								PRAA.SEMESTER_CODE,
								LINKCOU."NAME",
								LIN.PRACTICE_WEEKS
							FROM
								TCOUP_PRACTICAL_ARRANGE PRAA
							LEFT JOIN TTRAP_COURSE LINKCOU ON LINKCOU.COURSE_ID = PRAA.COURSE_ID
							LEFT JOIN TCOUP_PRACTICAL_STUDENT PRAS ON PRAS.PRACTICAL_ARRANGE_ID = PRAA.PRACTICAL_ARRANGE_ID
							LEFT JOIN TSTU_ARCHIVES_REGISTER ARCR ON ARCR.ACADEMIC_YEAR = PRAA.ACADEMIC_YEAR
							AND ARCR.SEMESTER_CODE = PRAA.SEMESTER_CODE
							AND ARCR.USER_ID = PRAS.STUDENT_ID
							LEFT JOIN TCOUP_LINK_CLASS_WEEK LIN ON LIN.ACADEMIC_YEAR = PRAA.ACADEMIC_YEAR
							AND LIN.SEMESTER_CODE = PRAA.SEMESTER_CODE
							AND LIN.COURSE_ID = PRAA.COURSE_ID
							AND LIN.CLASS_ID = ARCR.CLASS_ID
						)
				) PRAAR ON PRAAR.PRACTICAL_ARRANGE_ID = PRAT.PRACTICAL_ARRANGE_ID
				ORDER BY
					PRAAR.ACADEMIC_YEAR,
					PRAAR.SEMESTER_CODE,
					PRAT.TEACHER_ID,
					PRAAR."NAME"
			) PRATE
		LEFT JOIN TCOUP_THEORETICAL_TEACHERS THETE ON THETE.TEACHER_ID = PRATE.TEACHER_ID
		LEFT JOIN TCOUP_SCHEDULE_TEACHER TEA ON TEA.TEACHER_ID = PRATE.TEACHER_ID
		LEFT JOIN TSYS_TEACHER TCR ON TCR.USER_ID = PRATE.TEACHER_ID
		LEFT JOIN TSYS_DEPARTMENT_USER DEPAUSER ON DEPAUSER.USER_ID = PRATE.TEACHER_ID
		AND DEPAUSER.RELATION_TYPE = 1
		LEFT JOIN TSYS_DEPARTMENT DEPA ON DEPA.DEPARTMENT_ID = DEPAUSER.DEPARTMENT_ID
		WHERE
			THETE.THEORETICAL_TASK_ID IS NULL
		AND TEA.TEACHER_ID IS NULL
	)
;
commit;


-- 教室课表视图
/*==============================================================*/
/* VIEW: VCOUP_TEACHROOM_SCHEDULE                              	*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_TEACHROOM_SCHEDULE
AS
SELECT DISTINCT
	SCHT.SCHEDULING_TASK_ID,
	SCHT.THEORETICAL_TASK_ID,
	SCHT.ACADEMIC_YEAR,
	SCHT.SEMESTER_CODE,
	SCHT.COURSE_ARRANGE_WEEKLY,
	SCHT.COURSE_ARRANGE_SECTION,
	SCHT.SINGLE_OR_DOUBLE_WEEK,
	COUR."NAME" COURSE_NAME,
	BUILDING.BUILDING_ID,
	BUILDING.BUILDING_NAME,
	VENUE.VENUE_TYPE_CODE,
	VENUE.VENUE_ID,
	VENUE.VENUE_NAME,
	"DECODE" (
		TEACR.SCHEDULE_TEACHERS,
		NULL,
		TTS.TEACHERS,
		TEACR.SCHEDULE_TEACHERS
	) TEACHERS,
	"DECODE" (
		THES.COURSE_TYPE,
		'13',
		THET.TEACHING_CLASS_NO,
		''
	) CLASSES,
	(
		',' || SCHT.COURSE_ARRANGE_WEEK_LIST || ','
	) WEEK_NO, -- 周次查询
	CAMPUS.CAMPUS_ID, -- 校区查询
	CAMPUS.CAMPUS_NAME,
	DEPA.DEPARTMENT_ID -- 单位查询
FROM
	TCOUP_SCHEDULING_TASK SCHT -- 排课任务表
LEFT JOIN TSYS_CAMPUS CAMPUS ON CAMPUS.CAMPUS_ID = SCHT.CAMPUS_ID -- 校区信息表
LEFT JOIN TSYS_BUILDING BUILDING ON BUILDING.BUILDING_ID = SCHT.BUILDING_ID -- 楼房信息表
INNER JOIN TSYS_VENUE VENUE ON VENUE.VENUE_ID = SCHT.VENUE_ID -- 场地信息表
LEFT JOIN TSYS_DEPARTMENT DEPA ON DEPA.DEPARTMENT_ID = VENUE.DEPARTMENT_ID -- 单位（院系）信息表
LEFT JOIN TTRAP_COURSE COUR ON COUR.COURSE_ID = SCHT.COURSE_ID -- 课程信息表
LEFT JOIN TCOUP_THEORETICAL_TASK THET ON THET.THEORETICAL_TASK_ID = SCHT.THEORETICAL_TASK_ID -- 理论任务信息表
LEFT JOIN (
	-- 关联理论任务教师
	SELECT DISTINCT
		THETE.THEORETICAL_TASK_ID,
		TCR.USER_ID,
		TCR.TEACHER_NO,
		TCR.TEACHER_NAME,
		(
			WMSYS.WM_CONCAT (TO_CHAR(TCR.TEACHER_NAME)) OVER (
				PARTITION BY THETE.THEORETICAL_TASK_ID
			)
		) TEACHERS
	FROM
		TCOUP_THEORETICAL_TEACHERS THETE
	LEFT JOIN TSYS_TEACHER TCR ON TCR.USER_ID = THETE.TEACHER_ID
) TTS ON TTS.THEORETICAL_TASK_ID = SCHT.THEORETICAL_TASK_ID
LEFT JOIN (
	-- 关联调代课教师
	SELECT DISTINCT
		TEA.SCHEDULING_TASK_ID,
		TCR.USER_ID,
		TCR.TEACHER_NO,
		TCR.TEACHER_NAME,
		(
			WMSYS.WM_CONCAT (TO_CHAR(TCR.TEACHER_NAME)) OVER (
				PARTITION BY TEA.SCHEDULING_TASK_ID
			)
		) SCHEDULE_TEACHERS
	FROM
		TCOUP_SCHEDULE_TEACHER TEA
	LEFT JOIN TSYS_TEACHER TCR ON TCR.USER_ID = TEA.TEACHER_ID
) TEACR ON TEACR.SCHEDULING_TASK_ID = SCHT.SCHEDULING_TASK_ID
LEFT JOIN (
	SELECT DISTINCT
		THEOS.THEORETICAL_TASK_ID,
		(
			STARP.COURSE_TYPE_CODE || STARP.COURSE_ATTRIBUTE_CODE
		) COURSE_TYPE
	FROM
		TCOUP_THEORETICAL_STARTCLASS THEOS
	LEFT JOIN TTRAP_STARTCLASS_PLAN STARP ON STARP.STARTCLASS_PLAN_ID = THEOS.STARTCLASS_PLAN_ID
) THES ON THES.THEORETICAL_TASK_ID = SCHT.THEORETICAL_TASK_ID
LEFT JOIN (
	SELECT DISTINCT
		THEOC.THEORETICAL_TASK_ID,
		(
			WMSYS.WM_CONCAT (TO_CHAR(CLAS.CLASS_NAME)) OVER (
				PARTITION BY THEOC.THEORETICAL_TASK_ID
			)
		) CLASSES
	FROM
		TCOUP_THEORETICAL_CLASS THEOC -- 理论任务和班级中间表
	LEFT JOIN TSTU_CLASS CLAS ON CLAS.CLASS_ID = THEOC.CLASS_ID -- 班级信息表
) THEC ON THEC.THEORETICAL_TASK_ID = SCHT.THEORETICAL_TASK_ID
;
commit;


-- 课程课表视图
/*==============================================================*/
/* VIEW: VCOUP_COURSE_SCHEDULE                              	*/
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_COURSE_SCHEDULE
AS
SELECT DISTINCT
  SCHT.SCHEDULING_TASK_ID,
	SCHT.THEORETICAL_TASK_ID,
  SCHT.ACADEMIC_YEAR,
  SCHT.SEMESTER_CODE,
  SCHT.COURSE_ARRANGE_WEEKLY,
  SCHT.COURSE_ARRANGE_SECTION,
  SCHT.SINGLE_OR_DOUBLE_WEEK,
  BUILDING.BUILDING_NAME,
  VENUE.VENUE_NAME,
  "DECODE"(TEACR.SCHEDULE_TEACHERS, null,TTS.TEACHERS, TEACR.SCHEDULE_TEACHERS) TEACHERS,
  "DECODE" (THES.COURSE_TYPE,'13',THET.TEACHING_CLASS_NO,'') CLASSES,
  (
    ',' || SCHT.COURSE_ARRANGE_WEEK_LIST || ','
  ) WEEK_NO, -- 周次查询
  DEPA.DEPARTMENT_ID,
  DEPA.DEPARTMENT_NAME,
  COUR.COURSE_ID,
  COUR.COURSE_NO,
  COUR."NAME" COURSE_NAME
FROM
  TCOUP_SCHEDULING_TASK SCHT -- 排课任务表
LEFT JOIN TSYS_BUILDING BUILDING ON BUILDING.BUILDING_ID = SCHT.BUILDING_ID -- 楼房信息表
LEFT JOIN TSYS_VENUE VENUE ON VENUE.VENUE_ID = SCHT.VENUE_ID -- 场地信息表
LEFT JOIN TTRAP_COURSE COUR ON COUR.COURSE_ID = SCHT.COURSE_ID
LEFT JOIN TSYS_DEPARTMENT DEPA ON DEPA.DEPARTMENT_ID = COUR.DEPARTMENT_ID -- 单位（开课院系）信息表
LEFT JOIN TCOUP_THEORETICAL_TASK THET ON THET.THEORETICAL_TASK_ID = SCHT.THEORETICAL_TASK_ID -- 理论任务信息表
LEFT JOIN (
	-- 关联理论任务教师
	SELECT DISTINCT
		THETE.THEORETICAL_TASK_ID,
		TCR.USER_ID,
		TCR.TEACHER_NO,
		TCR.TEACHER_NAME,
		(
			WMSYS.WM_CONCAT (TO_CHAR(TCR.TEACHER_NAME)) OVER (
				PARTITION BY THETE.THEORETICAL_TASK_ID
			)
		) TEACHERS
	FROM
		TCOUP_THEORETICAL_TEACHERS THETE
	LEFT JOIN TSYS_TEACHER TCR ON TCR.USER_ID = THETE.TEACHER_ID
) TTS ON TTS.THEORETICAL_TASK_ID = SCHT.THEORETICAL_TASK_ID
LEFT JOIN (
	-- 关联调代课教师
	SELECT DISTINCT
		TEA.SCHEDULING_TASK_ID,
		TCR.USER_ID,
		TCR.TEACHER_NO,
		TCR.TEACHER_NAME,
		(
			WMSYS.WM_CONCAT (TO_CHAR(TCR.TEACHER_NAME)) OVER (
				PARTITION BY TEA.SCHEDULING_TASK_ID
			)
		) SCHEDULE_TEACHERS
	FROM
		TCOUP_SCHEDULE_TEACHER TEA
	LEFT JOIN TSYS_TEACHER TCR ON TCR.USER_ID = TEA.TEACHER_ID
) TEACR ON TEACR.SCHEDULING_TASK_ID = SCHT.SCHEDULING_TASK_ID
LEFT JOIN (
  SELECT DISTINCT
    THEOS.THEORETICAL_TASK_ID,
    (
      STARP.COURSE_TYPE_CODE || STARP.COURSE_ATTRIBUTE_CODE
    ) COURSE_TYPE
  FROM
    TCOUP_THEORETICAL_STARTCLASS THEOS
  LEFT JOIN TTRAP_STARTCLASS_PLAN STARP ON STARP.STARTCLASS_PLAN_ID = THEOS.STARTCLASS_PLAN_ID
) THES ON THES.THEORETICAL_TASK_ID = SCHT.THEORETICAL_TASK_ID
LEFT JOIN (
  SELECT DISTINCT
    THEOC.THEORETICAL_TASK_ID,
    (
      WMSYS.WM_CONCAT (TO_CHAR(CLAS.CLASS_NAME)) OVER (
        PARTITION BY THEOC.THEORETICAL_TASK_ID
      )
    ) CLASSES
  FROM
    TCOUP_THEORETICAL_CLASS THEOC -- 理论任务和班级中间表
  LEFT JOIN TSTU_CLASS CLAS ON CLAS.CLASS_ID = THEOC.CLASS_ID -- 班级信息表
) THEC ON THEC.THEORETICAL_TASK_ID = SCHT.THEORETICAL_TASK_ID
;
commit;


-- 
/*==============================================================*/
/* VIEW: VCOUP_THEORETICAL_ARRANGE                              */
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_THEORETICAL_ARRANGE
AS
SELECT DISTINCT
	(
		"TO_CHAR" (TTASK.THEORETICAL_TASK_ID) || "TO_CHAR" (TTS.TEACHER_ID)
	) AS ID,
	TTASK.THEORETICAL_TASK_ID,
	CSE.DEPARTMENT_ID,
	DPM.DEPARTMENT_NAME,
	TTASK.COURSE_ID,
	CSE.COURSE_NO,
	CSE."NAME" AS COURSE_NAME,
	SCP.COURSE_TYPE_CODE,
	SCP.COURSE_ATTRIBUTE_CODE,
	TTASK.TEACHING_CLASS_NO,
	"DECODE" (
		TCL.CLASSCOUNT,
		NULL,
		0,
		TCL.CLASSCOUNT
	) CLASSCOUNT,
	TTASK.TEACHING_CLASS_MEMBER_COUNT,
	TTASK.TEACHING_METHODS_CODE,
	TTASK.WEEKLY_HOURS,
	TTASK.ARRANGE_WEEKS,
	SCP.TOTAL_PERIOD,
	SCP.THEORY_PERIOD,
	SCP.EXPERI_PERIOD,
	SCP.PRACTICE_PERIOD,
	SCP.OTHER_PERIOD,
	TTASK.CONTIN_BLWDWN_COUNT,
	TTASK.SINGLE_OR_DOUBLE_WEEK,
	TTASK.TEACHING_GROUP_ID,
	TG.TEACHING_GROUP_NAME,
	TTASK.ACADEMIC_YEAR,
	TTASK.SEMESTER_CODE,
	TTASK.TEACHROOM_TYPE_CODE,
	TTASK.CAMPUS_ID,
	CAMPUS.CAMPUS_NAME,
	TTASK.BUILDING_ID,
	BUILDING.BUILDING_NAME,
	TTASK.TEACHROOM_ID,
	VENUE.VENUE_NAME AS TEACHROOM_NAME,
	TTASK.SOLID_LINE_SECTION,
	TTASK.FORBIDDEN_LINE_SECTION,
	SCP.IS_CORE_CURRICULUM,
	"DECODE" (
		TTASK.ARRANGE_WEEK_NUMBER * TTASK.WEEKLY_HOURS,
		NULL,
		0,
		TTASK.ARRANGE_WEEK_NUMBER * TTASK.WEEKLY_HOURS
	) TASK_PERIOD,
	"DECODE" (
		STASK.ARRANGE_PERIOD,
		NULL,
		0,
		STASK.ARRANGE_PERIOD
	) ARRANGE_PERIOD,
	TTS.TEACHER_ID,
	TTS.TEACHER_NO,
	TTS.TEACHER_NAME,
	TTS.TEACHERIDS,
	TTS.TEACHERS,
	TCLA.CAMPUS_ID CLASS_CAMPUS_ID
FROM
	TCOUP_THEORETICAL_TASK TTASK
LEFT JOIN TCOUP_THEORETICAL_STARTCLASS TSC ON TSC.THEORETICAL_TASK_ID = TTASK.THEORETICAL_TASK_ID
LEFT JOIN TTRAP_STARTCLASS_PLAN SCP ON SCP.STARTCLASS_PLAN_ID = TSC.STARTCLASS_PLAN_ID
LEFT JOIN TTRAP_COURSE CSE ON CSE.COURSE_ID = TTASK.COURSE_ID
LEFT JOIN TSYS_DEPARTMENT DPM ON DPM.DEPARTMENT_ID = CSE.DEPARTMENT_ID
LEFT JOIN (
	SELECT
		TCLASS.THEORETICAL_TASK_ID,
		"COUNT" (*) CLASSCOUNT
	FROM
		TCOUP_THEORETICAL_CLASS TCLASS
	GROUP BY
		TCLASS.THEORETICAL_TASK_ID
) TCL ON TCL.THEORETICAL_TASK_ID = TTASK.THEORETICAL_TASK_ID
LEFT JOIN (
	SELECT
		THEORETICAL_TASK_ID,
		"SUM" (
			ARRANGE_WEEK_NUMBER * CONTIN_BLWDWN_COUNT
		) ARRANGE_PERIOD
	FROM
		TCOUP_SCHEDULING_TASK
	GROUP BY
		THEORETICAL_TASK_ID
) STASK ON STASK.THEORETICAL_TASK_ID = TTASK.THEORETICAL_TASK_ID
LEFT JOIN (
	SELECT
		THETE.THEORETICAL_TASK_ID,
		THETE.TEACHER_ID,
		TCR.TEACHER_NO,
		TCR.TEACHER_NAME,
		(
			WMSYS.WM_CONCAT (TO_CHAR(THETE.TEACHER_ID)) OVER (
				PARTITION BY THETE.THEORETICAL_TASK_ID
			)
		) TEACHERIDS,
		(
			WMSYS.WM_CONCAT (
				TO_CHAR (
					'[' || TCR.TEACHER_NO || ']' || TCR.TEACHER_NAME
				)
			) OVER (
				PARTITION BY THETE.THEORETICAL_TASK_ID
			)
		) TEACHERS
	FROM
		TCOUP_THEORETICAL_TEACHERS THETE
	LEFT JOIN TSYS_TEACHER TCR ON TCR.USER_ID = THETE.TEACHER_ID
) TTS ON TTS.THEORETICAL_TASK_ID = TTASK.THEORETICAL_TASK_ID
LEFT JOIN (
	SELECT DISTINCT
		THEC.THEORETICAL_TASK_ID,
		CLA.CAMPUS_ID
	FROM
		TCOUP_THEORETICAL_CLASS THEC
	LEFT JOIN TSTU_CLASS CLA ON CLA.CLASS_ID = THEC.CLASS_ID
) TCLA ON TCLA.THEORETICAL_TASK_ID = TTASK.THEORETICAL_TASK_ID
LEFT JOIN TCOUP_TEACHING_GROUP TG ON TG.TEACHING_GROUP_ID = TTASK.TEACHING_GROUP_ID
LEFT JOIN TSYS_CAMPUS CAMPUS ON CAMPUS.CAMPUS_ID = TTASK.CAMPUS_ID
LEFT JOIN TSYS_BUILDING BUILDING ON BUILDING.BUILDING_ID = TTASK.BUILDING_ID
LEFT JOIN TSYS_VENUE VENUE ON VENUE.VENUE_ID = TTASK.TEACHROOM_ID
WHERE
	TTASK.IS_DELETED = 0
;
commit;

-- 
/*==============================================================*/
/* VIEW: VCOUP_LESSON 调停课详细	                            */
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_LESSON AS 
SELECT
	ADJUST.SCHEDULING_TASK_ID,
	ADJUST.ADJUST_SHUT_ID,
	ADJUST.ACADEMIC_YEAR,
	ADJUST.SEMESTER_CODE,
	COURSE. NAME COURSE_NAME,
	COURSE.COURSE_NO,
	TASK.TEACHING_CLASS_NO,
	ADJUST.ADJUST_SHUT_TYPE,
	ADJUST.ADJUST_SHUT_OPTION,
	BEFORE_BUILDING.BUILDING_NAME || BEFORE_VENUE.VENUE_NAME ADJUST_BEFORE_CLASSROOM ,
	AFTER_BUILDING.BUILDING_NAME || AFTER_VENUE.VENUE_NAME ADJUST_TO_CLASSROOM ,
	ADJUST.ADJUST_BEFORE_SECTION,
	ADJUST.ADJUST_TO_SECTION,
	ADJUST.ADJUST_BEFORE_WEEK,
	ADJUST.ADJUST_WEEK,
	ADJUST.ADJUST_TO_WEEK,
	ADJUST.ADJUST_BEFORE_TEACHER,
	(SELECT WMSYS.WM_CONCAT (TO_CHAR('[' || TEACHER.TEACHER_NO || ']' || TEACHER.TEACHER_NAME)) BEFORE_TEACHER_NAME  from TSYS_TEACHER TEACHER
		WHERE instr(ADJUST.ADJUST_BEFORE_TEACHER,TEACHER.USER_ID) > 0) BEFORE_TEACHER_NAME, 
	ADJUST.ADJUST_TO_TEACHER,
	(SELECT WMSYS.WM_CONCAT (TO_CHAR('[' || TEACHER.TEACHER_NO || ']' || TEACHER.TEACHER_NAME))   from TSYS_TEACHER TEACHER
		WHERE instr(ADJUST.ADJUST_TO_TEACHER,TEACHER.USER_ID) > 0) AFTER_TEACHER_NAME,
	U.USER_NAME USER_NAME,
	U.ACCOUNT_NAME USER_NO,
	U.USER_ID CREATE_USER_ID,
	ADJUST.CREATE_TIME,
	ADJUST.HANDING_STATUS,
	ADJUST.HANDING_OPINION,
	TASK.SINGLE_OR_DOUBLE_WEEK,
	ADJUST.THEORETICAL_TASK_ID,
	ADJUST.ADJUST_SHUT_REASON,
	ADJUST.TEACHER_CLASH_STATUS,
	ADJUST.CLASS_CLASH_STATUS,
	ADJUST.TEACHROOM_CLASH_STATUS,
	ADJUST.DISPOSE_TIME,
	ADJUST.BATCH_ADJUST_SHUT_ID,
	ADJUST.DISPOSE_USER_ID DISPOSE_ID,
	DISPOSE.USER_NAME DISPOSE_NAME,
	DISPOSE.ACCOUNT_NAME DISPOSE_NO
FROM
	TCOUP_ADJUST_SHUT ADJUST
LEFT JOIN TCOUP_THEORETICAL_TASK TASK ON TASK.THEORETICAL_TASK_ID = ADJUST.THEORETICAL_TASK_ID
LEFT JOIN TTRAP_COURSE COURSE ON COURSE.COURSE_ID = TASK.COURSE_ID
LEFT JOIN TSYS_USER U ON U.USER_ID = ADJUST.CREATE_USER_ID
LEFT JOIN TSYS_USER DISPOSE ON DISPOSE.USER_ID = ADJUST.DISPOSE_USER_ID
LEFT JOIN TSYS_VENUE BEFORE_VENUE ON BEFORE_VENUE.VENUE_ID = ADJUST.ADJUST_BEFORE_CLASSROOM
LEFT JOIN TSYS_VENUE AFTER_VENUE ON AFTER_VENUE.VENUE_ID = ADJUST.ADJUST_TO_CLASSROOM
LEFT JOIN TSYS_BUILDING BEFORE_BUILDING ON BEFORE_BUILDING.BUILDING_ID = BEFORE_VENUE.BUILDING_ID
LEFT JOIN TSYS_BUILDING AFTER_BUILDING ON AFTER_BUILDING.BUILDING_ID = AFTER_VENUE.BUILDING_ID
;
commit;
/*==============================================================*/
/* VIEW: VCOUP_LESSON_QUERY 调停课查询  */
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_LESSON_QUERY AS 
SELECT  LESSON.*, TEACHER.DEPARTMENT from VCOUP_LESSON LESSON
LEFT JOIN 
(
  SELECT TEACHERINFO.USER_ID,
		(
			WMSYS.WM_CONCAT (TO_CHAR (
					TEACHERINFO.DEPARTMENT_ID
				)) OVER (
				PARTITION BY TEACHERINFO.USER_ID
			)
		) DEPARTMENT FROM VCOUP_TEACHERINFO TEACHERINFO 
) TEACHER ON instr(LESSON.ADJUST_BEFORE_TEACHER,TEACHER.USER_ID) > 0;
COMMIT;
/*==============================================================*/
/* VIEW: VCOUP_BATCH_LESSON 批量调停课详情  */
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_BATCH_LESSON AS
SELECT
	BATCH_ADJUST."BATCH_ADJUST_SHUT_ID",
	BATCH_ADJUST."ACADEMIC_YEAR",
	BATCH_ADJUST."SEMESTER_CODE",
	BATCH_ADJUST."ADJUST_SHUT_TYPE",
	BATCH_ADJUST."ADJUST_WEEK",
	BATCH_ADJUST."ADJUST_TO_WEEK",
	BATCH_ADJUST."ADJUST_WEEK_DAYS",
	BATCH_ADJUST."ADJUST_TO_WEEK_DAYS",
	BATCH_ADJUST."ADJUST_SHUT_REASON",
	BATCH_ADJUST."CREATE_USER_ID",
	BATCH_ADJUST."CREATE_TIME",
	BATCH_ADJUST."UPDATE_USER_ID",
	BATCH_ADJUST."UPDATE_TIME", 
	CREATE_USER.ACCOUNT_NAME CREATE_NO,
	CREATE_USER.USER_NAME CREATE_NAME
FROM
	TCOUP_BATCH_ADJUST_SHUT BATCH_ADJUST
LEFT JOIN TSYS_USER CREATE_USER ON CREATE_USER.USER_ID = BATCH_ADJUST.CREATE_USER_ID;
COMMIT;
/*==============================================================*/
/* VIEW: VCOUP_THEORETICAL_STARTCLASS 理论任务-开课计划关联表查询视图  */
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_THEORETICAL_STARTCLASS AS 
SELECT 
	STARTCLASS_PLAN_ID ,
	THEORETICAL_TASK_ID,
		WMSYS.WM_CONCAT (TO_CHAR (
					THEORETICAL_TASK_ID
				)) OVER (
				PARTITION BY STARTCLASS_PLAN_ID
			) THEORETICAL_TASK
FROM
	TCOUP_THEORETICAL_STARTCLASS;
COMMIT;
/*==============================================================*/
/* VIEW: VCOUP_THEORETICAL_CLASS 理论任务-行政班关联表查询视图  */
/*==============================================================*/
CREATE OR REPLACE VIEW VCOUP_THEORETICAL_CLASSINFO AS
SELECT
	CLASS_ID ,
	THEORETICAL_TASK_ID,
		WMSYS.WM_CONCAT (TO_CHAR (
					THEORETICAL_TASK_ID
				)) OVER (
				PARTITION BY CLASS_ID
			) THEORETICAL_TASK
FROM
	TCOUP_THEORETICAL_CLASS;
COMMIT;

-- 如果存在排课管理的菜单先删除
DELETE  TSYS_MENU t where t.PARENT_ID_LIST LIKE '%57b495da862d42bf84db4e3bcdddc045%';
commit;
-- 生成排课管理菜单
DECLARE orderNo NUMBER;
BEGIN
SELECT MAX(ORDER_NO)+1 INTO orderNo FROM TSYS_MENU where PARENT_ID='0';
INSERT INTO "TSYS_MENU" VALUES ('57b495da862d42bf84db4e3bcdddc045', '排课管理', 1, 'fa fa-building', NULL, 'CoursePlan', 1, 1, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 8, '0', '0,57b495da862d42bf84db4e3bcdddc045', orderNo, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
End;
/

INSERT INTO "TSYS_MENU" VALUES ('2b83b98fea314a079aa41cfec9ac9642', '参数设置', 1, 'fa fa-cogs', NULL, 'CoursePlan_Parameters', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, '57b495da862d42bf84db4e3bcdddc045', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,2b83b98fea314a079aa41cfec9ac9642', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('89cd353ed65f4d3fa92adba7c2d8fd76', '排课进度设置', 2, 'fa fa-yelp', 'courseplan/parameter/html/scheduleSettings.html', 'CoursePlan_Parameters_Plan', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, '2b83b98fea314a079aa41cfec9ac9642', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,2b83b98fea314a079aa41cfec9ac9642,2b83b98fea314a079aa41cfec9ac9642,89cd353ed65f4d3fa92adba7c2d8fd76', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('3174dda9361343ae89430dbfbbe7f123', '新增', 3, 'fa fa-th', NULL, 'CoursePlan_Parameters_Plan_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '89cd353ed65f4d3fa92adba7c2d8fd76', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,2b83b98fea314a079aa41cfec9ac9642,2b83b98fea314a079aa41cfec9ac9642,89cd353ed65f4d3fa92adba7c2d8fd76,89cd353ed65f4d3fa92adba7c2d8fd76,3174dda9361343ae89430dbfbbe7f123', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('cb2abc4405fe44f6950671a03984acc6', '排课时间设置', 2, 'fa fa-calendar', 'courseplan/parameter/html/timeSettings.html', 'CoursePlan_Parameters_Times', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, '2b83b98fea314a079aa41cfec9ac9642', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,2b83b98fea314a079aa41cfec9ac9642,2b83b98fea314a079aa41cfec9ac9642,cb2abc4405fe44f6950671a03984acc6', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('6c41a494afe54681a3b4c4c4e3cb0493', '新增', 3, 'fa fa-th', NULL, 'CoursePlan_Parameters_Times_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'cb2abc4405fe44f6950671a03984acc6', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,2b83b98fea314a079aa41cfec9ac9642,2b83b98fea314a079aa41cfec9ac9642,cb2abc4405fe44f6950671a03984acc6,cb2abc4405fe44f6950671a03984acc6,6c41a494afe54681a3b4c4c4e3cb0493', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('38c39ae63ecc441a87fca943feb0e426', '校历设置', 2, 'fa fa-calendar-check-o', 'udf/schoolCalendar/html/list.html', 'BaseData_SchoolCalendar', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 3, '57b495da862d42bf84db4e3bcdddc045', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,38c39ae63ecc441a87fca943feb0e426', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('158a1d13357e43b09c3660a297efddd4', '教学周', 3, 'fa fa-th', NULL, 'BaseData_SchoolCalendar_TeachingWeek', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '38c39ae63ecc441a87fca943feb0e426', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,38c39ae63ecc441a87fca943feb0e426,38c39ae63ecc441a87fca943feb0e426,158a1d13357e43b09c3660a297efddd4', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('1d78f8b30284484ea5bc337e9c2419fb', '新增', 3, 'fa fa-th', NULL, 'BaseData_SchoolCalendar_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '38c39ae63ecc441a87fca943feb0e426', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,38c39ae63ecc441a87fca943feb0e426,38c39ae63ecc441a87fca943feb0e426,1d78f8b30284484ea5bc337e9c2419fb', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('35fc1761701e4e03ab35c95fcf8c1350', '修改', 3, 'fa fa-th', NULL, 'BaseData_SchoolCalendar_Update', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '38c39ae63ecc441a87fca943feb0e426', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,38c39ae63ecc441a87fca943feb0e426,38c39ae63ecc441a87fca943feb0e426,35fc1761701e4e03ab35c95fcf8c1350', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('3e7cfad911334720bc3fd1c8e781d249', '调停课管理', 1, 'fa fa-tumblr', NULL, 'CoursePlan_Lesson', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 3, '57b495da862d42bf84db4e3bcdddc045', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,3e7cfad911334720bc3fd1c8e781d249', 7, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('05ac1daf0e934a90a26e546de01482aa', '调停课处理', 2, 'fa fa-retweet', 'courseplan/lesson/html/list.html', 'CoursePlan_Lesson_Dispose', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 3, '3e7cfad911334720bc3fd1c8e781d249', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,3e7cfad911334720bc3fd1c8e781d249,3e7cfad911334720bc3fd1c8e781d249,05ac1daf0e934a90a26e546de01482aa', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('20b2e0601dee43ed824bea82a21b1594', '处理', 3, 'fa fa-th', NULL, 'CoursePlan_Lesson_Dispose_Update', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '05ac1daf0e934a90a26e546de01482aa', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,3e7cfad911334720bc3fd1c8e781d249,3e7cfad911334720bc3fd1c8e781d249,05ac1daf0e934a90a26e546de01482aa,05ac1daf0e934a90a26e546de01482aa,20b2e0601dee43ed824bea82a21b1594', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('63bf55be869943418e461d53a27d5090', '查看', 3, 'fa fa-th', NULL, 'CoursePlan_Lesson_Dispose_View', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '05ac1daf0e934a90a26e546de01482aa', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,3e7cfad911334720bc3fd1c8e781d249,3e7cfad911334720bc3fd1c8e781d249,05ac1daf0e934a90a26e546de01482aa,05ac1daf0e934a90a26e546de01482aa,63bf55be869943418e461d53a27d5090', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('b772410a0f05431ca6f0bb0a8652cdf4', '新增', 3, 'fa fa-th', NULL, 'CoursePlan_Lesson_Dispose_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '05ac1daf0e934a90a26e546de01482aa', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,3e7cfad911334720bc3fd1c8e781d249,3e7cfad911334720bc3fd1c8e781d249,05ac1daf0e934a90a26e546de01482aa,05ac1daf0e934a90a26e546de01482aa,b772410a0f05431ca6f0bb0a8652cdf4', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('18b044d8511840d0854ed4154e5e44b0', '批量调停课', 2, 'fa fa-tumblr-square', 'courseplan/lesson/html/batchlist.html', 'CoursePlan_Lesson_Batch', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, '3e7cfad911334720bc3fd1c8e781d249', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,3e7cfad911334720bc3fd1c8e781d249,3e7cfad911334720bc3fd1c8e781d249,18b044d8511840d0854ed4154e5e44b0', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('8081e3e2b0a14dfcbc8cf0ea91002e75', '新增', 3, 'fa fa-th', NULL, 'CoursePlan_Lesson_Batch_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '18b044d8511840d0854ed4154e5e44b0', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,3e7cfad911334720bc3fd1c8e781d249,3e7cfad911334720bc3fd1c8e781d249,18b044d8511840d0854ed4154e5e44b0,18b044d8511840d0854ed4154e5e44b0,8081e3e2b0a14dfcbc8cf0ea91002e75', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('f120f2c7a29e40f2844877fd651587f2', '调停课查询', 2, 'fa fa-television', 'courseplan/lesson/html/querylist.html', 'CoursePlan_Lesson_Query', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, '3e7cfad911334720bc3fd1c8e781d249', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,3e7cfad911334720bc3fd1c8e781d249,3e7cfad911334720bc3fd1c8e781d249,f120f2c7a29e40f2844877fd651587f2', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('9cf73c234ca04eba8c47ab6d2cc30c69', '导出', 3, 'fa fa-th', NULL, 'CoursePlan_Lesson_Query_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'f120f2c7a29e40f2844877fd651587f2', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,3e7cfad911334720bc3fd1c8e781d249,3e7cfad911334720bc3fd1c8e781d249,f120f2c7a29e40f2844877fd651587f2,f120f2c7a29e40f2844877fd651587f2,9cf73c234ca04eba8c47ab6d2cc30c69', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('bdb4674a43454173a9a8452d998feda2', '查看', 3, 'fa fa-th', NULL, 'CoursePlan_Lesson_Query_View', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'f120f2c7a29e40f2844877fd651587f2', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,3e7cfad911334720bc3fd1c8e781d249,3e7cfad911334720bc3fd1c8e781d249,f120f2c7a29e40f2844877fd651587f2,f120f2c7a29e40f2844877fd651587f2,bdb4674a43454173a9a8452d998feda2', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('4746923b2e2e43478888bcb972429c60', '理论任务', 1, 'fa fa-cube', NULL, 'CoursePlan_Theory', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, '57b495da862d42bf84db4e3bcdddc045', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,4746923b2e2e43478888bcb972429c60', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('31b68e5db06d4d298fa0c5452bd433c5', '理论任务查询', 1, 'fa fa-desktop', NULL, 'CoursePlan_Theory_Query', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, '4746923b2e2e43478888bcb972429c60', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,4746923b2e2e43478888bcb972429c60,4746923b2e2e43478888bcb972429c60,31b68e5db06d4d298fa0c5452bd433c5', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('daf3a44b7e1f4a14b7a6d31130c9d94b', '按年级/专业', 2, 'fa fa-yahoo', 'courseplan/theory/task/html/queryToMajor.html', 'CoursePlan_Theory_Query_TeachingFaculty', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, '31b68e5db06d4d298fa0c5452bd433c5', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,4746923b2e2e43478888bcb972429c60,4746923b2e2e43478888bcb972429c60,31b68e5db06d4d298fa0c5452bd433c5,31b68e5db06d4d298fa0c5452bd433c5,daf3a44b7e1f4a14b7a6d31130c9d94b', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('6b58c0f566f541ae988c9fd0a05612a2', '导出', 3, 'fa fa-th', NULL, 'CoursePlan_Theory_Query_TeachingFaculty_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'daf3a44b7e1f4a14b7a6d31130c9d94b', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,4746923b2e2e43478888bcb972429c60,4746923b2e2e43478888bcb972429c60,31b68e5db06d4d298fa0c5452bd433c5,31b68e5db06d4d298fa0c5452bd433c5,daf3a44b7e1f4a14b7a6d31130c9d94b,daf3a44b7e1f4a14b7a6d31130c9d94b,6b58c0f566f541ae988c9fd0a05612a2', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('e5c3f539a8ad482085dd4f4c2040d0bb', '按开课单位', 2, 'fa fa-sitemap', 'courseplan/theory/task/html/queryToDepartment.html', 'CoursePlan_Theory_Query_CourseUnit', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, '31b68e5db06d4d298fa0c5452bd433c5', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,4746923b2e2e43478888bcb972429c60,4746923b2e2e43478888bcb972429c60,31b68e5db06d4d298fa0c5452bd433c5,31b68e5db06d4d298fa0c5452bd433c5,e5c3f539a8ad482085dd4f4c2040d0bb', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('cefb19880daa40cf8c4b962eb1602567', '导出', 3, 'fa fa-th', NULL, 'CoursePlan_Theory_Query_CourseUnit_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'e5c3f539a8ad482085dd4f4c2040d0bb', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,4746923b2e2e43478888bcb972429c60,4746923b2e2e43478888bcb972429c60,31b68e5db06d4d298fa0c5452bd433c5,31b68e5db06d4d298fa0c5452bd433c5,e5c3f539a8ad482085dd4f4c2040d0bb,e5c3f539a8ad482085dd4f4c2040d0bb,cefb19880daa40cf8c4b962eb1602567', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('709fcd18ce0b4bc6a5107d2362978d68', '理论任务设置', 2, 'fa fa-delicious', 'courseplan/theory/task/html/list.html', 'CoursePlan_Theory_SetUp', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, '4746923b2e2e43478888bcb972429c60', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,4746923b2e2e43478888bcb972429c60,4746923b2e2e43478888bcb972429c60,709fcd18ce0b4bc6a5107d2362978d68', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('b5cc43cef21a4799883cca623742598c', '设置', 3, 'fa fa-th', NULL, 'CoursePlan_Theory_SetUp_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '709fcd18ce0b4bc6a5107d2362978d68', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,4746923b2e2e43478888bcb972429c60,4746923b2e2e43478888bcb972429c60,709fcd18ce0b4bc6a5107d2362978d68,709fcd18ce0b4bc6a5107d2362978d68,b5cc43cef21a4799883cca623742598c', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('51c07d67d14d44df99a78539910b693c', '实践安排', 1, 'fa fa-square-o', NULL, 'CoursePlan_PracticeArrange', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, '57b495da862d42bf84db4e3bcdddc045', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,51c07d67d14d44df99a78539910b693c', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('640901bde74a42fbbf05a5a503f7630e', '实践安排查询', 1, 'fa fa-desktop', NULL, 'CoursePlan_PracticeArrange_Query', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, '51c07d67d14d44df99a78539910b693c', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,51c07d67d14d44df99a78539910b693c,51c07d67d14d44df99a78539910b693c,640901bde74a42fbbf05a5a503f7630e', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('3ab7f0cc96074942853566595de62d04', '按年级/专业', 2, 'fa fa-yahoo', 'courseplan/practice/arrange/html/teachingfacultylist.html', 'CoursePlan_PracticeArrange_Query_TeachingFaculty', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, '640901bde74a42fbbf05a5a503f7630e', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,51c07d67d14d44df99a78539910b693c,51c07d67d14d44df99a78539910b693c,640901bde74a42fbbf05a5a503f7630e,640901bde74a42fbbf05a5a503f7630e,3ab7f0cc96074942853566595de62d04', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('d90e42c29cc64bb3936ec09e68df3be4', '导出', 3, 'fa fa-th', NULL, 'CoursePlan_PracticeArrange_Query_TeachingFaculty_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '3ab7f0cc96074942853566595de62d04', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,51c07d67d14d44df99a78539910b693c,51c07d67d14d44df99a78539910b693c,640901bde74a42fbbf05a5a503f7630e,640901bde74a42fbbf05a5a503f7630e,3ab7f0cc96074942853566595de62d04,3ab7f0cc96074942853566595de62d04,d90e42c29cc64bb3936ec09e68df3be4', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('ea362d262a3f4f608e3b595adb3c5d69', '按开课单位', 2, 'fa fa-sitemap', 'courseplan/practice/arrange/html/courseunitlist.html', 'CoursePlan_PracticeArrange_Query_CourseUnit', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, '640901bde74a42fbbf05a5a503f7630e', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,51c07d67d14d44df99a78539910b693c,51c07d67d14d44df99a78539910b693c,640901bde74a42fbbf05a5a503f7630e,640901bde74a42fbbf05a5a503f7630e,ea362d262a3f4f608e3b595adb3c5d69', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('fc1dc0aa14e94e46ba31dc7f09f931de', '导出', 3, 'fa fa-th', NULL, 'CoursePlan_PracticeArrange_Query_CourseUnit_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'ea362d262a3f4f608e3b595adb3c5d69', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,51c07d67d14d44df99a78539910b693c,51c07d67d14d44df99a78539910b693c,640901bde74a42fbbf05a5a503f7630e,640901bde74a42fbbf05a5a503f7630e,ea362d262a3f4f608e3b595adb3c5d69,ea362d262a3f4f608e3b595adb3c5d69,fc1dc0aa14e94e46ba31dc7f09f931de', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('70994808cc0446c18ae3817d3779ec65', '实践安排', 2, 'fa fa-square', 'courseplan/practice/arrange/html/list.html', 'CoursePlan_PracticeArrange_Arrange', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 3, '51c07d67d14d44df99a78539910b693c', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,51c07d67d14d44df99a78539910b693c,51c07d67d14d44df99a78539910b693c,70994808cc0446c18ae3817d3779ec65', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('4bfac4ce99fa46bc83f9ced8828e9f0f', '删除', 1, 'fa fa-th', NULL, 'CoursePlan_PracticeArrange_Arrange_Delete', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '70994808cc0446c18ae3817d3779ec65', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,51c07d67d14d44df99a78539910b693c,51c07d67d14d44df99a78539910b693c,70994808cc0446c18ae3817d3779ec65,70994808cc0446c18ae3817d3779ec65,4bfac4ce99fa46bc83f9ced8828e9f0f', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('64289d84bf0346f1ad5ba2bbc50e2c5f', '修改', 1, 'fa fa-th', NULL, 'CoursePlan_PracticeArrange_Arrange_Update', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '70994808cc0446c18ae3817d3779ec65', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,51c07d67d14d44df99a78539910b693c,51c07d67d14d44df99a78539910b693c,70994808cc0446c18ae3817d3779ec65,70994808cc0446c18ae3817d3779ec65,64289d84bf0346f1ad5ba2bbc50e2c5f', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('dd2d958405004f6d9aab129161b59173', '新增', 1, 'fa fa-th', NULL, 'CoursePlan_PracticeArrange_Arrange_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '70994808cc0446c18ae3817d3779ec65', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,51c07d67d14d44df99a78539910b693c,51c07d67d14d44df99a78539910b693c,70994808cc0446c18ae3817d3779ec65,70994808cc0446c18ae3817d3779ec65,dd2d958405004f6d9aab129161b59173', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('69815066db484e0f8f07ffb5b23b3e6b', '实践任务', 1, 'fa fa-bookmark-o', NULL, 'CoursePlan_Practice', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 3, '57b495da862d42bf84db4e3bcdddc045', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,69815066db484e0f8f07ffb5b23b3e6b', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('2a73ccdc3a9d4b67a2eee133033bcbc4', '实践任务查询', 1, 'fa fa-desktop', NULL, 'CoursePlan_Practice_Query', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, '69815066db484e0f8f07ffb5b23b3e6b', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,69815066db484e0f8f07ffb5b23b3e6b,69815066db484e0f8f07ffb5b23b3e6b,2a73ccdc3a9d4b67a2eee133033bcbc4', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('7ebfd491fbc34bc1813d879348de8c6d', '按开课单位', 2, 'fa fa-sitemap', 'courseplan/practice/task/html/courseunitlist.html', 'CoursePlan_Practice_Query_CourseUnit', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, '2a73ccdc3a9d4b67a2eee133033bcbc4', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,69815066db484e0f8f07ffb5b23b3e6b,69815066db484e0f8f07ffb5b23b3e6b,2a73ccdc3a9d4b67a2eee133033bcbc4,2a73ccdc3a9d4b67a2eee133033bcbc4,7ebfd491fbc34bc1813d879348de8c6d', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('fe0a82a3d32445b789d8f3ee49ea0ae2', '导出', 3, 'fa fa-th', NULL, 'CoursePlan_Practice_Query_CourseUnit_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '7ebfd491fbc34bc1813d879348de8c6d', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,69815066db484e0f8f07ffb5b23b3e6b,69815066db484e0f8f07ffb5b23b3e6b,2a73ccdc3a9d4b67a2eee133033bcbc4,2a73ccdc3a9d4b67a2eee133033bcbc4,7ebfd491fbc34bc1813d879348de8c6d,7ebfd491fbc34bc1813d879348de8c6d,fe0a82a3d32445b789d8f3ee49ea0ae2', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('c153fe160fcf4603888d38deb2bccd88', '按年级/专业', 2, 'fa fa-yahoo', 'courseplan/practice/task/html/teachingfacultylist.html', 'CoursePlan_Practice_Query_TeachingFaculty', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, '2a73ccdc3a9d4b67a2eee133033bcbc4', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,69815066db484e0f8f07ffb5b23b3e6b,69815066db484e0f8f07ffb5b23b3e6b,2a73ccdc3a9d4b67a2eee133033bcbc4,2a73ccdc3a9d4b67a2eee133033bcbc4,c153fe160fcf4603888d38deb2bccd88', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('1bb28477145a413db91e168691d65445', '导出', 3, 'fa fa-th', NULL, 'CoursePlan_Practice_Query_TeachingFaculty_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'c153fe160fcf4603888d38deb2bccd88', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,69815066db484e0f8f07ffb5b23b3e6b,69815066db484e0f8f07ffb5b23b3e6b,2a73ccdc3a9d4b67a2eee133033bcbc4,2a73ccdc3a9d4b67a2eee133033bcbc4,c153fe160fcf4603888d38deb2bccd88,c153fe160fcf4603888d38deb2bccd88,1bb28477145a413db91e168691d65445', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('a25cbc55f3e74d7fb88dcc8e6e9b3b65', '环节教师设置', 2, 'fa fa-podcast', 'courseplan/practice/task/html/teacherlist.html', 'CoursePlan_Practice_Teacher', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, '69815066db484e0f8f07ffb5b23b3e6b', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,69815066db484e0f8f07ffb5b23b3e6b,69815066db484e0f8f07ffb5b23b3e6b,a25cbc55f3e74d7fb88dcc8e6e9b3b65', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('c534d03e82b34677a7933b00fe72aa51', '设置', 3, 'fa fa-th', NULL, 'CoursePlan_Practice_Teacher_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'a25cbc55f3e74d7fb88dcc8e6e9b3b65', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,69815066db484e0f8f07ffb5b23b3e6b,69815066db484e0f8f07ffb5b23b3e6b,a25cbc55f3e74d7fb88dcc8e6e9b3b65,a25cbc55f3e74d7fb88dcc8e6e9b3b65,c534d03e82b34677a7933b00fe72aa51', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('e387b34bf4d04292997c1de2d97a655e', '环节班级周次设置', 1, 'fa fa-shopping-bag', NULL, 'CoursePlan_Practice_ClassSection', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, '69815066db484e0f8f07ffb5b23b3e6b', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,69815066db484e0f8f07ffb5b23b3e6b,69815066db484e0f8f07ffb5b23b3e6b,e387b34bf4d04292997c1de2d97a655e', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('2631eceab2854aae9f2d9671d2ff49c7', '按年级/专业', 2, 'fa fa-yahoo', 'courseplan/practice/task/html/sectionteachingfacultylist.html', 'CoursePlan_Practice_ClassSection_TeachingFaculty', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, 'e387b34bf4d04292997c1de2d97a655e', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,69815066db484e0f8f07ffb5b23b3e6b,69815066db484e0f8f07ffb5b23b3e6b,e387b34bf4d04292997c1de2d97a655e,e387b34bf4d04292997c1de2d97a655e,2631eceab2854aae9f2d9671d2ff49c7', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('8046432bcb054545a3d84e58f5072ebc', '设置', 3, 'fa fa-th', NULL, 'CoursePlan_Practice_ClassSection_TeachingFaculty_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '2631eceab2854aae9f2d9671d2ff49c7', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,69815066db484e0f8f07ffb5b23b3e6b,69815066db484e0f8f07ffb5b23b3e6b,e387b34bf4d04292997c1de2d97a655e,e387b34bf4d04292997c1de2d97a655e,2631eceab2854aae9f2d9671d2ff49c7,2631eceab2854aae9f2d9671d2ff49c7,8046432bcb054545a3d84e58f5072ebc', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('3a969506458941798f6969a6d45686c3', '按开课单位', 2, 'fa fa-sitemap', 'courseplan/practice/task/html/sectioncourseunitlist.html', 'CoursePlan_Practice_ClassSection_CourseUnit', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, 'e387b34bf4d04292997c1de2d97a655e', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,69815066db484e0f8f07ffb5b23b3e6b,69815066db484e0f8f07ffb5b23b3e6b,e387b34bf4d04292997c1de2d97a655e,e387b34bf4d04292997c1de2d97a655e,3a969506458941798f6969a6d45686c3', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('a49d50b94ecc4387abb4667a0ab0aae7', '设置', 3, 'fa fa-th', NULL, 'CoursePlan_Practice_ClassSection_CourseUnit_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '3a969506458941798f6969a6d45686c3', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,69815066db484e0f8f07ffb5b23b3e6b,69815066db484e0f8f07ffb5b23b3e6b,e387b34bf4d04292997c1de2d97a655e,e387b34bf4d04292997c1de2d97a655e,3a969506458941798f6969a6d45686c3,3a969506458941798f6969a6d45686c3,a49d50b94ecc4387abb4667a0ab0aae7', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('c4310aabc9114174ac32354a6f9e0fa4', '课表查询', 1, 'fa fa-keyboard-o', NULL, 'CoursePlan_Schedule', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 4, '57b495da862d42bf84db4e3bcdddc045', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,c4310aabc9114174ac32354a6f9e0fa4', 8, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('13c240387d7242f89094d944c5e3ec67', '班级课表', 2, 'fa fa-flag', 'courseplan/schedule/html/classlist.html', 'CoursePlan_Schedule_ClassQuery', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, 'c4310aabc9114174ac32354a6f9e0fa4', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,c4310aabc9114174ac32354a6f9e0fa4,c4310aabc9114174ac32354a6f9e0fa4,13c240387d7242f89094d944c5e3ec67', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('7e38c7b8e95f404fad75a5902a7efd19', '导出', 3, 'fa fa-th', NULL, 'CoursePlan_Schedule_ClassQuery_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '13c240387d7242f89094d944c5e3ec67', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,c4310aabc9114174ac32354a6f9e0fa4,c4310aabc9114174ac32354a6f9e0fa4,13c240387d7242f89094d944c5e3ec67,13c240387d7242f89094d944c5e3ec67,7e38c7b8e95f404fad75a5902a7efd19', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('512a57881f8449e896085d85e0578176', '教师课表', 2, 'fa fa-address-card-o', 'courseplan/schedule/html/teacherlist.html', 'CoursePlan_Schedule_TeacherQuery', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, 'c4310aabc9114174ac32354a6f9e0fa4', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,c4310aabc9114174ac32354a6f9e0fa4,c4310aabc9114174ac32354a6f9e0fa4,512a57881f8449e896085d85e0578176', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('4b29e7e7453441a48fdcd42f5b4b354f', '导出', 3, 'fa fa-th', NULL, 'CoursePlan_Schedule_TeacherQuery_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '512a57881f8449e896085d85e0578176', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,c4310aabc9114174ac32354a6f9e0fa4,c4310aabc9114174ac32354a6f9e0fa4,512a57881f8449e896085d85e0578176,512a57881f8449e896085d85e0578176,4b29e7e7453441a48fdcd42f5b4b354f', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('5af97e0ee4644ff7a4dd5f51cde77e06', '教室课表', 2, 'fa fa-medium', 'courseplan/schedule/html/teachroomlist.html', 'CoursePlan_Schedule_TeachRoomQuery', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, 'c4310aabc9114174ac32354a6f9e0fa4', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,c4310aabc9114174ac32354a6f9e0fa4,c4310aabc9114174ac32354a6f9e0fa4,5af97e0ee4644ff7a4dd5f51cde77e06', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('83b8699244684295a29b58959368df20', '导出', 3, 'fa fa-th', NULL, 'CoursePlan_Schedule_TeachRoomQuery_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '5af97e0ee4644ff7a4dd5f51cde77e06', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,c4310aabc9114174ac32354a6f9e0fa4,c4310aabc9114174ac32354a6f9e0fa4,5af97e0ee4644ff7a4dd5f51cde77e06,5af97e0ee4644ff7a4dd5f51cde77e06,83b8699244684295a29b58959368df20', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('7e1d57c4856e4220b4ab286d4d9aad90', '课程课表', 2, 'fa fa-book', 'courseplan/schedule/html/courselist.html', 'CoursePlan_Schedule_CourseQuery', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, 'c4310aabc9114174ac32354a6f9e0fa4', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,c4310aabc9114174ac32354a6f9e0fa4,c4310aabc9114174ac32354a6f9e0fa4,7e1d57c4856e4220b4ab286d4d9aad90', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('586fb974ec064db7af24ab196a1f3149', '导出', 3, 'fa fa-th', NULL, 'CoursePlan_Schedule_CourseQuery_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '7e1d57c4856e4220b4ab286d4d9aad90', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,c4310aabc9114174ac32354a6f9e0fa4,c4310aabc9114174ac32354a6f9e0fa4,7e1d57c4856e4220b4ab286d4d9aad90,7e1d57c4856e4220b4ab286d4d9aad90,586fb974ec064db7af24ab196a1f3149', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('e0d51058efde4bf496516b56f55f9800', '课表编排', 1, 'fa fa-newspaper-o', NULL, 'CoursePlan_TheoryArrange', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 8, '57b495da862d42bf84db4e3bcdddc045', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,e0d51058efde4bf496516b56f55f9800', 6, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('9809851037ba4653a353bba556a15efb', '手动排课', 2, 'fa fa-hand-lizard-o', 'courseplan/theory/arrange/html/list.html', 'CoursePlan_TheoryArrange_Arrange', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, 'e0d51058efde4bf496516b56f55f9800', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,e0d51058efde4bf496516b56f55f9800,e0d51058efde4bf496516b56f55f9800,9809851037ba4653a353bba556a15efb', 6, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('0f8be28d6c9d46e68e418c5f8c7f55e6', '排课', 3, 'fa fa-th', NULL, 'CoursePlan_TheoryArrange_Arrange_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '9809851037ba4653a353bba556a15efb', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,e0d51058efde4bf496516b56f55f9800,e0d51058efde4bf496516b56f55f9800,9809851037ba4653a353bba556a15efb,9809851037ba4653a353bba556a15efb,0f8be28d6c9d46e68e418c5f8c7f55e6', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('9ec5e210511148b886e0376b06564060', '发布课表', 2, 'fa fa-slideshare', 'courseplan/theory/arrange/html/publishlist.html', 'CoursePlan_TheoryArrange_PublishSchedule', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, 'e0d51058efde4bf496516b56f55f9800', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,e0d51058efde4bf496516b56f55f9800,e0d51058efde4bf496516b56f55f9800,9ec5e210511148b886e0376b06564060', 8, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('442e2c172b2546478499d52676462cbe', '发布', 3, 'fa fa-th', NULL, 'CoursePlan_TheoryArrange_PublishSchedule_Update', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '9ec5e210511148b886e0376b06564060', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,e0d51058efde4bf496516b56f55f9800,e0d51058efde4bf496516b56f55f9800,9ec5e210511148b886e0376b06564060,9ec5e210511148b886e0376b06564060,442e2c172b2546478499d52676462cbe', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
--INSERT INTO "TSYS_MENU" VALUES ('af88dde0d8264ce1b95ca2d359963bd5', '自动排课', 2, 'fa fa-hand-pointer-o', 'courseplan/theory/arrange/html/autoadd.html', 'CoursePlan_TheoryArrange_AutoArrange', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, 'e0d51058efde4bf496516b56f55f9800', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,e0d51058efde4bf496516b56f55f9800,e0d51058efde4bf496516b56f55f9800,af88dde0d8264ce1b95ca2d359963bd5', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
--INSERT INTO "TSYS_MENU" VALUES ('11e086d6eea643a489770046a70c6064', '排课', 3, 'fa fa-th', NULL, 'CoursePlan_TheoryArrange_AutoArrange_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'af88dde0d8264ce1b95ca2d359963bd5', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,e0d51058efde4bf496516b56f55f9800,e0d51058efde4bf496516b56f55f9800,af88dde0d8264ce1b95ca2d359963bd5,af88dde0d8264ce1b95ca2d359963bd5,11e086d6eea643a489770046a70c6064', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('ea3427ae63134a4aac5c1068a65baaf9', '排课结果管理', 2, 'fa fa-ioxhost', 'courseplan/theory/arrange/html/resultlist.html', 'CoursePlan_TheoryArrange_ArrangeResult', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 4, 'e0d51058efde4bf496516b56f55f9800', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,e0d51058efde4bf496516b56f55f9800,e0d51058efde4bf496516b56f55f9800,ea3427ae63134a4aac5c1068a65baaf9', 7, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('220f62c3b7664cae8a7f608677771775', '导出', 3, 'fa fa-th', NULL, 'CoursePlan_TheoryArrange_ArrangeResult_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'ea3427ae63134a4aac5c1068a65baaf9', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,e0d51058efde4bf496516b56f55f9800,e0d51058efde4bf496516b56f55f9800,ea3427ae63134a4aac5c1068a65baaf9,ea3427ae63134a4aac5c1068a65baaf9,220f62c3b7664cae8a7f608677771775', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('3039809cd3d04e3fbc44f134225d3900', '删除', 3, 'fa fa-th', NULL, 'CoursePlan_TheoryArrange_ArrangeResult_Delete', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'ea3427ae63134a4aac5c1068a65baaf9', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,e0d51058efde4bf496516b56f55f9800,e0d51058efde4bf496516b56f55f9800,ea3427ae63134a4aac5c1068a65baaf9,ea3427ae63134a4aac5c1068a65baaf9,3039809cd3d04e3fbc44f134225d3900', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('6f44460c761b47a9bd2b3df59b23326e', '锁定', 3, 'fa fa-th', NULL, 'CoursePlan_TheoryArrange_ArrangeResult_Lock', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'ea3427ae63134a4aac5c1068a65baaf9', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,e0d51058efde4bf496516b56f55f9800,e0d51058efde4bf496516b56f55f9800,ea3427ae63134a4aac5c1068a65baaf9,ea3427ae63134a4aac5c1068a65baaf9,6f44460c761b47a9bd2b3df59b23326e', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('9641d1d050a548c49dd5afb9470446a4', '解锁', 3, 'fa fa-th', NULL, 'CoursePlan_TheoryArrange_ArrangeResult_Unlock', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'ea3427ae63134a4aac5c1068a65baaf9', '0,57b495da862d42bf84db4e3bcdddc045,57b495da862d42bf84db4e3bcdddc045,e0d51058efde4bf496516b56f55f9800,e0d51058efde4bf496516b56f55f9800,ea3427ae63134a4aac5c1068a65baaf9,ea3427ae63134a4aac5c1068a65baaf9,9641d1d050a548c49dd5afb9470446a4', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
commit;

-- 给教务管理员授权
delete from TSYS_ROLE_MENU_PERMISSION WHERE ROLE_ID = '2' AND MENU_ID IN (select MENU_ID from tsys_menu where parent_id_list like '%,57b495da862d42bf84db4e3bcdddc045%');
commit;
insert into TSYS_ROLE_MENU_PERMISSION select SYS_GUID(),'2',MENU_ID from tsys_menu where parent_id_list like '%,57b495da862d42bf84db4e3bcdddc045%';
commit;
