/**
 * 分制设置
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
	//var base  =config.base;
	
	/**
	 * 分制设置
	 */
	var creditRegimen = {
		// 初始化
		init : function() {
			// 新增
			$(document).on("click", "button[name='add']", function() {
				creditRegimen.add(this);
			});
			// 查看
			$(document).on("click", "button[name='view']", function() {
				creditRegimen.view(this);
			});
			// 复选框
			utils.checkAllCheckboxes('check-all', 'checNormal');
		},
		/**
		 * 新增 弹窗
		 */
		add: function(){
			art.dialog.open('./score/paramSet/html/creditRegimenAdd.html', // 这里是页面的路径地址
				{
					id : 'add',// 唯一标识
					title : '分制新增',// 这是标题
					width : 900,// 这是弹窗宽度。其实可以不写
					height : 420,// 弹窗高度
					fixed: true,
					okVal : '保存',
					cancelVal : '关闭',
					ok : function() {
						return true;
					},
					cancel : function() {
						// 取消逻辑
					}
				});
		},
		/**
		 * 查看 弹窗
		 */
		view: function(){
			art.dialog.open('./score/paramSet/html/creditRegimenView.html', // 这里是页面的路径地址
				{
					id : 'view',// 唯一标识
					title : '分制查看',// 这是标题
					width : 900,// 这是弹窗宽度。其实可以不写
					height : 320,// 弹窗高度
					fixed: true,
					//okVal : '保存',
					cancelVal : '关闭',
					//ok : function() {
					//	return true;
					//},
					cancel : function() {
						// 取消逻辑
					}
				});
		}
	}
	module.exports = creditRegimen;
	window.creditRegimen = creditRegimen;
});