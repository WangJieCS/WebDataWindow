<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*,java.util.*" errorPage="" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Value Convet</title>
<script type="text/javascript" src="./file/jquery.js"></script>
<style type="text/css">
.STYLE1 {
	font-size: 48px;
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
<link 	href="http://travel-128.view.sitestar.cn/a5ff9619c0d55ec33f52759ebc554432.cssx" rel="stylesheet">

</head>
<body>
	<div align="center">


		<div style="margin-top: 5%; margin-bottom: 50px;">
			<span
				style="color: #394c5f; font-family: 'Microsoft YaHei'; font-size: 40px; line-height: 28px; widows: 1;">WebÊý¾Ý´°¿Ú</span>
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
								style="color: #e4fce1; vertical-align: middle; /*! margin: 20; */ /*! padding: 20; */ border-top-width: 0px; border-top-style: solid; font-size: 20px;">´´½¨Ö÷ÌåÐÅÏ¢±í</h1>

						</a>
					</div>
				</li>
				<li class="wp-new-article-style_lis"
					style="width: 160px; margin-right: 18px; height: 80px; background-color: #6792d4;">
					<div class="img"
						style="width: 180px; text-align: center; vertical-align: middle; display: table-cell;">


						<a target="_blank" href="linkPage.jsp" class="aeffect">
							<h1
								style="color: #e4fce1; vertical-align: middle; font-size: 20px;">ËÑË÷Ò³Ãæ</h1>
						</a>
					</div>
				</li>
				<li class="wp-new-article-style_lis"
					style="width: 160px; margin-right: 18px; height: 80px; background-color: #6792d4;">
					<div class="img"
						style="width: 180px; text-align: center; vertical-align: middle; display: table-cell;">


						<a target="_blank" href="windowServlet?opType=showCreateMapPage"
							class="aeffect">
							<h1 style="color: #e4fce1; font-size: 20px;">Éú³ÉÓ³Éä¹æÔò</h1>
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
							<h1 style="color: #e4fce1; font-size: 20px;">Ìí¼Ó×ª»»º¯Êý</h1>
						</a>
					</div>
				</li>

				<li class="wp-new-article-style_lis"
					style="width: 160px; margin-right: 18px; height: 80px; background-color: #6792d4;">
					<div class="img"
						style="width: 180px; text-align: center; vertical-align: middle; display: table-cell;">


						<a target="_blank" href="windowServlet?opType=showRelationPage"
							class="aeffect">
							<h1 style="font-size: 20px; color: #e4fce1;">Ìí¼ÓÊôÐÔÖµ¹ØÏµ</h1>
						</a>
					</div>
				</li>

				<li class="wp-new-article-style_lis"
					style="width: 160px; margin-right: 18px; height: 80px; background-color: #6792d4;">
					<div class="img"
						style="width: 180px; text-align: center; vertical-align: middle; display: table-cell;">


						<a target="_blank" href="windowServlet?opType=showConvertPage"
							class="aeffect">
							<h1 style="font-size: 20px; color: #525252;">×ª»»Êý¾ÝÖµ</h1>
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

	
	<form id="form1" name="form1" method="post" action="windowServlet?opType=doConvert">
	<div  align="left" class="STYLE2" style="border:1px solid blue">	
			<p>Ö÷ÌåÐÅÏ¢±í£º
				<select id="tableName" name="tableName">
			<%  String tableName=(String)session.getAttribute("tableName");
						out.print("<option value='"+tableName+"'>"+tableName+"</option>");
								%>
			</select></p>
			<p>Éæ¼°ÓïÒåÒì¹¹×Ö¶Î£º
			<select id="heterogeneousFeild" name="heterogeneousFeild">
			<%  String heterogeneousFeild=(String)session.getAttribute("heterogeneousFeild");
						out.print("<option value='"+heterogeneousFeild+"'>"+heterogeneousFeild+"</option>");
								%>
			</select></p>
            <p>ÊôÐÔÃû£º
            	<select id="attributeName" name="attributeName">
			<%  String theAttribute=(String)session.getAttribute("theAttribute");
						out.print("<option value='"+theAttribute+"'>"+theAttribute+"</option>");
								%>
</select>
 
            </p>
            <p>Ä¿±êÊôÐÔÖµ£º<input name="goalAttriValue"/></p>
            <!-- <p class="STYLE3">¶à¸öÖµÖ®¼äÓÃ¿Õ¸ñ¸ô¿ª</p> -->
  </div>
	 <p>
	 <input type="submit" id="submit" value="×ª»»" />
	 </p>
	 
	 </form>
</div>
</body>
</html>