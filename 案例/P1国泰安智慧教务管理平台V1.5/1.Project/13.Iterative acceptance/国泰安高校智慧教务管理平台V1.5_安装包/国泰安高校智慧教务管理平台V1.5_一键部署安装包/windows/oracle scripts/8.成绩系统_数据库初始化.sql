/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2017/12/25 11:45:43                          */
/*==============================================================*/

declare
      num  number;
begin
    select count(1) into num from user_tables where table_name = upper('TSCOR_COURSE_SCORE_SET') ;
    if num > 0 then
        execute immediate 'drop table TSCOR_COURSE_SCORE_SET' ;
    end if;  

    select count(1) into num from user_tables where table_name = upper('TSCOR_SCORE_REGIMEN') ;
    if num > 0 then
        execute immediate 'drop table TSCOR_SCORE_REGIMEN' ;
    end if;  

    select count(1) into num from user_tables where table_name = upper('TSCOR_SCORE_REGIMEN_DETAIL') ;
    if num > 0 then
        execute immediate 'drop table TSCOR_SCORE_REGIMEN_DETAIL' ;
    end if;  

    select count(1) into num from user_tables where table_name = upper('TSCOR_MAKE_UP_EXAM_AUDIT') ;
    if num > 0 then
        execute immediate 'drop table TSCOR_MAKE_UP_EXAM_AUDIT' ;
    end if;  
    
    select count(1) into num from user_tables where table_name = upper('TSCOR_ORIGINAL_SCORE') ;
    if num > 0 then
        execute immediate 'drop table TSCOR_ORIGINAL_SCORE' ;
    end if;  

    select count(1) into num from user_tables where table_name = upper('TSCOR_RELEASE_TIME') ;
    if num > 0 then
        execute immediate 'drop table TSCOR_RELEASE_TIME' ;
    end if;  
  
  select count(1) into num from user_tables where table_name = upper('TSCOR_SCORE_ENTRY_TIME') ;
    if num > 0 then
        execute immediate 'drop table TSCOR_SCORE_ENTRY_TIME' ;
    end if;  

    select count(1) into num from user_tables where table_name = upper('TSCOR_SCORE_LOG') ;
    if num > 0 then
        execute immediate 'drop table TSCOR_SCORE_LOG' ;
    end if;  

    select count(1) into num from user_tables where table_name = upper('TSCOR_SCORE_POINT') ;
    if num > 0 then
        execute immediate 'drop table TSCOR_SCORE_POINT' ;
    end if;  

    select count(1) into num from user_tables where table_name = upper('TSCOR_SCORE_POINT_DETAIL') ;
    if num > 0 then
        execute immediate 'drop table TSCOR_SCORE_POINT_DETAIL' ;
    end if;  
    
    select count(1) into num from user_tables where table_name = upper('TSCOR_SPECIAL_CASE') ;
    if num > 0 then
        execute immediate 'drop table TSCOR_SPECIAL_CASE' ;
    end if;  

    select count(1) into num from user_tables where table_name = upper('TSCOR_TACHE_SCORE_CONSTITUTE') ;
    if num > 0 then
        execute immediate 'drop table TSCOR_TACHE_SCORE_CONSTITUTE' ;
    end if;
  
  select count(1) into num from user_tables where table_name = upper('TSCOR_TACHE_SCORE_ENTER') ;
    if num > 0 then
        execute immediate 'drop table TSCOR_TACHE_SCORE_ENTER' ;
    end if;  

    select count(1) into num from user_tables where table_name = upper('TSCOR_VALIDITY_SCORE') ;
    if num > 0 then
        execute immediate 'drop table TSCOR_VALIDITY_SCORE' ;
    end if;
end;
/

/*==============================================================*/
/* Table: TSCOR_COURSE_SCORE_SET                               */
/*==============================================================*/
create table TSCOR_COURSE_SCORE_SET 
(
   COURSE_SCORE_SET_ID  NVARCHAR2(50)        not null,
   ACADEMIC_YEAR        INTEGER              not null,
   SEMESTER_CODE        NVARCHAR2(50)        not null,
   COURSE_ID            NVARCHAR2(50)        not null,
   CLASS_ID             NVARCHAR2(50),
   SCORE_REGIMEN_ID    NVARCHAR2(50),
   USUAL_RATIO       NUMBER(4,1),
   MIDTERM_RATIO        NUMBER(4,1),
   ENDTERM_RATIO        NUMBER(4,1),
   SKILL_RATIO          NUMBER(4,1),
   ONLY_ENTRY_TOTAL_SCORE INTEGER,
   ALLOW_MODIFY         INTEGER,
   ENTRY_USER_ID        NVARCHAR2(50),
   EXAM_BATCH_ID        NVARCHAR2(50),
   SCORE_TYPE           INTEGER             not null,
   constraint PK_TSCOR_COURSE_SCORE_SET primary key (COURSE_SCORE_SET_ID)
);

create index IX_TSCOR_COURSE_SCORE_SET on TSCOR_COURSE_SCORE_SET (ACADEMIC_YEAR, SEMESTER_CODE, COURSE_ID, CLASS_ID, SCORE_TYPE);
create index IX_TSCOR_COURSE_YEAR_CODE on TSCOR_COURSE_SCORE_SET (ACADEMIC_YEAR, SEMESTER_CODE);

/*==============================================================*/
/* Table: TSCOR_SCORE_REGIMEN                                 */
/*==============================================================*/
create table TSCOR_SCORE_REGIMEN 
(
   SCORE_REGIMEN_ID    NVARCHAR2(50)        not null,
   SCORE_REGIMEN_NAME  NVARCHAR2(50)        not null,
   IS_HIERARCHICAL      INTEGER             not null,
   HIGHEST_SCORE        NUMBER(4,1),
   LOWEST_SCORE         NUMBER(4,1),
   IS_SYSTEM            INTEGER             not null,
   constraint PK_TSCOR_SCORE_REGIMEN primary key (SCORE_REGIMEN_ID)
);

/*==============================================================*/
/* Table: TSCOR_SCORE_REGIMEN_DETAIL                          */
/*==============================================================*/
create table TSCOR_SCORE_REGIMEN_DETAIL 
(
   SCORE_REGIMEN_DETAIL_ID NVARCHAR2(50)        not null,
   SCORE_REGIMEN_ID    NVARCHAR2(50)            not null,
   CN_NAME              NVARCHAR2(50)           not null,
   EN_NAME              NVARCHAR2(50),
   SCORE_BEGIN          NUMBER(4,1)             not null,
   SCORE_END            NUMBER(4,1)             not null,
   PERCENTAGE_SCORE     NUMBER(4,1)             not null,
   constraint PK_TSCOR_SCORE_REGIMEN_DETAI primary key (SCORE_REGIMEN_DETAIL_ID)
);

/*==============================================================*/
/* Table: TSCOR_MAKE_UP_EXAM_AUDIT                             */
/*==============================================================*/
create table TSCOR_MAKE_UP_EXAM_AUDIT 
(
   MAKE_UP_EXAM_AUDIT_ID NVARCHAR2(50)        not null,
   RULES1               INTEGER            not null,
   RULES2               INTEGER            not null,
   RULES3               INTEGER            not null,
   RULES4               INTEGER            not null,
   SCORE1               NUMBER(4,1),
   SCORE2               NUMBER(4,1),
   SCORE3               NUMBER(4,1),
   SCORE4               NUMBER(4,1),
   constraint PK_TSCOR_MAKE_UP_EXAM_AUDIT primary key (MAKE_UP_EXAM_AUDIT_ID)
);

/*==============================================================*/
/* Table: TSCOR_ORIGINAL_SCORE                                 */
/*==============================================================*/
create table TSCOR_ORIGINAL_SCORE 
(
   ORIGINAL_SCORE_ID    NVARCHAR2(50)        not null,
   COURSE_SCORE_SET_ID  NVARCHAR2(50),
   ACADEMIC_YEAR        INTEGER,
   SEMESTER_CODE        NVARCHAR2(50),
   EXAM_BATCH_ID        NVARCHAR2(50),
   COURSE_ID            NVARCHAR2(50),
   STUDENT_ID           NVARCHAR2(50),
   SCORE_REGIMEN_ID    NVARCHAR2(50),
   USUAL_SCORE       NUMBER(4,1),
   MIDTERM_SCORE        NUMBER(4,1),
   ENDTERM_SCORE        NUMBER(4,1),
   SKILL_SCORE          NUMBER(4,1),
   SPECIAL_CASE_ID      NVARCHAR2(50),
   TOTAL_SCORE          NVARCHAR2(50),
   PERCENTAGE_SCORE     NUMBER(4,1),
   SCORE_TYPE           INTEGER,
   TACHE_SUBJECT        NVARCHAR2(50),
   REMARK               NVARCHAR2(50),
   AUDIT_STATUS         INTEGER,
   ENTRY_USER_ID        NVARCHAR2(50),
   ENTRY_TYPE           INTEGER,
   ENTRY_TIME           TIMESTAMP(6),
   AUDIT_USER_ID        NVARCHAR2(50),
   AUDIT_TIME           TIMESTAMP(6),
   STUDY_ACADEMIC_YEAR  INTEGER,
   STUDY_SEMESTER_CODE  NVARCHAR2(50),
   MODIFY_REASON        NVARCHAR2(100),
   ENTRY_MENU_NAME      NVARCHAR2(50),
   IS_MODIFY            INTEGER              default 0  not null,
   constraint PK_TSCOR_ORIGINAL_SCORE primary key (ORIGINAL_SCORE_ID)
);

create index IX_ORIGINAL_SCORE_STUDENT on TSCOR_ORIGINAL_SCORE (STUDY_ACADEMIC_YEAR, STUDY_SEMESTER_CODE, COURSE_ID, STUDENT_ID);
create index IX_ORIGINAL_SCORE_SET on TSCOR_ORIGINAL_SCORE (COURSE_SCORE_SET_ID);
create index IX_ORIGINAL_SCORE_STUDY on TSCOR_ORIGINAL_SCORE (STUDY_ACADEMIC_YEAR, STUDY_SEMESTER_CODE, COURSE_ID);
create index IX_ORIGINAL_SCORE_SCORE on TSCOR_ORIGINAL_SCORE (USUAL_SCORE, MIDTERM_SCORE, ENDTERM_SCORE, SKILL_SCORE, TOTAL_SCORE, SPECIAL_CASE_ID, REMARK, AUDIT_STATUS, ORIGINAL_SCORE_ID, PERCENTAGE_SCORE, SCORE_TYPE);
create index IX_ORIGINAL_SCORE_SCORE_TYPE on TSCOR_ORIGINAL_SCORE (ACADEMIC_YEAR, SEMESTER_CODE, COURSE_ID, STUDENT_ID, SCORE_TYPE);
create index IX_ORIGINAL_SCORE_YEAR_CODE on TSCOR_ORIGINAL_SCORE (ACADEMIC_YEAR, SEMESTER_CODE);

/*==============================================================*/
/* Table: TSCOR_RELEASE_TIME                                   */
/*==============================================================*/
create table TSCOR_RELEASE_TIME 
(
   RELEASE_TIME_ID      NVARCHAR2(50)        not null,
   ACADEMIC_YEAR        INTEGER              not null,
   SEMESTER_CODE        NVARCHAR2(50)        not null,
   RELEASE_STATUS       INTEGER              not null,
   OPERATE_TIME         TIMESTAMP(6)         not null,
   constraint PK_TSCOR_RELEASE_TIME primary key (RELEASE_TIME_ID)
);

create index IX_TSCOR_RELEASE_TIME on TSCOR_RELEASE_TIME (ACADEMIC_YEAR, SEMESTER_CODE);

/*==============================================================*/
/* Table: TSCOR_SCORE_ENTRY_TIME                               */
/*==============================================================*/
create table TSCOR_SCORE_ENTRY_TIME 
(
   SCORE_ENTRY_TIME_ID  NVARCHAR2(50)        not null,
   ACADEMIC_YEAR        INTEGER              not null,
   SEMESTER_CODE        NVARCHAR2(50)        not null,
   COURSE_ID            NVARCHAR2(50)        not null,
   IS_MARK_UP_EXAM      INTEGER              not null,
   BEGIN_TIME           TIMESTAMP(6)         not null,
   END_TIME             TIMESTAMP(6)         not null,
   constraint PK_TSCOR_SCORE_ENTRY_TIME primary key (SCORE_ENTRY_TIME_ID)
);

create index IX_TSCOR_SCORE_ENTRY_TIME on TSCOR_SCORE_ENTRY_TIME (ACADEMIC_YEAR, SEMESTER_CODE, COURSE_ID, IS_MARK_UP_EXAM);

/*==============================================================*/
/* Table: TSCOR_SCORE_LOG                                      */
/*==============================================================*/
create table TSCOR_SCORE_LOG 
(
   SCORE_LOG_ID         NVARCHAR2(50)        not null,
   ORIGINAL_SCORE_ID    NVARCHAR2(50),
   ACADEMIC_YEAR        INTEGER,
   SEMESTER_CODE        NVARCHAR2(50),
   COURSE_ID            NVARCHAR2(50),
   STUDENT_ID           NVARCHAR2(50),
   SCORE_REGIMEN_ID    NVARCHAR2(50),
   USUAL_SCORE       NUMBER(4,1),
   MIDTERM_SCORE        NUMBER(4,1),
   ENDTERM_SCORE        NUMBER(4,1),
   SKILL_SCORE          NUMBER(4,1),
   SPECIAL_CASE_ID      NVARCHAR2(50),
   TOTAL_SCORE          NVARCHAR2(50),
   MODIFIED_USUAL_SCORE NUMBER(4,1),
   MODIFIED_MIDTERM_SCORE NUMBER(4,1),
   MODIFIED_ENDTERM_SCORE NUMBER(4,1),
   MODIFIED_SKILL_SCORE NUMBER(4,1),
   MODIFIED_SPECIAL_CASE_ID NVARCHAR2(50),
   MODIFIED_TOTAL_SCORE NVARCHAR2(50),
   PERCENTAGE_SCORE     NUMBER(4,1),
   SCORE_TYPE           INTEGER,
   OPERATE_USER_ID      NVARCHAR2(50),
   OPERATE_TIME         TIMESTAMP(6),
   STUDY_ACADEMIC_YEAR  INTEGER,
   STUDY_SEMESTER_CODE  NVARCHAR2(50),
   ENTRY_MENU_NAME      NVARCHAR2(50),
   MODIFY_REASON        NVARCHAR2(100),
   OPERATE_TYPE         INTEGER              not null,
   constraint PK_TSCOR_SCORE_LOG primary key (SCORE_LOG_ID)
);

/*==============================================================*/
/* Table: TSCOR_SCORE_POINT                                    */
/*==============================================================*/
create table TSCOR_SCORE_POINT 
(
   SCORE_POINT_ID       NVARCHAR2(50)        not null,
   FIRST_SCORE_POINT_CALCULATE INTEGER       not null,
   MAKE_UP_EXAM_SCORE_POINT NUMBER(5,2),
   DELAY_EXAM_SCORE_POINT NUMBER(5,2),
   constraint PK_TSCOR_SCORE_POINT primary key (SCORE_POINT_ID)
);

/*==============================================================*/
/* Table: TSCOR_SCORE_POINT_DETAIL                        */
/*==============================================================*/
create table TSCOR_SCORE_POINT_DETAIL 
(
   SCORE_POINT_SECTION_DETAIL_ID NVARCHAR2(50)        not null,
   SCORE_REGIMEN_ID  NVARCHAR2(50)                   not null,
   SCORE_BEGIN          NUMBER(4,1)                  not null,
   SCORE_END            NUMBER(4,1)                  not null,
   SCORE_POINT          NUMBER(5,2)                  not null,
   SCORE_REGIMEN_DETAIL_ID NVARCHAR2(50),
   constraint PK_TSCOR_SCORE_POINT_SECTION_ primary key (SCORE_POINT_SECTION_DETAIL_ID)
);

/*==============================================================*/
/* Table: TSCOR_SPECIAL_CASE                                   */
/*==============================================================*/
create table TSCOR_SPECIAL_CASE 
(
   SPECIAL_CASE_ID      NVARCHAR2(50)        not null,
   NAME                 NVARCHAR2(50)        not null,
   TOTAL_SCORE          NUMBER(4,1)          not null,
   IS_ENABLED           INTEGER            not null,
   IS_SYSTEM            INTEGER            not null,
   constraint PK_TSCOR_SPECIAL_CASE primary key (SPECIAL_CASE_ID)
);

/*==============================================================*/
/* Table: TSCOR_TACHE_SCORE_CONSTITUTE                         */
/*==============================================================*/
create table TSCOR_TACHE_SCORE_CONSTITUTE 
(
   TACHE_SCORE_CONSTITUTE_ID NVARCHAR2(50)        not null,
   ACADEMIC_YEAR        INTEGER                 not null,
   SEMESTER_CODE        NVARCHAR2(50)           not null,
   COURSE_ID            NVARCHAR2(50)           not null,
   CLASS_ID             NVARCHAR2(50)           not null,
   SCORE_REGIMEN_ID    NVARCHAR2(50),
   ALLOW_MODIFY         INTEGER,
   constraint PK_TSCOR_TACHE_SCORE_CONSTITU primary key (TACHE_SCORE_CONSTITUTE_ID),
   constraint UK_TSCOR_TACHE_SCORE_CONSTITU unique (ACADEMIC_YEAR, SEMESTER_CODE, COURSE_ID, CLASS_ID)
);

/*==============================================================*/
/* Table: TSCOR_TACHE_SCORE_ENTER                              */
/*==============================================================*/
create table TSCOR_TACHE_SCORE_ENTER 
(
   TACHE_SCORE_ENTER_ID NVARCHAR2(50)        not null,
   ACADEMIC_YEAR        INTEGER              not null,
   SEMESTER_CODE        NVARCHAR2(50)        not null,
   GRADE                INTEGER              not null,
   MAJOR_ID             NVARCHAR2(50)        not null,
   COURSE_ID            NVARCHAR2(50)        not null,
   GROUP_NO             INTEGER              not null,
   ENTRY_USER_ID        NVARCHAR2(50)        ,
   constraint PK_TSCOR_TACHE_SCORE_ENTER primary key (TACHE_SCORE_ENTER_ID)
);

create index IX_TSCOR_TACHE_SCORE_ENTER on TSCOR_TACHE_SCORE_ENTER (ACADEMIC_YEAR, SEMESTER_CODE, GRADE, MAJOR_ID, COURSE_ID, GROUP_NO);

/*==============================================================*/
/* Table: TSCOR_VALIDITY_SCORE                                 */
/*==============================================================*/
create table TSCOR_VALIDITY_SCORE 
(
   VALIDITY_SCORE_ID    NVARCHAR2(50)        not null,
   ORIGINAL_SCORE_ID    NVARCHAR2(50)        not null,
   ACADEMIC_YEAR        INTEGER              not null,
   SEMESTER_CODE        NVARCHAR2(50)        not null,
   COURSE_ID            NVARCHAR2(50)        not null,
   STUDENT_ID           NVARCHAR2(50)        not null,
   SCORE_REGIMEN_ID    NVARCHAR2(50)         not null,
   USUAL_SCORE       NUMBER(4,1),
   MIDTERM_SCORE        NUMBER(4,1),
   ENDTERM_SCORE        NUMBER(4,1),
   SKILL_SCORE          NUMBER(4,1),
   SPECIAL_CASE_ID      NVARCHAR2(50),
   TOTAL_SCORE          NVARCHAR2(50)        not null,
   PERCENTAGE_SCORE     NUMBER(4,1)          not null,
   SCORE_TYPE           INTEGER              not null,
   TACHE_SUBJECT        NVARCHAR2(50),
   REMARK               NVARCHAR2(50),
   ENTRY_USER_ID        NVARCHAR2(50)        not null,
   ENTRY_TYPE           INTEGER              not null,
   ENTRY_TIME           TIMESTAMP(6)         not null,
   STUDY_ACADEMIC_YEAR  INTEGER              not null,
   STUDY_SEMESTER_CODE  NVARCHAR2(50)        not null,
   SCORE_POINT          NUMBER(5,2)          not null,
   IS_MEET_THE_MARK     INTEGER              not null,
   FINAL_TOTAL_SCORE          NVARCHAR2(50)  not null,
   FINAL_PERCENTAGE_SCORE     NUMBER(4,1)    not null,
   FINAL_SCORE_POINT          NUMBER(5,2)    not null,
   MARKUP_ORIGINAL_SCORE_ID   NVARCHAR2(50),
   AGO_FINAL_PERCENTAGE_SCORE     NUMBER(4,1),
   constraint PK_TSCOR_VALIDITY_SCORE primary key (VALIDITY_SCORE_ID),
   constraint UK_TSCOR_VALIDITY_SCORE unique (STUDY_ACADEMIC_YEAR, STUDY_SEMESTER_CODE, COURSE_ID, STUDENT_ID)
);
create index IX_TSCOR_VALIDITY_SCORE on TSCOR_VALIDITY_SCORE (ACADEMIC_YEAR, SEMESTER_CODE, COURSE_ID, STUDENT_ID, USUAL_SCORE, MIDTERM_SCORE, ENDTERM_SCORE, SKILL_SCORE, TOTAL_SCORE, PERCENTAGE_SCORE, SPECIAL_CASE_ID, SCORE_TYPE, FINAL_TOTAL_SCORE, FINAL_PERCENTAGE_SCORE, FINAL_SCORE_POINT);


/*==============================================================*/
/* �˵��ű���ʼ                               */
/*==============================================================*/
DELETE FROM TSYS_MENU WHERE PARENT_ID_LIST LIKE '%87fe81ec52ac4b8db65e0620f14415b7%';


DECLARE orderNo NUMBER;
BEGIN
SELECT MAX(ORDER_NO)+1 INTO orderNo FROM TSYS_MENU where PARENT_ID='0';
INSERT INTO "TSYS_MENU" VALUES ('87fe81ec52ac4b8db65e0620f14415b7', '�ɼ�����', 1, 'fa fa-line-chart', NULL, 'ScoreService', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 5, '0', '0,87fe81ec52ac4b8db65e0620f14415b7', orderNo, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
End;
/

INSERT INTO "TSYS_MENU" VALUES ('087298abbd45496fb370340387fea759', '�ɼ�����϶�', 1, 'fa fa-calendar-check-o', NULL, 'ScoreService_Audit', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, '87fe81ec52ac4b8db65e0620f14415b7', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,087298abbd45496fb370340387fea759', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('458398313a9645dab4427db998371557', '�ɼ����', 2, 'fa fa-check-square', 'score/score/html/scoreAuditList.html', 'ScoreService_Audit_Score', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, '087298abbd45496fb370340387fea759', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,087298abbd45496fb370340387fea759,087298abbd45496fb370340387fea759,458398313a9645dab4427db998371557', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('92d05816fdf045fd97247591d3f56da1', '���', 3, 'fa fa-th', NULL, 'ScoreService_Audit_Score_Audit', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '458398313a9645dab4427db998371557', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,087298abbd45496fb370340387fea759,087298abbd45496fb370340387fea759,458398313a9645dab4427db998371557,458398313a9645dab4427db998371557,92d05816fdf045fd97247591d3f56da1', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('605b132ae80243ef94ad8e02fb2a46a5', '�ɼ�¼��', 1, 'fa fa-desktop', NULL, 'ScoreService_Entry', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 6, '87fe81ec52ac4b8db65e0620f14415b7', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('54e7e5f871604db394748d1fefbee20b', '�����ɼ�¼��', 1, 'fa fa-chain-broken', NULL, 'ScoreService_Entry_MarkUp', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 3, '605b132ae80243ef94ad8e02fb2a46a5', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,54e7e5f871604db394748d1fefbee20b', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('08a08846190048048287b8c7a8879742', '�����ɼ��Ǽǲ�', 2, 'fa fa-wpforms', 'score/score/html/markUpExamScoreRegisterList.html', 'ScoreService_Entry_MarkUp_Reginster', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, '54e7e5f871604db394748d1fefbee20b', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,54e7e5f871604db394748d1fefbee20b,54e7e5f871604db394748d1fefbee20b,08a08846190048048287b8c7a8879742', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('337a00a559604efab566319529cd51f3', '��ӡ', 3, 'fa fa-th', NULL, 'ScoreService_Entry_MarkUp_Reginster_Print', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '08a08846190048048287b8c7a8879742', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,54e7e5f871604db394748d1fefbee20b,54e7e5f871604db394748d1fefbee20b,08a08846190048048287b8c7a8879742,08a08846190048048287b8c7a8879742,337a00a559604efab566319529cd51f3', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('41aec99bb950433b9e21e04c70cefc66', '�����ɼ�¼��������', 2, 'fa fa-street-view', 'score/score/html/markUpExamScoreEnterOperatorList.html', 'ScoreService_Entry_MarkUp_EntrySet', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, '54e7e5f871604db394748d1fefbee20b', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,54e7e5f871604db394748d1fefbee20b,54e7e5f871604db394748d1fefbee20b,41aec99bb950433b9e21e04c70cefc66', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('1bec74e0dd6a4639bb8daa8c4b37962a', '����¼����', 3, 'fa fa-th', NULL, 'ScoreService_Entry_MarkUp_EntrySet_Entry', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '41aec99bb950433b9e21e04c70cefc66', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,54e7e5f871604db394748d1fefbee20b,54e7e5f871604db394748d1fefbee20b,41aec99bb950433b9e21e04c70cefc66,41aec99bb950433b9e21e04c70cefc66,1bec74e0dd6a4639bb8daa8c4b37962a', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('fbd6d7d24bf44c9f9021dbfb5bb3f4e9', '����', 3, 'fa fa-th', NULL, 'ScoreService_Entry_MarkUp_EntrySet_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '41aec99bb950433b9e21e04c70cefc66', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,54e7e5f871604db394748d1fefbee20b,54e7e5f871604db394748d1fefbee20b,41aec99bb950433b9e21e04c70cefc66,41aec99bb950433b9e21e04c70cefc66,fbd6d7d24bf44c9f9021dbfb5bb3f4e9', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('ed2c2fa20ac7423a9c23f6483a88ad6c', '�����ɼ�¼��', 2, 'fa fa-keyboard-o', 'score/score/html/markUpExamScoreEnterList.html', 'ScoreService_Entry_MarkUp_ScoreEntry', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, '54e7e5f871604db394748d1fefbee20b', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,54e7e5f871604db394748d1fefbee20b,54e7e5f871604db394748d1fefbee20b,ed2c2fa20ac7423a9c23f6483a88ad6c', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('7511995db8da4584b8eab431c82e6d07', '����', 3, 'fa fa-th', NULL, 'ScoreService_Entry_MarkUp_ScoreEntry_Save', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'ed2c2fa20ac7423a9c23f6483a88ad6c', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,54e7e5f871604db394748d1fefbee20b,54e7e5f871604db394748d1fefbee20b,ed2c2fa20ac7423a9c23f6483a88ad6c,ed2c2fa20ac7423a9c23f6483a88ad6c,7511995db8da4584b8eab431c82e6d07', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('af38d7f547214e42804f3e38055a78f6', '����', 3, 'fa fa-th', NULL, 'ScoreService_Entry_MarkUp_ScoreEntry_Submit', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'ed2c2fa20ac7423a9c23f6483a88ad6c', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,54e7e5f871604db394748d1fefbee20b,54e7e5f871604db394748d1fefbee20b,ed2c2fa20ac7423a9c23f6483a88ad6c,ed2c2fa20ac7423a9c23f6483a88ad6c,af38d7f547214e42804f3e38055a78f6', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('57095ba9d6134a0789e6b00684c34731', '�ɼ���¼', 2, 'fa fa-random', 'score/score/html/scoreReentryList.html', 'ScoreService_Entry_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, '605b132ae80243ef94ad8e02fb2a46a5', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,57095ba9d6134a0789e6b00684c34731', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('2a78b90b0f2c4a9fb75c91b882b3cabe', '����', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Add_Submit', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '57095ba9d6134a0789e6b00684c34731', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,57095ba9d6134a0789e6b00684c34731,57095ba9d6134a0789e6b00684c34731,2a78b90b0f2c4a9fb75c91b882b3cabe', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('452f36501dc847f4b932b5a7427cc4e1', '����', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Add_Save', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '57095ba9d6134a0789e6b00684c34731', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,57095ba9d6134a0789e6b00684c34731,57095ba9d6134a0789e6b00684c34731,452f36501dc847f4b932b5a7427cc4e1', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('5a5a36bb79ad47338a77f25dd19606eb', '���ۿγ̳ɼ�¼��', 1, 'fa fa-telegram', NULL, 'ScoreService_Entry_Theroy', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 4, '605b132ae80243ef94ad8e02fb2a46a5', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,5a5a36bb79ad47338a77f25dd19606eb', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('5b84d576b31e4b0c93f3cca62f6fc911', '�γ̳ɼ�¼��', 2, 'fa fa-keyboard-o', 'score/score/html/courseScoreEnterList.html', 'ScoreService_Entry_Theroy_ScoreEntry', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 3, '5a5a36bb79ad47338a77f25dd19606eb', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,5a5a36bb79ad47338a77f25dd19606eb,5a5a36bb79ad47338a77f25dd19606eb,5b84d576b31e4b0c93f3cca62f6fc911', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('0d481e1024a94623a1c6398aa69cd02c', '����', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Theroy_ScoreEntry_Save', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '5b84d576b31e4b0c93f3cca62f6fc911', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,5a5a36bb79ad47338a77f25dd19606eb,5a5a36bb79ad47338a77f25dd19606eb,5b84d576b31e4b0c93f3cca62f6fc911,5b84d576b31e4b0c93f3cca62f6fc911,0d481e1024a94623a1c6398aa69cd02c', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('1a2807b2112942a4951b22f06f0e2653', '����', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Theroy_ScoreEntry_Submit', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '5b84d576b31e4b0c93f3cca62f6fc911', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,5a5a36bb79ad47338a77f25dd19606eb,5a5a36bb79ad47338a77f25dd19606eb,5b84d576b31e4b0c93f3cca62f6fc911,5b84d576b31e4b0c93f3cca62f6fc911,1a2807b2112942a4951b22f06f0e2653', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('426103036ba249e486a6fc6ff4ffec62', '���óɼ�����', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Theroy_ScoreEntry_ScoreSet', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '5b84d576b31e4b0c93f3cca62f6fc911', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,5a5a36bb79ad47338a77f25dd19606eb,5a5a36bb79ad47338a77f25dd19606eb,5b84d576b31e4b0c93f3cca62f6fc911,5b84d576b31e4b0c93f3cca62f6fc911,426103036ba249e486a6fc6ff4ffec62', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('7de51f4b08eb4a54a829b959ff6a936a', '�γ̳ɼ��Ǽǲ�', 2, 'fa fa-file-text-o', 'score/score/html/courseScoreRegisterList.html', 'ScoreService_Entry_Theroy_Register', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, '5a5a36bb79ad47338a77f25dd19606eb', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,5a5a36bb79ad47338a77f25dd19606eb,5a5a36bb79ad47338a77f25dd19606eb,7de51f4b08eb4a54a829b959ff6a936a', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('250cee8a0f1b435294b6b7f4bc2abed8', '��ӡ', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Theroy_Register_Print', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '7de51f4b08eb4a54a829b959ff6a936a', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,5a5a36bb79ad47338a77f25dd19606eb,5a5a36bb79ad47338a77f25dd19606eb,7de51f4b08eb4a54a829b959ff6a936a,7de51f4b08eb4a54a829b959ff6a936a,250cee8a0f1b435294b6b7f4bc2abed8', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('c72a944a8e214018b196a12af803add7', '�γ̳ɼ���������', 2, 'fa fa-cogs', 'score/score/html/courseScoreConstitutionList.html', 'ScoreService_Entry_Theroy_ConstSet', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, '5a5a36bb79ad47338a77f25dd19606eb', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,5a5a36bb79ad47338a77f25dd19606eb,5a5a36bb79ad47338a77f25dd19606eb,c72a944a8e214018b196a12af803add7', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('554a305b2b414e3391edb22b0000b81b', '�����Ƿ���޸Ĺ���', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Theroy_ConstSet_Modify', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'c72a944a8e214018b196a12af803add7', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,5a5a36bb79ad47338a77f25dd19606eb,5a5a36bb79ad47338a77f25dd19606eb,c72a944a8e214018b196a12af803add7,c72a944a8e214018b196a12af803add7,554a305b2b414e3391edb22b0000b81b', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('6a8c9a4bcdbb4d5683951a6413a14351', '����¼����', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Theroy_ConstSet_Seting', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'c72a944a8e214018b196a12af803add7', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,5a5a36bb79ad47338a77f25dd19606eb,5a5a36bb79ad47338a77f25dd19606eb,c72a944a8e214018b196a12af803add7,c72a944a8e214018b196a12af803add7,6a8c9a4bcdbb4d5683951a6413a14351', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('dbf2693b0ba5404a871aae52727016af', '�γ̳ɼ�¼��������', 2, 'fa fa-street-view', 'score/score/html/courseScoreEnterOperatorList.html', 'ScoreService_Entry_Theroy_EntrySet', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, '5a5a36bb79ad47338a77f25dd19606eb', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,5a5a36bb79ad47338a77f25dd19606eb,5a5a36bb79ad47338a77f25dd19606eb,dbf2693b0ba5404a871aae52727016af', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('20692b4aaaa448c4ac5835e24fbf2726', '����¼����', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Theroy_EntrySet_Seting', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'dbf2693b0ba5404a871aae52727016af', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,5a5a36bb79ad47338a77f25dd19606eb,5a5a36bb79ad47338a77f25dd19606eb,dbf2693b0ba5404a871aae52727016af,dbf2693b0ba5404a871aae52727016af,20692b4aaaa448c4ac5835e24fbf2726', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('9e9bbfbb1a3a419c8b91eded4222aa22', '����', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Theroy_EntrySet_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'dbf2693b0ba5404a871aae52727016af', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,5a5a36bb79ad47338a77f25dd19606eb,5a5a36bb79ad47338a77f25dd19606eb,dbf2693b0ba5404a871aae52727016af,dbf2693b0ba5404a871aae52727016af,9e9bbfbb1a3a419c8b91eded4222aa22', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('6ba5671b7fe6497aa5d5a275b79fdff1', '�ɼ��޸�', 2, 'fa fa-pencil-square-o', 'score/score/html/scoreModifyList.html', 'ScoreService_Entry_Update', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, '605b132ae80243ef94ad8e02fb2a46a5', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,6ba5671b7fe6497aa5d5a275b79fdff1', 6, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('1ed3f16588744922b10fe158406dcf4a', '�޸�', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Update_Update', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '6ba5671b7fe6497aa5d5a275b79fdff1', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,6ba5671b7fe6497aa5d5a275b79fdff1,6ba5671b7fe6497aa5d5a275b79fdff1,1ed3f16588744922b10fe158406dcf4a', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('8da96aad92c74b04aceb93996b74188c', '�鿴', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Update_Detail', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '6ba5671b7fe6497aa5d5a275b79fdff1', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,6ba5671b7fe6497aa5d5a275b79fdff1,6ba5671b7fe6497aa5d5a275b79fdff1,8da96aad92c74b04aceb93996b74188c', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('ee0bcf1752cc4ebda295e263c76146f2', 'ʵ�����ڳɼ�¼��', 1, 'fa fa-bookmark-o', NULL, 'ScoreService_Entry_Tache', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 4, '605b132ae80243ef94ad8e02fb2a46a5', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,ee0bcf1752cc4ebda295e263c76146f2', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('773178f46a85469ebedf5d1ffd0e0fe9', '���ڳɼ�¼��������', 2, 'fa fa-street-view', 'score/score/html/tacheScoreEnterOperatorList.html', 'ScoreService_Entry_Tache_EntrySet', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, 'ee0bcf1752cc4ebda295e263c76146f2', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,ee0bcf1752cc4ebda295e263c76146f2,ee0bcf1752cc4ebda295e263c76146f2,773178f46a85469ebedf5d1ffd0e0fe9', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('5ee5488705304023a9eb28b142b8527c', '����¼����', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Tache_EntrySet_SetEntry', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '773178f46a85469ebedf5d1ffd0e0fe9', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,ee0bcf1752cc4ebda295e263c76146f2,ee0bcf1752cc4ebda295e263c76146f2,773178f46a85469ebedf5d1ffd0e0fe9,773178f46a85469ebedf5d1ffd0e0fe9,5ee5488705304023a9eb28b142b8527c', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('a2b79717e83542d38ef7319af4773463', '����', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Tache_EntrySet_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '773178f46a85469ebedf5d1ffd0e0fe9', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,ee0bcf1752cc4ebda295e263c76146f2,ee0bcf1752cc4ebda295e263c76146f2,773178f46a85469ebedf5d1ffd0e0fe9,773178f46a85469ebedf5d1ffd0e0fe9,a2b79717e83542d38ef7319af4773463', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('b68eccd6572047409038fba9df48a6bb', '���ڳɼ��Ǽǲ�', 2, 'fa fa-wpforms', 'score/score/html/tacheScoreRegisterList.html', 'ScoreService_Entry_Tache_Register', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, 'ee0bcf1752cc4ebda295e263c76146f2', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,ee0bcf1752cc4ebda295e263c76146f2,ee0bcf1752cc4ebda295e263c76146f2,b68eccd6572047409038fba9df48a6bb', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('f3ec92b987a64355bac2ef476cdca645', '��ӡ', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Tache_Register_Print', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'b68eccd6572047409038fba9df48a6bb', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,ee0bcf1752cc4ebda295e263c76146f2,ee0bcf1752cc4ebda295e263c76146f2,b68eccd6572047409038fba9df48a6bb,b68eccd6572047409038fba9df48a6bb,f3ec92b987a64355bac2ef476cdca645', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('b980571947ba4917841333be61761554', '���ڳɼ�¼��', 2, 'fa fa-keyboard-o', 'score/score/html/tacheScoreEnterList.html', 'ScoreService_Entry_Tache_ScoreEntry', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 3, 'ee0bcf1752cc4ebda295e263c76146f2', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,ee0bcf1752cc4ebda295e263c76146f2,ee0bcf1752cc4ebda295e263c76146f2,b980571947ba4917841333be61761554', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('20225862bb5f478f80ed5f3b6e38dacd', '����', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Tache_ScoreEntry_Submit', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'b980571947ba4917841333be61761554', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,ee0bcf1752cc4ebda295e263c76146f2,ee0bcf1752cc4ebda295e263c76146f2,b980571947ba4917841333be61761554,b980571947ba4917841333be61761554,20225862bb5f478f80ed5f3b6e38dacd', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('bfe4969ca2f345d699b45469b99175a6', '����', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Tache_ScoreEntry_Save', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'b980571947ba4917841333be61761554', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,ee0bcf1752cc4ebda295e263c76146f2,ee0bcf1752cc4ebda295e263c76146f2,b980571947ba4917841333be61761554,b980571947ba4917841333be61761554,bfe4969ca2f345d699b45469b99175a6', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('e40f7375ea494ed0b53e8c1dbdca4352', '���óɼ�����', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Tache_ScoreEntry_regimenSet', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'b980571947ba4917841333be61761554', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,ee0bcf1752cc4ebda295e263c76146f2,ee0bcf1752cc4ebda295e263c76146f2,b980571947ba4917841333be61761554,b980571947ba4917841333be61761554,e40f7375ea494ed0b53e8c1dbdca4352', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('bae4cbb708a6427a9867430de5fa6c71', '���ڳɼ���������', 2, 'fa fa-cogs', 'score/score/html/tacheScoreRegimenList.html', 'ScoreService_Entry_Tache_RegimenSet', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, 'ee0bcf1752cc4ebda295e263c76146f2', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,ee0bcf1752cc4ebda295e263c76146f2,ee0bcf1752cc4ebda295e263c76146f2,bae4cbb708a6427a9867430de5fa6c71', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('49276c38e02f4131bc275052bb825209', '���÷����Ƿ���޸�', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Tache_RegimenSet_Update', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'bae4cbb708a6427a9867430de5fa6c71', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,ee0bcf1752cc4ebda295e263c76146f2,ee0bcf1752cc4ebda295e263c76146f2,bae4cbb708a6427a9867430de5fa6c71,bae4cbb708a6427a9867430de5fa6c71,49276c38e02f4131bc275052bb825209', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('b50459d8d5f94bd6a4b2dbbaf5235dc5', '���÷���', 3, 'fa fa-th', NULL, 'ScoreService_Entry_Tache_RegimenSet_Set', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'bae4cbb708a6427a9867430de5fa6c71', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,605b132ae80243ef94ad8e02fb2a46a5,605b132ae80243ef94ad8e02fb2a46a5,ee0bcf1752cc4ebda295e263c76146f2,ee0bcf1752cc4ebda295e263c76146f2,bae4cbb708a6427a9867430de5fa6c71,bae4cbb708a6427a9867430de5fa6c71,b50459d8d5f94bd6a4b2dbbaf5235dc5', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('7d680fdbe6c74f4d8df11b4febd46797', '�ɼ�����', 1, 'fa fa-hand-pointer-o', NULL, 'ScoreService_Release', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, '87fe81ec52ac4b8db65e0620f14415b7', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,7d680fdbe6c74f4d8df11b4febd46797', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('cc0e31bab32a4a96b34de732cb38e1a5', '�ɼ�����', 2, 'fa fa-gavel', 'score/score/html/scoreReleaseList.html', 'ScoreService_Release_Time', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, '7d680fdbe6c74f4d8df11b4febd46797', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,7d680fdbe6c74f4d8df11b4febd46797,7d680fdbe6c74f4d8df11b4febd46797,cc0e31bab32a4a96b34de732cb38e1a5', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('2241d1d467c24e3dad5860e9bfd18e05', '�ɼ�����-ȡ������', 3, 'fa fa-th', NULL, 'ScoreService_Release_Time_ReleaseStatus', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'cc0e31bab32a4a96b34de732cb38e1a5', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,7d680fdbe6c74f4d8df11b4febd46797,7d680fdbe6c74f4d8df11b4febd46797,cc0e31bab32a4a96b34de732cb38e1a5,cc0e31bab32a4a96b34de732cb38e1a5,2241d1d467c24e3dad5860e9bfd18e05', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('c6573ab2826e43b182c10b33dd2ba3fe', '�ɼ���ѯ', 1, 'fa fa-tasks', NULL, 'ScoreService_Query', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 2, '87fe81ec52ac4b8db65e0620f14415b7', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,c6573ab2826e43b182c10b33dd2ba3fe', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('217007f45da94cec8fbe03ac9e9435c2', 'ѧ���ɼ�����', 2, 'fa fa-file-text-o', 'score/score/html/studentScoreArchives.html', 'ScoreService_Query_ScoreRecord', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, 'c6573ab2826e43b182c10b33dd2ba3fe', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,c6573ab2826e43b182c10b33dd2ba3fe,c6573ab2826e43b182c10b33dd2ba3fe,217007f45da94cec8fbe03ac9e9435c2', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('8cf07aa40faf4e2798dd268cd47bf534', '��ӡ', 3, 'fa fa-th', NULL, 'ScoreService_Query_ScoreRecord_Print', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '217007f45da94cec8fbe03ac9e9435c2', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,c6573ab2826e43b182c10b33dd2ba3fe,c6573ab2826e43b182c10b33dd2ba3fe,217007f45da94cec8fbe03ac9e9435c2,217007f45da94cec8fbe03ac9e9435c2,8cf07aa40faf4e2798dd268cd47bf534', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('fcf55932510f4187a93fad7b1a4750da', 'ѧ���ɼ���ѯ', 2, 'fa fa-list-ul', 'score/score/html/studentScoreQuery.html', 'ScoreService_Query_StudentScore', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, 'c6573ab2826e43b182c10b33dd2ba3fe', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,c6573ab2826e43b182c10b33dd2ba3fe,c6573ab2826e43b182c10b33dd2ba3fe,fcf55932510f4187a93fad7b1a4750da', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('9e278db1d1dc437a9c0bd3448e3833b3', '����', 3, 'fa fa-th', NULL, 'ScoreService_Query_StudentScore_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'fcf55932510f4187a93fad7b1a4750da', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,c6573ab2826e43b182c10b33dd2ba3fe,c6573ab2826e43b182c10b33dd2ba3fe,fcf55932510f4187a93fad7b1a4750da,fcf55932510f4187a93fad7b1a4750da,9e278db1d1dc437a9c0bd3448e3833b3', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('fa266b39b3e44df9b4a176714a5cdf8e', '��������', 1, 'fa fa-cogs', NULL, 'ScoreService_Set', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 5, '87fe81ec52ac4b8db65e0620f14415b7', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,fa266b39b3e44df9b4a176714a5cdf8e', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('41f7b5de401f4fcfb484e6ab9c4a067c', '�ɼ�¼��ʱ������', 2, 'fa fa-calendar', 'score/paramSet/html/scoreEnterTimeSetlist.html', 'ScoreService_Set_EntryTime', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 1, 'fa266b39b3e44df9b4a176714a5cdf8e', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,fa266b39b3e44df9b4a176714a5cdf8e,fa266b39b3e44df9b4a176714a5cdf8e,41f7b5de401f4fcfb484e6ab9c4a067c', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
INSERT INTO "TSYS_MENU" VALUES ('8549a1dc80974aabbfde14ec14eab332', '����', 3, 'fa fa-th', NULL, 'ScoreService_Set_EntryTime_Set', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, '41f7b5de401f4fcfb484e6ab9c4a067c', '0,87fe81ec52ac4b8db65e0620f14415b7,87fe81ec52ac4b8db65e0620f14415b7,fa266b39b3e44df9b4a176714a5cdf8e,fa266b39b3e44df9b4a176714a5cdf8e,41f7b5de401f4fcfb484e6ab9c4a067c,41f7b5de401f4fcfb484e6ab9c4a067c,8549a1dc80974aabbfde14ec14eab332', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);
commit;


/*==============================================================*/
/* �˵��ű�����                               */
/*==============================================================*/

/*==============================================================*/
/* �������ó�ʼ����ʼ                              */
/*==============================================================*/

delete from TSCOR_SCORE_REGIMEN;
delete from TSCOR_SCORE_REGIMEN_DETAIL;
delete from TSCOR_SCORE_POINT;
delete from TSCOR_SCORE_POINT_DETAIL;
delete from TSCOR_SPECIAL_CASE;
delete from TSCOR_MAKE_UP_EXAM_AUDIT;
-- ���Ʊ�
INSERT INTO TSCOR_SCORE_REGIMEN VALUES ('0d81581933484834b7196de21c060c95','�ٷ���',0,100.0,60.0,1);
INSERT INTO TSCOR_SCORE_REGIMEN VALUES ('a19c4dad25214500ab3097ec6cf5380b','�弶��',1,null,null,1);
INSERT INTO TSCOR_SCORE_REGIMEN VALUES ('9582d8022e0f42d291c0180cf11746c2','������',1,null,null,1);
-- ����������ϸ��
INSERT INTO TSCOR_SCORE_REGIMEN_DETAIL VALUES ('79c923d5645e41d7a8281de0ec928ddf','a19c4dad25214500ab3097ec6cf5380b','����','excellence',100.0,90.0,95.0);
INSERT INTO TSCOR_SCORE_REGIMEN_DETAIL VALUES ('17f76796a77e4f53be739254278de13d','a19c4dad25214500ab3097ec6cf5380b','����','nicer',90.0,80.0,85.0);
INSERT INTO TSCOR_SCORE_REGIMEN_DETAIL VALUES ('95c8faa713b1452da3ea058349099b3b','a19c4dad25214500ab3097ec6cf5380b','�е�','middling',80.0,70.0,75.0);
INSERT INTO TSCOR_SCORE_REGIMEN_DETAIL VALUES ('8a48d686dca844229bd6fdbec3d439c2','a19c4dad25214500ab3097ec6cf5380b','����','pass',70.0,60.0,65.0);
INSERT INTO TSCOR_SCORE_REGIMEN_DETAIL VALUES ('9e39206464154a1397580a9c54b24e8c','a19c4dad25214500ab3097ec6cf5380b','������','failure',60.0,0.0,55.0);
INSERT INTO TSCOR_SCORE_REGIMEN_DETAIL VALUES ('6bbb95f4eb6b418aa2b8fb1acbfa1965','9582d8022e0f42d291c0180cf11746c2','����','pass',100.0,60.0,65.0);
INSERT INTO TSCOR_SCORE_REGIMEN_DETAIL VALUES ('c4c6697595c04502b93f931fa0a2f98f','9582d8022e0f42d291c0180cf11746c2','������','failure',60.0,0.0,55.0);
-- �����
INSERT INTO TSCOR_SCORE_POINT (SCORE_POINT_ID, FIRST_SCORE_POINT_CALCULATE, MAKE_UP_EXAM_SCORE_POINT, DELAY_EXAM_SCORE_POINT) VALUES ('6d67d6a6221549a1ab7d824f7b2b40f1', '0', NULL, NULL);
-- ���ް���ʽ���㣬�����������󲹿������޼������
--INSERT INTO TSCOR_SCORE_POINT VALUES ('2194b6c08b984924961710d826232beb','0',5.00,5.00);-- ���ް���ʽ���㣬�����������󲹿�������5.00
--INSERT INTO TSCOR_SCORE_POINT VALUES ('9b0710611a7f478083f2f2a13939d875','1',null,null);-- ���ް��ֶμ��㣬�����������󲹿������޼������

-- ����ֶ���ϸ
-- �ٷ��Ƽ���
INSERT INTO TSCOR_SCORE_POINT_DETAIL VALUES ('b999c52b441a4cc1a089e2a8dd983e32','0d81581933484834b7196de21c060c95',100.0,60.0,5.00,NULL);
INSERT INTO TSCOR_SCORE_POINT_DETAIL VALUES ('1bab4877fea341ff81b76b062674e1b0','0d81581933484834b7196de21c060c95',60.0,0.0,5.00,NULL); 
-- �弶�Ƽ���
INSERT INTO TSCOR_SCORE_POINT_DETAIL VALUES ('8bb2329319dd4c6aae764ddc95120d98','a19c4dad25214500ab3097ec6cf5380b',100.0,90.0,5.00,'79c923d5645e41d7a8281de0ec928ddf');
INSERT INTO TSCOR_SCORE_POINT_DETAIL VALUES ('d509feff330f446e944e21dc9bb8ec5e','a19c4dad25214500ab3097ec6cf5380b',90.0,80.0,5.00,'17f76796a77e4f53be739254278de13d'); 
INSERT INTO TSCOR_SCORE_POINT_DETAIL VALUES ('b590462fe00e47c48f20b4de13815c41','a19c4dad25214500ab3097ec6cf5380b',80.0,70.0,5.00,'95c8faa713b1452da3ea058349099b3b');
INSERT INTO TSCOR_SCORE_POINT_DETAIL VALUES ('b283c14e1cd547728759db90af997185','a19c4dad25214500ab3097ec6cf5380b',70.0,60.0,5.00,'8a48d686dca844229bd6fdbec3d439c2'); 
INSERT INTO TSCOR_SCORE_POINT_DETAIL VALUES ('dbf4659dc4694a0c91f96d8c92cb3091','a19c4dad25214500ab3097ec6cf5380b',60.0,0.00,5.00,'9e39206464154a1397580a9c54b24e8c');
-- �����Ƽ���
INSERT INTO TSCOR_SCORE_POINT_DETAIL VALUES ('ea18c4c38b78438799edab0b27bc9441','9582d8022e0f42d291c0180cf11746c2',100.0,60.0,5.00,'6bbb95f4eb6b418aa2b8fb1acbfa1965'); 
INSERT INTO TSCOR_SCORE_POINT_DETAIL VALUES ('92c18b558a7447d9addb31bc71b56f07','9582d8022e0f42d291c0180cf11746c2',60.0,0.00,5.00,'c4c6697595c04502b93f931fa0a2f98f');

-- ���������
INSERT INTO TSCOR_SPECIAL_CASE VALUES ('abae6bf54fd94e59860fe2add396c10a','���',0.0,1,1);
INSERT INTO TSCOR_SPECIAL_CASE VALUES ('2e6b2ccf5b2f4ff189ff9d87a5d69db3','ȱ��',0.0,1,1);
INSERT INTO TSCOR_SPECIAL_CASE VALUES ('3352311d91bf44f6be0395e0a807b7ec','����',0.0,1,1);

-- �����ɼ���˷�����
INSERT INTO TSCOR_MAKE_UP_EXAM_AUDIT VALUES ('a72558a7bf284ac49221eb4d4fc6f477',1,2,4,2,66.0,66.0,66.0,66.0);
/*==============================================================*/
/* �������ó�ʼ������                               */
/*==============================================================*/


/* VIEW: ���еĳɼ���ͼ   */
/*==============================================================*/


CREATE OR REPLACE FORCE VIEW "VSCOR_APPROVAL_DETAILLIST" ("ORIGINAL_SCORE_ID", "COURSE_SCORE_SET_ID", "ACADEMIC_YEAR", "SEMESTER_CODE", "EXAM_BATCH_ID", "COURSE_ID", "STUDENT_ID", "SCORE_REGIMEN_ID", "USUAL_SCORE", "MIDTERM_SCORE", "ENDTERM_SCORE", "SKILL_SCORE", "SPECIAL_CASE_ID", "TOTAL_SCORE", "PERCENTAGE_SCORE", "SCORE_TYPE", "TACHE_SUBJECT", "REMARK", "AUDIT_STATUS", "ENTRY_USER_ID", "ENTRY_TYPE", "ENTRY_TIME", "AUDIT_USER_ID", "AUDIT_TIME", "STUDY_ACADEMIC_YEAR", "STUDY_SEMESTER_CODE", "MODIFY_REASON", "ENTRY_MENU_NAME", "STUDENT_NO", "STUDENT_NAME", "SEX_CODE") AS 
  SELECT SC."ORIGINAL_SCORE_ID",SC."COURSE_SCORE_SET_ID",SC."ACADEMIC_YEAR",SC."SEMESTER_CODE",SC."EXAM_BATCH_ID",SC."COURSE_ID",SC."STUDENT_ID",SC."SCORE_REGIMEN_ID",SC."USUAL_SCORE",SC."MIDTERM_SCORE",SC."ENDTERM_SCORE",SC."SKILL_SCORE",SC."SPECIAL_CASE_ID",SC."TOTAL_SCORE",SC."PERCENTAGE_SCORE",SC."SCORE_TYPE",SC."TACHE_SUBJECT",SC."REMARK",SC."AUDIT_STATUS",SC."ENTRY_USER_ID",SC."ENTRY_TYPE",SC."ENTRY_TIME",SC."AUDIT_USER_ID",SC."AUDIT_TIME",SC."STUDY_ACADEMIC_YEAR",SC."STUDY_SEMESTER_CODE",SC."MODIFY_REASON",SC."ENTRY_MENU_NAME",ST.STUDENT_NO,ST.STUDENT_NAME,ST.SEX_CODE FROM TSCOR_ORIGINAL_SCORE SC LEFT JOIN TSTU_STUDENT ST ON SC.STUDENT_ID = ST.USER_ID
where SC.AUDIT_STATUS = 1
;


CREATE OR REPLACE FORCE VIEW VSCOR_COURSE_SCORE_ENTRY  AS 
 SELECT
	DISTINCT TCS.TEACHING_CLASS_STUDENT_ID,-- ��ѡ��ѧ��Id
  TCS.USER_ID,-- ѧ��Id
	TCS.STUDENT_NAME,-- ѧ������
	TCS.STUDENT_NO,-- ѧ��
	TCS.SEX_CODE,-- �Ա�
	TCS.GRADE,-- �꼶
	TCS.CLASS_ID,-- �༶Id
	TCS.CLASS_NAME,-- �༶����
	TCS.MAJOR_ID,-- רҵId
	TCS.MAJOR_NAME,-- רҵ����
	TCS.DEPARTMENT_ID,-- ԺϵId
	TCS.DEPARTMENT_NAME,-- Ժϵ����
	TCS.ACADEMIC_YEAR,-- ѧ��
	TCS.SEMESTER_CODE,-- ѧ��
	TCS.CHOICE_WAY,-- ѡ�η�ʽ
	TCS.CREATE_TIME,--ѡ��ʱ��
	TCS.COURSE_ID,-- �γ�Id
  TCS.COURSE_NO, -- �γ̺�
	TCS.COURSE_NAME, --�γ�����
  TCS.CREDIT,-- ѧ��
	TCS.COURSE_TYPE_CODE,-- �γ����
	TCS.COURSE_ATTRIBUTE_CODE,--�γ�����
	TCS.IS_CORE_CURRICULUM,-- �Ƿ�ͨʶ��
	TCS.CHECK_WAY_CODE,-- ���˷�ʽ	
	TCS.OPEN_DEPARTMENT_ID, -- ���ε�λId
	TCS.OPEN_DEPARTMENT_NAME,-- ���ε�λ����
	TCS.THEORETICAL_TASK_ID,-- ��ѧ��Id
	TCS.TEACHING_CLASS_NO,-- ��ѧ���	
	TCS.TEACHER_LIST,-- �ον�ʦ	
  TCS.WEEK_LIST,-- �ſ������ſ��ܣ�
	TCS.SECTION_LIST,-- �ſ������ſνڴΣ�
  TCS.IS_ADJUST,
  OS.USUAL_SCORE, --ƽʱ�ɼ�
  OS.MIDTERM_SCORE, -- ���гɼ�
  OS.ENDTERM_SCORE, -- ��ĩ�ɼ�
  OS.SKILL_SCORE, --���ܳɼ�
  OS.TOTAL_SCORE, --�����ɼ����ٷ��ƴ�ŷ������ȼ��ƴ�ŷ�����ϸid��
  OS.SPECIAL_CASE_ID, -- �������ID
  OS.REMARK,  --��ע
  OS.AUDIT_STATUS, -- ���״̬
  OS.ORIGINAL_SCORE_ID, --ԭʼ�ɼ�Id
  OS.PERCENTAGE_SCORE,  --��Ӧ�İٷ��Ʒ���
  OS.SCORE_TYPE,  --�ɼ�����
  cse.ENTRY_USER_ID, --¼����
	sc.NAME SPECIAL_CASE_NAME, -- �������
	case when srd.CN_NAME is not null then srd.CN_NAME else os.TOTAL_SCORE end TOTAL_SCORE_DESC -- ������ϸ������
FROM VCHOC_TEACHING_CHOICE_STUDENT tcs 
LEFT JOIN TSCOR_ORIGINAL_SCORE os 
ON TCS.ACADEMIC_YEAR=OS.ACADEMIC_YEAR AND TCS.SEMESTER_CODE=OS.SEMESTER_CODE AND TCS.COURSE_ID=OS.COURSE_ID AND TCS.USER_ID=OS.STUDENT_ID AND OS.SCORE_TYPE=1 -- �ɼ�����Ϊ�׿� ����ͼֻ���ڿγ̳ɼ�¼��
LEFT JOIN TSCOR_COURSE_SCORE_SET cse ON TCS.ACADEMIC_YEAR=cse.ACADEMIC_YEAR AND TCS.SEMESTER_CODE=cse.SEMESTER_CODE AND TCS.COURSE_ID=cse.COURSE_ID AND TCS.THEORETICAL_TASK_ID=cse.CLASS_ID AND cse.SCORE_TYPE=1
LEFT JOIN TSCOR_SPECIAL_CASE sc ON sc.SPECIAL_CASE_ID=os.SPECIAL_CASE_ID -- �������
LEFT JOIN TSCOR_SCORE_REGIMEN_DETAIL srd ON srd.SCORE_REGIMEN_DETAIL_ID=os.TOTAL_SCORE
LEFT JOIN TSTU_ARCHIVES_REGISTER AR ON TCS.USER_ID=AR.USER_ID AND TCS.ACADEMIC_YEAR=AR.ACADEMIC_YEAR AND TCS.SEMESTER_CODE=AR.SEMESTER_CODE --ѧ��ע���
WHERE AR.SCHOOL_STATUS_CODE='001' -- ѧ��ע����Уѧ��
;



CREATE OR REPLACE FORCE VIEW VSCOR_TACHE_SCORE_ENTRY_SET AS 
  select 
(PR.PRACTICAL_ARRANGE_ID || PR.GRADE || m.MAJOR_ID || cou.course_id || PR.GROUP_NO) Id,
PR.GRADE,-- �꼶
m.DEPARTMENT_ID,-- Ժϵid
dep.DEPARTMENT_NAME,-- Ժϵ����
m.MAJOR_ID,--רҵid
m.MAJOR_NO, --רҵ��
m.MAJOR_NAME, --רҵ����
cou.course_id, --����id
cou.course_NO, -- ���ں�
cou.NAME COURSE_NAME , --��������
cou.tache_type_code,--�������
PR.GROUP_NO,--С���
(
		SELECT
			"REPLACE" (
				WMSYS.WM_CONCAT (
					TO_CHAR (
						'[' || TCR.TEACHER_NO || ']' || TCR.TEACHER_NAME
					)
				),
				',',
				'��'
			)
		FROM
			TCOUP_PRACTICAL_TEACHER PT
		LEFT JOIN TSYS_TEACHER TCR ON TCR.USER_ID = PT.TEACHER_ID -- ��ʦ��
		WHERE
			PT.PRACTICAL_ARRANGE_ID = pr.PRACTICAL_ARRANGE_ID
	) USERID_LIST,--ָ����ʦ
te.TEACHER_NAME,
te.TEACHER_NO,
pr.SEMESTER_CODE,   -- ѧ��
pr.ACADEMIC_YEAR,   -- ѧ��
tr.tache_Score_Enter_Id, -- ���ڳɼ�¼��������id
tr.ENTRY_USER_ID -- ���ڳɼ�¼����id
from TCOUP_PRACTICAL_ARRANGE  pr
left join TSYS_MAJOR m on PR.MAJOR_ID= m.MAJOR_ID 
left join TSYS_DEPARTMENT dep on dep.DEPARTMENT_ID=m.DEPARTMENT_ID 
left join TTRAP_COURSE cou on cou.course_Id = pr.course_Id 
left join TSCOR_TACHE_SCORE_ENTER tr on pr.academic_year = tr .academic_year and tr .semester_code =  pr .semester_code and tr .grade = pr .grade and tr .major_id = pr.major_id and tr.group_no=pr.group_no and tr.course_id = pr.course_id
LEFT JOIN VCOUP_TEACHERINFO te ON tr.entry_user_id = te.user_id
;



CREATE OR REPLACE FORCE VIEW VSCOR_COURSE_SCORE_SET_RESULT ("ACADEMIC_YEAR", "SEMESTER_CODE", "THEORETICAL_TASK_ID", "DEPARTMENT_ID", "DEPARTMENT_NAME", "COURSE_ID", "COURSE_NO", "COURSE_NAME", "TEACHING_CLASS_NO", "SCORE_REGIMEN_NAME", "USUAL_RATIO", "MIDTERM_RATIO", "ENDTERM_RATIO", "SKILL_RATIO", "ONLY_ENTRY_TOTAL_SCORE", "ID", "ALLOW_MODIFY", "TEACHER_LIST", "SCORE_REGIMEN_ID", "COURSE_SCORE_SET_ID", "TEACHER_NAME", "TEACHER_NO", "ENTRY_USER_ID", "SCORE_TYPE", "IS_EXIT_NUM") AS 
  SELECT
v."ACADEMIC_YEAR",
v."SEMESTER_CODE",
v."THEORETICAL_TASK_ID",
v."DEPARTMENT_ID",
v."DEPARTMENT_NAME",
v."COURSE_ID",
v."COURSE_NO",
v."COURSE_NAME",
v."TEACHING_CLASS_NO",
ts.SCORE_REGIMEN_NAME,
s.USUAL_RATIO,
s.MIDTERM_RATIO,
s.ENDTERM_RATIO,
 s.SKILL_RATIO,
s.ONLY_ENTRY_TOTAL_SCORE,
(v.THEORETICAL_TASK_ID || s.COURSE_ID || s.CLASS_ID ) as Id,
s.ALLOW_MODIFY,
v.TEACHER_LIST,
s.SCORE_REGIMEN_ID,
s.COURSE_SCORE_SET_ID,
te.TEACHER_NAME,
te.TEACHER_NO,
s.ENTRY_USER_ID,
s.SCORE_TYPE,
(select count(0) from TSCOR_ORIGINAL_SCORE th WHERE th.COURSE_SCORE_SET_ID = s.COURSE_SCORE_SET_ID) as  IS_EXIT_NUM
FROM
	VCHOC_CHOICE_RESULT_MANAGE v
LEFT JOIN TSCOR_COURSE_SCORE_SET s ON v.COURSE_ID = s.COURSE_ID
AND v.ACADEMIC_YEAR = s.ACADEMIC_YEAR
AND v.SEMESTER_CODE = s.SEMESTER_CODE
AND s.CLASS_ID = v.THEORETICAL_TASK_ID
and s.SCORE_TYPE =1
LEFT JOIN TSCOR_SCORE_REGIMEN ts on s.score_regimen_id =  ts .score_regimen_id  -- ����id
LEFT JOIN VCOUP_TEACHERINFO te ON s.entry_user_id = te.user_id
;



 
CREATE OR REPLACE FORCE VIEW VSCOR_SCOREUPDATE AS 
SELECT
  H .STARTCLASS_PLAN_ID AS ID,
  H .COURSE_NO,
  H . NAME COURSE_NAME,
  H .ACADEMIC_YEAR,
  H .SEMESTER_CODE,
  H .CHECK_WAY_CODE,
  H .CLASS_TYPE,
  H .CREDIT,
  H .CLASS_ID,
  H .GRADE,
  H .MAJOR_ID,
  H .COURSE_ID,
  D .ACADEMIC_YEAR SCORE_ACADEMIC_YEAR,
  D .SEMESTER_CODE SCORE_SEMESTER_CODE,
  D .SCORE_REGIMEN_ID,
  D .SCORE_TYPE,
  D .TOTAL_SCORE,
  D .SPECIAL_CASE_ID,
  D .REMARK,
  D .USUAL_SCORE,
  D .MIDTERM_SCORE,
  D .ENDTERM_SCORE,
  D .SKILL_SCORE,
  D .PERCENTAGE_SCORE,
  D .AUDIT_STATUS,
  D .ENTRY_USER_ID,
  D .ENTRY_TIME,
  D .OLD_USUAL_SCORE,
  D .OLD_MIDTERM_SCORE,
  D .OLD_ENDTERM_SCORE,
  D .OLD_SKILL_SCORE,
  D .OLD_TOTAL_SCORE,
  D .OLD_SPECIAL_CASE_ID,
  D .OLD_ENTRY_USER_ID,
  D .OLD_ENTRY_TIME,
  D .OLD_SCORE_TYPE,
  D.OLD_ENTRY_USER_NAME ,
D.OLD_ACCOUNT_NAME OLD_ENTRY_USER_NO,
D.ACCOUNT_NAME ENTRY_USER_NO,
  D.ENTRY_USER_NAME ,
D.ORIGINAL_SCORE_ID,
D.MODIFY_REASON,
CA.NAME AS SPECIAL_CASE_NAME,
CS.COURSE_SCORE_SET_ID,
CS.USUAL_RATIO,
CS.MIDTERM_RATIO,
CS.ENDTERM_RATIO,
CS.SKILL_RATIO,
CS.ONLY_ENTRY_TOTAL_SCORE,
SR.IS_HIERARCHICAL,
OLDCA.NAME AS OLD_SPECIAL_CASE_NAME,
  F.USER_ID,
  F.STUDENT_NO,
  F.STUDENT_NAME,
 (CASE SR.IS_HIERARCHICAL when 1 THEN
(SELECT CN_NAME FROM TSCOR_SCORE_REGIMEN_DETAIL WHERE SCORE_REGIMEN_DETAIL_ID=D .TOTAL_SCORE)
ELSE D .TOTAL_SCORE END) TOTAL_SCOREALL,
 (CASE SR.IS_HIERARCHICAL when 1 THEN
(SELECT CN_NAME FROM TSCOR_SCORE_REGIMEN_DETAIL WHERE SCORE_REGIMEN_DETAIL_ID=D .OLD_TOTAL_SCORE)
ELSE D .OLD_TOTAL_SCORE END) OLD_TOTAL_SCOREALL
FROM
  (
    SELECT
      SP.STARTCLASS_PLAN_ID,
      SP.ACADEMIC_YEAR,
      SP.SEMESTER_CODE,
      SP.CHECK_WAY_CODE,
      SP.CLASS_TYPE,
      SP.COURSE_ID,
      CO.CREDIT,
      CL.CLASS_ID,
      GM.GRADE,
      GM.MAJOR_ID,
      CO.COURSE_NO,
      CO. NAME
    FROM
      TTRAP_STARTCLASS_PLAN SP
    LEFT JOIN TTRAP_GRADE_MAJOR GM ON SP.GRADE_MAJOR_ID = GM.GRADE_MAJOR_ID
    LEFT JOIN TSTU_CLASS CL ON CL.GRADE = GM.GRADE
    AND CL.MAJOR_ID = GM.MAJOR_ID
    LEFT JOIN TTRAP_COURSE CO ON SP.COURSE_ID = CO.COURSE_ID
    LEFT JOIN TSYS_MAJOR MA ON GM.MAJOR_ID = MA.MAJOR_ID
    WHERE
      sp.TEMP_FLAG = 0
  ) H
INNER JOIN (
  SELECT
    AR.ACADEMIC_YEAR,
    AR.SEMESTER_CODE,
    AR.CLASS_ID,
    AR.USER_ID,
    CL.CAMPUS_ID,
    CL.MAJOR_ID,
    CL.GRADE,
    ST.STUDENT_NO,
    ST.STUDENT_NAME
  FROM
    TSTU_ARCHIVES_REGISTER AR
  LEFT JOIN TSTU_CLASS CL ON AR.CLASS_ID = CL.CLASS_ID
  INNER JOIN TSTU_STUDENT ST ON AR.USER_ID = ST.USER_ID
) F ON F.ACADEMIC_YEAR = H .ACADEMIC_YEAR
AND F.SEMESTER_CODE = H .SEMESTER_CODE
AND H .CLASS_ID = F.CLASS_ID
AND F.MAJOR_ID = H .MAJOR_ID
AND F.GRADE = H .GRADE
INNER JOIN (
  SELECT
    OS.*, VS.USUAL_SCORE AS OLD_USUAL_SCORE,
    VS.MIDTERM_SCORE AS OLD_MIDTERM_SCORE,
    VS.ENDTERM_SCORE AS OLD_ENDTERM_SCORE,
    VS.SKILL_SCORE AS OLD_SKILL_SCORE,
    VS.TOTAL_SCORE AS OLD_TOTAL_SCORE,
    VS.SPECIAL_CASE_ID AS OLD_SPECIAL_CASE_ID,
    VS.ENTRY_USER_ID AS OLD_ENTRY_USER_ID,
    VS.ENTRY_TIME AS OLD_ENTRY_TIME,
    VS.SCORE_TYPE AS OLD_SCORE_TYPE,
VUS.USER_NAME AS OLD_ENTRY_USER_NAME,
OUS.USER_NAME AS ENTRY_USER_NAME,
VUS.ACCOUNT_NAME AS OLD_ACCOUNT_NAME,
OUS.ACCOUNT_NAME AS ACCOUNT_NAME
  FROM
    TSCOR_VALIDITY_SCORE VS
  INNER JOIN TSCOR_ORIGINAL_SCORE OS ON VS.ORIGINAL_SCORE_ID = OS.ORIGINAL_SCORE_ID
LEFT JOIN  TSYS_USER VUS ON VUS.USER_ID=VS.ENTRY_USER_ID
LEFT JOIN TSYS_USER OUS ON OUS.USER_ID=OS.ENTRY_USER_ID
) D
LEFT JOIN TSCOR_SPECIAL_CASE CA ON CA.SPECIAL_CASE_ID=D.SPECIAL_CASE_ID
LEFT JOIN TSCOR_SPECIAL_CASE OLDCA ON OLDCA.SPECIAL_CASE_ID=D.OLD_SPECIAL_CASE_ID
LEFT JOIN TSCOR_SCORE_REGIMEN SR ON SR.SCORE_REGIMEN_ID=D.SCORE_REGIMEN_ID
LEFT JOIN TSCOR_COURSE_SCORE_SET CS ON CS.COURSE_SCORE_SET_ID=D.COURSE_SCORE_SET_ID
 ON D .STUDENT_ID = F.USER_ID
AND D .STUDY_ACADEMIC_YEAR = F.ACADEMIC_YEAR
AND D .STUDY_SEMESTER_CODE = F.SEMESTER_CODE
AND D .COURSE_ID = H .COURSE_ID
;





CREATE OR REPLACE FORCE VIEW VSCOR_STARCLASS_STUDENT AS 
SELECT 
 (H.COURSE_ID || H.ACADEMIC_YEAR || H."SEMESTER_CODE" || F.USER_ID ) AS ID, -- ���μƻ�id
H.COURSE_NO, -- �γ̺�
H.NAME COURSE_NAME, -- �γ�����
"CONCAT"(H."ACADEMIC_YEAR", H."SEMESTER_CODE") AS semester , -- ѧ��ѧ��
H."ACADEMIC_YEAR", -- �޶�ѧ��
H."SEMESTER_CODE", -- �޶�ѧ��
H."CHECK_WAY_CODE", -- ��˷�ʽ
H."CLASS_TYPE", -- �༶����
H."CREDIT", -- ѧ��
H."CLASS_ID", -- �༶id
H."GRADE", -- �꼶
H."MAJOR_ID", -- רҵid
H.COURSE_ID, -- �γ�id
OS.ORIGINAL_SCORE_ID, -- ԭʼ�ɼ�id
OS.AUDIT_STATUS, -- ���״̬
OS.ACADEMIC_YEAR SCORE_ACADEMIC_YEAR, -- ȡ��ѧ��
OS.SEMESTER_CODE SCORE_SEMESTER_CODE, -- ȡ��ѧ��
OS.SCORE_REGIMEN_ID, -- ����id
OS.SCORE_TYPE, -- �ɼ�����
OS.TOTAL_SCORE, -- �����ɼ�
OS.SPECIAL_CASE_ID, -- �������id
OS.REMARK,  -- ��ע
OS.TACHE_SUBJECT, -- ������Ŀ
OS.PERCENTAGE_SCORE, -- ��Ӧ�İٷ��Ƴɼ�
F.USER_ID, -- ѧ��id
F.STUDENT_NAME, -- ѧ������
F.STUDENT_NO,  -- ѧ��
F.SEX_CODE, -- �Ա�
H.DEPARTMENT_ID,  -- Ժϵid
H.COURSE_OR_TACHE,--�γ̻򻷽�
OS.ENTRY_TYPE--¼�뷽ʽ
FROM 
( SELECT 
	SP.STARTCLASS_PLAN_ID,
	SP.ACADEMIC_YEAR,
	SP.SEMESTER_CODE,
	SP.CHECK_WAY_CODE,
	SP.CLASS_TYPE,
	SP.COURSE_ID,
	CO.CREDIT,
	CL.CLASS_ID,
	GM.GRADE,
	GM.MAJOR_ID,
	CO.COURSE_OR_TACHE,
	CO.COURSE_NO,
	CO.NAME,
	DE.DEPARTMENT_ID
	FROM TTRAP_STARTCLASS_PLAN SP  -- ���μƻ�
	LEFT JOIN TTRAP_GRADE_MAJOR GM  ON  SP.GRADE_MAJOR_ID = GM.GRADE_MAJOR_ID   -- �꼶רҵ
	LEFT JOIN TSTU_CLASS CL ON CL.GRADE = GM.GRADE AND CL.MAJOR_ID = GM.MAJOR_ID  -- �����༶
	LEFT JOIN TTRAP_COURSE CO ON SP.COURSE_ID =CO.COURSE_ID   -- �γ���Ϣ
	LEFT JOIN TSYS_MAJOR MA ON GM.MAJOR_ID = MA.MAJOR_ID  -- רҵ
  LEFT JOIN TSYS_DEPARTMENT DE on MA.department_id = DE.department_id -- Ժϵ
	WHERE sp.TEMP_FLAG=0) H
INNER  JOIN 
(SELECT 
AR.ACADEMIC_YEAR,
AR.SEMESTER_CODE,
AR.CLASS_ID,
AR.USER_ID,
CL.CAMPUS_ID,
CL.MAJOR_ID,
CL.GRADE,
ST.STUDENT_NO,
ST.SEX_CODE,
ST.STUDENT_NAME
FROM TSTU_ARCHIVES_REGISTER AR -- ѧ��ע��
LEFT JOIN TSTU_CLASS CL ON AR.CLASS_ID=CL.CLASS_ID  -- �����༶
INNER JOIN TSTU_STUDENT ST ON AR.USER_ID=ST.USER_ID -- ѧ����Ϣ
WHERE AR.SCHOOL_STATUS_CODE='001' -- ѧ��ע����Уѧ��
) F
ON F.ACADEMIC_YEAR=H.ACADEMIC_YEAR AND F.SEMESTER_CODE=H.SEMESTER_CODE AND H.CLASS_ID=F.CLASS_ID AND F.MAJOR_ID=H.MAJOR_ID AND F.GRADE=H.GRADE
LEFT JOIN TSCOR_ORIGINAL_SCORE OS -- ԭʼ�ɼ�
ON OS.STUDY_ACADEMIC_YEAR=F.ACADEMIC_YEAR AND OS.STUDY_SEMESTER_CODE=F.SEMESTER_CODE AND OS.COURSE_ID=H.COURSE_ID AND OS.STUDENT_ID=F.USER_ID
;






CREATE OR REPLACE VIEW VSCOR_TACHE_SCORE_ENTRY AS
SELECT
(tses.ACADEMIC_YEAR || tses.SEMESTER_CODE || tses.COURSE_ID || ar.CLASS_ID || tses.ENTRY_USER_ID || ps.STUDENT_ID) AS ID, 
tses.ACADEMIC_YEAR, -- �޶�ѧ��
tses.SEMESTER_CODE, -- �޶�ѧ��
ar.CLASS_ID, -- �༶id
tses.GRADE, -- �꼶
tses.MAJOR_ID, -- רҵid
tses.COURSE_ID, -- �γ�id
OS.ORIGINAL_SCORE_ID, -- ԭʼ�ɼ�id
OS.AUDIT_STATUS, -- ���״̬
OS.ACADEMIC_YEAR SCORE_ACADEMIC_YEAR, -- ȡ��ѧ��
OS.SEMESTER_CODE SCORE_SEMESTER_CODE, -- ȡ��ѧ��
OS.SCORE_REGIMEN_ID, -- ����id
OS.SCORE_TYPE, -- �ɼ�����
OS.TOTAL_SCORE, -- �����ɼ�
OS.SPECIAL_CASE_ID, -- �������id
OS.REMARK,  -- ��ע
OS.TACHE_SUBJECT, -- ������Ŀ
OS.PERCENTAGE_SCORE, -- ��Ӧ�İٷ��Ƴɼ�
ps.STUDENT_ID as USER_ID, -- ѧ��id
st.STUDENT_NAME, -- ѧ������
st.STUDENT_NO,  -- ѧ��
st.SEX_CODE, -- �Ա�
tses.DEPARTMENT_ID,  -- Ժϵid
tses.ENTRY_USER_ID,  -- ¼����
sc.NAME SPECIAL_CASE_NAME, -- �������
case when srd.CN_NAME is not null then srd.CN_NAME else os.TOTAL_SCORE end TOTAL_SCORE_DESC -- ������ϸ������
FROM VSCOR_TACHE_SCORE_ENTRY_SET tses -- ���û��ڳɼ�¼������ͼ
INNER JOIN TCOUP_PRACTICAL_ARRANGE pa ON TSES.ACADEMIC_YEAR=PA.ACADEMIC_YEAR AND TSES.SEMESTER_CODE=PA.SEMESTER_CODE AND TSES.GRADE=PA.GRADE AND TSES.MAJOR_ID=PA.MAJOR_ID AND TSES.course_id=PA.COURSE_ID AND TSES.GROUP_NO=PA.GROUP_NO -- ʵ�����ű�
LEFT JOIN TCOUP_PRACTICAL_STUDENT ps  ON pa.PRACTICAL_ARRANGE_ID=ps.PRACTICAL_ARRANGE_ID  -- ʵ������ѧ����
LEFT JOIN TSCOR_ORIGINAL_SCORE os ON os.ACADEMIC_YEAR=tses.ACADEMIC_YEAR AND os.SEMESTER_CODE=tses.SEMESTER_CODE AND os.COURSE_ID=tses.COURSE_ID AND os.STUDENT_ID=ps.STUDENT_ID -- ԭʼ�ɼ���
INNER JOIN TSTU_ARCHIVES_REGISTER ar ON ar.ACADEMIC_YEAR=tses.ACADEMIC_YEAR AND ar.SEMESTER_CODE=tses.SEMESTER_CODE AND ar.USER_ID=ps.STUDENT_ID -- ѧ��ע��a��
left join TSTU_STUDENT st ON ST.USER_ID=ps.STUDENT_ID -- ѧ����Ϣ��
LEFT JOIN TSCOR_SPECIAL_CASE sc ON sc.SPECIAL_CASE_ID=os.SPECIAL_CASE_ID -- �������
LEFT JOIN TSCOR_SCORE_REGIMEN_DETAIL srd ON srd.SCORE_REGIMEN_DETAIL_ID=os.TOTAL_SCORE
WHERE AR.SCHOOL_STATUS_CODE='001' -- ѧ��ע����Уѧ��
;


CREATE OR REPLACE FORCE VIEW VSCOR_TACHE_SCORE_SET_RESULT AS 
 SELECT
			(SP.STARTCLASS_PLAN_ID || Cl.class_id) as Id,
      SP.MAJOR_THEORY_ID,
			SP.ACADEMIC_YEAR,
			SP.SEMESTER_CODE,
			SP.CLASS_TYPE,
			SP.COURSE_ID,
			CO.CREDIT,
			CL.CLASS_ID,
			GM.GRADE,
			GM.MAJOR_ID,
			CO.COURSE_NO,
			CO.NAME,
      CL.CLASS_NAME,
      MA.MAJOR_NAME,
      CO.TACHE_TYPE_CODE,
      d.DEPARTMENT_NAME AS OPENDEPARTMENT_NAME,
			d.DEPARTMENT_ID AS OPENDEPARTMENT_ID,
			c.DEPARTMENT_NAME,
      c.DEPARTMENT_ID,
      TS.SCORE_REGIMEN_ID,
      K.SCORE_REGIMEN_NAME,
      TS .ALLOW_MODIFY
		FROM
			TTRAP_STARTCLASS_PLAN SP
		LEFT JOIN TTRAP_GRADE_MAJOR GM ON SP.GRADE_MAJOR_ID = GM.GRADE_MAJOR_ID
		LEFT JOIN TTRAP_COURSE CO ON SP.COURSE_ID = CO.COURSE_ID
    LEFT JOIN TSYS_DEPARTMENT d on d.department_id = CO.department_id
		LEFT JOIN TSYS_MAJOR MA ON GM.MAJOR_ID = MA.MAJOR_ID
    LEFT JOIN TSYS_DEPARTMENT C on MA.department_id = C.department_id
    JOIN TSTU_CLASS CL ON CL.GRADE = GM.GRADE AND CL.MAJOR_ID = GM.MAJOR_ID
    LEFT JOIN TSCOR_TACHE_SCORE_CONSTITUTE TS ON SP.ACADEMIC_YEAR=TS.ACADEMIC_YEAR AND SP.SEMESTER_CODE = TS .SEMESTER_CODE AND SP.COURSE_ID = TS .COURSE_ID AND CL .CLASS_ID = TS.CLASS_ID
    LEFT JOIN TSCOR_SCORE_REGIMEN K on K.score_regimen_id =  TS.score_regimen_id  -- ����id
		WHERE
		  SP.CLASS_TYPE =2  and	SP.TEMP_FLAG =0
;
      

CREATE OR REPLACE VIEW VSCOR_MARKUP_SCORE_ENTRY AS
SELECT
	VS.VALIDITY_SCORE_ID, -- ��Ч�ɼ�id
	VS.STUDY_ACADEMIC_YEAR, -- �޶�ѧ��
	VS.STUDY_SEMESTER_CODE, -- �޶�ѧ��
	VS.COURSE_ID, -- �γ�id
	VS.FINAL_PERCENTAGE_SCORE, -- ���ճɼ���Ӧ�İٷ��Ƴɼ�
	STU.USER_ID,-- ѧ��Id
	STU.STU.STUDENT_NO, -- ѧ��
	STU.STUDENT_NAME, -- ����
	STU.SEX_CODE, -- �Ա�
  OS.ORIGINAL_SCORE_ID, --ԭʼ�ɼ�Id
	OS.ACADEMIC_YEAR, -- ȡ��ѧ��
	OS.SEMESTER_CODE, -- ȡ��ѧ��	
	OS.TOTAL_SCORE, -- �����ɼ�
	OS.SPECIAL_CASE_ID, -- �������id
  OS.PERCENTAGE_SCORE,  --��Ӧ�İٷ��Ʒ���
	OS.REMARK, -- ��ע	
  OS.AUDIT_STATUS, -- ���״̬
	OS.SCORE_REGIMEN_ID, -- ����id
	DE.DEPARTMENT_ID OPEN_DEPARTMENT_ID, -- ���ε�λid	
	CL.GRADE, -- �꼶
	MA.DEPARTMENT_ID, -- Ժϵid
	MA.MAJOR_ID, --רҵid
	CL.CLASS_ID, -- �༶id   
	DE.DEPARTMENT_NAME AS OPEN_DEPARTMENT_NAME, -- ���ε�λ����
	CO.NAME COURSE_NAME, -- �γ�����
	CO.COURSE_NO ,--�γ̺�
	CO.CREDIT, -- ѧ��
  cse.ENTRY_USER_ID, -- ¼����
	sc.NAME SPECIAL_CASE_NAME, -- �������
	case when srd.CN_NAME is not null then srd.CN_NAME else os.TOTAL_SCORE end TOTAL_SCORE_DESC -- ������ϸ������
FROM TSCOR_VALIDITY_SCORE VS -- ��Ч�ɼ�
LEFT JOIN TSCOR_ORIGINAL_SCORE OS ON VS.MARKUP_ORIGINAL_SCORE_ID=OS.ORIGINAL_SCORE_ID AND OS.SCORE_TYPE=2  -- ԭʼ�ɼ�
LEFT JOIN TTRAP_COURSE CO ON VS.COURSE_ID=CO.COURSE_ID -- �γ���Ϣ
LEFT JOIN TSYS_DEPARTMENT DE ON CO.DEPARTMENT_ID = DE.DEPARTMENT_ID  -- ���ε�λ
LEFT JOIN TSTU_STUDENT STU ON VS.STUDENT_ID=STU.USER_ID -- ѧ����Ϣ
LEFT JOIN TSTU_ARCHIVES_REGISTER AR ON VS.STUDENT_ID=AR.USER_ID AND VS.STUDY_ACADEMIC_YEAR=AR.ACADEMIC_YEAR AND VS.STUDY_SEMESTER_CODE=AR.SEMESTER_CODE --ѧ��ע���
LEFT JOIN TSTU_CLASS CL ON AR.CLASS_ID= CL.CLASS_ID -- �༶
LEFT JOIN TSYS_MAJOR MA ON CL.MAJOR_ID=MA.MAJOR_ID -- רҵ
LEFT JOIN TSCOR_COURSE_SCORE_SET cse ON vs.STUDY_ACADEMIC_YEAR=cse.ACADEMIC_YEAR AND vs.STUDY_SEMESTER_CODE=cse.SEMESTER_CODE AND vs.COURSE_ID=cse.COURSE_ID AND cse.SCORE_TYPE=2
LEFT JOIN TSCOR_SPECIAL_CASE sc ON sc.SPECIAL_CASE_ID=os.SPECIAL_CASE_ID -- �������
LEFT JOIN TSCOR_SCORE_REGIMEN_DETAIL srd ON srd.SCORE_REGIMEN_DETAIL_ID=os.TOTAL_SCORE -- ������ϸ
WHERE VS.FINAL_PERCENTAGE_SCORE<60 AND CO.COURSE_OR_TACHE=1 and AR.SCHOOL_STATUS_CODE='001' -- ѧ��ע����Уѧ��
;

CREATE OR REPLACE VIEW VSCOR_MARKUP_SCORE_REGISTER AS
SELECT
  DISTINCT
	CONCAT(DE.DEPARTMENT_ID, CO.COURSE_ID) AS ID,
	VS.STUDY_ACADEMIC_YEAR, -- �޶�ѧ��
	VS.STUDY_SEMESTER_CODE, -- �޶�ѧ��
	DE.DEPARTMENT_ID OPEN_DEPARTMENT_ID, -- ���ε�λid  
	DE.DEPARTMENT_NAME AS OPEN_DEPARTMENT_NAME, -- ���ε�λ����
	CO.COURSE_ID, -- �γ�id
	CO.NAME COURSE_NAME, -- �γ�����
	CO.CREDIT, -- ѧ��
	CL.GRADE, -- �꼶 
  CO.COURSE_NO
FROM TSCOR_VALIDITY_SCORE VS -- ��Ч�ɼ�
LEFT JOIN TSCOR_ORIGINAL_SCORE OS ON VS.MARKUP_ORIGINAL_SCORE_ID=OS.ORIGINAL_SCORE_ID  -- ԭʼ�ɼ�
LEFT JOIN TTRAP_COURSE CO ON VS.COURSE_ID=CO.COURSE_ID -- �γ���Ϣ
LEFT JOIN TSYS_DEPARTMENT DE ON CO.DEPARTMENT_ID = DE.DEPARTMENT_ID  -- ���ε�λ
INNER  JOIN TSTU_STUDENT STU ON VS.STUDENT_ID=STU.USER_ID   -- ѧ����Ϣ
LEFT JOIN TSTU_ARCHIVES_REGISTER AR ON VS.STUDENT_ID=AR.USER_ID AND VS.STUDY_ACADEMIC_YEAR=AR.ACADEMIC_YEAR AND VS.STUDY_SEMESTER_CODE=AR.SEMESTER_CODE --ѧ��ע���
LEFT JOIN TSTU_CLASS CL ON AR.CLASS_ID= CL.CLASS_ID -- �༶
LEFT JOIN TSYS_MAJOR MA ON CL.MAJOR_ID=MA.MAJOR_ID -- רҵ  -- ԭʼ�ɼ� 
WHERE  VS.FINAL_PERCENTAGE_SCORE<60
AND CO.COURSE_OR_TACHE=1
;

CREATE OR REPLACE VIEW VSCOR_TACHE_SCORE_REGISTER AS
SELECT
DISTINCT
(SP.COURSE_ID || SP.ACADEMIC_YEAR || SP.SEMESTER_CODE|| CL.CLASS_ID) as ID,
 DE.DEPARTMENT_NAME, -- Ժϵ����,	
GM.GRADE,-- �꼶,
CL.CLASS_NAME, -- �༶����,
CL.CLASS_ID,--�༶id
CO.COURSE_ID,--�γ�id
CO.COURSE_NO, --�γ̺�
CO.NAME COURSE_NAME , --�γ�����
CO.TACHE_TYPE_CODE COURSE_TYPE_CODE, -- �������
CO.CREDIT,-- ѧ�� 
SP.CHECK_WAY_CODE,--���˷�ʽ
SR.SCORE_REGIMEN_NAME,--����
SP.ACADEMIC_YEAR,--ѧ��
SP.SEMESTER_CODE,--ѧ��
 DE.DEPARTMENT_ID,--Ժϵid
MA.MAJOR_ID,--רҵid
MA.MAJOR_NO--רҵ��
-- SC.CLASS_ID,--�༶id
-- SC.COURSE_ID--�γ�id
 FROM 	 TTRAP_STARTCLASS_PLAN SP  -- ���μƻ�
	LEFT JOIN TTRAP_GRADE_MAJOR GM  ON  SP.GRADE_MAJOR_ID = GM.GRADE_MAJOR_ID   -- �꼶רҵ
	LEFT JOIN TSTU_CLASS CL ON CL.GRADE = GM.GRADE AND CL.MAJOR_ID = GM.MAJOR_ID  -- �����༶
	LEFT JOIN TTRAP_COURSE CO ON SP.COURSE_ID =CO.COURSE_ID   -- �γ���Ϣ
	LEFT JOIN TSYS_MAJOR MA ON GM.MAJOR_ID = MA.MAJOR_ID  -- רҵ
  LEFT JOIN TSYS_DEPARTMENT DE on MA.department_id = DE.department_id -- Ժϵ
	LEFT JOIN TSCOR_TACHE_SCORE_CONSTITUTE SC
	ON SP.ACADEMIC_YEAR=SC.ACADEMIC_YEAR AND SP.SEMESTER_CODE=SC.SEMESTER_CODE AND SP.COURSE_ID=SC.COURSE_ID AND CL.CLASS_ID=SC.CLASS_ID
 LEFT JOIN TSCOR_SCORE_REGIMEN SR ON SR.SCORE_REGIMEN_ID=SC.SCORE_REGIMEN_ID
 INNER  JOIN TSTU_STUDENT STU ON STU.CLASS_ID=CL.CLASS_ID
 INNER JOIN TSTU_ARCHIVES_REGISTER AR ON AR.ACADEMIC_YEAR=SC.ACADEMIC_YEAR AND AR.SEMESTER_CODE=SC.SEMESTER_CODE AND STU.USER_ID=AR.USER_ID
	WHERE sp.TEMP_FLAG=0 AND SP.CLASS_TYPE=2 AND AR.SCHOOL_STATUS_CODE='001'
	;

 CREATE OR REPLACE VIEW VSCOR_GROUPBYCOURSEPLAN AS
SELECT SP.ACADEMIC_YEAR,SP.SEMESTER_CODE,SP.COURSE_ID,CO.COURSE_NO,CO.NAME,CO.COURSE_OR_TACHE,CO.DEPARTMENT_ID,TI.BEGIN_TIME,TI.END_TIME,0 as IS_MARK_UP_EXAM
FROM TTRAP_STARTCLASS_PLAN SP
     LEFT JOIN TTRAP_GRADE_MAJOR GM  ON  SP.GRADE_MAJOR_ID = GM.GRADE_MAJOR_ID
     LEFT JOIN TSTU_CLASS CL ON CL.GRADE = GM.GRADE AND CL.MAJOR_ID = GM.MAJOR_ID
     LEFT JOIN TTRAP_COURSE CO ON SP.COURSE_ID =CO.COURSE_ID
     LEFT JOIN TSYS_MAJOR MA ON GM.MAJOR_ID = MA.MAJOR_ID
     LEFT JOIN TSCOR_SCORE_ENTRY_TIME TI ON TI.ACADEMIC_YEAR = SP.ACADEMIC_YEAR AND TI.SEMESTER_CODE = SP.SEMESTER_CODE AND TI.COURSE_ID = SP.COURSE_ID AND TI.IS_MARK_UP_EXAM = 0
     WHERE SP.TEMP_FLAG=0 
 group by SP.ACADEMIC_YEAR,SP.SEMESTER_CODE,SP.COURSE_ID,CO.COURSE_NO,CO.NAME,CO.COURSE_OR_TACHE,CO.DEPARTMENT_ID,TI.BEGIN_TIME,TI.END_TIME,TI.IS_MARK_UP_EXAM
 UNION ALL
SELECT SP.ACADEMIC_YEAR,SP.SEMESTER_CODE,SP.COURSE_ID,CO.COURSE_NO,CO.NAME,CO.COURSE_OR_TACHE,CO.DEPARTMENT_ID,TI.BEGIN_TIME,TI.END_TIME,1 as IS_MARK_UP_EXAM
FROM TTRAP_STARTCLASS_PLAN SP
     LEFT JOIN TTRAP_GRADE_MAJOR GM  ON  SP.GRADE_MAJOR_ID = GM.GRADE_MAJOR_ID
     LEFT JOIN TSTU_CLASS CL ON CL.GRADE = GM.GRADE AND CL.MAJOR_ID = GM.MAJOR_ID
     LEFT JOIN TTRAP_COURSE CO ON SP.COURSE_ID =CO.COURSE_ID
     LEFT JOIN TSYS_MAJOR MA ON GM.MAJOR_ID = MA.MAJOR_ID
     LEFT JOIN TSCOR_SCORE_ENTRY_TIME TI ON TI.ACADEMIC_YEAR = SP.ACADEMIC_YEAR AND TI.SEMESTER_CODE = SP.SEMESTER_CODE AND TI.COURSE_ID = SP.COURSE_ID AND TI.IS_MARK_UP_EXAM = 1
     WHERE SP.TEMP_FLAG=0 AND CO.COURSE_OR_TACHE=1 
 group by SP.ACADEMIC_YEAR,SP.SEMESTER_CODE,SP.COURSE_ID,CO.COURSE_NO,CO.NAME,CO.COURSE_OR_TACHE,CO.DEPARTMENT_ID,TI.BEGIN_TIME,TI.END_TIME,TI.IS_MARK_UP_EXAM
 ;

CREATE OR REPLACE VIEW VSCOR_COURSE_SCORE_REGISTER AS
SELECT
  DISTINCT CONCAT(CONCAT(CONCAT(TCS.ACADEMIC_YEAR,TCS.SEMESTER_CODE),TCS.COURSE_ID),TCS.THEORETICAL_TASK_ID) as ID,--ƴ������
  TCS.ACADEMIC_YEAR,-- ѧ��
  TCS.SEMESTER_CODE,-- ѧ��
  TCS.COURSE_ID,-- �γ�Id
  TCS.COURSE_NO, -- �γ̺�
  TCS.COURSE_NAME, --�γ�����
  TCS.CREDIT,-- ѧ��
  s.USUAL_RATIO,
  s.MIDTERM_RATIO,
  s.ENDTERM_RATIO,
  s.SKILL_RATIO,
  ts.SCORE_REGIMEN_NAME,
  s.ONLY_ENTRY_TOTAL_SCORE,
  TCS.COURSE_TYPE_CODE,-- �γ����
  TCS.OPEN_DEPARTMENT_ID, -- ���ε�λId
  TCS.OPEN_DEPARTMENT_NAME,-- ���ε�λ����
  TCS.THEORETICAL_TASK_ID,-- ��ѧ��Id
  TCS.TEACHING_CLASS_NO,-- ��ѧ���
  TCS.TEACHER_LIST-- �ον�ʦ
FROM VCHOC_TEACHING_CHOICE_STUDENT TCS 
LEFT JOIN TSCOR_COURSE_SCORE_SET s ON TCS.COURSE_ID = s.COURSE_ID AND TCS.ACADEMIC_YEAR = s.ACADEMIC_YEAR AND TCS.SEMESTER_CODE = s.SEMESTER_CODE AND TCS.THEORETICAL_TASK_ID = s.CLASS_ID 
LEFT JOIN TSCOR_SCORE_REGIMEN ts on s.score_regimen_id = ts.score_regimen_id
;

CREATE OR REPLACE VIEW VSCOR_SCORE_APPROVAL AS
SELECT rawtohex(sys_guid()) AS ID,AP.*  FROM (
SELECT SC.STUDY_ACADEMIC_YEAR AS ACADEMIC_YEAR,SC.STUDY_SEMESTER_CODE AS SEMESTER_CODE,DE.DEPARTMENT_NAME,CS.DEPARTMENT_ID,CS.COURSE_NO,CS.NAME,SC.ENTRY_TYPE,US.ACCOUNT_NAME,US.USER_NAME,SC.ENTRY_USER_ID,SC.COURSE_ID,SC.AUDIT_STATUS,SC.IS_MODIFY,COUNT(*) AS TOTAL 
from TSCOR_ORIGINAL_SCORE SC LEFT JOIN TTRAP_COURSE CS ON SC.COURSE_ID = CS.COURSE_ID
LEFT JOIN TSYS_DEPARTMENT DE ON CS.DEPARTMENT_ID = DE.DEPARTMENT_ID
LEFT JOIN TSYS_USER US ON US.USER_ID = SC.ENTRY_USER_ID 
GROUP BY SC.STUDY_ACADEMIC_YEAR,SC.STUDY_SEMESTER_CODE,DE.DEPARTMENT_NAME,CS.DEPARTMENT_ID,CS.COURSE_NO,CS.NAME,SC.ENTRY_TYPE,SC.ENTRY_USER_ID,SC.COURSE_ID,US.ACCOUNT_NAME,US.USER_NAME,SC.AUDIT_STATUS,SC.IS_MODIFY) AP
;

CREATE OR REPLACE VIEW VSCOR_APPROVAL_DETAIL AS 
SELECT SC.*,REOR.CN_NAME AS SCOREREGIMENTNAME,REVA.CN_NAME AS SCOREREGIMENTNAMEOLD,SP.NAME AS ORSPECIALNAME,ST.STUDENT_NO,ST.STUDENT_NAME,ST.SEX_CODE,VALI.USUAL_SCORE AS USUAL_SCORE_OLD,VALI.MIDTERM_SCORE AS MIDTERM_SCORE_OLD,VALI.ENDTERM_SCORE AS ENDTERM_SCORE_OLD,VALI.SKILL_SCORE AS SKILL_SCORE_OLD,VALI.TOTAL_SCORE AS TOTAL_SCORE_OLD,SPVALI.NAME AS VASPECIALNAME 
FROM TSCOR_ORIGINAL_SCORE SC 
LEFT JOIN TSTU_STUDENT ST ON SC.STUDENT_ID = ST.USER_ID 
LEFT JOIN TSCOR_VALIDITY_SCORE VALI ON SC.STUDY_ACADEMIC_YEAR = VALI.STUDY_ACADEMIC_YEAR and SC.STUDY_SEMESTER_CODE = VALI.STUDY_SEMESTER_CODE and SC.COURSE_ID = VALI.COURSE_ID and SC.STUDENT_ID = VALI.STUDENT_ID 
LEFT JOIN TSCOR_SPECIAL_CASE SP ON SC.SPECIAL_CASE_ID=SP.SPECIAL_CASE_ID 
LEFT JOIN TSCOR_SPECIAL_CASE SPVALI ON VALI.SPECIAL_CASE_ID=SPVALI.SPECIAL_CASE_ID
LEFT JOIN TSCOR_SCORE_REGIMEN_DETAIL REOR ON SC.SCORE_REGIMEN_ID=REOR.SCORE_REGIMEN_ID and SC.TOTAL_SCORE=REOR.SCORE_REGIMEN_DETAIL_ID
LEFT JOIN TSCOR_SCORE_REGIMEN_DETAIL REVA ON VALI.SCORE_REGIMEN_ID=REVA.SCORE_REGIMEN_ID and VALI.TOTAL_SCORE=REVA.SCORE_REGIMEN_DETAIL_ID
;

CREATE OR REPLACE VIEW VSCOR_ORIGINAL_VALIDITY AS 
select ORI.*,SC.VALIDITY_SCORE_ID,SC.FINAL_PERCENTAGE_SCORE,CO.CREDIT,SC.AGO_FINAL_PERCENTAGE_SCORE 
from TSCOR_ORIGINAL_SCORE ORI 
LEFT JOIN TSCOR_VALIDITY_SCORE SC 
ON ORI.STUDY_ACADEMIC_YEAR = SC.STUDY_ACADEMIC_YEAR 
and ORI.STUDY_SEMESTER_CODE = SC.STUDY_SEMESTER_CODE 
and ORI.COURSE_ID = SC.COURSE_ID 
and ORI.STUDENT_ID = SC.STUDENT_ID
LEFT JOIN TTRAP_COURSE CO ON ORI.COURSE_ID = CO.COURSE_ID
;

CREATE OR REPLACE VIEW VSCOR_STUDENT_SCORE_QUERY AS 
SELECT DE.CN_NAME AS REGIMEN_NAME,VA.VALIDITY_SCORE_ID,VA.ACADEMIC_YEAR,VA.SEMESTER_CODE,VA.USUAL_SCORE,VA.MIDTERM_SCORE,VA.ENDTERM_SCORE,VA.SKILL_SCORE,VA.FINAL_TOTAL_SCORE,VA.FINAL_PERCENTAGE_SCORE,VA.SCORE_POINT,VA.FINAL_SCORE_POINT,VA.TACHE_SUBJECT,SP.NAME as SPECIAL_CASE_NAME,MA.DEPARTMENT_ID,CL.MAJOR_ID,
ST.STUDENT_NO,ST.STUDENT_NAME,ST.USER_ID,ST.GRADE,CL.CLASS_NAME,CL.CLASS_ID,CO.COURSE_NO,CO.NAME AS COURSE_NAME,CO.COURSE_OR_TACHE,CO.CREDIT,PL.COURSE_ATTRIBUTE_CODE,PL.CHECK_WAY_CODE,PL.COURSE_TYPE_CODE,CO.TACHE_TYPE_CODE,US.USER_NAME,US.ACCOUNT_NAME,VA.ENTRY_TIME,VA.REMARK,VA.IS_MEET_THE_MARK,VA.STUDY_ACADEMIC_YEAR,VA.STUDY_SEMESTER_CODE,ST.SCHOOL_STATUS_CODE,TI.RELEASE_STATUS 
FROM TSCOR_VALIDITY_SCORE VA 
INNER JOIN TSTU_STUDENT ST ON VA.STUDENT_ID = ST.USER_ID
LEFT JOIN TSTU_CLASS CL ON ST.ClASS_ID = CL.ClASS_ID 
LEFT JOIN TSYS_MAJOR MA ON CL.MAJOR_ID = MA.MAJOR_ID 
LEFT JOIN TTRAP_COURSE CO ON VA.COURSE_ID = CO.COURSE_ID 
LEFT JOIN TSYS_USER US ON VA.ENTRY_USER_ID = US.USER_ID 
LEFT JOIN TSCOR_SPECIAL_CASE SP ON VA.SPECIAL_CASE_ID=SP.SPECIAL_CASE_ID 
LEFT JOIN TSCOR_SCORE_REGIMEN_DETAIL DE ON VA.FINAL_TOTAL_SCORE = DE.SCORE_REGIMEN_DETAIL_ID 
LEFT JOIN TTRAP_GRADE_MAJOR GM ON GM.GRADE=ST.GRADE and GM.MAJOR_ID=MA.MAJOR_ID 
LEFT JOIN TTRAP_STARTCLASS_PLAN PL ON PL.COURSE_ID=VA.COURSE_ID and PL.GRADE_MAJOR_ID=GM.GRADE_MAJOR_ID  and VA.STUDY_ACADEMIC_YEAR=PL.ACADEMIC_YEAR and VA.STUDY_SEMESTER_CODE=PL.SEMESTER_CODE
LEFT JOIN TSCOR_RELEASE_TIME TI ON VA.STUDY_ACADEMIC_YEAR=TI.ACADEMIC_YEAR and VA.STUDY_SEMESTER_CODE=TI.SEMESTER_CODE
;



CREATE OR REPLACE VIEW VSCOR_ACADEMICYEAR_SEMESTER AS 
select ARCHIVES_REGISTER_ID,ACADEMIC_YEAR,SEMESTER_CODE,USER_ID from TSTU_ARCHIVES_REGISTER
;

CREATE OR REPLACE FORCE VIEW VSCOR_RELEASE_TIME_RESULT ("ID", "ACADEMIC_YEAR", "SEMESTER_CODE", "RELEASE_STATUS", "OPERATE_TIME", "RELEASE_TIME_ID") AS 
  SELECT
(TS.ACADEMIC_YEAR || TS.SEMESTER_CODE || RE.RELEASE_TIME_ID) id,
ts.ACADEMIC_YEAR,
TS.SEMESTER_CODE,
RE.RELEASE_STATUS,
RE.OPERATE_TIME,
RE.RELEASE_TIME_ID
from 
TSYS_SCHOOL_CALENDAR ts 
LEFT JOIN TSCOR_RELEASE_TIME re on TS.ACADEMIC_YEAR = RE.ACADEMIC_YEAR and TS.SEMESTER_CODE = RE.SEMESTER_CODE;

CREATE OR REPLACE FORCE VIEW VSCOR_MARKUP_SCORE_OPERATOR("ID", "STUDY_ACADEMIC_YEAR", "STUDY_SEMESTER_CODE", "OPEN_DEPARTMENT_ID", "OPEN_DEPARTMENT_NAME", "COURSE_ID", "COURSE_NAME", "COURSE_NO", "COURSE_SCORE_SET_ID", "TEACHER_NAME", "TEACHER_NO", "USER_ID") AS 
  SELECT  
  t.COURSE_ID as ID,
  t.STUDY_ACADEMIC_YEAR, -- �޶�ѧ��
  t.STUDY_SEMESTER_CODE, -- �޶�ѧ��
  DE.DEPARTMENT_ID OPEN_DEPARTMENT_ID, -- ���ε�λid
  DE.DEPARTMENT_NAME AS OPEN_DEPARTMENT_NAME, -- ���ε�λ����
  CO.COURSE_ID, -- �γ�id
  CO.NAME COURSE_NAME, -- �γ�����
  co.COURSE_NO,
  CS .COURSE_SCORE_SET_ID,
  te.TEACHER_NAME,
  te.TEACHER_NO,
  te.USER_ID 
from 
(
SELECT
  DISTINCT VS.COURSE_ID,
  VS.STUDY_ACADEMIC_YEAR, -- �޶�ѧ��
  VS.STUDY_SEMESTER_CODE -- �޶�ѧ��
FROM TSCOR_VALIDITY_SCORE VS where VS.FINAL_PERCENTAGE_SCORE<60
)t
LEFT JOIN TTRAP_COURSE CO ON t.COURSE_ID=CO.COURSE_ID  -- �γ���Ϣ
LEFT JOIN TSYS_DEPARTMENT DE ON CO.DEPARTMENT_ID = DE.DEPARTMENT_ID  -- ���ε�λ
LEFT JOIN TSCOR_COURSE_SCORE_SET CS ON CS.ACADEMIC_YEAR = t.STUDY_ACADEMIC_YEAR AND CS.SEMESTER_CODE = t.STUDY_SEMESTER_CODE AND CS.COURSE_ID = t.COURSE_ID and cs.score_type = 2
LEFT JOIN VCOUP_TEACHERINFO te ON CS.entry_user_id = te.user_id
where co .COURSE_OR_TACHE =1
;

CREATE OR REPLACE VIEW VSCOR_COURSE_SCORE_FOR_TEACH AS 
SELECT
(H.ACADEMIC_YEAR || H.SEMESTER_CODE || H.COURSE_ID || H.THEORETICAL_TASK_ID) AS ID, 
H.NEED_ENTRY, -- ��¼��
H.HAS_ENTRY, -- ��¼��
H.ACADEMIC_YEAR, -- ѧ��
H.SEMESTER_CODE, -- ѧ��
H.COURSE_ID, -- �γ�id
H.THEORETICAL_TASK_ID, -- ��ѧ��id
H.AUDIT_STATUS, -- ���״̬
H.ENTRY_USER_ID, -- ¼����id
CO.NAME AS COURSE_NAME, -- �γ�����
CO.COURSE_NO, -- �γ̺�
CO.BIG_COURSE_CODE, -- �γ̴���
TT.TEACHING_CLASS_NO -- ��ѧ���
FROM
(
SELECT 
COUNT(cse.USER_ID) as NEED_ENTRY, -- ��¼��
COUNT(cse.PERCENTAGE_SCORE) AS HAS_ENTRY,  -- ��¼��
cse.ACADEMIC_YEAR, -- ѧ��
cse.SEMESTER_CODE, -- ѧ��
cse.COURSE_ID, -- �γ�id
cse.THEORETICAL_TASK_ID,  -- ��ѧ��id
max(CSE.AUDIT_STATUS) AUDIT_STATUS, -- ���״̬�����ֵΪ3������ˣ����ֵΪ2�������󣬷���δ����
cse.ENTRY_USER_ID --¼����id
FROM VSCOR_COURSE_SCORE_ENTRY cse
GROUP BY cse.ACADEMIC_YEAR,cse.SEMESTER_CODE, cse.COURSE_ID,cse.THEORETICAL_TASK_ID,cse.ENTRY_USER_ID
) H 
LEFT JOIN TTRAP_COURSE co ON H.COURSE_ID=CO.COURSE_ID
LEFT JOIN TCOUP_THEORETICAL_TASK TT ON H.THEORETICAL_TASK_ID = TT.THEORETICAL_TASK_ID
;

CREATE OR REPLACE VIEW VSCOR_TACHE_SCORE_ENTRY_TEACH AS
SELECT 
(H.ACADEMIC_YEAR || H.SEMESTER_CODE || H.COURSE_ID || H.CLASS_ID || H.ENTRY_USER_ID) AS ID, 
H.NEED_ENTRY, -- ��¼��
H.HAS_ENTRY, -- ��¼��
H.ACADEMIC_YEAR, -- ѧ��
H.SEMESTER_CODE, -- ѧ��
H.COURSE_ID, -- �γ�id
H.CLASS_ID, -- �༶id
H.AUDIT_STATUS, -- ���״̬
H.ENTRY_USER_ID, -- ¼����id
CO.NAME AS COURSE_NAME, -- �γ�����
CO.COURSE_NO, -- �γ̺�
CO.TACHE_TYPE_CODE, -- �������
cl.CLASS_NAME -- �༶����
FROM
(
SELECT
COUNT(tse.USER_ID) as NEED_ENTRY, -- ��¼��
COUNT(tse.PERCENTAGE_SCORE) AS HAS_ENTRY,  -- ��¼��
tse.ACADEMIC_YEAR, -- ѧ��
tse.SEMESTER_CODE, -- ѧ��
tse.COURSE_ID, -- �γ�id
tse.CLASS_ID,  -- �༶id
max(tse.AUDIT_STATUS) AUDIT_STATUS, -- ���״̬�����ֵΪ3������ˣ����ֵΪ2�������󣬷���δ����
tse.ENTRY_USER_ID --¼����id
FROM VSCOR_TACHE_SCORE_ENTRY tse
GROUP BY tse.ACADEMIC_YEAR,tse.SEMESTER_CODE, tse.COURSE_ID,tse.CLASS_ID,tse.ENTRY_USER_ID              
) H
LEFT JOIN TTRAP_COURSE co ON H.COURSE_ID=CO.COURSE_ID
LEFT JOIN TSTU_CLASS cl ON H.CLASS_ID=CL.CLASS_ID
;

CREATE OR REPLACE VIEW VSCOR_MARKUP_SCORE_ENTRY_TEACH AS
SELECT
(H.STUDY_ACADEMIC_YEAR || H.STUDY_SEMESTER_CODE ||H.OPEN_DEPARTMENT_ID || H.COURSE_ID || H.ENTRY_USER_ID) AS ID, 
H.NEED_ENTRY, -- ��¼��
H.HAS_ENTRY, -- ��¼��
H.STUDY_ACADEMIC_YEAR, -- ѧ��
H.STUDY_SEMESTER_CODE, -- ѧ��
H.OPEN_DEPARTMENT_ID, -- ���ε�λ
H.COURSE_ID, -- �γ�id
H.AUDIT_STATUS, -- ���״̬
H.ENTRY_USER_ID, -- ¼����id
CO.NAME AS COURSE_NAME, -- �γ�����
CO.COURSE_NO, -- �γ̺�
de.DEPARTMENT_NAME -- ���ε�λ����
FROM
(
SELECT 
COUNT(mse.USER_ID) as NEED_ENTRY, -- ��¼��
COUNT(mse.PERCENTAGE_SCORE) AS HAS_ENTRY,  -- ��¼��
mse.STUDY_ACADEMIC_YEAR, -- ѧ��
mse.STUDY_SEMESTER_CODE, -- ѧ��
mse.OPEN_DEPARTMENT_ID, -- ���ε�λ
mse.COURSE_ID, -- �γ�id
max(mse.AUDIT_STATUS) AUDIT_STATUS, -- ���״̬�����ֵΪ3������ˣ����ֵΪ2�������󣬷���δ����
mse.ENTRY_USER_ID --¼����id
FROM VSCOR_MARKUP_SCORE_ENTRY mse
GROUP BY mse.STUDY_ACADEMIC_YEAR,mse.STUDY_SEMESTER_CODE,MSE.OPEN_DEPARTMENT_ID, mse.COURSE_ID,mse.ENTRY_USER_ID
) H 
LEFT JOIN TTRAP_COURSE co ON H.COURSE_ID=CO.COURSE_ID
LEFT JOIN TSYS_DEPARTMENT de ON H.OPEN_DEPARTMENT_ID=de.DEPARTMENT_ID
;

CREATE OR REPLACE VIEW VSCOR_TEACHING_SCORE AS --��ѧ��ɼ�
SELECT
 TCS.TEACHING_CLASS_STUDENT_ID ID,-- ��ѡ��ѧ��Id
 TCS.ACADEMIC_YEAR,-- ѧ��
 TCS.SEMESTER_CODE,-- ѧ��
 TCS.USER_ID,-- ѧ��ID
 STU.STUDENT_NAME,-- ѧ������
 STU.STUDENT_NO,-- ѧ��
 STU.SEX_CODE,-- �Ա�
 AR.CLASS_ID,-- �༶ID
 CL.GRADE,-- �꼶
 CL.CLASS_NAME,-- �༶����
 TT.COURSE_ID,-- �γ�Id
 TC.COURSE_NO, -- �γ̺�
 TC.NAME AS COURSE_NAME, --�γ�����
 TT.TEACHING_CLASS_NO, -- ��ѧ���
TT.THEORETICAL_TASK_ID,--��ѧ��id
VS.FINAL_PERCENTAGE_SCORE, --�����ɼ�����Ӧ�İٷ��Ƴɼ���
TTS.TEACHERS,--�ον�ʦ
 (CASE SR.IS_HIERARCHICAL when 1 THEN
(SELECT CN_NAME FROM TSCOR_SCORE_REGIMEN_DETAIL WHERE SCORE_REGIMEN_DETAIL_ID=VS .FINAL_TOTAL_SCORE)
ELSE VS .FINAL_TOTAL_SCORE END) TOTAL_SCOREALL,
(CASE IS_MEET_THE_MARK WHEN 1 THEN TC.CREDIT
ELSE 0 END) CREDIT,--ȡ��ѧ��
VS.SCORE_POINT ,-- ����
VS.FINAL_SCORE_POINT ,-- ѧ�ּ���
VS.SPECIAL_CASE_ID,--�������
CS.NAME SPECIAL_CASE_NAME,
RT.RELEASE_STATUS,--����״̬
VS.REMARK --��ע
FROM
 TCHOC_TEACHING_CLASS_STUDENT TCS
LEFT JOIN TCOUP_THEORETICAL_TASK TT ON TCS.THEORETICAL_TASK_ID = TT.THEORETICAL_TASK_ID-- �õ� ��ѧ����
LEFT JOIN TTRAP_COURSE TC ON TT.COURSE_ID = TC.COURSE_ID -- �γ� �õ��γ̺ź�����
LEFT JOIN TSTU_STUDENT STU ON TCS.USER_ID = STU.USER_ID -- ѧ����Ϣ
LEFT JOIN TSTU_ARCHIVES_REGISTER AR ON (
  AR.USER_ID = STU.USER_ID
  AND TCS.ACADEMIC_YEAR = AR.ACADEMIC_YEAR
  AND TCS.SEMESTER_CODE = AR.SEMESTER_CODE
)
LEFT JOIN TSTU_CLASS CL ON CL.CLASS_ID = AR.CLASS_ID-- �༶��Ϣ
LEFT JOIN TSYS_MAJOR MA ON MA.MAJOR_ID = CL.MAJOR_ID-- רҵ��Ϣ
INNER JOIN TSCOR_VALIDITY_SCORE VS ON VS.STUDENT_ID=STU.USER_ID AND VS.COURSE_ID=TT.COURSE_ID 
AND VS.STUDY_ACADEMIC_YEAR=TCS.ACADEMIC_YEAR AND VS.STUDY_SEMESTER_CODE=TCS.SEMESTER_CODE
LEFT JOIN TSCOR_SPECIAL_CASE CS ON CS.SPECIAL_CASE_ID =VS.SPECIAL_CASE_ID
LEFT JOIN TSCOR_SCORE_REGIMEN SR ON SR.SCORE_REGIMEN_ID=VS.SCORE_REGIMEN_ID
LEFT JOIN (
	-- �������������ʦ
	SELECT DISTINCT
		THETE.THEORETICAL_TASK_ID,
		(
			WMSYS.WM_CONCAT (TO_CHAR(THETE.TEACHER_ID)) OVER (
				PARTITION BY THETE.THEORETICAL_TASK_ID
			)
		) TEACHERS
	FROM
		TCOUP_THEORETICAL_TEACHERS THETE
	LEFT JOIN TSYS_TEACHER TCR ON TCR.USER_ID = THETE.TEACHER_ID
) TTS ON TTS.THEORETICAL_TASK_ID = TT.THEORETICAL_TASK_ID
INNER JOIN TSCOR_RELEASE_TIME RT ON RT.ACADEMIC_YEAR=TCS.ACADEMIC_YEAR AND RT.SEMESTER_CODE =TCS.SEMESTER_CODE  AND RT.RELEASE_STATUS=1
;

CREATE OR REPLACE VIEW VSCOR_TACHE_SCORE AS --���ڳɼ�
SELECT
ARCR.STUDENT_ID AS ID,
	PRAS.COURSE_ID,
  PRAS.TEACHER_IDS,
	ARCR."ACADEMIC_YEAR",ARCR."SEMESTER_CODE",ARCR."CLASS_ID",ARCR."STUDENT_ID",ARCR."CAMPUS_ID",ARCR."MAJOR_ID",ARCR."GRADE",ARCR."STUDENT_NO",ARCR."SEX_CODE",ARCR."STUDENT_NAME",ARCR."CLASS_NAME",
  VS.FINAL_PERCENTAGE_SCORE, --�����ɼ�����Ӧ�İٷ��Ƴɼ���
  SR.IS_HIERARCHICAL,
 (CASE SR.IS_HIERARCHICAL when 1 THEN
    (SELECT CN_NAME FROM TSCOR_SCORE_REGIMEN_DETAIL WHERE SCORE_REGIMEN_DETAIL_ID=VS .FINAL_TOTAL_SCORE)
     ELSE VS .FINAL_TOTAL_SCORE END) TOTAL_SCOREALL,
  (CASE IS_MEET_THE_MARK WHEN 1 THEN CO.CREDIT  ELSE 0 END) CREDIT,--ȡ��ѧ��
 VS.SCORE_POINT ,-- ����
 VS.FINAL_SCORE_POINT ,-- ѧ�ּ���
 VS.SPECIAL_CASE_ID,--�������
 CS.NAME SPECIAL_CASE_NAME,
CO.COURSE_NO,
CO.NAME COURSE_NAME,
RT.RELEASE_STATUS,--�Ƿ񷢲�
 VS.REMARK --��ע
FROM
	(
SELECT
AR.ACADEMIC_YEAR,
AR.SEMESTER_CODE,
AR.CLASS_ID,
AR.USER_ID AS STUDENT_ID,
CL.CAMPUS_ID,
CL.MAJOR_ID,
CL.GRADE,
ST.STUDENT_NO,
ST.SEX_CODE,
ST.STUDENT_NAME,
CL.CLASS_NAME
FROM TSTU_ARCHIVES_REGISTER AR -- ѧ��ע��
LEFT JOIN TSTU_CLASS CL ON AR.CLASS_ID=CL.CLASS_ID  -- �����༶
INNER JOIN TSTU_STUDENT ST ON AR.USER_ID=ST.USER_ID -- ѧ����Ϣ
) ARCR
LEFT JOIN (
	SELECT DISTINCT
		PRAA.ACADEMIC_YEAR,
		PRAA.SEMESTER_CODE,
		PRAA.COURSE_ID,
		PRA.STUDENT_ID,
		TEACHER_IDS
	FROM
		TCOUP_PRACTICAL_STUDENT PRA --ʵ������ѧ����
	LEFT JOIN TCOUP_PRACTICAL_ARRANGE PRAA ON PRAA.PRACTICAL_ARRANGE_ID = PRA.PRACTICAL_ARRANGE_ID --ʵ����������
	LEFT JOIN (
		SELECT
			PRACTICAL_ARRANGE_ID,
			(
				WMSYS.WM_CONCAT (TO_CHAR(TEACHER_ID)) OVER (
					PARTITION BY PRACTICAL_ARRANGE_ID
				)
			) TEACHER_IDS
		FROM
			TCOUP_PRACTICAL_TEACHER --ʵ������ָ����ʦ��
	) PRAT ON PRAT.PRACTICAL_ARRANGE_ID = PRA.PRACTICAL_ARRANGE_ID 
) PRAS ON PRAS.ACADEMIC_YEAR = ARCR.ACADEMIC_YEAR
AND PRAS.SEMESTER_CODE = ARCR.SEMESTER_CODE
AND PRAS.STUDENT_ID = ARCR.STUDENT_ID
INNER JOIN TSCOR_VALIDITY_SCORE VS -- ��Ч�ɼ�
ON VS.STUDENT_ID=PRAS.STUDENT_ID AND VS.COURSE_ID=PRAS.COURSE_ID AND VS.STUDY_ACADEMIC_YEAR=ARCR.ACADEMIC_YEAR AND VS.STUDY_SEMESTER_CODE=ARCR.SEMESTER_CODE
LEFT JOIN TSCOR_SPECIAL_CASE CS --�������
ON CS.SPECIAL_CASE_ID =VS.SPECIAL_CASE_ID
LEFT JOIN TSCOR_SCORE_REGIMEN SR ON SR.SCORE_REGIMEN_ID=VS.SCORE_REGIMEN_ID
LEFT JOIN TTRAP_COURSE CO ON CO.COURSE_ID=VS.COURSE_ID
INNER JOIN TSCOR_RELEASE_TIME RT ON RT.ACADEMIC_YEAR=ARCR.ACADEMIC_YEAR AND RT.SEMESTER_CODE =ARCR.SEMESTER_CODE  AND RT.RELEASE_STATUS=1
;

CREATE OR REPLACE VIEW VSCOR_CLASS_SCORE AS --������ɼ�
SELECT
(VS.STUDENT_ID||H.ACADEMIC_YEAR||VS.VALIDITY_SCORE_ID) ID, --����id
H.ACADEMIC_YEAR,--ѧ��
H.SEMESTER_CODE,--ѧ��
VS.STUDENT_ID,--ѧ��id
F.STUDENT_NAME,--ѧ������
F.STUDENT_NO,--ѧ��
 F.SEX_CODE,-- �Ա�
 F.CLASS_ID,-- �༶ID
 F.GRADE,-- �꼶
 F.CLASS_NAME,-- �༶����
 F.TEACHER_ID,--����Ա
 VS.COURSE_ID,-- �γ�Id
 H.COURSE_NO, -- �γ̺�
 H.NAME AS COURSE_NAME, --�γ�����
VS.FINAL_PERCENTAGE_SCORE, --�����ɼ�����Ӧ�İٷ��Ƴɼ���
SR.IS_HIERARCHICAL,
 (CASE SR.IS_HIERARCHICAL when 1 THEN
(SELECT CN_NAME FROM TSCOR_SCORE_REGIMEN_DETAIL WHERE SCORE_REGIMEN_DETAIL_ID=VS .FINAL_TOTAL_SCORE)
ELSE VS .FINAL_TOTAL_SCORE END) TOTAL_SCOREALL,
(CASE IS_MEET_THE_MARK WHEN 1 THEN H.CREDIT
ELSE 0 END) CREDIT,--ȡ��ѧ��
VS.SCORE_POINT ,-- ����
VS.FINAL_SCORE_POINT ,-- ѧ�ּ���
VS.SPECIAL_CASE_ID,--�������
CS.NAME SPECIAL_CASE_NAME,
VS.REMARK --��ע
FROM
( SELECT
  SP.STARTCLASS_PLAN_ID,
  SP.ACADEMIC_YEAR,
  SP.SEMESTER_CODE,
  SP.CHECK_WAY_CODE,
  SP.CLASS_TYPE,
  SP.COURSE_ID,
  CO.CREDIT,
  CL.CLASS_ID,
  GM.GRADE,
  GM.MAJOR_ID,
  CO.COURSE_NO,
  CO.NAME,
  DE.DEPARTMENT_ID
  FROM TTRAP_STARTCLASS_PLAN SP  -- ���μƻ�
  LEFT JOIN TTRAP_GRADE_MAJOR GM  ON  SP.GRADE_MAJOR_ID = GM.GRADE_MAJOR_ID   -- �꼶רҵ
  LEFT JOIN TSTU_CLASS CL ON CL.GRADE = GM.GRADE AND CL.MAJOR_ID = GM.MAJOR_ID  -- �����༶
  LEFT JOIN TTRAP_COURSE CO ON SP.COURSE_ID =CO.COURSE_ID   -- �γ���Ϣ
  LEFT JOIN TSYS_MAJOR MA ON GM.MAJOR_ID = MA.MAJOR_ID  -- רҵ
  LEFT JOIN TSYS_DEPARTMENT DE on MA.department_id = DE.department_id -- Ժϵ
  WHERE sp.TEMP_FLAG=0) H
INNER  JOIN
(SELECT
AR.ACADEMIC_YEAR,
AR.SEMESTER_CODE,
AR.CLASS_ID,
AR.USER_ID,
CL.CAMPUS_ID,
CL.MAJOR_ID,
CL.GRADE,
ST.STUDENT_NO,
ST.SEX_CODE,
ST.STUDENT_NAME,
CL.CLASS_NAME,
CL.USER_ID TEACHER_ID
FROM TSTU_ARCHIVES_REGISTER AR -- ѧ��ע��
LEFT JOIN TSTU_CLASS CL ON AR.CLASS_ID=CL.CLASS_ID  -- �����༶
INNER JOIN TSTU_STUDENT ST ON AR.USER_ID=ST.USER_ID -- ѧ����Ϣ
) F
ON F.ACADEMIC_YEAR=H.ACADEMIC_YEAR AND F.SEMESTER_CODE=H.SEMESTER_CODE AND H.CLASS_ID=F.CLASS_ID AND F.MAJOR_ID=H.MAJOR_ID AND F.GRADE=H.GRADE
INNER JOIN TSCOR_VALIDITY_SCORE VS -- ��Ч�ɼ�
ON VS.STUDENT_ID=F.USER_ID AND VS.COURSE_ID=H.COURSE_ID AND VS.STUDY_ACADEMIC_YEAR=H.ACADEMIC_YEAR AND VS.STUDY_SEMESTER_CODE=H.SEMESTER_CODE
LEFT JOIN TSCOR_SPECIAL_CASE CS --�������
ON CS.SPECIAL_CASE_ID =VS.SPECIAL_CASE_ID
LEFT JOIN TSCOR_SCORE_REGIMEN SR ON SR.SCORE_REGIMEN_ID=VS.SCORE_REGIMEN_ID
INNER JOIN TSCOR_RELEASE_TIME RT ON RT.ACADEMIC_YEAR=H.ACADEMIC_YEAR AND RT.SEMESTER_CODE =H.SEMESTER_CODE  AND RT.RELEASE_STATUS=1
;

--�ύ
COMMIT;
