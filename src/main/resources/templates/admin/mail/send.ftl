<!--邮件发件箱页面ftl-->
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="/admin/X-admin-2.2/css/font.css">
    <link rel="stylesheet" href="/admin/X-admin-2.2/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="/admin/X-admin-2.2/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/admin/X-admin-2.2/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

    <body>
        <div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="javascript:void(0);">${parentMenu.name!""}</a>
                <a>
                	<cite>${currentMenu.name!""}</cite>
                </a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
                <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
            </a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                                <div class="layui-input-inline layui-show-xs-block">
	                                <#if onThirdMenus?size gt 0>
	                                	<#list onThirdMenus as onThirdMenu>
	                                		<#if onThirdMenu.parentId == currentMenu.id>
		                                		<a onclick="${onThirdMenu.url!""}">
		                                			<#if onThirdMenu.url == "openEdit();">
				                                    	<button class="layui-btn layui-btn-warm layui-btn-xs"><i class="icon iconfont">${onThirdMenu.icon!""}</i>&nbsp;${onThirdMenu.name!""}</button>
				                                	<#elseif onThirdMenu.url == "deleteMail();">
			                                			<button class="layui-btn-danger layui-btn layui-btn-xs"><i class="icon iconfont">${onThirdMenu.icon!""}</i>&nbsp;${onThirdMenu.name!""}</button>
				                                	<#else>
				                                		<button class="layui-btn"><i class="icon iconfont">${onThirdMenu.icon!""}</i>&nbsp;${onThirdMenu.name!""}</button>
				                                	</#if>
				                                </a>
			                                </#if>
	                                	</#list>
	                               	</#if>
	                               	&nbsp;&nbsp;
	                                <div class="layui-input-inline layui-show-xs-block">
                                    	<input class="layui-input" placeholder="邮件主题" id="search-name" value="${title!""}">
                                    </div>
                                    <button class="layui-btn" onclick="search();"><i class="icon iconfont">&#xe6ac;</i>&nbsp;搜索</button>
                                </div>
                                
                            <hr>
                            <blockquote class="layui-elem-quote">Tips：如果管理员对应角色权限一个也没有，那该管理员将无法登录哦！</blockquote>
                        </div>
                        <div class="layui-card-body ">
                            <table class="layui-table layui-form">
                              <thead>
                                  <th width="5" style="text-align:center"></th>
                                  <th width="5" style="text-align:center;">邮件ID</th>
                                  <th style="text-align:center">邮件主题</th>
                                  <th width="200" style="text-align:center">收件人</th>
                                  <th width="5" style="text-align:center">附件个数</th>
                                  <th width="120" style="text-align:center">时间</th>
                              </thead>
                              <tbody class="x-cate">
                              	  <#if PageInfo.list?size gt 0>
                              	  	<#list PageInfo.list as mail>
                              	  		<tr>
	                              	  	   <td style="text-align:center">
		                                      <input type="checkbox" name="" id="${mail.id!""}" method="checkedId" lay-skin="primary">
		                                   </td>
	                              	 	   <td style="text-align:center">${mail.id!""}</td>
	                              	 	   <td style="text-align:center">${mail.title!""}</td>
	                              	 	   <td style="text-align:center">
		                              	 	   <#if allAdmins?size gt 0>
		                              	 	   		<#list allAdmins as admin>
		                              	 	   			<#if mail.receiverId == admin.id>
		                              	 	   				<#assign flag = true>
		                              	 	   				${admin.name!""}
		                              	 	   			</#if>
		                              	 	   		</#list>
		                              	 	   </#if>
	                              	 	   </td>
	                              	 	   <#assign count = 0>
	                              	 	   <#if mail.attachmentOne??>
	                              	 	   		<#assign count++>
	                              	 	   </#if>
	                              	 	   <#if mail.attachmentTwo??>
	                              	 	   		<#assign count++>
	                              	 	   </#if>
	                              	 	   <#if mail.attachmentThree??>
	                              	 	   		<#assign count++>
	                              	 	   </#if>
	                              	 	   <td style="text-align:center">${count!""}</td>
	                              	 	   <td style="text-align:center">${mail.createTime?string('yyyy-MM-dd HH:mm:ss')!""}</td>
		                              	</tr>
                              	  	</#list>
                              	  </#if>
                              </tbody>
                            </table>
                        </div>
                        
                        <div class="layui-card-body ">
                            <div class="page">
                                <div>
                                  <#if PageInfo.pageNum == 1>
                              	      <a class="prev" href="javascript:void(0);">&lt;&lt;</a>
                                  <#else>
                                      <a class="prev" href="/admin/mail/send?id=${currentMenu.id!""}&pageNum=${PageInfo.prePage!""}&title=${title!""}">&lt;&lt;</a>
                                  </#if>
                                  <#list PageInfo.pageNum-2..PageInfo.pageNum-1 as i>
                                  	  <#if i gte 1>
                                  	  	 <a class="num" href="/admin/mail/send?id=${currentMenu.id!""}&pageNum=${i!""}&title=${title!""}">${i!""}</a>
                                  	  </#if>
                                  </#list>
                                  <span class="current">${PageInfo.pageNum!""}</span>
                                  <#list PageInfo.pageNum+1..PageInfo.pageNum+2 as i>
                                  	  <#if i lte PageInfo.pages>
                                  	  	 <a class="num" href="/admin/mail/send?id=${currentMenu.id!""}&pageNum=${i!""}&title=${title!""}">${i!""}</a>
                                  	  </#if>
                                  </#list>
                                  <#if PageInfo.pageNum == PageInfo.pages || PageInfo.pages == 0>
                                  	  <a class="next" href="javascript:void(0);">&gt;&gt;</a>
                                  <#else>
                                  	  <a class="next" href="/admin/mail/send?id=${currentMenu.id!""}&pageNum=${PageInfo.nextPage!""}&title=${title!""}">&gt;&gt;</a>
                                  </#if>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        
                        
                        
                        </div>
                      
                    </div>
                </div>
            </div>
        </div>
		<script>
          layui.use(['form'], function(){
            form = layui.form;
            
          });
          
            //搜索
		  function search(){
		  	  var title = $("#search-name").val();
		  	  window.location.href = "/admin/mail/send?title="+title+"&id="+${currentMenu.id};
		  }
          

          var ids = "";
          function checkedId(i){
          		if(ids == ""){
          			ids = i + ","
          		}else{
          			var flag = false; //判断有没有重复
          			ids = ids.substring(0,ids.length-1);
          			var arr = ids.split(',');
          			ids = "";
	          		for(var k=0;k<arr.length;k++){
	          			if(arr[k] != i){
	          				ids += arr[k];
	          				ids += ",";
	          			}else{
	          				flag = true;
	          			}
	          		}
	          		if(!flag){
	          			ids += i;
	          			ids += ",";
	          		}
          		
          		}
          }
          
          //邮件查看
          function preview(){
              var id = ids.substring(0,ids.length-1);
          	  if(id.indexOf(",") != -1 || id == ""){
          	  	  layer.alert("请选择一条数据进行查看！", {icon: 5}); 
          	  	  return;
          	  }
          	  xadmin.open('邮件查看','/admin/mail/preview?id='+id,'','',true)
         
          }
         
         
          
          //删除
          function deleteMail(){
          	  var id = ids.substring(0,ids.length-1);
          	  if(id.indexOf(",") != -1 || id == ""){
          	   	  layer.alert("请选择一条数据进行删除！", {icon: 5}); 
          	  	  return;
          	  }
          	  layer.confirm('确认要删除<font color="red">邮件id='+id+'</font>的这条数据吗？',function(index){
                 $.ajax({
					url:'/admin/mail/delete',
					type:'post',
					dataType:'json',
					data:{id:id},
					success:function(data){
						if(data.code == 0){
							layer.alert(data.msg, {icon: 6},function(){parent.window.location.reload();}); 
						}else{
							layer.alert(data.msg, {icon: 5}); 
						}
					},
					error:function(){
						layer.alert('网络错误！删除邮件失败！', {icon: 5}); 
					}
				});
	          });
          }
         
        </script>
    </body>
</html>
