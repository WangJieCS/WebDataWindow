<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage="" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����ӳ�����</title>
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
    	   
    	 $('#attributes').append('<div>�ֶ�����<input type="text" name="attribute'+ i + '"/>&nbsp;&nbsp;&nbsp;�������ͣ�<select id="attriStyle'+ i + '" name="attriStyle' + i + '"><option value="varchar(50)">varchar(50)</option><option value="int">int</option><option value="float">float</option><option value="varchar(MAX)">varchar(MAX)</option><option value="bigint">bigint</option><option value="binary(50)">binary(50)</option><option value="bit">bit</option><option value="char(10)">char(10)</option><option value="date">date</option><option value="datetime">datetime</option><option value="decimal(18, 0)">decimal(18, 0)</option></select>  &nbsp; ����nullֵ <input type="checkbox" value=""/>&nbsp;&nbsp;&nbsp;<input type="button" id="delete1" value="��"></div>');  
    	
    	
    	  
    	  } else {  
    	   alert("����100��");  
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
    	 $(this).parent().append('<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<textarea name="attriValue'+ i + '"></textarea><input type="button" id="delete2" value="��"> <input type="button" id="addRelation" value="���ֵ���ϵ"></div><br>');  
    	 }); 
    	 $('#addRelation').live('click',function(){
    	 $(this).parent().append('<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<textarea name="relation'+ i + '"></textarea> <input type="button" id="delete2" value="��"></div>');  
    	 });  
    	});  
    </script>  

</head>
<body background="">
<input type="button" value="����������Ϣ��" style="color: black;background: #ACD6FF; width:160px;height:40px;font-size:16px;" />
<input type="button" value="����ӳ�����" style="color: black;background: #ACD6FF; width:110px;height:40px;font-size:16px;" />
<input type="button" value="���ת������" style="color: white;background: #0000FF; width:160px;height:50px;font-size:16px;" />


	<div align="left">
		<p class="STYLE1" style="color:white">����ӳ�����</p>
	</div>
	
	<form id="form1" name="form1" method="post" action="OntologyServlet?opType=doInsertOntology">
	<div>	
	                     
		 &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 	������Ϣ������
			<select id="valueStyle" name="valueStyle">
			<option value="varchar(50)">book</option>
		
</select>
 
<br /><br />

     �漰�����칹�ֶ�����
			<select id="valueStyle" name="valueStyle">
			<option value="varchar(50)">price</option>
		
</select>
 
    
        
      
         
        <p></p> 
      
            
   <div  align="left" class="STYLE2" style="border:1px solid blue">	
   <br />
		<div>��������	<select id="valueStyle" name="valueStyle">
			<option value="varchar(50)">currency</option>
	
</select>&nbsp;&nbsp;���Ľڵ㣺	<select id="valueStyle" name="valueStyle">
			<option value="varchar(50)">�����</option>
		
</select>	&nbsp;&nbsp;	<input  type="button" id="addAtrri" value="������Ľڵ�"/>  <br /><br /><br />
					
					
					<table  bordercolor="#000000" cellspacing="10px">
					<tr><th>Ŀ������ֵ</th><th>=</th><th>ϵ��</th><th>*</th><th>Դ����ֵ</th></tr>
					<tr><th>y</th><th>=</th><th>A</th><th>*</th><th>x</th></tr>
					<tr><th><select id="valueStyle" name="valueStyle">
			<option value="varchar(50)">�����</option></select>
					</th><th>=</th>
					<th><input name="concept" style="width:80px;"/></th>
					<th>*</th>
					<th><input name="concept" style="width:80px;"/></th></tr>
					
					<tr><th><select id="valueStyle" name="valueStyle">
			<option value="varchar(50)">�����</option></select>
					</th><th>=</th>
					<th><input name="concept" style="width:80px;"/></th>
					<th>*</th>
					<th><input name="concept" style="width:80px;"/></th></tr>
					
					<tr><th><select id="valueStyle" name="valueStyle">
			<option value="varchar(50)">�����</option></select>
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
	<input type="reset" id="reset" value="����" /> <input type="submit" id="submit" value="�ύ" />
	 </p>
	 
	 </form>

</body>
</html>