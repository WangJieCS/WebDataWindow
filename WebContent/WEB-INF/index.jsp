<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage="" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Ontology Define</title>
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
<script>  
    $(function(){  
    	 var i=0;  
    	 $('#addAtrri').click(function(){  
    	  if(i < 100) {  
    	  i++;
    	   $('#attributes').append('<div><input type="text" name="attribute'+ i + '"/>	<select id="attriStyle'+ i + '" name="attriStyle' + i + '"><option value="varchar(50)">varchar(50)</option><option value="int">int</option><option value="float">float</option><option value="varchar(MAX)">varchar(MAX)</option><option value="bigint">bigint</option><option value="binary(50)">binary(50)</option><option value="bit">bit</option><option value="char(10)">char(10)</option><option value="date">date</option><option value="datetime">datetime</option><option value="decimal(18, 0)">decimal(18, 0)</option></select> <input type="button" id="delete1" value="×"> <input type="button" id="addAttriValue" value="添加属性值域"></div>');  
    	  } else {  
    	   alert("最多加100个");  
    	  }  
    	 });  
    	 $('#delete1').live('click',function(){  
    	 $(this).parent().remove();  
    	 i--;  
    	 });  
    	 $('#delete2').live('click',function(){  
    	 $(this).parent().remove();    
    	 });
    	 $('#addAttriValue').live('click',function(){
    	 $(this).parent().append('<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<textarea name="attriValue'+ i + '"></textarea><input type="button" id="delete2" value="×"> <input type="button" id="addRelation" value="添加值域关系"></div><br>');  
    	 }); 
    	 $('#addRelation').live('click',function(){
    	 $(this).parent().append('<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<textarea name="relation'+ i + '"></textarea> <input type="button" id="delete2" value="×"></div>');  
    	 });  
    	});  
    </script>  

</head>
<body background="./file/back.jpg">
	<div align="center">
		<p class="STYLE1">Ontology Define</p>
	</div>
	
	<form id="form1" name="form1" method="post" action="OntologyServlet?opType=doInsertOntology">
	<div  align="left" class="STYLE2" style="border:1px solid blue">	
			<p>数据项本体概念：<input name="concept"/>	值类型：<select id="valueStyle" name="valueStyle">
			<option value="varchar(50)">varchar(50)</option>
			<option value="int">int</option>
			<option value="float">float</option>
			<option value="varchar(MAX)">varchar(MAX)</option>
            <option value="bigint">bigint</option>
            <option value="binary(50)">binary(50)</option>
            <option value="bit">bit</option>
            <option value="char(10)">char(10)</option>
            <option value="date">date</option>
            <option value="datetime">datetime</option>
            <option value="decimal(18, 0)">decimal(18, 0)</option>
</select></p>
            <input  type="button" id="addAtrri" value="添加本体属性"/>  
            
   <div id="attributes" >  
   </div>  
	<p></p><p class="STYLE3">多个值之间用空格隔开</p></div>
	 <p>
	 <input type="submit" id="submit" value="提交" />
	 </p>
	 
	 </form>

</body>
</html>