     $(function (){
		  var data = getData();
		  console.info("data:"+JSON.stringify(data)); 
		  //渲染视图
		  getEcharts(data.times_aps_name,data.consumTimes_aps,"chart_aps",data.openTimes_aps);
		  getEcharts(data.times_cps_name,data.consumTimes_cps,"chart_cps",data.openTimes_cps);
		  getEcharts(data.times_auth_name,data.consumTimes_auth,"chart_auth",data.openTimes_auth);
		  getEcharts(data.times_mps_name,data.consumTimes_mps,"chart_mps",data.openTimes_mps); 
		  getEcharts(data.times_afs_name,data.consumTimes_afs,"chart_afs",data.openTimes_afs);
		 // getEcharts(data.times_cum_name,data.consumTimes_cum,"chart_cum",data.openTimes_cum);
		  
		  
		  //窗口缩放 echarts图适应大小 
		  setTimeout(function (){ 
                 window.onresize = function () {    
                	 echart_resize(data.times_aps_name,data.consumTimes_aps,"chart_aps",data.openTimes_aps);
                	 echart_resize(data.times_cps_name,data.consumTimes_cps,"chart_cps",data.openTimes_cps);
                	 echart_resize(data.times_mps_name,data.consumTimes_mps,"chart_mps",data.openTimes_mps);
                	 echart_resize(data.times_afs_name,data.consumTimes_afs,"chart_afs",data.openTimes_afs);
                	 //echart_resize(data.times_cum_name,data.consumTimes_cum,"chart_cum",data.openTimes_cum);
                	 echart_resize(data.times_auth_name,data.consumTimes_auth,"chart_auth",data.openTimes_auth);
                 }  
             },200)
	  });
	          
	   function getData(){
		   var baseurl = "<%=request.getRequestURL()%>";
		   var pre = baseurl.substr(0,baseurl.indexOf("bdp-app")-1);
		   var url = pre+'/bdp-app/jsonAjaxProxy.do?requestMap=bdp.system.consumingtime';
		   alert(url);
		   var resultdata = [];
			  //拉取数据
			  $.ajax({
				  url:url,
				  async:false,
				  type : 'GET',
				  success : function(data){
					  resultdata =  data;
				  }
			  }); 
			  return resultdata;
	   }
	          
	  function echart_resize(name,datay,id,datax){
		var chart_dom = echarts.init(document.getElementById(id));
			chart_dom.setOption(getOption(name,datay,datax));
			chart_dom.resize(); 
	  }
	  
	  //渲染echarts视图 
	  function getEcharts(name,datay,id,datax){ 
		 var option =  getOption(name,datay,datax); 
		  var chart = document.getElementById(id); 
		  var echart = echarts.init(chart);
		  echart.setOption(option);
		  echart.hideLoading(); 
		  option = {};
	  }
	  
	  //获取echarts配置项 
	  function getOption(name,datay,datax) {
			var chartOption = {
				    title : {
				        text: '',   
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				        data:[]
				    },
				    toolbox: {
				        show : true,
				        feature : {
				           // magicType : {show: true, type: ['line']},
				           // restore : {show: true},
				           // saveAsImage : {show: true} 
				        }
				    },
				    dataZoom : {
				        show : true,
				        realtime: true,
				        start : 0,
				        end : 60
				    },
				    xAxis : [
				        
				        {
				            type : 'category',
				            boundaryGap : false,
				            data : null,
				            axisLabel : {
				    	   	  // interval : 29,
				            	formatter : function(value){
				            			return value.slice(11);
				            	}
				            }
				           // splitNumber : 9
				        } 
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            scale: true,
				            name : '耗时 ms'
				        }
				    ],
				    series : [
				        {
				            name:'', 
				            type:'line',
				            smooth:true,
				            itemStyle: {
				            	normal: {    
				            		color:'#FFBFA8',
				            		areaStyle: {type: 'default'},
				            		lineStyle:{
										color:'#FF7F50' 
									}
				                }
				            },
				            data:null
				        }
				    ]
			}
			chartOption.title.text = name;
			chartOption.legend.data[0] = name;
			chartOption.series[0].data = datay;
			chartOption.series[0].name = name; 
			chartOption.xAxis[0].data = datax ;
			
		return 	chartOption;
	  }
