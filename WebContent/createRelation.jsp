<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage="" pageEncoding="GBK"%>
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
    $(function(){  
    	 var i=0;  
    	 $('#addAtrri').click(function(){  
    	  if(i < 100) {  
    	  i++;
    	   
    	 $('#attributes').append('<div>字段名：<input type="text" name="attribute'+ i + '"/>&nbsp;&nbsp;&nbsp;数据类型：<select id="attriStyle'+ i + '" name="attriStyle' + i + '"><option value="varchar(50)">varchar(50)</option><option value="int">int</option><option value="float">float</option><option value="varchar(MAX)">varchar(MAX)</option><option value="bigint">bigint</option><option value="binary(50)">binary(50)</option><option value="bit">bit</option><option value="char(10)">char(10)</option><option value="date">date</option><option value="datetime">datetime</option><option value="decimal(18, 0)">decimal(18, 0)</option></select>  &nbsp; 允许null值 <input type="checkbox" value=""/>&nbsp;&nbsp;&nbsp;<input type="button" id="delete1" value="×"></div>');  
    	
    	
    	  
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
<body background="">
<input type="button" value="创建主体信息表" style="color: black;background: #ACD6FF; width:160px;height:40px;font-size:16px;" />
<input type="button" value="生成映射规则" style="color: black;background: #ACD6FF; width:110px;height:40px;font-size:16px;" />
<input type="button" value="添加转换函数" style="color: white;background: #0000FF; width:160px;height:50px;font-size:16px;" />


	<div align="left">
		<p class="STYLE1" style="color:white">生成映射规则</p>
	</div>
	
	<form id="form1" name="form1" method="post" action="OntologyServlet?opType=doInsertOntology">
	<div>	
	                     
		 &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 	主体信息表名：
			<select id="valueStyle" name="valueStyle">
			<option value="varchar(50)">book</option>
		
</select>
 
<br /><br />

     涉及语义异构字段名：
			<select id="valueStyle" name="valueStyle">
			<option value="varchar(50)">price</option>
		
</select>
 
    
        
      
         
        <p></p> 
      
            
   <div  align="left" class="STYLE2" style="border:1px solid blue">	
   <br />
		<div>属性名：	<select id="valueStyle" name="valueStyle">
			<option value="varchar(50)">currency</option>
	
</select>&nbsp;&nbsp;中心节点：	<select id="valueStyle" name="valueStyle">
			<option value="varchar(50)">人民币</option>
		
</select>	&nbsp;&nbsp;	<input  type="button" id="addAtrri" value="添加中心节点"/>  <br /><br /><br />
					
					
					<table  bordercolor="#000000" cellspacing="10px">
					<tr><th>目标属性值</th><th>=</th><th>系数</th><th>*</th><th>源属性值</th></tr>
					<tr><th>y</th><th>=</th><th>A</th><th>*</th><th>x</th></tr>
					<tr><th><select id="valueStyle" name="valueStyle">
			<option value="varchar(50)">人民币</option></select>
					</th><th>=</th>
					<th><input name="concept" style="width:80px;"/></th>
					<th>*</th>
					<th><input name="concept" style="width:80px;"/></th></tr>
					
					<tr><th><select id="valueStyle" name="valueStyle">
			<option value="varchar(50)">人民币</option></select>
					</th><th>=</th>
					<th><input name="concept" style="width:80px;"/></th>
					<th>*</th>
					<th><input name="concept" style="width:80px;"/></th></tr>
					
					<tr><th><select id="valueStyle" name="valueStyle">
			<option value="varchar(50)">人民币</option></select>
					</th><th>=</th>
					<th><input name="concept" style="width:80px;"/></th>
					<th>*</th>
					<th><input name="concept" style="width:80px;"/></th></tr>
</table>
					</div>
		
		
  &nbsp;&nbsp; &nbsp;   <input  type="button" id="addAtrri" value="+"/> 
     <p></p> 
       
   
	</div>
	 
	
	
	
	 <p>
	<input type="reset" id="reset" value="重置" /> <input type="submit" id="submit" value="提交" />
	 </p>
	 
	 </form>

</body>
</html>