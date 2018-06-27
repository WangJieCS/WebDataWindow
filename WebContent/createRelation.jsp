<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*,java.util.*" errorPage="" pageEncoding="GBK"%>
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
	var i = 1;
	$('#addAtrri')
			.click(
					function() {
						if (i < 100) {
							i++;
							let appendHTML=$('#tr').html();
							$('#table')
									.append(
											'<%
											out.print("<tr>");
											ArrayList<String> functionList=(ArrayList<String>)session.getAttribute("functionList");
											for(int n=0;n<functionList.size();n++){
												String th=functionList.get(n);
												if(th.matches("[+|-|*|/|=]"))
													out.print("<th>"+th+"</th>");
												else if(th.matches("[A-Z]"))
													out.print("<th>"+"<input name=\""+th);%>'
													+i+'<%out.print("\" style=\"width: 80px;\" />"+"</th>");
												if(th.matches("[x]"))
													out.print("<th>"+"<input name=\""+th);%>'
													+i+'<%out.print("\" style=\"width: 80px;\" />"+"</th>");
												if(th.matches("[y]"))
													out.print("<th>"+"<input name=\""+th);%>'
													+i+'<%out.print("\" style=\"width: 80px;\" />"+"</th>");
											}
											out.print("<th>"+"<input type=\"button\" id=\"delete\" value=\"删除\">"+"</th>");
											out.print("</tr>");
											%>'
											);

						} else {
							alert("最多加100个");
						}
					});
	$('#delete').live('click', function() {
		$(this).parent().parent().remove();
		i--;
	});
});
</script>
<link 	href="http://travel-128.view.sitestar.cn/a5ff9619c0d55ec33f52759ebc554432.cssx" rel="stylesheet">

</head>
<body background="">
	<div align="center">


		<div style="margin-top: 5%; margin-bottom: 50px;">
			<span
				style="color: #394c5f; font-family: 'Microsoft YaHei'; font-size: 40px; line-height: 28px; widows: 1; background-color: rgb(255, 255, 255);">Web数据窗口</span>
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
							<h1 style="color: #e4fce1; font-size: 20px;">生成映射规则</h1>
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
							<h1 style="font-size: 20px; color: #525252;">添加属性值关系</h1>
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
		action="windowServlet?opType=doCreateRelation">
		<div>

			主体信息表名： <input name="tableName" value="<%=session.getAttribute("tableName") %>" size=10/> 
			 <br />
			<br />涉及语义异构字段名：
			<input name="heterogeneousFeild" value="<%=session.getAttribute("heterogeneousFeild") %>" size=10/>
			 <br />
			<br />属性名：
<input name="theAttribute" value="<%=session.getAttribute("theAttribute") %>" size=10/>



			<p></p>


			<div align="left" class="STYLE2" style="border: 1px solid blue">
				<br />
				<div>


					<table cellspacing="10px" id="table">
						<tr>
							<%
							ArrayList<String> functionLabelList=(ArrayList<String>)session.getAttribute("functionLabelList");
							for(String th:functionLabelList){
								out.print("<th>"+th+"</th>");
							}
							%>
							
						</tr>
						<tr>
							<%
							functionList=(ArrayList<String>)session.getAttribute("functionList");
							for(String th:functionList){
								out.print("<th>"+th+"</th>");
							}
							%>
							
						</tr>
						<tr id="tr">
							<%
							
							for(int i=0;i<functionList.size();i++){
								String th=functionList.get(i);
								if(th.matches("[+|-|*|/|=]"))
									out.print("<th>"+th+"</th>");
								else if(th.matches("[A-Z]"))
									out.print("<th>"+"<input name=\""+th+"1\" style=\"width: 80px;\" />"+"</th>");
								else if(th.matches("[x]"))
									out.print("<th>"+"<input name=\""+th+"1\" style=\"width: 80px;\" />"+"</th>");
								else if(th.matches("[y]"))
									out.print("<th>"+"<input name=\""+th+"1\" style=\"width: 80px;\" />"+"</th>");
							}
							out.print("<th>"+"<input type=\"button\" id=\"delete\" value=\"删除\">"+"</th>");
							%>
							
						</tr>

					

					
					</table>
				</div>


				&nbsp;&nbsp; &nbsp; <input type="button" id="addAtrri" value="+" />
				<p></p>


			</div>




			<p>
				<input type="reset" id="reset" value="重置" /> <input type="submit"
					id="submit" value="提交" />
			</p>
	</form></div>

</body>
</html>