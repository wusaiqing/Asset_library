define(function (require, exports, module) {

	/**
	 * ajax请求类型
	 */
	var RequestMethod = {
		PUT:"PUT",
		POST:"POST",
		DELETE:"DELETE",
		GET:"GET"
	}
	/**
	 * 所有请求
	 */
	var config = {
		/**
		 * 成绩录入时间设置
		 */
		//加载列表
		GET_SCORE_ENTER_LIST: {
			url : "/score/scoreEntryTime/getList",
			method : RequestMethod.GET
		},
		//批量设置
		SAVE_SCORE_ENTER_SETUP: {
			url : "/score/scoreEntryTime/batchSetUp",
			method : RequestMethod.POST
		},
		/**
		 * 特殊情况
		 */
		//获取特殊情况列表数据
		SPECIAL_CASE_GET_LIST: {
			url : "/score/specialCase/getList",
			method : RequestMethod.GET
		},
		
		/**
		 * 分制
		 */
		//加载分制名称
		GET_SCORE_REGIMEN_LIST: {
			url : "/score/scoreRegimen/getList",
			method : RequestMethod.POST
		},
		
		/**
		 * 分制明细
		 */
		//获取分制设置明细列表数据
		GET_SCORE_REGIMEN_DETAIL_LIST: {
			url : "/score/scoreRegimenDetail/getList",
			method : RequestMethod.GET
		},
		/**
		 * 分制
		 */
		//加载分制名称
		GET_SELECTLIST: {
			url : "/score/scoreRegimen/getSelectList",
			method : RequestMethod.GET
		},
		//根据分制id和分数获取等级
		GET_ITEM: {
			url : "/score/scoreRegimenDetail/getItem",
			method : RequestMethod.POST
		},
		//加载分制名称
		GET_ALLLIST: {
			url : "/score/scoreRegimen/getAllList",
			method : RequestMethod.POST
		},
		//根据分支明细id获取等级
		GETITEMNEW: {
			url : "/score/scoreRegimenDetail/getItemNew",
			method : RequestMethod.POST
		},
		/**
		 * 课程成绩构成设置
		 */
		//课程成绩构成设置分页查询
		GET_COURSE_SCORE_SET_PAGEDLIST: {
			url : "/score/courseScore/getCourseScoreSetPagedList",
			method : RequestMethod.POST
		},
		//加载详情
		GET_COURSE_SCORE_GETITEM: {
			url : "/score/courseScore/getCourseScoreSetItem",
			method : RequestMethod.POST
		},
		//保存
		SAVE_COURSE_SCORE_SET:{
			url : "/score/courseScore/saveCourseScoreSet",
			method : RequestMethod.POST
		},
		//修改成绩构成
		UPDATE_ALLOW_MODIFY_COURSE:{
			url : "/score/courseScore/updateAllowModify",
			method : RequestMethod.POST
		},
		//查询教学班号
	    GET_TASKNO_SELECT_LIST:{
			url : "/score/courseScore/getTaskNoSelectList",
			method : RequestMethod.POST
		},
		//查询课程成绩未设置的数量
	    GET_SCORE_NOT_NUM:{
			url : "/score/courseScore/getScoreNoSetNum",
			method : RequestMethod.POST
		},
		//查询课程中是否存在成绩
	    CHECK_RELE_VANCE:{
			url : "/score/courseScore/checkRelevance",
			method : RequestMethod.POST
		},
		/**
		 * 课程成绩录入
		 */
		//根据学年学期、开课单位从选课结果中获取课程数据
		GET_COURSE_SELECT_LIST: {
			url : "/score/courseScore/getCourseSelectList",
			method : RequestMethod.GET
		},
		//1.根据学年学期、开课单位从选课结果中获取课程数据
	    //2.查询有效成绩中修读学年学期为查询条件中的学年学期且成绩小于60分的课程
	    //1和2的交集
		MARKUP_GET_COURSE_SELECT_LIST: {
			url : "/score/markUpExamScoreEntry/getCourseSelectList",
			method : RequestMethod.GET
		},
		
		//开课单位：取成绩管理中设置的课程录入人为当前登录人的课程，对应的开课单位
		GET_START_CLASS_DEPARTMENT_SELECT_LIST: {
			url : "/score/markUpExamScoreEntry/getStartClassDepartmentSelectList",
			method : RequestMethod.GET
		},
		
		
		//根据学年学期、课程id、是否补考获取成绩录入时间
		GET_SCORE_ENTRY_TIME_BY_PARAMETERS: {
			url : "/score/scoreEntryTime/getScoreEntryTimeByParameters",
			method : RequestMethod.GET
		},
		
		
		//根据学年学期、课程从选课结果中获取任课教师数据
		GET_TEACHER_SELECT_LIST: {
			url : "/score/courseScore/getTeacherSelectList",
			method : RequestMethod.GET
		},
		//根据学年学期、课程从选课结果中获取任课教师数据
		GET_TEACHER_SELECT_LIST: {
			url : "/score/courseScore/getTeacherSelectList",
			method : RequestMethod.GET
		},
		//根据学年学期、任课教师从选课结果中获取教学班号数据
		GET_THEORETICAL_TASK_SELECT_LIST: {
			url : "/score/courseScore/getTheoreticalTaskSelectList",
			method : RequestMethod.GET
		},
		//根据学年学期、课程id、教学班id获取课程/补考成绩录入相关设置
		GET_COURSE_SCORE_SET_BY_PARAMETERS: {
			url : "/score/courseScore/getCourseScoreSetByParameters",
			method : RequestMethod.GET
		},
		//根据学年学期、环节id、班级id获取环节成绩构成
		GET_TACHE_SCORE_CONSTITUTE_BY_PARAMETERS: {
			url : "/score/tacheScore/getTacheScoreConstituteByParameters",
			method : RequestMethod.GET
		},
		
		//教学班已选课学生成绩数据 
		GET_COURSE_SCORE_ENTRY_LIST: {
			url : "/score/courseScore/getCourseScoreEntryList",
			method : RequestMethod.GET
		},	
		
		//教师服务端-课程成绩录入列表数据 
		GET_COURSE_SCORE_FOR_TEACH_LIST: {
			url : "/score/courseScore/getCourseScoreForTeachList",
			method : RequestMethod.GET
		},
		
		//教师服务端-环节成绩录入主页面列表数据 
		GET_TACHE_SCORE_FOR_TEACH_LIST: {
			url : "/score/tacheScore/getTacheScoreForTeachList",
			method : RequestMethod.GET
		},
		
		//教师服务端-补考成绩录入主页面列表数据 
		GET_MARKUP_SCORE_FOR_TEACH_LIST: {
			url : "/score/markUpExamScoreEntry/getMarkupScoreForTeachList",
			method : RequestMethod.GET
		},
		
		//教师服务端-环节成绩录入列表数据 
		GET_TACHE_SCORE_LIST: {
			url : "/score/tacheScore/getTacheScoreList",
			method : RequestMethod.GET
		},
		
		//补考成绩录入列表数据 
		GET_MARKUP_SCORE_ENTRY_LIST: {
			url : "/score/markUpExamScoreEntry/getMarkupScoreEntryList",
			method : RequestMethod.GET
		},	
		
		//开课计划下行政班学生成绩数据 
		GET_TACHE_SCORE_ENTRY_LIST: {
			url : "/score/tacheScore/getTacheScoreEntryList",
			method : RequestMethod.GET
		},
		//课程成绩保存
		SAVE_COURSE_SCORE: {
			url : "/score/courseScore/saveCourseScore",
			method : RequestMethod.POST
		},
		
		//根据条件删除原始成绩		
		DELETE_ORIGINAL_SCORE: {
			url : "/score/score/deleteOriginalScore",
			method : RequestMethod.POST
		},
		
		//环节成绩保存
		SAVE_TACHE_SCORE: {
			url : "/score/tacheScore/saveTacheScore",
			method : RequestMethod.POST
		},
		//补考成绩保存
		SAVE_MARKUP_SCORE: {
			url : "/score/markUpExamScoreEntry/saveMarkupScore",
			method : RequestMethod.POST
		},
		//课程成绩成绩册列表
		GET_COURSE_SCORE_REGISTER_LIST: {
			url : "/score/courseScore/getCourseScoreRegisterList",
			method : RequestMethod.GET
		},
		//课程成绩成绩册教学班总数
		GET_COURSE_SCORE_REGISTER_LIST_SUM: {
			url : "/score/courseScore/getCourseScoreRegisterListSum",
			method : RequestMethod.GET
		},
		//课程成绩成绩册打印
		GET_COURSE_SCORE_REGISTER_LIST_PRINT: {
			url : "/score/courseScore/getCourseScoreRegisterListPrint",
			method : RequestMethod.GET
		},
		//查询课程成绩未设置的数量
	    GET_SCORE_ENTRY_USERID_NOSET_NUM:{
			url : "/score/courseScore/getScoreEntryUserIdNoSetNum",
			method : RequestMethod.POST
		},
		
		//补考成绩登记册
		GET_MARKUPSCORE_REGISTER_LIST:{
			url : "/score/markUpExamScoreEntry/getMarkupScoreRegisterList",
			method : RequestMethod.POST
		},
		
		//补考成绩登记册(统计数量)
		GET_MARKUPSCORE_REGISTERLIST_SUM:{
			url : "/score/markUpExamScoreEntry/getMarkupScoreRegisterListSum",
			method : RequestMethod.POST
		},
		
		//打印补考成绩登记册
		GET_MARKUPSCORE_REGISTERLIST_PRINT:{
			url : "/score/markUpExamScoreEntry/getMarkupScoreRegisterListPrint",
			method : RequestMethod.POST
		},
		
		/**
		 * 成绩补录
		 */
		//加载成绩补录列表
		GET_START_CLASS_PLAN: {
			url : "/score/score/getStartClassPlan",
			method : RequestMethod.GET
		},
		//根据学年学期、任课教师从选课结果中获取教学班号数据
		GET_THEORETICAL_TASK_SELECT_LIST: {
			url : "/score/courseScore/getTheoreticalTaskSelectList",
			method : RequestMethod.GET
		},
		//保存
		SAVE: {
			url : "/score/score/save",
			method : RequestMethod.POST
		},
		//送审
		AUDIT: {
			url : "/score/score/audit",
			method : RequestMethod.POST
		},
		//成绩修改送审
		APPROVAL: {
			url : "/score/score/approval",
			method : RequestMethod.POST
		},
		/**
		 * 环节成绩构成设置
		 */
		//环节成绩构成设置分页查询
		GET_TACHE_SCORE_SET_PAGEDLIST: {
			url : "/score/tacheScore/getTacheScoreSetPagedList",
			method : RequestMethod.POST
		},
		//修改环节成绩构成设置
		UPDATE_ALLOW_MODIFY: {
			url : "/score/tacheScore/updateAllowModify",
			method : RequestMethod.POST
		},
		//保存环节分制构成
		SAVE_TACHE_SCORE_SET:{
			url : "/score/tacheScore/saveTacheScoreSet",
			method : RequestMethod.POST
		},
		//联动环节名称
		GET_TACHE_SCORE_NAME:{
			url : "/score/tacheScore/getTacheScoreName",
			method : RequestMethod.POST
		},
		//查询环节未设置的数量
		GET_TACHE_SCORE_NUM:{
			url : "/score/tacheScore/getTacheScoreNum",
			method : RequestMethod.POST
		},
		//查询环节成绩登记册（列表）
		GET_TACHESCORE_REGISTERLIST:{
			url : "/score/tacheScore/getTacheScoreRegisterList",
			method : RequestMethod.POST
		},
		//查询环节成绩登记册（班级环节数量）
		GET_TACHESCORE_REGISTERLIST_SUM:{
			url : "/score/tacheScore/getTacheScoreRegisterListSum",
			method : RequestMethod.POST
		},
		//打印环节成绩登记册
		GET_TACHESCORE_REGISTERLIST_PRINT:{
			url : "/score/tacheScore/getTacheScoreRegisterListPrint",
			method : RequestMethod.POST
		},
		//查询环节是否被引用
		CHECK_TACHE_RELEVANCE:{
			url : "/score/tacheScore/checkTacheRelevance",
			method : RequestMethod.POST
		},
		/**
		 * 课程录入人设置
		 */
		//课程录入人设置分页
		GET_COURSE_SCORE_ENTRY_PAGEDLIST:{
			url : "/score/courseScore/getCourseScoreEntryPagedList",
			method : RequestMethod.POST
		},
		//设置录入人
		SAVE_ENTERUSER:{
			url : "/score/courseScore/saveEnterUser",
			method : RequestMethod.POST
		},
		//批量设置
		BATCH_SAVE_ENTERUSER:{
			url : "/score/courseScore/batchSaveEnterUser",
			method : RequestMethod.POST
		},
		//导出
		EXPORT:{
			url : "/score/courseScore/export",
			method : RequestMethod.POST
		},
		/**
		 * 成绩修改
		 */
		//加载成绩修改列表
		GET_ORIGINAL_SCORELIST:{
			url : "/score/score/getOriginalScoreList",
			method : RequestMethod.GET
		},
		
		/**
		 * 成绩审核
		 */
		//加载成绩审核列表
		GET_SCORE_APPROVAL_PAGEDLIST:{
			url : "/score/score/getScoreApprovalPagedList",
			method : RequestMethod.GET
		},
		//加载成绩审核列表详情
		GET_SCORE_APPROVAL_DETAILLIST:{
			url : "/score/score/getScoreApprovalStudentList",
			method : RequestMethod.GET
		},
		//成绩审核-单个或者多个审核
		SCORE_APPROVAL:{
			url : "/score/score/scoreApproval",
			method : RequestMethod.POST
		},

		/**
		 * 环节录入人设置
		 */
		//环节录入人设置分页
		GET_TACHE_SCORE_ENTRY_SET_PAGEDLIST:{
			url : "/score/tacheScore/getTacheScoreEntrySetPagedList",
			method : RequestMethod.POST
		},
		//保存
		SAVE_ENTER_USER:{
			url : "/score/tacheScore/saveEnterUser",
			method : RequestMethod.POST
		},
		//批量保存
		BATCH_SAVE_ENTER_TACHE_USER:{
			url : "/score/tacheScore/batchSaveEnterTacheUser",
			method : RequestMethod.POST
		},
		//环节录入人设置
		GET_TACHE_ENTRY_SCORE_NAME:{
			url : "/score/tacheScore/getTacheEntryScoreName",
			method : RequestMethod.POST
		},
		//环节录入人导出
		EXPORT_FILE:{
			url : "/score/tacheScore/exportFile",
			method : RequestMethod.POST
		},
		//查询未设置的数量
		GET_TACHE_SCORE_ENTRY_NUM:{
			url : "/score/tacheScore/getTacheScoreEntryNum",
			method : RequestMethod.POST
		},
		
		/**
		 * 成绩查询
		 */
		//学生成绩查询
		QUERY_STUDENT_SCORE_PAGEDLIST:{
			url : "/score/score/queryStudentScorePagedList",
			method : RequestMethod.GET
		},
		//学生成绩查询导出
		QUERY_STUDENT_SCORE_EXPORT:{
			url : "/score/score/queryStudentScoreExport",
			method : RequestMethod.GET
		},
		//学生成绩档案
		STUDENT_SCORE_ARCHIVES_PAGEDLIST:{
			url : "/score/score/studentScoreArchivesPagedList",
			method : RequestMethod.GET
		},
		//学生成绩档案总人数
		STUDENT_COUNT_SCORE:{
			url : "/score/score/getStudentListCount",
			method : RequestMethod.GET
		},
		//学生成绩档案打印
		STUDENT_SCORE_ARCHIVES_PRINT:{
			url : "/score/score/studentScoreArchivesPrint",
			method : RequestMethod.GET
		},
		//学生端-学生个人成绩查询
		SCORE_QUERY_BY_STUDENT:{
			url : "/score/score/scoreQueryByStudent",
			method : RequestMethod.GET
		},
		//学生成绩查询导出
		SCORE_QUERY_BY_STUDENT_EXPORT:{
			url : "/score/score/exportPersonalStudentScore",
			method : RequestMethod.POST
		},
		//补考
		GET_MARKUP_SCORE_ENTRY_USER_LIST:{
			url : "/score/markUpExamScoreEntry/getMarkupScoreEntryUserList",
			method : RequestMethod.POST
		},
		//补考新增录入人
		BATCH_MARK_UP_SAVEN_ENTRY_USER:{
			url : "/score/courseScore/batchMarkUpSaveEnterUser",
			method : RequestMethod.POST
		},
		//查询未设置的数量
		GET_MARKUP_ENTRY_USER_ID_NOSETNUM:{
			url : "/score/markUpExamScoreEntry/getMarkUpEntryUserIdNoSetNum",
			method : RequestMethod.POST
		},
		//导出
		GET_EXPORT:{
			url : "/score/markUpExamScoreEntry/export",
			method : RequestMethod.POST
		},
		
		/**
		 * 成绩发布
		 */
		//补考成绩录入人列表
		GET_SCORE_RELEASE_TIME_LIST:{
			url : "/score/score/queryScoreReleaseList",
			method : RequestMethod.POST
		},
		//保存发布成绩
		SAVE_RELEASE_SCORE:{
			url : "/score/score/saveReleaseScore",
			method : RequestMethod.POST
		},
		
		//获取教学任务的选课学生成绩
		GET_TEACHINGSCORE:{
			url : "/score/score/getTeachingScore",
			method : RequestMethod.GET
		},
		//获取行政班学生成绩
		GET_TACHESCORE_LIST:{
			url : "/score/score/getTacheScoreList",
			method : RequestMethod.GET
		},
		//获取学生成绩
		GET_CLASSSCORE_LIST:{
			url : "/score/score/getClassScoreList",
			method : RequestMethod.GET
		},
		//导出学生成绩
		EXPORT_CLASSSTUDENT_SCORE:{
			url : "/score/score/exportClassStudentScore",
			method : RequestMethod.POST
		},
		//导出学生成绩
		EXPORT_STUDENT_SCORE:{
			url : "/score/score/exportStudentScore",
			method : RequestMethod.POST
		},
	}
    module.exports = config;
});
