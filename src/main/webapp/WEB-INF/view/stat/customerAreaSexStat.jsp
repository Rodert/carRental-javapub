
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户地区性别统计</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${alfred}/resources/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${alfred}/resources/css/public.css" media="all"/>
</head>
<body style="height: 100%; margin: 0">
<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>

<form class="layui-form" method="post" id="searchFrm">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">选择地区:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" class="layui-input" name="area" id="area" style="height: 30px;border-radius: 10px">
            </div>
            <button type="button"
                    class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm"
                    id="doSearch" style="margin-top: 4px">查询
            </button>
            <button type="reset"
                    class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm"
                    style="margin-top: 4px">重置
            </button>
        </div>
    </div>
</form>

<div id="container" style="height: 80%;width: 90%;"></div>
<script type="text/javascript" src="${alfred}/resources/echarts/js/echarts.min.js"></script>
<script type="text/javascript" src="${alfred}/resources/echarts/js/jquery-3.1.1.min.js"></script>
<script src="${alfred}/resources/layui/layui.js"></script>

<script type="text/javascript">

    layui.use(['jquery', 'layer', 'form'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;

        $("#doSearch").click(function () {
            var area=$("#area").serialize();

            getData(area);
        });

        function getData(area) {
            $.get("${alfred}/stat/loadCustomerAreaSexStatJson.action",area,function (data) {
                for(var i=0;i<data.length;i++){
                    if(data[i].name == 0){
                        data[i].name = "女"
                    }
                    if(data[i].name == 1){
                        data[i].name = "男"
                    }
                }
                var dom = document.getElementById("container");
                var myChart = echarts.init(dom);
                var app = {};
                option = null;
                option = {
                    title: {
                        text: '汽车出租系统客户地区性别统计',
                        x: 'center',
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data: data
                    },
                    series: [
                        {
                            name: '客户数量(占比)',
                            type: 'pie',
                            radius: '55%',
                            center: ['50%', '60%'],
                            data: data,
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };
                ;
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }
            })
        }
    });

</script>
</body>
</html>
