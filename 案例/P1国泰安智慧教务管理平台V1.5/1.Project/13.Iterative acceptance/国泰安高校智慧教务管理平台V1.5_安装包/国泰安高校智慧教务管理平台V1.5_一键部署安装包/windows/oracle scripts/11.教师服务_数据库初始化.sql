/*
 ��ʦ����--���ݳ�ʼ��
*/
/*
 ��ʦ����--ɾ��ԭ�в˵�
*/ 
delete  TSYS_MENU t where t.MENU_ID in 
(
select menu_id from tsys_menu where parent_id_list like '%,1b5b837028e64cf397d158d871833804%'
) ;

-- ���ɽ�ʦ����˵�
insert into tsys_menu values ('1b5b837028e64cf397d158d871833804', '��ʦ����', 1, 'fa fa-male', '', 'TeacherService', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 5, '0', '0,1b5b837028e64cf397d158d871833804', 10, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('31f56a41f5ca4079a90495de17d8459b', '�ɼ�����', 1, 'fa fa-line-chart', '', 'TeacherService_Score', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 5, '1b5b837028e64cf397d158d871833804', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,31f56a41f5ca4079a9049de17d8459b', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('dfc0bbe989214edbad27e8d2815cde14', '����Ա', 1, 'fa fa-user-md', '', 'TeacherService_Counsellor', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 3, '1b5b837028e64cf397d158d871833804', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,dfc0bbe989214edbad7e8d2815cde14', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('7e43f38c461e42f793d35abff3b3d4ef', '��ѧ����', 1, 'fa fa-th', '', 'TeacherService_TeachingArrangement', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 3, '1b5b837028e64cf397d158d871833804', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,7e43f38461e42f793d35abff3b3d4ef', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('0406e03f4b6a4a27baeed8246f43236f', '������Ϣ', 2, 'fa fa-id-card-o', 'teacherservice/information/html/list.html', 'TeacherService_Information', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 1, '1b5b837028e64cf397d158d871833804', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,0406e03f4b6a4a2baeed8246f43236f', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('473fbf845c0344ba8ba83483b34305fc', '��ѧ����', 2, 'fa fa-list', 'teacherservice/task/html/taskList.html', 'TeacherService_TeachingTask', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 2, '1b5b837028e64cf397d158d871833804', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,473fbf845c0344a8ba83483b34305fc', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('7fc8a30dd6854137aa9bb8e0c3ecfef9', '�ɼ���ѯ', 2, 'fa fa-list', 'teacherservice/score/html/queryList.html', 'TeacherService_Score_ScoreQuery', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 1, '31f56a41f5ca4079a90495de17d8459b', '0,1b5b837028e64cf397d158d871833804,1b5837028e64cf397d158d871833804,31f56a41f5ca4079a90495de17d8459b,31f56a41f5ca4079a90495de17d8459b,7fc8a30dd6854137aa9bb8e0c3ecfef9', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('e7c681d746684ac0ad2644300c78d139', '¼�뻷�ڳɼ�', 2, 'fa fa-newspaper-o', 'teacherservice/score/html/tacheScoreEnterIndex.html', 'TeacherService_Score_TacheScore', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 3, '31f56a41f5ca4079a90495de17d8459b', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,31f56a41f5ca4079a9049de17d8459b,31f56a41f5ca4079a90495de17d8459b,e7c681d746684ac0ad2644300c78d139', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('483d275f707d442b894e3ea230299cd0', 'ѧ������', 2, 'fa fa-street-view', 'teacherservice/counsellor/html/reportList.html', 'TeacherService_Counsellor_Report', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 3, 'dfc0bbe989214edbad27e8d2815cde14', '0,1b5b837028e64cf397d158d87183304,1b5b837028e64cf397d158d871833804,dfc0bbe989214edbad27e8d2815cde14,dfc0bbe989214edbad27e8d2815cde14,483d275f707d442b894e3ea230299cd0', 6, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('f5bc433f29a34afca0a49f2728972451', '¼��γ̳ɼ�', 2, 'fa fa-keyboard-o', 'teacherservice/score/html/courseScoreEnterIndex.html', 'TeacherService_Score_CourseScore', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 3, '31f56a41f5ca4079a90495de17d8459b', '0,1b5b837028e64cf397d158d871833804,1b5837028e64cf397d158d871833804,31f56a41f5ca4079a90495de17d8459b,31f56a41f5ca4079a90495de17d8459b,f5bc433f29a34afca0a49f2728972451', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('d39558e5bcb74ef6b1ae170087ccdb88', '�ɼ��Ǽǲ�', 2, 'fa fa-file-text', 'teacherservice/score/html/achievementsList.html', 'TeacherService_Score_RegisterRoll', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 1, '31f56a41f5ca4079a90495de17d8459b', '0,1b5b837028e64cf397d158d87833804,1b5b837028e64cf397d158d871833804,31f56a41f5ca4079a90495de17d8459b,31f56a41f5ca4079a90495de17d8459b,d39558e5bcb74ef6b1ae170087ccdb88', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('1529f845848749cd95e05537ac422b4a', '¼�벹���ɼ�', 2, 'fa fa-chain-broken', 'teacherservice/score/html/markUpExamScoreEnterIndex.html', 'TeacherService_Score_MakeUpExamScore', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 2, '31f56a41f5ca4079a90495de17d8459b', '0,1b5b837028e64cf397d158d87133804,1b5b837028e64cf397d158d871833804,31f56a41f5ca4079a90495de17d8459b,31f56a41f5ca4079a90495de17d8459b,1529f845848749cd95e05537ac422b4a', 4, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('38e07d00ed0e45debc1d4967268c2ec4', '��ѯѧ������', 2, 'fa fa-users', 'teacherservice/counsellor/html/studentList.html', 'TeacherService_Counsellor_StudentRoll', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 1, 'dfc0bbe989214edbad27e8d2815cde14', '0,1b5b837028e64cf397d58d871833804,1b5b837028e64cf397d158d871833804,dfc0bbe989214edbad27e8d2815cde14,dfc0bbe989214edbad27e8d2815cde14,38e07d00ed0e45debc1d4967268c2ec4', 5, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('3b65e06ff2434086b3dccb7edf8ecdb8', '��ѯѧ���ɼ�', 2, 'fa fa-list', 'teacherservice/counsellor/html/queryStudentScoreList.html', 'TeacherService_Counsellor_StudentScore', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 1, 'dfc0bbe989214edbad27e8d2815cde14', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d87183804,dfc0bbe989214edbad27e8d2815cde14,dfc0bbe989214edbad27e8d2815cde14,3b65e06ff2434086b3dccb7edf8ecdb8', 7, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('6ff662abd9b846268f3f78a170d914bb', '��ѯ�༶�α�', 2, 'fa fa-flag', 'teacherservice/counsellor/html/classList.html', 'TeacherService_Counsellor_ClassSchedule', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 1, 'dfc0bbe989214edbad27e8d2815cde14', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d87133804,dfc0bbe989214edbad27e8d2815cde14,dfc0bbe989214edbad27e8d2815cde14,6ff662abd9b846268f3f78a170d914bb', 8, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('45f667d1a82d4fb7adccc06561359e23', '�Ͽε�����', 2, 'fa fa-leanpub', 'teacherservice/schedule/html/rollBook.html', 'TeacherService_TeachingArrangement_NameRoll', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 1, '7e43f38c461e42f793d35abff3b3d4ef', '0,1b5b837028e64cf397d18d871833804,1b5b837028e64cf397d158d871833804,7e43f38c461e42f793d35abff3b3d4ef,7e43f38c461e42f793d35abff3b3d4ef,45f667d1a82d4fb7adccc06561359e23', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('542a42926d4b498ead58b3f318b58c6f', '��ͣ������', 2, 'fa fa-retweet', 'courseplan/lesson/html/mylist.html', 'TeacherService_TeachingArrangement_LessonDispose', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 1, '7e43f38c461e42f793d35abff3b3d4ef', '0,1b5b837028e64cf397d58d871833804,1b5b837028e64cf397d158d871833804,7e43f38c461e42f793d35abff3b3d4ef,7e43f38c461e42f793d35abff3b3d4ef,542a42926d4b498ead58b3f318b58c6f', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('71c105e648684fae8f07b55f3fc3b44d', '���˿α�', 2, 'fa fa-calculator', 'teacherservice/schedule/html/personalTimetable.html', 'TeacherService_TeachingArrangement_PersonalSchedule', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 1, '7e43f38c461e42f793d35abff3b3d4ef', '0,1b5b87028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,7e43f38c461e42f793d35abff3b3d4ef,7e43f38c461e42f793d35abff3b3d4ef,71c105e648684fae8f07b55f3fc3b44d', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('7bb69297df9049eb9edf7ca821949055', '�޸�', 3, 'fa fa-th', '', 'TeacherService_Information_Update', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '0406e03f4b6a4a27baeed8246f43236f', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,0406e03f4b6a4a2baeed8246f43236f,0406e03f4b6a4a27baeed8246f43236f,7bb69297df9049eb9edf7ca821949055', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('470fbb2071714d7798e341b981394c8b', '�鿴', 3, 'fa fa-th', '', 'TeacherService_Score_TacheScore_View', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, 'e7c681d746684ac0ad2644300c78d139', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,31f56a41f5ca4079a9049de17d8459b,31f56a41f5ca4079a90495de17d8459b,e7c681d746684ac0ad2644300c78d139,e7c681d746684ac0ad2644300c78d139,470fbb2071714d7798e341b981394c8b', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('6fa3e933ed644fefbe473679ca93b2c7', '������', 3, 'fa fa-th', '', 'TeacherService_Counsellor_Report_Add', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '483d275f707d442b894e3ea230299cd0', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,dfc0be989214edbad27e8d2815cde14,dfc0bbe989214edbad27e8d2815cde14,483d275f707d442b894e3ea230299cd0,483d275f707d442b894e3ea230299cd0,6fa3e933ed644fefbe473679ca93b2c7', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('619cee37b5bb4471a436974a6deae608', '¼��', 3, 'fa fa-th', '', 'TeacherService_Score_TacheScore_Entry', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, 'e7c681d746684ac0ad2644300c78d139', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,31f56a41f5ca4079a9049de17d8459b,31f56a41f5ca4079a90495de17d8459b,e7c681d746684ac0ad2644300c78d139,e7c681d746684ac0ad2644300c78d139,619cee37b5bb4471a436974a6deae608', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('6b89010dc7a34be1b821bb2c0b48b9a8', '�鿴', 3, 'fa fa-th', '', 'TeacherService_Score_CourseScore_View', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, 'f5bc433f29a34afca0a49f2728972451', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,31f56a41fca4079a90495de17d8459b,31f56a41f5ca4079a90495de17d8459b,f5bc433f29a34afca0a49f2728972451,f5bc433f29a34afca0a49f2728972451,6b89010dc7a34be1b821bb2c0b48b9a8', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('4fe6180b98e14672983857e5378a1eaf', '�鿴����', 3, 'fa fa-th', '', 'TeacherService_TeachingTask_ViewCourse', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '473fbf845c0344ba8ba83483b34305fc', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,473fbf845c0344a8ba83483b34305fc,473fbf845c0344ba8ba83483b34305fc,4fe6180b98e14672983857e5378a1eaf', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('d30bc38a109344acbf8b9bee36ff5711', '����', 3, 'fa fa-th', '', 'TeacherService_Score_ScoreQuery_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '7fc8a30dd6854137aa9bb8e0c3ecfef9', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,31f56a4f5ca4079a90495de17d8459b,31f56a41f5ca4079a90495de17d8459b,7fc8a30dd6854137aa9bb8e0c3ecfef9,7fc8a30dd6854137aa9bb8e0c3ecfef9,d30bc38a109344acbf8b9bee36ff5711', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('8885516d1ac048d3a7aa5ea8583184fa', '¼��', 3, 'fa fa-th', '', 'TeacherService_Score_CourseScore_Entry', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, 'f5bc433f29a34afca0a49f2728972451', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,31f56a415ca4079a90495de17d8459b,31f56a41f5ca4079a90495de17d8459b,f5bc433f29a34afca0a49f2728972451,f5bc433f29a34afca0a49f2728972451,8885516d1ac048d3a7aa5ea8583184fa', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('5149169952914ed8b526c8ff19e68948', '���óɼ�����', 3, 'fa fa-th', '', 'TeacherService_Score_TacheScore_Setting', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, 'e7c681d746684ac0ad2644300c78d139', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,31f56a41f5ca4079a9049de17d8459b,31f56a41f5ca4079a90495de17d8459b,e7c681d746684ac0ad2644300c78d139,e7c681d746684ac0ad2644300c78d139,5149169952914ed8b526c8ff19e68948', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('ca79a278906c403fb034347fc107f3b1', '����', 3, 'fa fa-th', '', 'TeacherService_Counsellor_Report_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '483d275f707d442b894e3ea230299cd0', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,dfc0bb989214edbad27e8d2815cde14,dfc0bbe989214edbad27e8d2815cde14,483d275f707d442b894e3ea230299cd0,483d275f707d442b894e3ea230299cd0,ca79a278906c403fb034347fc107f3b1', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('da8381e98cf4459aa81ed4079a584685', '��ӡ', 3, 'fa fa-th', '', 'TeacherService_Score_RegisterRoll_Print', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, 'd39558e5bcb74ef6b1ae170087ccdb88', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,31f56a1f5ca4079a90495de17d8459b,31f56a41f5ca4079a90495de17d8459b,d39558e5bcb74ef6b1ae170087ccdb88,d39558e5bcb74ef6b1ae170087ccdb88,da8381e98cf4459aa81ed4079a584685', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('4e4b857062664d9bae6767514e938da3', '��������', 3, 'fa fa-th', '', 'TeacherService_Counsellor_Report_Cancel', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '483d275f707d442b894e3ea230299cd0', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,df0bbe989214edbad27e8d2815cde14,dfc0bbe989214edbad27e8d2815cde14,483d275f707d442b894e3ea230299cd0,483d275f707d442b894e3ea230299cd0,4e4b857062664d9bae6767514e938da3', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('9d08a61e6c314a518456ca1b8aeca55e', '���óɼ�����', 3, 'fa fa-th', '', 'TeacherService_Score_CourseScore_Setting', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, 'f5bc433f29a34afca0a49f2728972451', '0,1b5b837028e64cf397d158d871833804,1b5837028e64cf397d158d871833804,31f56a41f5ca4079a90495de17d8459b,31f56a41f5ca4079a90495de17d8459b,f5bc433f29a34afca0a49f2728972451,f5bc433f29a34afca0a49f2728972451,9d08a61e6c314a518456ca1b8aeca55e', 3, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('f2e0d4daf5ea47e4b76a3657361af030', '�鿴', 3, 'fa fa-th', '', 'TeacherService_Score_MakeUpExamScore_View', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '1529f845848749cd95e05537ac422b4a', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,31f5a41f5ca4079a90495de17d8459b,31f56a41f5ca4079a90495de17d8459b,1529f845848749cd95e05537ac422b4a,1529f845848749cd95e05537ac422b4a,f2e0d4daf5ea47e4b76a3657361af030', 2, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('6f5b46cc2c6846989890607a0731c41e', '¼��', 3, 'fa fa-th', '', 'TeacherService_Score_MakeUpExamScore_Entry', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '1529f845848749cd95e05537ac422b4a', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,31f6a41f5ca4079a90495de17d8459b,31f56a41f5ca4079a90495de17d8459b,1529f845848749cd95e05537ac422b4a,1529f845848749cd95e05537ac422b4a,6f5b46cc2c6846989890607a0731c41e', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('e21e0bfdf97c4373aade8f76e43561bd', '����', 3, 'fa fa-th', '', 'TeacherService_Counsellor_StudentRoll_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '38e07d00ed0e45debc1d4967268c2ec4', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,dc0bbe989214edbad27e8d2815cde14,dfc0bbe989214edbad27e8d2815cde14,38e07d00ed0e45debc1d4967268c2ec4,38e07d00ed0e45debc1d4967268c2ec4,e21e0bfdf97c4373aade8f76e43561bd', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('2b50a623261b44c89ed4dc9bc125055d', '����', 3, 'fa fa-th', '', 'TeacherService_Counsellor_StudentScore_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '3b65e06ff2434086b3dccb7edf8ecdb8', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,fc0bbe989214edbad27e8d2815cde14,dfc0bbe989214edbad27e8d2815cde14,3b65e06ff2434086b3dccb7edf8ecdb8,3b65e06ff2434086b3dccb7edf8ecdb8,2b50a623261b44c89ed4dc9bc125055d', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('cbc6947997044a91a2303a9bfecd1957', '�鿴��ѧ��', 3, 'fa fa-th', '', 'TeacherService_TeachingTask_ViewTeachingClass', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '473fbf845c0344ba8ba83483b34305fc', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804,473fbf845c0344a8ba83483b34305fc,473fbf845c0344ba8ba83483b34305fc,cbc6947997044a91a2303a9bfecd1957', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('4f6698122dbf4f1bb028e55c95d181b3', '��ӡ', 3, 'fa fa-th', '', 'TeacherService_Counsellor_ClassSchedule_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '6ff662abd9b846268f3f78a170d914bb', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d871833804dfc0bbe989214edbad27e8d2815cde14,dfc0bbe989214edbad27e8d2815cde14,6ff662abd9b846268f3f78a170d914bb,6ff662abd9b846268f3f78a170d914bb,4f6698122dbf4f1bb028e55c95d181b3', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('ebfcb7fb53954d71940aef1cdc8e1fac', '����', 3, 'fa fa-th', '', 'TeacherService_TeachingArrangement_NameRoll_Export', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '45f667d1a82d4fb7adccc06561359e23', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d158d87183804,7e43f38c461e42f793d35abff3b3d4ef,7e43f38c461e42f793d35abff3b3d4ef,45f667d1a82d4fb7adccc06561359e23,45f667d1a82d4fb7adccc06561359e23,ebfcb7fb53954d71940aef1cdc8e1fac', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('7ce0c19744194e938e6b1c1998ba7954', '�����ͣ��', 3, 'fa fa-th', '', 'TeacherService_TeachingArrangement_LessonDispose_Apply', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '542a42926d4b498ead58b3f318b58c6f', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397158d871833804,7e43f38c461e42f793d35abff3b3d4ef,7e43f38c461e42f793d35abff3b3d4ef,542a42926d4b498ead58b3f318b58c6f,542a42926d4b498ead58b3f318b58c6f,7ce0c19744194e938e6b1c1998ba7954', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);
insert into tsys_menu values ('78d23c923f934b979e29d7900c629d80', '��ӡ', 3, 'fa fa-th', '', 'TeacherService_TeachingArrangement_PersonalSchedule_Print', 1, 2, 0, 1, 'feed58284f9e48988ec463d5aa3eb92a', '', 1, '', 0, '71c105e648684fae8f07b55f3fc3b44d', '0,1b5b837028e64cf397d158d871833804,1b5b837028e64cf397d15d871833804,7e43f38c461e42f793d35abff3b3d4ef,7e43f38c461e42f793d35abff3b3d4ef,71c105e648684fae8f07b55f3fc3b44d,71c105e648684fae8f07b55f3fc3b44d,78d23c923f934b979e29d7900c629d80', 1, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate, '1b7ade75be4e4ba8b7fe94fa06e36e92', sysdate);

commit;

/*
 ��ʦ����--ɾ������ϵͳ����Ա��ɫԭ�еĲ˵�Ȩ��
*/ 
delete from TSYS_ROLE_MENU_PERMISSION WHERE ROLE_ID = '2' AND MENU_ID IN (select MENU_ID from tsys_menu where parent_id_list like '%,1b5b837028e64cf397d158d871833804%');
commit;

/*
 ��ʦ����--������ϵͳ����Ա��ɫ����˵�Ȩ��
*/ 
insert into TSYS_ROLE_MENU_PERMISSION  select SYS_GUID(),'2',MENU_ID from tsys_menu where parent_id_list like '%,1b5b837028e64cf397d158d871833804%';
commit;

/*
 ��ʦ����--ɾ��ѧ����ɫԭ�еĲ˵�Ȩ��
*/ 
delete from TSYS_ROLE_MENU_PERMISSION WHERE ROLE_ID = '3' AND MENU_ID IN (select MENU_ID from tsys_menu where parent_id_list like '%,1b5b837028e64cf397d158d871833804%');
commit;

/*
 ��ʦ����--��ѧ����ɫ����˵�Ȩ��
*/ 
insert into TSYS_ROLE_MENU_PERMISSION  select SYS_GUID(),'3',MENU_ID from tsys_menu where parent_id_list like '%,1b5b837028e64cf397d158d871833804%';
commit;

-- ��ʦ�������ۿγ�-��ѧ��ѡ����������Դ
CREATE OR REPLACE VIEW VTEAC_SELECT_COURSE
AS
SELECT 
LOWER(SYS_GUID()) ID,-- ����
TASK.ACADEMIC_YEAR,-- ѧ��
TASK.SEMESTER_CODE,-- ѧ��
TEA.TEACHER_ID, -- ��ʦID
COU.NAME COURSE_NAME,-- �γ���
COU.COURSE_NO,-- �γ̱��
TASK.COURSE_ID,-- �γ�ID
TASK.TEACHING_CLASS_NO,-- ��ѧ���
TEA.THEORETICAL_TASK_ID,-- ��ѧ��Id
COU.COURSE_OR_TACHE-- �Ƿ�γ̻򻷽�
FROM TCOUP_THEORETICAL_TEACHERS TEA
JOIN TCOUP_THEORETICAL_TASK TASK ON TASK.THEORETICAL_TASK_ID = TEA.THEORETICAL_TASK_ID
LEFT JOIN TTRAP_COURSE COU ON TASK.COURSE_ID = COU.COURSE_ID
INNER JOIN (SELECT DISTINCT THEORETICAL_TASK_ID FROM TCOUP_SCHEDULING_TASK) SCHT ON SCHT.THEORETICAL_TASK_ID = TEA.THEORETICAL_TASK_ID;
commit;

-- ��ʦ���񻷽�-������ѡ����������Դ
CREATE OR REPLACE VIEW VTEAC_SELECT_PRACTICE
AS
SELECT 
LOWER(SYS_GUID()) ID,-- ����
ARR.ACADEMIC_YEAR,-- ѧ��
ARR.SEMESTER_CODE,-- ѧ��
TEA.TEACHER_ID, -- ��ʦID
COU.NAME COURSE_NAME,-- �γ���
COU.COURSE_NO,-- �γ̱��
ARR.COURSE_ID,-- �γ�ID
COU.COURSE_OR_TACHE,-- �Ƿ�γ̻򻷽�
REG.CLASS_ID,-- �༶ID
CLA.CLASS_NAME,-- �༶��
CLA.CLASS_NO-- �༶��
FROM TCOUP_PRACTICAL_ARRANGE ARR
LEFT JOIN TCOUP_PRACTICAL_TEACHER TEA ON ARR.PRACTICAL_ARRANGE_ID=TEA.PRACTICAL_ARRANGE_ID 
LEFT JOIN TTRAP_COURSE COU ON ARR.COURSE_ID = COU.COURSE_ID
LEFT JOIN TCOUP_PRACTICAL_STUDENT STU ON ARR.PRACTICAL_ARRANGE_ID=STU.PRACTICAL_ARRANGE_ID
LEFT JOIN TSTU_ARCHIVES_REGISTER REG ON STU.STUDENT_ID = REG.USER_ID AND ARR.ACADEMIC_YEAR= REG.ACADEMIC_YEAR AND ARR.SEMESTER_CODE= REG.SEMESTER_CODE
LEFT JOIN TSTU_CLASS CLA ON REG.CLASS_ID = CLA.CLASS_ID;


-- ��ʦ����-��ѧ����-����
CREATE OR REPLACE VIEW VCOUP_TEAS_TEACHERPRACTICE AS
SELECT
	A .PRACTICAL_ARRANGE_ID,
	-- ʵ������id
	c.DEPARTMENT_ID,
	-- ���ε�λid
	D .DEPARTMENT_NAME,
	-- ���ε�λ����
	A .COURSE_ID,
	-- ����id
	C.COURSE_NO,
	-- ���ں�
	C. NAME COURSE_NAME,
	-- ��������
	C.TACHE_TYPE_CODE,
	-- �������
	C.CREDIT,
	-- ѧ��
	A .GROUP_NO,
	-- С���
	PN.MEMBER_COUNT,
	-- С������
	pw.PRACTICE_WEEKS,
	-- ʵ���ܴ�
	b.TEACHER_ID,
	-- ��ʦid
	A .ACADEMIC_YEAR,
	-- ѧ��
	A .SEMESTER_CODE,
	-- ѧ��
	A .major_id,
	A .grade,
	-- �꼶
	major.major_name,
	--רҵ����
	dep.department_name department_name_yx -- Ժϵ����
FROM
	TCOUP_PRACTICAL_ARRANGE A
LEFT JOIN TCOUP_PRACTICAL_TEACHER b ON A .PRACTICAL_ARRANGE_ID = b.PRACTICAL_ARRANGE_ID
LEFT JOIN TTRAP_COURSE c ON c.course_id = A .COURSE_ID
LEFT JOIN TSYS_DEPARTMENT D ON D .DEPARTMENT_ID = c.DEPARTMENT_ID
LEFT JOIN (
	(
		SELECT
			WMSYS.WM_CONCAT (TO_CHAR(PRACTICE_WEEKS)) PRACTICE_WEEKS,
			ACADEMIC_YEAR,
			SEMESTER_CODE,
			COURSE_ID,
			major_id,
			grade,
			group_NO
		FROM
			(
				SELECT DISTINCT
					pa.ACADEMIC_YEAR,
					pa.SEMESTER_CODE,
					pa.COURSE_ID,
					pa.group_NO,
					pa.major_id,
					pa.grade,
					PRACTICE_WEEKS
				FROM
					TCOUP_PRACTICAL_STUDENT ps
				LEFT JOIN TCOUP_PRACTICAL_ARRANGE pa ON ps.PRACTICAL_ARRANGE_ID = pa.PRACTICAL_ARRANGE_ID
				INNER JOIN TSTU_ARCHIVES_REGISTER tsr ON pa.ACADEMIC_YEAR = tsr.ACADEMIC_YEAR
				AND pa.SEMESTER_CODE = tsr.SEMESTER_CODE
				AND ps.student_id = tsr.user_id  
				INNER JOIN TCOUP_LINK_CLASS_WEEK cw ON cw.ACADEMIC_YEAR = pa.ACADEMIC_YEAR
				AND cw.SEMESTER_CODE = pa.SEMESTER_CODE
				AND pa.COURSE_ID = cw.COURSE_ID
				AND cw.class_id = tsr.class_id
			)
		GROUP BY
			ACADEMIC_YEAR,
			SEMESTER_CODE,
			COURSE_ID,
			major_id,
			grade,
			group_NO
	) pw
) ON A .ACADEMIC_YEAR = pw.ACADEMIC_YEAR
AND A .SEMESTER_CODE = pw.SEMESTER_CODE
AND A .COURSE_ID = pw.COURSE_ID
AND A .group_no = pw.group_no
AND A .major_id = pw.major_id
AND A .grade = pw.grade
LEFT JOIN tsys_major major ON A .major_id = major.major_id
LEFT JOIN tsys_department dep ON major.department_id = dep.department_id
LEFT JOIN (
 select count(0) MEMBER_COUNT ,A.PRACTICAL_ARRANGE_ID,B.ACADEMIC_YEAR ,B.SEMESTER_CODE,C.MAJOR_ID,C.GRADE  from TCOUP_PRACTICAL_STUDENT A 
 INNER JOIN TSTU_ARCHIVES_REGISTER B ON (A.STUDENT_ID =B.USER_ID and b.SCHOOL_STATUS_CODE='001' )
 INNER JOIN TSTU_CLASS C ON B.CLASS_ID =C.CLASS_ID 
 GROUP BY   A.PRACTICAL_ARRANGE_ID,B.ACADEMIC_YEAR ,B.SEMESTER_CODE,C.MAJOR_ID,C.GRADE 
)PN ON PN.PRACTICAL_ARRANGE_ID=A.PRACTICAL_ARRANGE_ID AND A.ACADEMIC_YEAR=PN.ACADEMIC_YEAR  AND A.SEMESTER_CODE=PN.SEMESTER_CODE AND A.MAJOR_ID =PN.MAJOR_ID AND A.GRADE=PN.GRADE;

-- ��ʦ����-��ѧ��ѡ�ε�ѧ����ͼ
CREATE OR REPLACE VIEW VTEAC_TEACHING_CHOICE_STUDENT
AS
SELECT
 TCS.TEACHING_CLASS_STUDENT_ID,-- ��ѡ��ѧ��Id
 TCS.ACADEMIC_YEAR,-- ѧ��
 TCS.SEMESTER_CODE,-- ѧ��
 TCS.THEORETICAL_TASK_ID, -- ����ID
 TCS.USER_ID,-- ѧ��ID
 STU.STUDENT_NAME,-- ѧ������
 STU.STUDENT_NO,-- ѧ��
 STU.SEX_CODE,-- �Ա� 
 AR.CLASS_ID,-- �༶ID
 CL.GRADE,-- �꼶
 CL.CLASS_NAME,-- �༶���� 
 CL.MAJOR_ID,-- רҵId
 MA.MAJOR_NAME,-- רҵ����
 TT.COURSE_ID,-- �γ�Id
 TC.COURSE_NO, -- �γ̺�
 TC.NAME AS COURSE_NAME, --�γ�����
 TT.TEACHING_CLASS_NO -- ��ѧ���
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
WHERE AR.SCHOOL_STATUS_CODE='001'-- ��У
;

-- ��ʦ����-��ѧ��ѡ�ε�ѧ���İ༶ͳ����ͼ
CREATE OR REPLACE VIEW VTEAC_TEACHING_CHOICE_CLASS
AS
SELECT SC.* FROM (SELECT
  LOWER(SYS_GUID()) ID,-- ����
  ACADEMIC_YEAR,--ѧ��
  SEMESTER_CODE,-- ѧ��
  VS.THEORETICAL_TASK_ID,-- ��ѧ��ID
  GRADE, -- �꼶
  MAJOR_NAME,-- רҵ
  CLASS_NAME, -- �༶
  COUNT(1) AS STUDENT_COUNT -- �༶����
FROM VTEAC_TEACHING_CHOICE_STUDENT VS
inner join tcoup_theoretical_class ttc on ttc.theoretical_task_id=VS.THEORETICAL_TASK_ID and  VS.CLASS_id=ttc.class_ID  
GROUP BY VS.THEORETICAL_TASK_ID,VS.ACADEMIC_YEAR,VS.SEMESTER_CODE, VS.GRADE, VS.MAJOR_NAME, VS.CLASS_NAME) SC;

-- ��ʦ����-���ۿγ̽�ѧ������ͼ
CREATE OR REPLACE VIEW VTEAC_TEACHCLASS_CHOICE AS
SELECT
 DISTINCT TASK.THEORETICAL_TASK_ID, 
 (SELECT
   COUNT (1) CHOICEDNUM
  FROM
  TCHOC_TEACHING_CLASS_STUDENT a 
  inner join Tstu_Archives_Register b on b.academic_year = a.academic_year AND b.SEMESTER_CODE = a.semester_code and b.user_ID= a.USER_ID and b.school_status_code='001'
  INNER JOIN tcoup_theoretical_class TCL on tcl.theoretical_task_id=a.THEORETICAL_TASK_ID   and b.class_id=tcl.class_id 
  WHERE TASK.THEORETICAL_TASK_ID = a.THEORETICAL_TASK_ID AND a.ACADEMIC_YEAR = PLANINFO.ACADEMIC_YEAR AND a.SEMESTER_CODE = PLANINFO.SEMESTER_CODE ) TEACHING_CLASS_MEMBER_COUNT, --��ѡ����
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
 COURSE.CHECK_WAY_CODE,
 TASK.TEACHING_CLASS_NO,
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
) TEACHER_ID_ALL,
'' CLASS_ID
FROM
 TSYS_DEPARTMENT DEPT
JOIN TTRAP_COURSE COURSE ON COURSE.DEPARTMENT_ID = DEPT.DEPARTMENT_ID
JOIN TTRAP_STARTCLASS_PLAN PLANINFO ON PLANINFO.COURSE_ID = COURSE.COURSE_ID
JOIN TCOUP_THEORETICAL_STARTCLASS STARTCLASS ON STARTCLASS.STARTCLASS_PLAN_ID = PLANINFO.STARTCLASS_PLAN_ID
JOIN TCOUP_THEORETICAL_TASK TASK ON TASK.THEORETICAL_TASK_ID = STARTCLASS.THEORETICAL_TASK_ID
LEFT JOIN TSYS_VENUE VENUE ON VENUE.VENUE_ID = TASK.TEACHROOM_ID
LEFT JOIN TSYS_BUILDING BUILDING ON BUILDING.BUILDING_ID = TASK.BUILDING_ID
LEFT JOIN TSYS_CAMPUS CAMPUS ON CAMPUS.CAMPUS_ID = TASK.CAMPUS_ID
LEFT JOIN TCOUP_THEORETICAL_TEACHERS TT ON TT.THEORETICAL_TASK_ID = TASK.THEORETICAL_TASK_ID
LEFT JOIN TSYS_TEACHER TEACHER ON TEACHER.USER_ID = TT.TEACHER_ID;

commit;