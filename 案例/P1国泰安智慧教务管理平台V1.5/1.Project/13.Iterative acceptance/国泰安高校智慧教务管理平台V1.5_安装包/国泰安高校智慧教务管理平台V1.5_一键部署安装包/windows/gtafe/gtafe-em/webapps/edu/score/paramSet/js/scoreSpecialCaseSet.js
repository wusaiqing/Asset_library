/**
 * 成绩特殊情况设置
 */
define(function(require, exports, module) {
    var utils = require("basePath/utils/utils");
    var ajaxData = require("basePath/utils/ajaxData");
    var config = require("basePath/utils/config");
    var url = require("configPath/url.score");
    var urlData = require("configPath/url.data");
    var urlUdf = require("configPath/url.udf");
    var pagination = require("basePath/utils/pagination");
    var popup = require("basePath/utils/popup");
    var common = require("basePath/utils/common");
    var ve = require("basePath/utils/validateExtend");
    var dataDictionary=require("configPath/data.dictionary");

    /**
     * 成绩审核
     */
    var scoreSpecialCaseSet = {
        // 初始化
        init : function() {
            // 新增
            $(document).on("click", "[name='add']", function() {
                scoreSpecialCaseSet.add(this);
            });

            // 复选框
            utils.checkAllCheckboxes('check-all', 'checNormal');
        },
        /**
         * 新增 弹窗
         */
        add: function(){
            art.dialog.open('./score/paramSet/html/scoreSpecialCaseSetAdd.html', // 这里是页面的路径地址
                {
                    id : 'add',// 唯一标识
                    title : '成绩特殊情况新增',// 这是标题
                    width : 450,// 这是弹窗宽度。其实可以不写
                    height : 220,// 弹窗高度
                    okVal : '保存',
                    cancelVal : '关闭',
                    ok : function() {
                        return true;
                    },
                    cancel : function() {
                        // 取消逻辑
                    }
                });
        }


    }
    module.exports = scoreSpecialCaseSet;
    window.scoreSpecialCaseSet = scoreSpecialCaseSet;
});