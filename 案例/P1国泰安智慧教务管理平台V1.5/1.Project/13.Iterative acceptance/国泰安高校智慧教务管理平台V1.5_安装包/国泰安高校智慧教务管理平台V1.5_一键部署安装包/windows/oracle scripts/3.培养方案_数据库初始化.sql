declare
      num  number;
begin
    select count(1) into num from user_tables where table_name = upper('TTRAP_COURSE') ;
    if num > 0 then
        execute immediate 'drop table TTRAP_COURSE' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TTRAP_GRADE_MAJOR') ;
    if num > 0 then
        execute immediate 'drop table TTRAP_GRADE_MAJOR' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TTRAP_MAJOR_THEORY') ;
    if num > 0 then
        execute immediate 'drop table TTRAP_MAJOR_THEORY' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TTRAP_STARTCLASS_PLAN') ;
    if num > 0 then
        execute immediate 'drop table TTRAP_STARTCLASS_PLAN' ;
    end if;
    
    select count(1) into num from user_tables where table_name = upper('TTRAP_STARTCLASS_PLAN_TEMP') ;
    if num > 0 then
        execute immediate 'drop table TTRAP_STARTCLASS_PLAN_TEMP' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TTRAP_OPEN_TIME') ;
    if num > 0 then
        execute immediate 'drop table TTRAP_OPEN_TIME' ;
    end if;
end;
/

/*==============================================================*/
/* Table: TTRAP_COURSE                                     */
/*==============================================================*/
create table TTRAP_COURSE 
(
   COURSE_ID            NVARCHAR2(50)        not null,
   COURSE_NO            NVARCHAR2(50)        not null,
   NAME                 NVARCHAR2(100)        not null,
   DEPARTMENT_ID        NVARCHAR2(50)        not null,
   BIG_COURSE_CODE      NVARCHAR2(50),
   CREDIT               NUMBER(4,2)        not null,
   TOTAL_PERIOD         INTEGER,
   THEORY_PERIOD        INTEGER,
   EXPERI_PERIOD        INTEGER,
   PRACTICE_PERIOD      INTEGER,
   OTHER_PERIOD         INTEGER,
   ENABLE_STATUS        INTEGER        not null,
   ENGLISH_NAME         NVARCHAR2(200),
   IS_CORE_CURRICULUM   INTEGER,
   CHECK_WAY_CODE       NVARCHAR2(50)        not null,
   COURSE_TYPE_CODE     NVARCHAR2(50),
   COURSE_ATTRIBUTE_CODE NVARCHAR2(50),
   COURSE_SUMMARY       NVARCHAR2(1000),
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP            not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP            not null,
   IS_DELETED           INTEGER              not null,
   TACHE_TYPE_CODE      NVARCHAR2(50),
   WEEK_NUM             INTEGER,
   COURSE_OR_TACHE      INTEGER        not null,
   constraint PK_TTRAP_COURSE primary key (COURSE_ID)
);
create index IX_TTRAP_COURSE on TTRAP_COURSE (DEPARTMENT_ID, COURSE_ID, NAME);

/*==============================================================*/
/* Table: TTRAP_GRADE_MAJOR                                */
/*==============================================================*/
create table TTRAP_GRADE_MAJOR 
(
   GRADE_MAJOR_ID       NVARCHAR2(50)        not null,
   GRADE                INTEGER        		 not null,
   MAJOR_ID             NVARCHAR2(50)        not null,
   ENROLL_SEASON_CODE   NVARCHAR2(50),
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP            not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP            not null,
   constraint PK_TTRAP_GRADE_MAJOR primary key (GRADE_MAJOR_ID)
);
create index IX_TTRAP_GRADE_MAJOR on TTRAP_GRADE_MAJOR (GRADE, MAJOR_ID, ENROLL_SEASON_CODE);

/*==============================================================*/
/* Table: TTRAP_MAJOR_THEORY                               */
/*==============================================================*/
create table TTRAP_MAJOR_THEORY 
(
   MAJOR_THEORY_ID      NVARCHAR2(50)        not null,
   GRADE_MAJOR_ID       NVARCHAR2(50)        not null,
   COURSE_ID            NVARCHAR2(50)        not null,
   TOTAL_PERIOD         INTEGER,
   THEORY_PERIOD        INTEGER,
   EXPERI_PERIOD        INTEGER,
   PRACTICE_PERIOD      INTEGER,
   OTHER_PERIOD         INTEGER,
   WEEK_PERIOD          INTEGER,
   CHECK_WAY_CODE       NVARCHAR2(50)        not null,
   STARTCLASS_SEMESTER  NVARCHAR2(50)        not null,
   COURSE_TYPE_CODE     NVARCHAR2(50),
   COURSE_ATTRIBUTE_CODE NVARCHAR2(50),
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP            not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP            not null,
   WEEK_NUM             INTEGER,
   COURSE_OR_TACHE      INTEGER        		 not null,
   constraint PK_TTRAP_MAJOR_THEORY primary key (MAJOR_THEORY_ID)
);
create index IX_TTRAP_MAJOR_THEORY on TTRAP_MAJOR_THEORY (GRADE_MAJOR_ID, COURSE_ID);

/*==============================================================*/
/* Table: TTRAP_OPEN_TIME                                  */
/*==============================================================*/
create table TTRAP_OPEN_TIME 
(
   OPEN_TIME_ID         NVARCHAR2(50)        not null,
   MODULE_FLAG          INTEGER,
   DEPARTMENT_ID        NVARCHAR2(50),
   BEGIN_TIME           TIMESTAMP            not null,
   END_TIME             TIMESTAMP            not null,
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP            not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP            not null,
   constraint PK_TTRAP_OPEN_TIME primary key (OPEN_TIME_ID)
);
create index IX_TTRAP_OPEN_TIME on TTRAP_OPEN_TIME (DEPARTMENT_ID, BEGIN_TIME, END_TIME);

/*==============================================================*/
/* Table: TTRAP_STARTCLASS_PLAN                            */
/*==============================================================*/
create table TTRAP_STARTCLASS_PLAN 
(
   STARTCLASS_PLAN_ID   NVARCHAR2(50)        not null,
   MAJOR_THEORY_ID      NVARCHAR2(50),
   ACADEMIC_YEAR        INTEGER              not null,
   SEMESTER_CODE        NVARCHAR2(50)        not null,
   CLASS_TYPE           INTEGER,
   WEEK_NUM             INTEGER,
   CHECK_WAY_CODE       NVARCHAR2(50)        not null,
   TOTAL_PERIOD         INTEGER,
   THEORY_PERIOD        INTEGER,
   EXPERI_PERIOD        INTEGER,
   PRACTICE_PERIOD      INTEGER,
   OTHER_PERIOD         INTEGER,
   WEEK_PERIOD          INTEGER,
   COURSE_TYPE_CODE     NVARCHAR2(50),
   COURSE_ATTRIBUTE_CODE NVARCHAR2(50),
   CHANGE_TYPE          INTEGER              default 4,
   CREATE_USER_ID       NVARCHAR2(50)        not null,
   CREATE_TIME          TIMESTAMP            not null,
   UPDATE_USER_ID       NVARCHAR2(50)        not null,
   UPDATE_TIME          TIMESTAMP            not null,
   IS_CORE_CURRICULUM   INTEGER,
   COURSE_ID            NVARCHAR2(50),
   GRADE_MAJOR_ID       NVARCHAR2(50),
   AUDIT_RESULT         INTEGER,
   AUDIT_VIEW           NVARCHAR2(500),
   AUDIT_USER_ID        NVARCHAR2(50),
   AUDIT_TIME           TIMESTAMP,
   TEMP_FLAG            INTEGER,
   PID                  NVARCHAR2(50),
   constraint PK_TTRAP_STARTCLASS_PLAN primary key (STARTCLASS_PLAN_ID)
);
create index IX_TTRAP_STARTCLASS_PLAN on TTRAP_STARTCLASS_PLAN (ACADEMIC_YEAR, SEMESTER_CODE, GRADE_MAJOR_ID, COURSE_ID);

CREATE OR REPLACE FORCE VIEW "VTRAP_STARTNOCLASSPLAN" 
("TRAINING_LEVEL_CODE", "STARTCLASSID", "GRADE", "MAJOR_NAME", "COURSE_NO", "NAME", "CHECK_WAY_CODE", "CREDIT", "TOTAL_PERIOD", "THEORY_PERIOD", "EXPERI_PERIOD",
 "PRACTICE_PERIOD", "OTHER_PERIOD", "WEEK_NUM", "START_UNIT", "COURSE_TYPE_CODE", "COURSE_ATTRIBUTE_CODE", "CLASS_TYPE", "DEPARTMENT_NAME", "DEPARTMENT_ID",
  "WEEK_PERIOD", "ACADEMIC_YEAR", "SEMESTER_CODE", "MAJOR_ID", "CAMPUS_ID", "CLASS_NUMBER", "COURSE_ID", "GRADE_MAJOR_ID", "TACHE_TYPE_CODE") AS 
  SELECT
t.TRAINING_LEVEL_CODE,
t."STARTCLASSID",
t."GRADE",
t."MAJOR_NAME",
t."COURSE_NO",
t."NAME",
t."CHECK_WAY_CODE",
t."CREDIT",
t."TOTAL_PERIOD"
,t."THEORY_PERIOD",
t."EXPERI_PERIOD",
t."PRACTICE_PERIOD",
t."OTHER_PERIOD"
,t."WEEK_NUM",
t."START_UNIT",
t."COURSE_TYPE_CODE",
t."COURSE_ATTRIBUTE_CODE",
t."CLASS_TYPE",
t."DEPARTMENT_NAME",
t."DEPARTMENT_ID",
t."WEEK_PERIOD",
t."ACADEMIC_YEAR",
t."SEMESTER_CODE",
t."MAJOR_ID",
t."CAMPUS_ID",
(SELECT COUNT(0) from TSTU_CLASS ts where ts.major_id = t.major_id and ts.grade = t.grade and ts.campus_id =t.campus_id) as CLASS_NUMBER,
t.course_id,
t.grade_major_id,
t.TACHE_TYPE_CODE
from
(
SELECT
(p.STARTCLASS_PLAN_ID || g.MAJOR_ID ) as startclassId,
t.MAJOR_THEORY_ID,
P.CHECK_WAY_CODE,
P.TOTAL_PERIOD,
P.THEORY_PERIOD,
P.EXPERI_PERIOD,
P.PRACTICE_PERIOD,
P.OTHER_PERIOD,
P.WEEK_NUM,
p.COURSE_TYPE_CODE,
p.COURSE_ATTRIBUTE_CODE,
p.CLASS_TYPE,
p.WEEK_PERIOD,
p.ACADEMIC_YEAR,
p.SEMESTER_CODE,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  j.TACHE_TYPE_CODE else c.TACHE_TYPE_CODE  end) as  TACHE_TYPE_CODE,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  mk.DEPARTMENT_NAME else d.DEPARTMENT_NAME  end) as  DEPARTMENT_NAME,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  CJ.DEPARTMENT_ID else d.DEPARTMENT_ID  end) as  DEPARTMENT_ID,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  fk.MAJOR_ID else g.MAJOR_ID  end) as  MAJOR_ID,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  j.NAME else c.name  end) as  name,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  j.COURSE_NO else c.COURSE_NO  end) as  COURSE_NO,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  j.CREDIT else c.CREDIT  end) as  CREDIT,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  mk.DEPARTMENT_NAME else k.DEPARTMENT_NAME  end) as  START_UNIT,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  kl.major_name else m.MAJOR_NAME  end) as MAJOR_NAME,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  fk.grade else g.grade end) as grade,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  cat.campus_id else ca.campus_id end) as CAMPUS_ID,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  kl.training_level_code else m.training_level_code end) as training_level_code,
p.COURSE_ID,
p.grade_major_id
from
TTRAP_STARTCLASS_PLAN  p
LEFT JOIN TTRAP_MAJOR_THEORY t on  p.MAJOR_THEORY_ID = t.MAJOR_THEORY_ID
LEFT JOIN TTRAP_GRADE_MAJOR g  on  t.grade_major_id = g.grade_major_id
LEFT JOIN TSYS_MAJOR m on g.major_id = m.major_id
LEFT JOIN TSYS_DEPARTMENT d on d.department_id = m.department_id
LEFT JOIN TSYS_CAMPUS ca on d.campus_id = ca.campus_id
LEFT JOIN TTRAP_COURSE c on t.course_id =c.course_id
LEFT JOIN TSYS_DEPARTMENT k on k.department_id = c.department_id
LEFT JOIN TTRAP_COURSE j on p.course_id = j.course_id
LEFT JOIN TSYS_DEPARTMENT mk on mk.department_id = j.department_id
LEFT JOIN TSYS_CAMPUS cat on mk.campus_id = cat.campus_id
LEFT JOIN TTRAP_GRADE_MAJOR fk on p.grade_major_id = fk.grade_major_id
LEFT JOIN TSYS_MAJOR kl on fk.major_id = kl.major_id
LEFT JOIN TSYS_DEPARTMENT CJ ON KL.department_id = CJ.department_id 
where p.TEMP_FLAG =0
)t;

commit;

CREATE OR REPLACE FORCE VIEW "VTRAP_STARTTHECLASSPLAN" ("STARTCLASSID", "COURSE_ID", "NAME", "COURSE_NO", "CREDIT", "START_UNIT", "MAJOR_NAME", "GRADE", "CAMPUS_NAME", "DEPARTMENT_NAME", "DEPARTMENT_ID", "TACHE_TYPE_CODE", "MAJOR_ID", "CHECK_WAY_CODE", "TOTAL_PERIOD", "THEORY_PERIOD", "EXPERI_PERIOD", "PRACTICE_PERIOD", "OTHER_PERIOD", "WEEK_NUM", "COURSE_TYPE_CODE", "COURSE_ATTRIBUTE_CODE", "CLASS_NAME", "CLASS_NO", "PRESET_NUMBER", "CLASS_TYPE", "WEEK_PERIOD", "ACADEMIC_YEAR", "SEMESTER_CODE", "GRADE_MAJOR_ID") AS 
  SELECT
(p.STARTCLASS_PLAN_ID || cl.class_Id ) as startclassId,
 p.course_id,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  j.NAME else c.name  end) as  name,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  j.COURSE_NO else c.COURSE_NO  end) as  COURSE_NO,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  j.CREDIT else c.CREDIT  end) as  CREDIT,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  mk.DEPARTMENT_NAME else k.DEPARTMENT_NAME  end) as  START_UNIT,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  kl.major_name else m.MAJOR_NAME  end) as MAJOR_NAME,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  fk.grade else g.grade end) as grade,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  cat.CAMPUS_NAME else ca.CAMPUS_NAME end) as CAMPUS_NAME,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  mk.DEPARTMENT_NAME else d.DEPARTMENT_NAME  end) as  DEPARTMENT_NAME,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  CJ.DEPARTMENT_ID else d.DEPARTMENT_ID  end) as  DEPARTMENT_ID,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  j.TACHE_TYPE_CODE else c.TACHE_TYPE_CODE  end) as  TACHE_TYPE_CODE,
(CASE WHEN  t.MAJOR_THEORY_ID is null THEN  fk.MAJOR_ID else g.MAJOR_ID  end) as  MAJOR_ID,
P.CHECK_WAY_CODE,
P.TOTAL_PERIOD,
P.THEORY_PERIOD,
P.EXPERI_PERIOD,
P.PRACTICE_PERIOD,
P.OTHER_PERIOD,
P.WEEK_NUM,
p.COURSE_TYPE_CODE,
p.COURSE_ATTRIBUTE_CODE,
cl.CLASS_NAME,
cl.CLASS_NO,
cl.PRESET_NUMBER,
p.CLASS_TYPE,
p.WEEK_PERIOD,
p.ACADEMIC_YEAR,
p.SEMESTER_CODE,
p.GRADE_MAJOR_ID
from
TTRAP_STARTCLASS_PLAN  p
LEFT JOIN TTRAP_MAJOR_THEORY t on  p.MAJOR_THEORY_ID = t.MAJOR_THEORY_ID
LEFT JOIN TTRAP_GRADE_MAJOR g  on  t.grade_major_id = g.grade_major_id
LEFT JOIN TSYS_MAJOR m on g.major_id = m.major_id
LEFT JOIN TSYS_DEPARTMENT d on d.department_id = m.department_id
LEFT JOIN TSYS_CAMPUS ca on d.campus_id = ca.campus_id
LEFT JOIN TTRAP_COURSE c on t.course_id =c.course_id
LEFT JOIN TSYS_DEPARTMENT k on k.department_id = c.department_id
LEFT JOIN TSTU_CLASS cl on cl.grade = g.grade and cl.major_id = m.major_id
LEFT JOIN TTRAP_COURSE j on p.course_id = j.course_id
LEFT JOIN TSYS_DEPARTMENT mk on mk.department_id = j.department_id
LEFT JOIN TSYS_CAMPUS cat on mk.campus_id = cat.campus_id
LEFT JOIN TTRAP_GRADE_MAJOR fk on p.grade_major_id = fk.grade_major_id
LEFT JOIN TSYS_MAJOR kl on fk.major_id = kl.major_id
LEFT JOIN TSYS_DEPARTMENT CJ ON KL.department_id = CJ.department_id 
where p.TEMP_FLAG =0;


/**
 * 查询培养方案的视图，为了优化生成开课计划的一个视图
 */
CREATE OR REPLACE FORCE VIEW VTTRAP_MAJOR_THEORY ("MAJOR_THEORY_ID", "GRADE_MAJOR_ID", "COURSE_ID", "TOTAL_PERIOD", "THEORY_PERIOD", "EXPERI_PERIOD", "PRACTICE_PERIOD", "OTHER_PERIOD", "WEEK_PERIOD", "CHECK_WAY_CODE", "STARTCLASS_SEMESTER", "COURSE_TYPE_CODE", "COURSE_ATTRIBUTE_CODE", "WEEK_NUM", "COURSE_OR_TACHE", "GRADE", "MAJOR_NAME", "OPENG_DEPARTMENT_NAME", "DEPARTMENT_NAME", "COURSE_NAME", "CREDIT", "BIG_COURSE_CODE", "TACHE_TYPE_CODE", "MAJOR_ID", "EDUCATION_SYSTEM", "DEPARTMENT_ID") AS 
  SELECT 
t.MAJOR_THEORY_ID,
t.GRADE_MAJOR_ID,
t.COURSE_ID,
t.TOTAL_PERIOD,
t.THEORY_PERIOD,
t.EXPERI_PERIOD,
t.PRACTICE_PERIOD,
t.OTHER_PERIOD,
t.WEEK_PERIOD,
t.CHECK_WAY_CODE,
t.STARTCLASS_SEMESTER,
t.COURSE_TYPE_CODE,
t.COURSE_ATTRIBUTE_CODE,
t.WEEK_NUM,
t.COURSE_OR_TACHE,
r.GRADE,
m.MAJOR_NAME,
d.DEPARTMENT_NAME AS OPENG_DEPARTMENT_NAME,
de.DEPARTMENT_NAME,
c.name as COURSE_NAME,
c.CREDIT,
C.BIG_COURSE_CODE,
C.TACHE_TYPE_CODE,
r.MAJOR_ID,
m.EDUCATION_SYSTEM,
de.DEPARTMENT_ID
from
TTRAP_MAJOR_THEORY t  
LEFT JOIN  TTRAP_COURSE c on t.COURSE_ID = c.COURSE_ID 
LEFT JOIN TSYS_DEPARTMENT d on c.department_id=d.department_id
LEFT JOIN TTRAP_GRADE_MAJOR r on t.grade_major_id = r .grade_major_id
LEFT JOIN TSYS_MAJOR m on r.major_id = m.major_id
LEFT JOIN TSYS_DEPARTMENT de on m.department_id = de .department_id;


/**
 * 打印培养方案视图，优化
 */
CREATE OR REPLACE FORCE VIEW VTTRAP_MAJOR_THEORY_FOR_PRINT ("MAJOR_THEORY_ID", "GRADE_MAJOR_ID", "GRADE", "MAJOR_ID", "MAJOR_NO", "DEPARTMENT_ID", "DEPARTMENT_NAME", "MAJOR_NAME", "MAJORNONAME", "COURSE_ID", "COURSE_NO", "NAME", "ENGLISH_NAME", "KKDEPARTMENTID", "KKDEPARTMENTNAME", "BIG_COURSE_CODE", "CREDIT", "TOTAL_PERIOD", "THEORY_PERIOD", "EXPERI_PERIOD", "PRACTICE_PERIOD", "OTHER_PERIOD", "WEEK_PERIOD", "TACHE_TYPE_CODE", "CHECK_WAY_CODE", "STARTCLASS_SEMESTER", "COURSE_TYPE_CODE", "COURSE_ATTRIBUTE_CODE", "CREATE_USER_ID", "CREATE_TIME", "UPDATE_USER_ID", "UPDATE_TIME", "WEEK_NUM", "COURSE_OR_TACHE", "EDUCATION_SYSTEM", "TRAINING_LEVEL_CODE") AS 
  SELECT
mt.MAJOR_THEORY_ID, --专业理论课/专业环节ID
gm.grade_major_id, --年级开设专业ID
gm.grade, --年级
m.major_id, --专业ID
m.major_no, -- 专业编号
de.department_id, --院系ID
de.department_name, -- 院系名称
m.major_name, -- 专业名称
'['||m.major_no||']'||m.major_name as majorNoName, --专业号名称
c.course_id, -- 课程/环节ID
c.course_no, -- 课程/环节号
c.name,  --课程/环节名称
c.english_name, --英文名称
kkd.department_id as kkDepartmentId, -- 开课单位ID
kkd.department_name as kkDepartmentName, --开课单位名称
c.big_course_code, --课程大类
c.credit, -- 学分
mt.total_period, -- 总学时
mt.theory_period, -- 理论学时
mt.experi_period, -- 实验学时
mt.practice_period, -- 实践学时
mt.other_period, -- 其他学时
mt.week_period, --周学时
c.tache_type_code, -- 环节类别
mt.check_way_code, -- 考核方式
mt.startclass_semester, -- 开课学期（1至14用“,”隔开）
mt.course_type_code, --课程类别
mt.course_attribute_code, -- 课程属性
mt.create_user_id,
mt.create_time,
mt.update_user_id,
mt.update_time,
mt.week_num, --周数
mt.course_or_tache, -- 标识专业课程和专业环节（1专业课程2专业环节）
m.education_system, --学制
m.training_level_code -- 培养层次编号
from TTRAP_MAJOR_THEORY mt
LEFT JOIN TTRAP_COURSE c on mt.COURSE_ID = c.COURSE_ID
LEFT JOIN TSYS_DEPARTMENT kkd on c.department_id = kkd .department_id
LEFT JOIN TTRAP_GRADE_MAJOR gm on mt.grade_major_id = gm.grade_major_id
LEFT JOIN TSYS_MAJOR m on gm .major_Id = m.major_id
left join TSYS_DEPARTMENT de on m.department_id=de.department_id;

commit;

/*
 培养方案--删除培养方案原有菜单
*/ 
delete  TSYS_MENU t where t.MENU_ID in 
(
select menu_id from tsys_menu where parent_id_list like '%,3cab2af0932c47ebb7fe3ee1da61b904%'
) ;
commit;

-- 生成培养方案菜单
DECLARE orderNo NUMBER;
BEGIN
SELECT MAX(ORDER_NO)+1 INTO orderNo FROM TSYS_MENU where PARENT_ID='0';
INSERT INTO "TSYS_MENU" VALUES ('3cab2af0932c47ebb7fe3ee1da61b904', '培养方案', 1, 'fa fa-file-text', NULL, 'TrainPlan', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 3, '0', '0,3cab2af0932c47ebb7fe3ee1da61b904', orderNo, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
End;
/

INSERT INTO "TSYS_MENU" VALUES ('6045f605d5c7483d8a2084d042306b95', '开课计划', 1, 'fa fa-arrows', NULL, 'TrainPlan_StartClassPlan', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 6, '3cab2af0932c47ebb7fe3ee1da61b904', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('0c68041df84446658396153121c83451', '审核开课变更', 2, 'fa fa-check-circle', 'trainplan/coursePlan/coursePlan/html/auditList.html', 'TrainPlan_StartClassPlan_AuditChange', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, '6045f605d5c7483d8a2084d042306b95', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,0c68041df84446658396153121c83451', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('27fd490ca1fd48cebc799d7085b1a566', '导出', 3, 'fa fa-th', NULL, 'TrainPlan_StartClassPlan_AuditChange_Export', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '0c68041df84446658396153121c83451', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,0c68041df84446658396153121c83451,0c68041df84446658396153121c83451,27fd490ca1fd48cebc799d7085b1a566', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('e4ca30830a0a488099978b9f546f91b4', '审核/取消审核', 3, 'fa fa-th', NULL, 'TrainPlan_StartClassPlan_AuditChange_Audit', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '0c68041df84446658396153121c83451', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,0c68041df84446658396153121c83451,0c68041df84446658396153121c83451,e4ca30830a0a488099978b9f546f91b4', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('12732b8290f2402d855b4bd58d338c22', '通识课开课计划', 2, 'fa fa-globe', 'trainplan/coursePlan/generateCoursePlan/html/list.html', 'TrainPlan_StartClassPlan_CoreCurricul', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 3, '6045f605d5c7483d8a2084d042306b95', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,12732b8290f2402d855b4bd58d338c22', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('28e02fc38ef8495e8e8254950cfdef5b', '新增', 3, 'fa fa-th', NULL, 'TrainPlan_StartClassPlan_CoreCurricul_Add', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '12732b8290f2402d855b4bd58d338c22', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,12732b8290f2402d855b4bd58d338c22,12732b8290f2402d855b4bd58d338c22,28e02fc38ef8495e8e8254950cfdef5b', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('507e9da2f21447ad8a8046849d737d11', '导出', 3, 'fa fa-th', NULL, 'TrainPlan_StartClassPlan_CoreCurricul_Export', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '12732b8290f2402d855b4bd58d338c22', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,12732b8290f2402d855b4bd58d338c22,12732b8290f2402d855b4bd58d338c22,507e9da2f21447ad8a8046849d737d11', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('61018ee40bf64fcf9259490d88a02360', '删除', 3, 'fa fa-th', NULL, 'TrainPlan_StartClassPlan_CoreCurricul_Delete', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '12732b8290f2402d855b4bd58d338c22', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,12732b8290f2402d855b4bd58d338c22,12732b8290f2402d855b4bd58d338c22,61018ee40bf64fcf9259490d88a02360', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('215e6b80ee82429c9dc72645ffe44a1a', '查询开课计划', 2, 'fa fa-television', 'trainplan/coursePlan/view/html/list.html', 'TrainPlan_StartClassPlan_View', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '6045f605d5c7483d8a2084d042306b95', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,215e6b80ee82429c9dc72645ffe44a1a', 6, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('4b7bec54d1384219a9cae82e0bc88101', '开课计划维护时间控制', 2, 'fa fa-calendar', 'trainplan/coursePlan/setTime/html/settime.html', 'TrainPlan_StartClassPlan_Time', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '6045f605d5c7483d8a2084d042306b95', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,4b7bec54d1384219a9cae82e0bc88101', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('65520ca9c2ba441981e001aa06dd35bf', '生成开课计划', 2, 'fa fa-stack-overflow', 'trainplan/coursePlan/coursePlan/html/buildList.html', 'TrainPlan_StartClassPlan_Build', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 3, '6045f605d5c7483d8a2084d042306b95', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,65520ca9c2ba441981e001aa06dd35bf', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('54d8cbed4bd84f11bd9782ae871dd973', '生成', 3, 'fa fa-th', NULL, 'TrainPlan_StartClassPlan_Build_Build', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '65520ca9c2ba441981e001aa06dd35bf', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,65520ca9c2ba441981e001aa06dd35bf,65520ca9c2ba441981e001aa06dd35bf,54d8cbed4bd84f11bd9782ae871dd973', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('aad01f0847b84d80ae6609c1aa3ede33', '删除', 3, 'fa fa-th', NULL, 'TrainPlan_StartClassPlan_Build_Delete', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '65520ca9c2ba441981e001aa06dd35bf', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,65520ca9c2ba441981e001aa06dd35bf,65520ca9c2ba441981e001aa06dd35bf,aad01f0847b84d80ae6609c1aa3ede33', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('c295a6a772044928a1b4ab5a2270aa3d', '导出', 3, 'fa fa-th', NULL, 'TrainPlan_StartClassPlan_Build_Export', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '65520ca9c2ba441981e001aa06dd35bf', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,65520ca9c2ba441981e001aa06dd35bf,65520ca9c2ba441981e001aa06dd35bf,c295a6a772044928a1b4ab5a2270aa3d', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('e72ce3e789f544d79b6541fb2eeb6938', '申请开课变更', 2, 'fa fa-exchange', 'trainplan/coursePlan/coursePlan/html/applyList.html', 'TrainPlan_StartClassPlan_ApplyChange', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 8, '6045f605d5c7483d8a2084d042306b95', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,e72ce3e789f544d79b6541fb2eeb6938', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('0b2686ce2aac4bf3b65b9ca968cececa', '取消修改', 3, 'fa fa-th', NULL, 'TrainPlan_StartClassPlan_ApplyChange_CancelUpdate', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'e72ce3e789f544d79b6541fb2eeb6938', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,e72ce3e789f544d79b6541fb2eeb6938,e72ce3e789f544d79b6541fb2eeb6938,0b2686ce2aac4bf3b65b9ca968cececa', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('0d1fa9a712484330a4d5b89e112c4eba', '导出', 3, 'fa fa-th', NULL, 'TrainPlan_StartClassPlan_ApplyChange_Export', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'e72ce3e789f544d79b6541fb2eeb6938', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,e72ce3e789f544d79b6541fb2eeb6938,e72ce3e789f544d79b6541fb2eeb6938,0d1fa9a712484330a4d5b89e112c4eba', 8, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('6991be78cb5f434d93d362056b2d2f83', '停开', 3, 'fa fa-th', NULL, 'TrainPlan_StartClassPlan_ApplyChange_Stop', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'e72ce3e789f544d79b6541fb2eeb6938', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,e72ce3e789f544d79b6541fb2eeb6938,e72ce3e789f544d79b6541fb2eeb6938,6991be78cb5f434d93d362056b2d2f83', 6, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('879a6f6d9231412e86cec818025dd526', '取消停开', 3, 'fa fa-th', NULL, 'TrainPlan_StartClassPlan_ApplyChange_CancelStop', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'e72ce3e789f544d79b6541fb2eeb6938', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,e72ce3e789f544d79b6541fb2eeb6938,e72ce3e789f544d79b6541fb2eeb6938,879a6f6d9231412e86cec818025dd526', 7, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('c6b3e51482834627be47e62cb1926463', '增开环节', 3, 'fa fa-th', NULL, 'TrainPlan_StartClassPlan_ApplyChange_AddTache', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'e72ce3e789f544d79b6541fb2eeb6938', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,e72ce3e789f544d79b6541fb2eeb6938,e72ce3e789f544d79b6541fb2eeb6938,c6b3e51482834627be47e62cb1926463', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('cb24ccb125d6491585fc9fdf37ed112e', '取消新增', 3, 'fa fa-th', NULL, 'TrainPlan_StartClassPlan_ApplyChange_CancelAdd', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'e72ce3e789f544d79b6541fb2eeb6938', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,e72ce3e789f544d79b6541fb2eeb6938,e72ce3e789f544d79b6541fb2eeb6938,cb24ccb125d6491585fc9fdf37ed112e', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('ddf1bec1e25d44c189f01b5c9a74b33e', '增开课程', 3, 'fa fa-th', NULL, 'TrainPlan_StartClassPlan_ApplyChange_AddCourse', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'e72ce3e789f544d79b6541fb2eeb6938', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,e72ce3e789f544d79b6541fb2eeb6938,e72ce3e789f544d79b6541fb2eeb6938,ddf1bec1e25d44c189f01b5c9a74b33e', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('e66ac11b12c04641b46837e87bcf220d', '修改', 3, 'fa fa-th', NULL, 'TrainPlan_StartClassPlan_ApplyChange_Update', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'e72ce3e789f544d79b6541fb2eeb6938', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,6045f605d5c7483d8a2084d042306b95,6045f605d5c7483d8a2084d042306b95,e72ce3e789f544d79b6541fb2eeb6938,e72ce3e789f544d79b6541fb2eeb6938,e66ac11b12c04641b46837e87bcf220d', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('e3c56d197e2b4d178122dbb9f13968ff', '设置培养方案', 1, 'fa fa-file-text', NULL, 'TrainPlan_SetTrainPlan', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 5, '3cab2af0932c47ebb7fe3ee1da61b904', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('044854f156984a85b43a14c241b69a5e', '培养方案维护时间控制', 2, 'fa fa-calendar', 'trainplan/setTrainPlan/setTime/html/settime.html', 'TrainPlan_SetTrainPlan_Time', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, 'e3c56d197e2b4d178122dbb9f13968ff', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,044854f156984a85b43a14c241b69a5e', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('2821a8d83c7e4290a736d356fcb97848', '设置', 3, 'fa fa-th', NULL, 'TrainPlan_SetTrainPlan_Time_Set', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '044854f156984a85b43a14c241b69a5e', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,044854f156984a85b43a14c241b69a5e,044854f156984a85b43a14c241b69a5e,2821a8d83c7e4290a736d356fcb97848', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('15b0b05d1c994f71b206833d49e9d701', '设置专业理论课程', 2, 'fa fa-list-alt', 'trainplan/setTrainPlan/majorTheory/html/list.html', 'TrainPlan_SetTrainPlan_MajorCourse', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 4, 'e3c56d197e2b4d178122dbb9f13968ff', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,15b0b05d1c994f71b206833d49e9d701', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('428be11f7a5d45c89dfb793707b7e43d', '删除', 3, 'fa fa-th', NULL, 'TrainPlan_SetTrainPlan_MajorCourse_Delete', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '15b0b05d1c994f71b206833d49e9d701', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,15b0b05d1c994f71b206833d49e9d701,15b0b05d1c994f71b206833d49e9d701,428be11f7a5d45c89dfb793707b7e43d', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('58f7e6f402a1410e9b8477d441a7e11c', '修改', 3, 'fa fa-th', NULL, 'TrainPlan_SetTrainPlan_MajorCourse_Update', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '15b0b05d1c994f71b206833d49e9d701', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,15b0b05d1c994f71b206833d49e9d701,15b0b05d1c994f71b206833d49e9d701,58f7e6f402a1410e9b8477d441a7e11c', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('7b045c9e033b4eb7a45204703d905c86', '导出', 3, 'fa fa-th', NULL, 'TrainPlan_SetTrainPlan_MajorCourse_Export', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '15b0b05d1c994f71b206833d49e9d701', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,15b0b05d1c994f71b206833d49e9d701,15b0b05d1c994f71b206833d49e9d701,7b045c9e033b4eb7a45204703d905c86', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('b6bc8ab171124a94b55da43b6c2c802a', '新增', 3, 'fa fa-th', NULL, 'TrainPlan_SetTrainPlan_MajorCourse_Add', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '15b0b05d1c994f71b206833d49e9d701', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,15b0b05d1c994f71b206833d49e9d701,15b0b05d1c994f71b206833d49e9d701,b6bc8ab171124a94b55da43b6c2c802a', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('4d79e4b6c69040d9b209782a5fbdf5c3', '设置年级开设专业', 2, 'fa fa-yahoo', 'trainplan/setTrainPlan/grademajor/html/list.html', 'TrainPlan_SetTrainPlan_GradeMajor', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 4, 'e3c56d197e2b4d178122dbb9f13968ff', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,4d79e4b6c69040d9b209782a5fbdf5c3', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('18e28a0887384236bcffaa157604a61b', '添加', 3, 'fa fa-th', NULL, 'TrainPlan_SetTrainPlan_GradeMajor_Add', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '4d79e4b6c69040d9b209782a5fbdf5c3', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,4d79e4b6c69040d9b209782a5fbdf5c3,4d79e4b6c69040d9b209782a5fbdf5c3,18e28a0887384236bcffaa157604a61b', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('4f3a32f0a15b41888fb727b5d8a23ddc', '取消', 3, 'fa fa-th', NULL, 'TrainPlan_SetTrainPlan_GradeMajor_Cancel', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '4d79e4b6c69040d9b209782a5fbdf5c3', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,4d79e4b6c69040d9b209782a5fbdf5c3,4d79e4b6c69040d9b209782a5fbdf5c3,4f3a32f0a15b41888fb727b5d8a23ddc', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('52fc17e61761436a875cb3e30fc1e58d', '复制', 3, 'fa fa-th', NULL, 'TrainPlan_SetTrainPlan_GradeMajor_Copy', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '4d79e4b6c69040d9b209782a5fbdf5c3', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,4d79e4b6c69040d9b209782a5fbdf5c3,4d79e4b6c69040d9b209782a5fbdf5c3,52fc17e61761436a875cb3e30fc1e58d', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('534d03a2c4f24185873ce37e7d891be4', '导出', 3, 'fa fa-th', NULL, 'TrainPlan_SetTrainPlan_GradeMajor_Export', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '4d79e4b6c69040d9b209782a5fbdf5c3', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,4d79e4b6c69040d9b209782a5fbdf5c3,4d79e4b6c69040d9b209782a5fbdf5c3,534d03a2c4f24185873ce37e7d891be4', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('718b6901ed974e2783f3ac2d180ea3c9', '设置专业实践环节', 2, 'fa fa-bookmark', 'trainplan/setTrainPlan/majorTache/html/list.html', 'TrainPlan_SetTrainPlan_MajorTache', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 4, 'e3c56d197e2b4d178122dbb9f13968ff', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,718b6901ed974e2783f3ac2d180ea3c9', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('69f15d23560b4468829611b31c6390a8', '新增', 3, 'fa fa-th', NULL, 'TrainPlan_SetTrainPlan_MajorTache_Add', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '718b6901ed974e2783f3ac2d180ea3c9', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,718b6901ed974e2783f3ac2d180ea3c9,718b6901ed974e2783f3ac2d180ea3c9,69f15d23560b4468829611b31c6390a8', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('e1b7221cfaba44c190c4a952ea819878', '修改', 3, 'fa fa-th', NULL, 'TrainPlan_SetTrainPlan_MajorTache_Update', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '718b6901ed974e2783f3ac2d180ea3c9', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,718b6901ed974e2783f3ac2d180ea3c9,718b6901ed974e2783f3ac2d180ea3c9,e1b7221cfaba44c190c4a952ea819878', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('fa4b64f3e1c341d8bafcebbd4983c0f4', '导出', 3, 'fa fa-th', NULL, 'TrainPlan_SetTrainPlan_MajorTache_Export', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '718b6901ed974e2783f3ac2d180ea3c9', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,718b6901ed974e2783f3ac2d180ea3c9,718b6901ed974e2783f3ac2d180ea3c9,fa4b64f3e1c341d8bafcebbd4983c0f4', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('ffec5fa202e24187af95aaa3ae91929d', '删除', 3, 'fa fa-th', NULL, 'TrainPlan_SetTrainPlan_MajorTache_Delete', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '718b6901ed974e2783f3ac2d180ea3c9', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,718b6901ed974e2783f3ac2d180ea3c9,718b6901ed974e2783f3ac2d180ea3c9,ffec5fa202e24187af95aaa3ae91929d', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('8ee373a81a234eeeabfc1f0506c62f5f', '查询培养方案', 2, 'fa fa-desktop', 'trainplan/setTrainPlan/view/html/list.html', 'TrainPlan_SetTrainPlan_ViewTrainPlan', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, 'e3c56d197e2b4d178122dbb9f13968ff', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,8ee373a81a234eeeabfc1f0506c62f5f', 6, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('8a78ed81e242403e9e4cf0e0fd3b377f', '打印培养方案', 3, 'fa fa-th', NULL, 'TrainPlan_SetTrainPlan_ViewTrainPlan_Print', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '8ee373a81a234eeeabfc1f0506c62f5f', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,8ee373a81a234eeeabfc1f0506c62f5f,8ee373a81a234eeeabfc1f0506c62f5f,8a78ed81e242403e9e4cf0e0fd3b377f', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('d612af49b0de404cb4ddad389c9ecb13', '查看培养方案', 3, 'fa fa-th', NULL, 'TrainPlan_SetTrainPlan_ViewTrainPlan_View', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '8ee373a81a234eeeabfc1f0506c62f5f', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,e3c56d197e2b4d178122dbb9f13968ff,e3c56d197e2b4d178122dbb9f13968ff,8ee373a81a234eeeabfc1f0506c62f5f,8ee373a81a234eeeabfc1f0506c62f5f,d612af49b0de404cb4ddad389c9ecb13', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('f71119d17fb04b958a8c380ca8959fc2', '课程资源管理', 1, 'fa fa-book', NULL, 'TrainPlan_CourseResource', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 3, '3cab2af0932c47ebb7fe3ee1da61b904', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('3b24d705ae054b2fb80edde3657ae6f5', '课程信息', 2, 'fa fa-pencil-square', 'trainplan/courseResource/course/html/list.html', 'TrainPlan_CourseResource_Course', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 7, 'f71119d17fb04b958a8c380ca8959fc2', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2,f71119d17fb04b958a8c380ca8959fc2,3b24d705ae054b2fb80edde3657ae6f5', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('656865afcf3749deb75a3317f36bc37a', '导入', 3, 'fa fa-th', NULL, 'TrainPlan_CourseResource_Course_Import', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '3b24d705ae054b2fb80edde3657ae6f5', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2,f71119d17fb04b958a8c380ca8959fc2,3b24d705ae054b2fb80edde3657ae6f5,3b24d705ae054b2fb80edde3657ae6f5,656865afcf3749deb75a3317f36bc37a', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('6ed27373595743ed8d98175901a41ce5', '启用', 3, 'fa fa-th', NULL, 'TrainPlan_CourseResource_Course_Enable', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '3b24d705ae054b2fb80edde3657ae6f5', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2,f71119d17fb04b958a8c380ca8959fc2,3b24d705ae054b2fb80edde3657ae6f5,3b24d705ae054b2fb80edde3657ae6f5,6ed27373595743ed8d98175901a41ce5', 7, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('7fa755646c34447bb117b28411fc035a', '新增', 3, 'fa fa-th', NULL, 'TrainPlan_CourseResource_Course_Add', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '3b24d705ae054b2fb80edde3657ae6f5', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2,f71119d17fb04b958a8c380ca8959fc2,3b24d705ae054b2fb80edde3657ae6f5,3b24d705ae054b2fb80edde3657ae6f5,7fa755646c34447bb117b28411fc035a', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('98f2ccd22b6f497481c3bd35a879bbe2', '修改', 3, 'fa fa-th', NULL, 'TrainPlan_CourseResource_Course_Update', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '3b24d705ae054b2fb80edde3657ae6f5', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2,f71119d17fb04b958a8c380ca8959fc2,3b24d705ae054b2fb80edde3657ae6f5,3b24d705ae054b2fb80edde3657ae6f5,98f2ccd22b6f497481c3bd35a879bbe2', 6, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('ba747c7b3c7c420c9b6e6ef305fd1373', '删除', 3, 'fa fa-th', NULL, 'TrainPlan_CourseResource_Course_Delete', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '3b24d705ae054b2fb80edde3657ae6f5', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2,f71119d17fb04b958a8c380ca8959fc2,3b24d705ae054b2fb80edde3657ae6f5,3b24d705ae054b2fb80edde3657ae6f5,ba747c7b3c7c420c9b6e6ef305fd1373', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('d577bf58521243f0bbb863c83f8cb0fe', '导出', 3, 'fa fa-th', NULL, 'TrainPlan_CourseResource_Course_Export', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '3b24d705ae054b2fb80edde3657ae6f5', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2,f71119d17fb04b958a8c380ca8959fc2,3b24d705ae054b2fb80edde3657ae6f5,3b24d705ae054b2fb80edde3657ae6f5,d577bf58521243f0bbb863c83f8cb0fe', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('f59c8920e72046c5b08c188e6bef40a1', '禁用', 3, 'fa fa-th', NULL, 'TrainPlan_CourseResource_Course_Disable', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '3b24d705ae054b2fb80edde3657ae6f5', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2,f71119d17fb04b958a8c380ca8959fc2,3b24d705ae054b2fb80edde3657ae6f5,3b24d705ae054b2fb80edde3657ae6f5,f59c8920e72046c5b08c188e6bef40a1', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('b9cfef837d6942b581096d4f1e8a6778', '环节信息', 2, 'fa fa-external-link-square', 'trainplan/courseResource/tache/html/list.html', 'TrainPlan_CourseResource_Tache', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 6, 'f71119d17fb04b958a8c380ca8959fc2', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2,f71119d17fb04b958a8c380ca8959fc2,b9cfef837d6942b581096d4f1e8a6778', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('13d9c2be31804c7c86b1932933e8c985', '新增', 3, 'fa fa-th', NULL, 'TrainPlan_CourseResource_Tache_Add', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'b9cfef837d6942b581096d4f1e8a6778', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2,f71119d17fb04b958a8c380ca8959fc2,b9cfef837d6942b581096d4f1e8a6778,b9cfef837d6942b581096d4f1e8a6778,13d9c2be31804c7c86b1932933e8c985', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('7e0017afaeac48e4b46cf8efda200da0', '修改', 3, 'fa fa-th', NULL, 'TrainPlan_CourseResource_Tache_Update', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'b9cfef837d6942b581096d4f1e8a6778', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2,f71119d17fb04b958a8c380ca8959fc2,b9cfef837d6942b581096d4f1e8a6778,b9cfef837d6942b581096d4f1e8a6778,7e0017afaeac48e4b46cf8efda200da0', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('ac61f605d16f44e58e64f8d2f7d23dff', '导出', 3, 'fa fa-th', NULL, 'TrainPlan_CourseResource_Tache_Export', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'b9cfef837d6942b581096d4f1e8a6778', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2,f71119d17fb04b958a8c380ca8959fc2,b9cfef837d6942b581096d4f1e8a6778,b9cfef837d6942b581096d4f1e8a6778,ac61f605d16f44e58e64f8d2f7d23dff', 6, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('b01a672269c045b88ef83e79cc328e93', '删除', 3, 'fa fa-th', NULL, 'TrainPlan_CourseResource_Tache_Delete', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'b9cfef837d6942b581096d4f1e8a6778', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2,f71119d17fb04b958a8c380ca8959fc2,b9cfef837d6942b581096d4f1e8a6778,b9cfef837d6942b581096d4f1e8a6778,b01a672269c045b88ef83e79cc328e93', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('d7617905d0484840952eeee7394747f5', '启用', 3, 'fa fa-th', NULL, 'TrainPlan_CourseResource_Tache_Enable', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'b9cfef837d6942b581096d4f1e8a6778', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2,f71119d17fb04b958a8c380ca8959fc2,b9cfef837d6942b581096d4f1e8a6778,b9cfef837d6942b581096d4f1e8a6778,d7617905d0484840952eeee7394747f5', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('f97bbd706408422fb0e5829b7d2218be', '禁用', 3, 'fa fa-th', NULL, 'TrainPlan_CourseResource_Tache_Disable', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'b9cfef837d6942b581096d4f1e8a6778', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2,f71119d17fb04b958a8c380ca8959fc2,b9cfef837d6942b581096d4f1e8a6778,b9cfef837d6942b581096d4f1e8a6778,f97bbd706408422fb0e5829b7d2218be', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('da03aede41c14040bc31cfdb18ba9a8b', '开课单位', 2, 'fa fa-google', 'trainplan/courseResource/courseDepartment/html/list.html', 'TrainPlan_CourseResource_Department', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, 'f71119d17fb04b958a8c380ca8959fc2', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2,f71119d17fb04b958a8c380ca8959fc2,da03aede41c14040bc31cfdb18ba9a8b', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('0dd709f49cf140faa1a140ef5fa066cb', '取消', 3, 'fa fa-th', NULL, 'TrainPlan_CourseResource_Department_CancelClassDept', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'da03aede41c14040bc31cfdb18ba9a8b', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2,f71119d17fb04b958a8c380ca8959fc2,da03aede41c14040bc31cfdb18ba9a8b,da03aede41c14040bc31cfdb18ba9a8b,0dd709f49cf140faa1a140ef5fa066cb', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('bd860ff869df466ea6df9e604c3a9225', '设为开课单位', 3, 'fa fa-th', NULL, 'TrainPlan_CourseResource_Department_SetClassDept', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'da03aede41c14040bc31cfdb18ba9a8b', '0,3cab2af0932c47ebb7fe3ee1da61b904,3cab2af0932c47ebb7fe3ee1da61b904,f71119d17fb04b958a8c380ca8959fc2,f71119d17fb04b958a8c380ca8959fc2,da03aede41c14040bc31cfdb18ba9a8b,da03aede41c14040bc31cfdb18ba9a8b,bd860ff869df466ea6df9e604c3a9225', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);

commit;

/*
 培养方案--删除教务系统管理员角色原有的菜单权限
*/ 
delete from TSYS_ROLE_MENU_PERMISSION WHERE ROLE_ID = '2' AND MENU_ID IN (select MENU_ID from tsys_menu where parent_id_list like '%,3cab2af0932c47ebb7fe3ee1da61b904%');
commit;

/*
 培养方案--给教务系统管理员角色授予培养方案菜单权限
*/ 
insert into TSYS_ROLE_MENU_PERMISSION  select SYS_GUID(),'2',MENU_ID from tsys_menu where parent_id_list like '%,3cab2af0932c47ebb7fe3ee1da61b904%';
commit;
