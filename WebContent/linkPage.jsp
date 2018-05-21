<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage="" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>WEB DATA WINDOW</title>
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
  

</head>
<body background="./file/back.jpg">
	<div align="center">
		<p class="STYLE1">WEB DATA WINDOW</p>
	</div>
	
	<form id="form1" name="form1" method="post" action="windowServlet?opType=doExtractHtml">
	<div  align="left" class="STYLE2" style="border:1px solid blue">	
			请输入链接：<input name="urlString" value="http://search.dangdang.com/?key=%BC%C6%CB%E3%BB%FA&act=input" style="width:500px;"/>
			</div>
	 <p>
	 <input type="submit" id="submit" value="加载" />
	 </p>
	 
	 </form>

</body>
</html>