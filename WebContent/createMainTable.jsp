<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage="" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����������Ϣ��</title>
<script type="text/javascript" src="./file/jquery.js"></script>
<script type="text/javascript">
	function getValue(name) {
		let value=document.getElementsByName(name)[0].value;
		let TableName=document.getElementsByName('tableName')[0].value;
		console.log(value+TableName);
		window.open('createAttribute.jsp?name='+value+'&tableName='+TableName);
	}
</script>
<style type="text/css">
.STYLE1 {
	font-size: 20px;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	color: #000000;
}

.STYLE2 {
	font-size: 20px;
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
		$('#addFeild')
				.click(
						function() {
							if (i < 100) {
								i++;

								$('#feilds')
										.append(
												'<div>'+
													'�ֶ�����<input type="text" name="feild'+ i + '"/>&nbsp;&nbsp;&nbsp;'+
													'�������ͣ�'+
													'<select id="feildType'+ i + '" name="feildType' + i + '">'+
														'<option value="varchar(MAX)">varchar(MAX)</option>'+
														'<option value="int">int</option><option value="float">float</option>'+
														'<option value="varchar(50)">varchar(50)</option>'+
														'<option value="bigint">bigint</option>'+
														'<option value="binary(50)">binary(50)</option>'+
														'<option value="bit">bit</option>'+
														'<option value="char(10)">char(10)</option>'+
														'<option value="date">date</option>'+
														'<option value="datetime">datetime</option>'+
														'<option value="decimal(18, 0)">decimal(18, 0)</option>'+
													'</select>  '+
													'&nbsp; ����nullֵ <input name="nullValue' + i + '" type="checkbox" value=""/>&nbsp; &nbsp;'+
													'��Ϊ���� <input name="keyValue' + i + '" type="checkbox" value=""/>&nbsp;&nbsp; '+
													'[ <a href="javascript:;" target="_blank" onclick="getValue(\'feild'+i+'\')">������Թ�ϵ</a>]'+
												/* 	location=\'windowServlet?opType=doCreateAttribute&feild=\'+document.getElementsByName(\'feild'+i+'\')[0].value */
												/* '[ <a href="javascript:;" target="_blank" onclick="getValue(\'feild'+i+'\')">��Ӹ�ʽ</a>]'+ */
													'&nbsp;<input type="button" id="delete" value="��">'+
												'</div>');

							} else {
								alert("����100��");
							}
						});
		$('#delete').live('click', function() {
			$(this).parent().remove();
			i--;
		});
	});
</script>
<link 	href="http://travel-128.view.sitestar.cn/a5ff9619c0d55ec33f52759ebc554432.cssx" rel="stylesheet">
</head>
<body background="">
<div align="center">


	<div style="margin-top: 5%; margin-bottom: 50px;">
		<span style="color: #394c5f; font-family: 'Microsoft YaHei'; font-size: 40px; line-height: 28px; widows: 1; background-color: rgb(255, 255, 255);">Web���ݴ���</span>
	</div>


	<div class="product_list-layer73A2B298864E621ED516398DFA76638F" style="overflow: hidden;  margin-top: 30px;">
		<ul style="margin: 0px;">
			<li class="wp-new-article-style_lis" style="width: 160px;margin-right: 18px;height: 80px;background-color: #6792d4;">
				<div class="img" style="/* height: 110px; */width: 180px;text-align: center;vertical-align: middle;display: table-cell;">


					<a target="_blank" href="createMainTable.jsp" class="aeffect" style="margin-top: 0; padding-top: 0; border-top-style: solid;">

						<h1 style="color: #525252;vertical-align: middle; /*! margin: 20; */ /*! padding: 20; */border-top-width: 0px;border-top-style: solid;font-size: 20px;">����������Ϣ��</h1>

					</a>
				</div>
			</li>
			<li class="wp-new-article-style_lis" style="width: 160px;margin-right: 18px;height: 80px;background-color: #6792d4;">
				<div class="img" style="/* height: 110px; */width: 180px;text-align: center;vertical-align: middle;display: table-cell;">


					<a target="_blank" href="linkPage.jsp" class="aeffect">
						<h1 style="color: #e4fce1; vertical-align: middle; font-size: 20px;">����ҳ��</h1>
					</a>
				</div>
			</li>
			<li class="wp-new-article-style_lis" style="width: 160px;margin-right: 18px;height: 80px;background-color: #6792d4;">
				<div class="img" style="/* height: 110px; */width: 180px;text-align: center;vertical-align: middle;display: table-cell;">


					<a target="_blank" href="windowServlet?opType=showCreateMapPage" class="aeffect">
						<h1 style="color: #e4fce1; font-size: 20px;">����ӳ�����</h1>
					</a>
				</div>
			</li>
			<li class="wp-new-article-style_lis" style="width: 160px;margin-right: 18px;height: 80px;background-color: #6792d4;">
				<div class="img" style="/* height: 110px; */width: 180px;text-align: center;vertical-align: middle;display: table-cell;">


					<a target="_blank" href="windowServlet?opType=showCreateFunctionPage" class="aeffect">
						<h1 style="color: #e4fce1; font-size: 20px;">���ת������</h1>
					</a>
				</div>
			</li>
			
				<li class="wp-new-article-style_lis" style="width: 160px;margin-right: 18px;height: 80px;background-color: #6792d4;">
				<div class="img" style="/* height: 110px; */width: 180px;text-align: center;vertical-align: middle;display: table-cell;">


					<a target="_blank" href="windowServlet?opType=showRelationPage" class="aeffect">
						<h1 style="font-size: 20px; color: #e4fce1;">�������ֵ��ϵ</h1>
					</a>
				</div>
			</li>
			
			<li class="wp-new-article-style_lis" style="width: 160px;margin-right: 18px;height: 80px;background-color: #6792d4;">
				<div class="img" style="/* height: 110px; */width: 180px;text-align: center;vertical-align: middle;display: table-cell;">


					<a target="_blank" href="windowServlet?opType=showConvertPage" class="aeffect">
						<h1 style="font-size: 20px; color: #e4fce1;">ת������ֵ</h1>
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

<div style="
    width: 71%;
    margin-left: 15.2%;
    " align="center">
	<form id="form1" name="form1" method="post"
		action="windowServlet?opType=doCreateMainTable">
		<div align="left" class="STYLE2" style="border: 1px solid blue">
			<div>
				�� ����<input name="tableName" /><br />
				<br />
			</div>
			�ֶ�����<input name="feild1" />&nbsp;&nbsp; �������ͣ�<select id="feildType1"
				name="feildType1">
				<option value="varchar(MAX)">varchar(MAX)</option>
				<option value="varchar(50)">varchar(50)</option>
				<option value="int">int</option>
				<option value="float">float</option>
				<option value="bigint">bigint</option>
				<option value="binary(50)">binary(50)</option>
				<option value="bit">bit</option>
				<option value="char(10)">char(10)</option>
				<option value="date">date</option>
				<option value="datetime">datetime</option>
				<option value="decimal(18, 0)">decimal(18, 0)</option>
			</select> &nbsp; ����nullֵ <input name="nullValue1" type="checkbox" value="" />
			&nbsp; ��Ϊ���� <input name="keyValue1" type="checkbox" value="" />
			&nbsp; [ <a href="javascript:;"
				onclick="getValue('feild1')">������Թ�ϵ</a>]
<!-- onclick="location='windowServlet?opType=doCreateAttribute&feild='+document.getElementsByName('feild1')[0].value">������Թ�ϵ</a>] -->
			<!-- <a href="javascript:;" onclick="location='windowServlet?opType=doCreateAttribute&feild='+document.getElementsByName('feild1')[0].value">������Թ�ϵ</a> -->
			<!-- [ <a href="javascript:;"
				onclick="getValue('feild1')">��Ӹ�ʽ</a>] -->
			 <input type="button" id="delete" value="��">


				<div id="feilds"></div>

				<p></p> <input type="button" id="addFeild" value="����ֶ�" />
				<p></p> �������id��Ϊ���� <input type="checkbox" value="" />
		</div>
		<p>
			<input type="reset" id="reset" value="����" /> <input type="submit"
				id="submit" value="������" />
		</p>

	</form>
</div>
</body>
</html>