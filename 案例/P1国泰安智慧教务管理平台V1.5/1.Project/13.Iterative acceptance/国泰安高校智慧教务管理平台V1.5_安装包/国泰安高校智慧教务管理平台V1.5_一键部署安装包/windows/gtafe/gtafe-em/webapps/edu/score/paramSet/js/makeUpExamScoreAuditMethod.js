/**
 * 补考成绩审核方法
 */
define(function(require, exports, module) {
	var utils = require("basePath/utils/utils");
	var ajaxData = require("basePath/utils/ajaxData");
	var config = require("basePath/utils/config");
	var url = require("configPath/url.trainplan");
	var urlData = require("configPath/url.data");
	var urlUdf = require("configPath/url.udf");
	var pagination = require("basePath/utils/pagination");
	var popup = require("basePath/utils/popup");
	var common = require("basePath/utils/common");
	var ve = require("basePath/utils/validateExtend");
	var dataDictionary=require("configPath/data.dictionary");
	var importUtils = require("basePath/utils/importUtils"); //文件上传帮助
	var isEnabled=require("basePath/enumeration/common/IsEnabled");
	var vCourseOrTache=require("basePath/enumeration/trainplan/CourseOrTache");
	// 下拉框
	var select = require("basePath/module/select");
	var simpleSelect = require("basePath/module/select.simple");
	var base  =config.base;
	
	/**
	 * 补考成绩审核方法
	 */
	var makeUpExamScoreAuditMethod = {
		// 初始化
		init : function() {

			// 复选框
			utils.checkAllCheckboxes('check-all', 'checNormal');
		},


	}
	module.exports = makeUpExamScoreAuditMethod;
	window.makeUpExamScoreAuditMethod = makeUpExamScoreAuditMethod;
});
