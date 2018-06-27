<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.util.*,com.hpdb.window.bean.DataItem" errorPage="" pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>生成映射规则</title>
<script type="text/javascript" src="./file/jquery.js"></script>
<style type="text/css">
.STYLE1 {
	font-size: 14px;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	color: #000000;
}

.STYLE2 {
	font-size: 16px;
	font-family: Arial, Helvetica, sans-serif;
	font-weight:;
	color: #000000;
}

.STYLE3 {
	font-size: 14px;
	font-family: Arial, Helvetica, sans-serif;
	font-weight:;
	color: red;
}
</style>
<script>
	$(function() {
		var i = 0;
		$('#addAtrri')
				.click(
						function() {
							if (i < 100) {
								i++;

								$('#attributes')
										.append(
												'<div>字段名：<input type="text" name="attribute'+ i + '"/>&nbsp;&nbsp;&nbsp;数据类型：<select id="attriStyle'+ i + '" name="attriStyle' + i + '"><option value="varchar(50)">varchar(50)</option><option value="int">int</option><option value="float">float</option><option value="varchar(MAX)">varchar(MAX)</option><option value="bigint">bigint</option><option value="binary(50)">binary(50)</option><option value="bit">bit</option><option value="char(10)">char(10)</option><option value="date">date</option><option value="datetime">datetime</option><option value="decimal(18, 0)">decimal(18, 0)</option></select>  &nbsp; 允许null值 <input type="checkbox" value=""/>&nbsp;&nbsp;&nbsp;<input type="button" id="delete1" value="×"></div>');

							} else {
								alert("最多加100个");
							}
						});
		$('#delete1').live('click', function() {
			$(this).parent().remove();
			i--;
		});
		$('#delete2').live('click', function() {
			$(this).parent().remove();
		});
		$('#addAttriValue')
				.live(
						'click',
						function() {
							$(this)
									.parent()
									.append(
											'<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<textarea name="attriValue'+ i + '"></textarea><input type="button" id="delete2" value="×"> <input type="button" id="addRelation" value="添加值域关系"></div><br>');
						});
		$('#addRelation')
				.live(
						'click',
						function() {
							$(this)
									.parent()
									.append(
											'<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<textarea name="relation'+ i + '"></textarea> <input type="button" id="delete2" value="×"></div>');
						});
	});
</script>
<link 	href="http://travel-128.view.sitestar.cn/a5ff9619c0d55ec33f52759ebc554432.cssx" rel="stylesheet">
</head>
<body background="">
	<div align="center">


		<div style="margin-top: 5%; margin-bottom: 50px;">
			<span
				style="color: #394c5f; font-family: 'Microsoft YaHei'; font-size: 40px; line-height: 28px; widows: 1;">Web数据窗口</span>
		</div>


		<div class="product_list-layer73A2B298864E621ED516398DFA76638F"
			style="overflow: hidden; margin-top: 30px;">
			<ul style="margin: 0px;">
				<li class="wp-new-article-style_lis"
					style="width: 160px; margin-right: 18px; height: 80px; background-color: #6792d4;">
					<div class="img"
						style="width: 180px; text-align: center; vertical-align: middle; display: table-cell;">


						<a target="_blank" href="createMainTable.jsp" class="aeffect"
							style="margin-top: 0; padding-top: 0; border-top-style: solid;">

							<h1
								style="color: #e4fce1; vertical-align: middle; /*! margin: 20; */ /*! padding: 20; */ border-top-width: 0px; border-top-style: solid; font-size: 20px;">创建主体信息表</h1>

						</a>
					</div>
				</li>
				<li class="wp-new-article-style_lis"
					style="width: 160px; margin-right: 18px; height: 80px; background-color: #6792d4;">
					<div class="img"
						style="width: 180px; text-align: center; vertical-align: middle; display: table-cell;">


						<a target="_blank" href="linkPage.jsp" class="aeffect">
							<h1
								style="color: #e4fce1; vertical-align: middle; font-size: 20px;">搜索页面</h1>
						</a>
					</div>
				</li>
				<li class="wp-new-article-style_lis"
					style="width: 160px; margin-right: 18px; height: 80px; background-color: #6792d4;">
					<div class="img"
						style="width: 180px; text-align: center; vertical-align: middle; display: table-cell;">


						<a target="_blank" href="windowServlet?opType=showCreateMapPage"
							class="aeffect">
							<h1 style="color: #525252; font-size: 20px;">生成映射规则</h1>
						</a>
					</div>
				</li>
				<li class="wp-new-article-style_lis"
					style="width: 160px; margin-right: 18px; height: 80px; background-color: #6792d4;">
					<div class="img"
						style="width: 180px; text-align: center; vertical-align: middle; display: table-cell;">


						<a target="_blank"
							href="windowServlet?opType=showCreateFunctionPage"
							class="aeffect">
							<h1 style="color: #e4fce1; font-size: 20px;">添加转换函数</h1>
						</a>
					</div>
				</li>

				<li class="wp-new-article-style_lis"
					style="width: 160px; margin-right: 18px; height: 80px; background-color: #6792d4;">
					<div class="img"
						style="width: 180px; text-align: center; vertical-align: middle; display: table-cell;">


						<a target="_blank" href="windowServlet?opType=showRelationPage"
							class="aeffect">
							<h1 style="font-size: 20px; color: #e4fce1;">添加属性值关系</h1>
						</a>
					</div>
				</li>

				<li class="wp-new-article-style_lis"
					style="width: 160px; margin-right: 18px; height: 80px; background-color: #6792d4;">
					<div class="img"
						style="width: 180px; text-align: center; vertical-align: middle; display: table-cell;">


						<a target="_blank" href="windowServlet?opType=showConvertPage"
							class="aeffect">
							<h1 style="font-size: 20px; color: #e4fce1;">转换数据值</h1>
						</a>
					</div>
				</li>

			</ul>
			<style>
<!--
#layer73A2B298864E621ED516398DFA76638F .wp-new-article-style_lis:hover {
	border-color: #1dd2af;
}

#layer73A2B298864E621ED516398DFA76638F .wp-new-article-style_lis {
	
}
-->
</style>
		</div>
	</div>

	<div style="width: 71%; margin-left: 15.2%;">


	<form id="form1" name="form1" method="post"
		action="windowServlet?opType=doCreateMapTable">
		<div>

			主体信息表名：<select id="tableName" name="tableName">
			<%  String tableName=(String)session.getAttribute("tableName");
						out.print("<option value='"+tableName+"'>"+tableName+"</option>");
								%>
			</select> <br />
			  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 




				<p></p>


				<div align="left" class="STYLE2" style="border: 1px solid blue">

					<table border="0">
						<td>

							<table border="1px" bordercolor="#000000" cellspacing="0px">

								<tr>
									<td>主体字段名</td>
									<td>对应数据项编号</td>

								</tr>
								<% ArrayList<String> feilds=(ArrayList<String>)session.getAttribute("feilds");
									for(String ziduanName:feilds){
										out.print("<tr><td>"+ziduanName+"</td><td><input name=\""+ziduanName+"\"/></td></tr>");
									}
								%>
								
								<tr>
									<p class="STYLE3">多个编号之间用空格隔开</p>
									<p><a target="_blank" href="windowServlet?opType=showCreateFormatPage">为主体字段添加格式 </a></p>
								</tr>
							</table>

						</td>


						<th width="200">
							<table border="0" align="center" cellpadding="10px">
								<tr>
									<td><input type="button" id="delete2" value="查看数据记录树形结构"></td>

								</tr>
								<tr>
									<td><input type="button" id="delete2" value="查看源网页内容"></td>

								</tr>
							</table>

						</th>



						<td>

							<table border="1px" bordercolor="#000000" cellspacing="0px">
								<tr>
									<td>编号</td>
									<td>节点文本</td>
									<td>class属性值</td>
								</tr>
								
								<% 
								ArrayList<DataItem> dataItemInfors=((ArrayList<DataItem>)session.getAttribute("dataItemInfors")); 
								    
									for(int i=0;i<dataItemInfors.size();i++){
										out.print("<tr>");
										out.print("<td>"+(i+1)+"</td>");
										DataItem dataItemInfo=dataItemInfors.get(i);
										out.print("<td>"+dataItemInfo.text+"</td>");
										out.print("<td>"+dataItemInfo.classAtri+"</td>");
										out.print("</tr>");
									}
								
								%>
							</table>
						</td>




					</table>









				</div>
		</div>
		<p>
			<input type="reset" id="reset" value="重置" /> <input type="submit"
				id="submit" value="提交" />
		</p>

	</form>
</div>
</body>
</html>