<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage="" pageEncoding="GBK"%>
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

</head>
<body background="./file/back.jpg">
	<div align="center">
		<p class="STYLE1">Value Convet</p>
	</div>
	
	<form id="form1" name="form1" method="post" action="OntologyServlet?opType=doConvertOntology">
	<div  align="left" class="STYLE2" style="border:1px solid blue">	
			<p>Êý¾ÝÏî±¾Ìå¸ÅÄî£º<input name="concept"/></p>
			<p>µ±Ç°Í¨³£Öµ£º<input name="currentValue"/></p>
            <p>µ±Ç°ÓïÒåÖµ£º<input name="currentAttriValues"/></p>
            <p>Ä¿±êÓïÒåÖµ£º<input name="goalAttriValues"/></p>
            <p class="STYLE3">¶à¸öÖµÖ®¼äÓÃ¿Õ¸ñ¸ô¿ª</p>
  </div>
	 <p>
	 <input type="submit" id="submit" value="×ª»»" />
	 </p>
	 
	 </form>

</body>
</html>