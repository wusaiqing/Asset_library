/*
 �������--���󴴽�
*/
declare
      num   number;
begin
    select count(1) into num from user_tables where table_name = upper('TSYS_DATA_DICTIONARY') ;
    if num > 0 then
        execute immediate 'drop table TSYS_DATA_DICTIONARY' ;
    end if;
    
    select count(1) into num from user_tables where table_name = upper('TSYS_MENU') ;
    if num > 0 then
        execute immediate 'drop table TSYS_MENU' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSYS_ROLE') ;
    if num > 0 then
        execute immediate 'drop table TSYS_ROLE' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSYS_ROLE_MENU_PERMISSION') ;
    if num > 0 then
        execute immediate 'drop table TSYS_ROLE_MENU_PERMISSION' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSYS_ROLE_USER') ;
    if num > 0 then
        execute immediate 'drop table TSYS_ROLE_USER' ;
    end if;

    select count(1) into num from user_tables where table_name = upper('TSYS_USER') ;
    if num > 0 then
        execute immediate 'drop table TSYS_USER' ;
    end if;
end;
/
/*==============================================================*/
/* Table: TSYS_USER                                             */
/*==============================================================*/
create table TSYS_USER 
(
   USER_ID              NVARCHAR2(50)         not null,
   USER_NAME            NVARCHAR2(50)         not null,
   USER_NO              NVARCHAR2(50),
   USER_TYPE            INTEGER              not null,
   ACCOUNT_TYPE         INTEGER              not null,
   ACCOUNT_NAME         NVARCHAR2(50)         not null,
   ACCOUNT_PASSWORD     NVARCHAR2(100)        not null,
   IS_ENABLED           INTEGER              not null,
   DESCRIPTION          NVARCHAR2(50),
   ORDER_NO             INTEGER              not null,
   CREATE_USER_ID       NVARCHAR2(50)         not null,
   CREATE_TIME          TIMESTAMP            not null,
   UPDATE_USER_ID       NVARCHAR2(50)         not null,
   UPDATE_TIME          TIMESTAMP            not null,
   DEPTMENT_ID          NVARCHAR2(50),
   constraint PK_TAPP_USER primary key (USER_ID)
);

/*==============================================================*/
/* Table: TSYS_ROLE_USER                                        */
/*==============================================================*/
create table TSYS_ROLE_USER 
(
   ROLE_USER_ID         NVARCHAR2(50)         not null,
   ROLE_ID              NVARCHAR2(50)         not null,
   USER_ID              NVARCHAR2(50)         null,
   ORDER_NO             INTEGER              not null,
   constraint PK_TAPP_USER_ROLE primary key (ROLE_USER_ID)
);

/*==============================================================*/
/* Table: TSYS_ROLE                                             */
/*==============================================================*/
create table TSYS_ROLE 
(
   ROLE_ID              NVARCHAR2(50)         not null,
   ROLE_NAME            NVARCHAR2(50)         not null,
   CODE                 NVARCHAR2(50),
   IS_SYSTEM            INTEGER              not null,
   DESCRIPTION          NVARCHAR2(200),
   CAN_BE_ASSIGNED      INTEGER,
   IS_ENABLED           INTEGER              not null,
   OWNER_USER_ID        NVARCHAR2(50)         not null,
   ORDER_NO             INTEGER              not null,
   CREATE_USER_ID       NVARCHAR2(50)         not null,
   CREATE_TIME          TIMESTAMP            not null,
   UPDATE_USER_ID       NVARCHAR2(50)         not null,
   UPDATE_TIME          TIMESTAMP            not null,
   ROLE_TYPE  			INTEGER,              
   constraint PK_TAPP_ROLE primary key (ROLE_ID)
);
ALTER TABLE TSYS_ROLE ADD CONSTRAINT  UK_TSYS_ROLE_ROLE_NAME UNIQUE (ROLE_NAME);

/*==============================================================*/
/* Table: TSYS_ROLE_MENU_PERMISSION                             */
/*==============================================================*/
create table TSYS_ROLE_MENU_PERMISSION 
(
   ROLE_MENU_PERMISSION_ID NVARCHAR2(50)         not null,
   ROLE_ID              NVARCHAR2(50),
   MENU_ID              NVARCHAR2(50),
   constraint PK_TAPP_ROLE_OBJ_PRIV primary key (ROLE_MENU_PERMISSION_ID)
);

/*==============================================================*/
/* Table: TSYS_MENU                                             */
/*==============================================================*/
create table TSYS_MENU 
(
   MENU_ID              NVARCHAR2(50)         not null,
   MENU_NAME            NVARCHAR2(50)         not null,
   MENU_TYPE            INTEGER              not null,
   IMAGE_CLASS          NVARCHAR2(50),
   URL                  NVARCHAR2(500),
   PERMISSION_CODE      NVARCHAR2(200)       not null,
   IS_ENABLED           INTEGER              not null,
   IS_EXPAND            INTEGER              not null,
   IS_SYSTEM            INTEGER              not null,
   CAN_BE_ASSIGNED      INTEGER              not null,
   OWNER_USER_ID        NVARCHAR2(50)         not null,
   TAG                  NVARCHAR2(200),
   TARGET               INTEGER              not null,
   DESCRIPTION          NVARCHAR2(200),
   CHILD_COUNT          INTEGER              not null,
   PARENT_ID            NVARCHAR2(50)         not null,
   PARENT_ID_LIST       NVARCHAR2(300)        not null,
   ORDER_NO             INTEGER              not null,
   CREATE_USER_ID       NVARCHAR2(50)         not null,
   CREATE_TIME          TIMESTAMP            not null,
   UPDATE_USER_ID       NVARCHAR2(50)         not null,
   UPDATE_TIME          TIMESTAMP            not null,
   constraint PK_TAPP_FOLDER primary key (MENU_ID)
);

/*==============================================================*/
/* Table: TSYS_DATA_DICTIONARY                                  */
/*==============================================================*/
create table TSYS_DATA_DICTIONARY 
(
   DATA_DICTIONARY_ID   NVARCHAR2(50)         not null,
   DATA_DICTIONARY_NAME NVARCHAR2(50)         not null,
   CODE                 NVARCHAR2(50)         not null,
   DESCRIPTION          NVARCHAR2(100),
   DATA_DICTIONARY_TYPE NVARCHAR2(50)         not null,
   IS_SYSTEM            INTEGER              not null,
   CHILD_COUNT          INTEGER              not null,
   PARENT_ID            NVARCHAR2(50)         not null,
   PARENT_ID_LIST       NVARCHAR2(300)        not null,
   ORDER_NO             INTEGER              not null,
   IS_ENABLED           INTEGER              not null,
   IS_DELETED           INTEGER              not null,
   CREATE_USER_ID       NVARCHAR2(50),
   CREATE_TIME          TIMESTAMP            not null,
   UPDATE_USER_ID       NVARCHAR2(50)         not null,
   UPDATE_TIME          TIMESTAMP            not null,
   constraint PK_TAPP_DATA_DICT primary key (DATA_DICTIONARY_ID)
);

/*
 �������--���ݳ�ʼ��
*/
-- �˵�
/*
 �������--ɾ��ԭ�в˵�
*/ 
delete  TSYS_MENU t where t.MENU_ID in 
(
select menu_id from tsys_menu where parent_id_list like '%,9f8ce4140db84373a4d755baf4729437%'
) ;
commit;

INSERT INTO TSYS_MENU VALUES ('9f8ce4140db84373a4d755baf4729437','ϵͳ����',1,'fa fa-cog','','Udf_Sys',1,1,1,1,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',5,'0','0,9f8ce4140db84373a4d755baf4729437',1,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);

INSERT INTO TSYS_MENU VALUES ('62879cc9082b48d8aa95ac5edd14652b','�˵�����',2,'fa fa-th-large','udf/menu/html/list.html','Udf_Sys_MenuManage',1,1,1,0,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',4,'9f8ce4140db84373a4d755baf4729437','0,9f8ce4140db84373a4d755baf4729437,62879cc9082b48d8aa95ac5edd14652b',1,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);

INSERT INTO TSYS_MENU VALUES ('ddf96020b2ba4a368758cc86b169d206','�û�����',2,'fa fa-users','udf/user/html/list.html','Udf_Sys_UserManage',1,1,1,1,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',3,'9f8ce4140db84373a4d755baf4729437','0,9f8ce4140db84373a4d755baf4729437,ddf96020b2ba4a368758cc86b169d206',3,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);

INSERT INTO TSYS_MENU VALUES ('53f8533d15c6439bb7191691dbeeb894','��ɫ����',2,'fa fa-user','udf/role/html/list.html','Udf_Sys_RoleManage',1,1,1,1,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',5,'9f8ce4140db84373a4d755baf4729437','0,9f8ce4140db84373a4d755baf4729437,53f8533d15c6439bb7191691dbeeb894',4,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);

INSERT INTO TSYS_MENU VALUES ('8faa37776d714a7c8354bd236c1509db','�����ֵ�',2,'fa fa-pie-chart','udf/dictionary/html/list.html','Udf_Sys_DataDictionaryManage',1,1,1,1,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',4,'9f8ce4140db84373a4d755baf4729437','0,9f8ce4140db84373a4d755baf4729437,8faa37776d714a7c8354bd236c1509db',5,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);

-- �˵������µİ�ť
INSERT INTO TSYS_MENU VALUES ('98001aadccd14dfd8a25b75b65a6caac','����',3,'IMAGE_URL','#','Udf_Sys_MenuManage_Add',1,1,1,0,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',0,'62879cc9082b48d8aa95ac5edd14652b','0,9f8ce4140db84373a4d755baf4729437,62879cc9082b48d8aa95ac5edd14652b,98001aadccd14dfd8a25b75b65a6caac',1,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);

INSERT INTO TSYS_MENU VALUES ('905a251b4cc84d76a432f0b1937b3b5c','�޸�',3,'IMAGE_URL','#','Udf_Sys_MenuManage_Modify',1,1,1,0,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',0,'62879cc9082b48d8aa95ac5edd14652b','0,9f8ce4140db84373a4d755baf4729437,62879cc9082b48d8aa95ac5edd14652b,905a251b4cc84d76a432f0b1937b3b5c',2,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);

INSERT INTO TSYS_MENU VALUES ('74d278ec2d2841aa9f188082108f3ea0','ɾ��',3,'IMAGE_URL','#','Udf_Sys_MenuManage_Delete',1,1,1,0,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',0,'62879cc9082b48d8aa95ac5edd14652b','0,9f8ce4140db84373a4d755baf4729437,62879cc9082b48d8aa95ac5edd14652b,74d278ec2d2841aa9f188082108f3ea0',3,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);

INSERT INTO TSYS_MENU VALUES ('83f068f24e83446a817e76cfead777bb','����/����',3,'IMAGE_URL','#','Udf_Sys_MenuManage_MoveUpAndDown',1,1,1,0,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',0,'62879cc9082b48d8aa95ac5edd14652b','0,9f8ce4140db84373a4d755baf4729437,62879cc9082b48d8aa95ac5edd14652b,83f068f24e83446a817e76cfead777bb',4,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);

-- �û������µİ�ť
INSERT INTO TSYS_MENU VALUES ('a3c95b6cb62442bc887add00453aa30b','����/����',3,'IMAGE_URL','#','Udf_Sys_UserManage_EnableDisable',1,1,1,1,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',0,'ddf96020b2ba4a368758cc86b169d206','0,9f8ce4140db84373a4d755baf4729437,ddf96020b2ba4a368758cc86b169d206,a3c95b6cb62442bc887add00453aa30b',1,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);

INSERT INTO TSYS_MENU VALUES ('a04ed4d8fbcf44ba98b205b78c8502e1','��������',3,'IMAGE_URL','#','Udf_Sys_UserManage_ResetPwd',1,1,1,1,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',0,'ddf96020b2ba4a368758cc86b169d206','0,9f8ce4140db84373a4d755baf4729437,ddf96020b2ba4a368758cc86b169d206,a04ed4d8fbcf44ba98b205b78c8502e1',2,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);

INSERT INTO TSYS_MENU VALUES ('30b741b6012b49ce9d831b65138781ca','�鿴',3,'IMAGE_URL','#','Udf_Sys_UserManage_ViewDetail',1,1,1,1,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',0,'ddf96020b2ba4a368758cc86b169d206','0,9f8ce4140db84373a4d755baf4729437,ddf96020b2ba4a368758cc86b169d206,30b741b6012b49ce9d831b65138781ca',3,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);

INSERT INTO TSYS_MENU VALUES ('0befad822e7744fb9762a576bfda630a', '����Ȩ��', 3, 'fa fa-th', NULL, 'Udf_Sys_UserManage_Authority', 1, 2, 2, 1, 'feed58284f9e48988ec463d5aa3eb92a', NULL, 1, NULL, 0, 'ddf96020b2ba4a368758cc86b169d206', '0,9f8ce4140db84373a4d755baf4729437,ddf96020b2ba4a368758cc86b169d206,0befad822e7744fb9762a576bfda630a', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE, '1b7ade75be4e4ba8b7fe94fa06e36e92', SYSDATE);

-- ��ɫ�����µİ�ť
INSERT INTO TSYS_MENU VALUES ('26473d1ad84742459c1d36e93300574d','����',3,'IMAGE_URL','#','Udf_Sys_RoleManage_Add',1,1,1,1,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',0,'53f8533d15c6439bb7191691dbeeb894','0,9f8ce4140db84373a4d755baf4729437,53f8533d15c6439bb7191691dbeeb894,26473d1ad84742459c1d36e93300574d',1,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);

INSERT INTO TSYS_MENU VALUES ('326c53c121454732b410e2b70d85acee','�޸�',3,'IMAGE_URL','#','Udf_Sys_RoleManage_Modify',1,1,1,1,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',0,'53f8533d15c6439bb7191691dbeeb894','0,9f8ce4140db84373a4d755baf4729437,53f8533d15c6439bb7191691dbeeb894,326c53c121454732b410e2b70d85acee',2,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);

INSERT INTO TSYS_MENU VALUES ('3fcfb6f82cfd4eb28158641b57074df5','ɾ��',3,'IMAGE_URL','#','Udf_Sys_RoleManage_Delete',1,1,1,1,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',0,'53f8533d15c6439bb7191691dbeeb894','0,9f8ce4140db84373a4d755baf4729437,53f8533d15c6439bb7191691dbeeb894,3fcfb6f82cfd4eb28158641b57074df5',3,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);

INSERT INTO TSYS_MENU VALUES ('55a9a2ffa6c6492c8481286720af9eb3','ά���û�',3,'IMAGE_URL','#','Udf_Sys_RoleManage_MaintainUser',1,1,1,1,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',0,'53f8533d15c6439bb7191691dbeeb894','0,9f8ce4140db84373a4d755baf4729437,53f8533d15c6439bb7191691dbeeb894,55a9a2ffa6c6492c8481286720af9eb3',4,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);
 
INSERT INTO TSYS_MENU VALUES ('2d6ab11760cd4bf289539beb3e729306','��Ȩ',3,'IMAGE_URL','#','Udf_Sys_RoleManage_Empower',1,1,1,1,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',0,'53f8533d15c6439bb7191691dbeeb894','0,9f8ce4140db84373a4d755baf4729437,53f8533d15c6439bb7191691dbeeb894,2d6ab11760cd4bf289539beb3e729306',5,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);


-- �����ֵ�����µİ�ť
INSERT INTO TSYS_MENU VALUES ('b0a825246718413e9658e214e3ccc61a','����',3,'IMAGE_URL','#','Udf_Sys_DataDictionaryManage_Add',1,1,1,1,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',0,'8faa37776d714a7c8354bd236c1509db','0,9f8ce4140db84373a4d755baf4729437,8faa37776d714a7c8354bd236c1509db,b0a825246718413e9658e214e3ccc61a',1,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);

INSERT INTO TSYS_MENU VALUES ('2f254bfd5cec4db3b4aa04de8448745b','�޸�',3,'IMAGE_URL','#','Udf_Sys_DataDictionaryManage_Modify',1,1,1,1,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',0,'8faa37776d714a7c8354bd236c1509db','0,9f8ce4140db84373a4d755baf4729437,8faa37776d714a7c8354bd236c1509db,2f254bfd5cec4db3b4aa04de8448745b',2,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);

INSERT INTO TSYS_MENU VALUES ('a992376c40cb406d92b5cde544e947d1','ɾ��',3,'IMAGE_URL','#','Udf_Sys_DataDictionaryManage_Delete',1,1,1,1,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',0,'8faa37776d714a7c8354bd236c1509db','0,9f8ce4140db84373a4d755baf4729437,8faa37776d714a7c8354bd236c1509db,a992376c40cb406d92b5cde544e947d1',3,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);

INSERT INTO TSYS_MENU VALUES ('b13c0677eac44a76bb130429cbbb74fc','����/����',3,'IMAGE_URL','#','Udf_Sys_DataDictionaryManage_MoveUpAndDown',1,1,1,1,'feed58284f9e48988ec463d5aa3eb92a','TAG',1,'DESCRIPTION',0,'8faa37776d714a7c8354bd236c1509db','0,9f8ce4140db84373a4d755baf4729437,8faa37776d714a7c8354bd236c1509db,b13c0677eac44a76bb130429cbbb74fc',4,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE);


-- ��ɫ
delete from TSYS_ROLE;

INSERT INTO TSYS_ROLE VALUES ('2','�������Ա','jwadmin',     1,'�������Ա',0,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',2,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,1);

INSERT INTO TSYS_ROLE VALUES ('3','��ְ��','teachingStaff',  1,'��ְ��',0,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',3,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,2);

INSERT INTO TSYS_ROLE VALUES ('4','ѧ��','student',          1,'ѧ��',0,1,'1b7ade75be4e4ba8b7fe94fa06e36e92',4,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,2);

-- �˺�
delete from TSYS_USER;

INSERT INTO TSYS_USER VALUES ('1b7ade75be4e4ba8b7fe94fa06e36e92','��������Ա','USER_NO',1,1,'super','d1d208e31e0bddb14d1a30b222893b8f',0,'��������Ա',1,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'DEPTMENT_ID');

INSERT INTO TSYS_USER VALUES ('feed58284f9e48988ec463d5aa3eb92a','�������Ա','USER_NO',1,2,'jwadmin','d1d208e31e0bddb14d1a30b222893b8f',1,'�������Ա',2,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'1b7ade75be4e4ba8b7fe94fa06e36e92',SYSDATE,'DEPTMENT_ID');


-- ��ɫ��Ա��ϵ��
delete from TSYS_ROLE_USER;
--�������Ա�����������Ա��ɫ
INSERT INTO TSYS_ROLE_USER VALUES ('2','2','feed58284f9e48988ec463d5aa3eb92a',2);

/*
 �������--ɾ������ϵͳ����Ա��ɫԭ�еĲ˵�Ȩ��
*/ 
delete from TSYS_ROLE_MENU_PERMISSION WHERE ROLE_ID = '2' AND MENU_ID IN (select MENU_ID from tsys_menu where parent_id_list like '%,9f8ce4140db84373a4d755baf4729437%');
commit;

/*
 �������--������ϵͳ����Ա��ɫ�����ҵϵͳ�˵�Ȩ��
*/ 
insert into TSYS_ROLE_MENU_PERMISSION  select SYS_GUID(),'2',MENU_ID from tsys_menu where parent_id_list like '%,9f8ce4140db84373a4d755baf4729437%';
commit;

/*
�������--��ɫ������Ĳ˵�Ȩ����ͼ
*/
CREATE OR REPLACE VIEW VUDF_MENU_PERMISSION AS
SELECT ME.MENU_ID, -- �˵�ID
       ME.MENU_NAME, -- �˵���
       MP.ROLE_ID, -- ��ɫID
       ME.PARENT_ID, -- �˵����ڵ�ID
       ME.PARENT_ID_LIST, --�ϼ����нڵ�ID
       ME.IS_ENABLED, -- �Ƿ�����
       ME.CAN_BE_ASSIGNED, --�Ƿ��ܱ���Ȩ
       ME.ORDER_NO-- �˵�����
  FROM TSYS_MENU ME
  LEFT JOIN TSYS_ROLE_MENU_PERMISSION MP ON ME.MENU_ID = MP.MENU_ID;
  
COMMIT; 
/