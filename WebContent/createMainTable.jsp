<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage="" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����������Ϣ��</title>
<script type="text/javascript" src="./file/jquery.js"></script>
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
    $(function(){  
    	 var i=1;  
    	 $('#addFeild').click(function(){  
    	  if(i < 100) {  
    	  i++;
    	   
    	 $('#feilds').append('<div>�ֶ�����<input type="text" name="feild'+ i + '"/>&nbsp;&nbsp;&nbsp;�������ͣ�<select id="feildType'+ i + '" name="feildType' + i + '"><option value="varchar(50)">varchar(50)</option><option value="int">int</option><option value="float">float</option><option value="varchar(MAX)">varchar(MAX)</option><option value="bigint">bigint</option><option value="binary(50)">binary(50)</option><option value="bit">bit</option><option value="char(10)">char(10)</option><option value="date">date</option><option value="datetime">datetime</option><option value="decimal(18, 0)">decimal(18, 0)</option></select>  &nbsp; ����nullֵ <input name="nullValue' + i + '" type="checkbox" value=""/>&nbsp; &nbsp;��Ϊ���� <input name="keyValue' + i + '" type="checkbox" value=""/>&nbsp;&nbsp; <input type="button" id="addAttibute" value="������Թ�ϵ">&nbsp;&nbsp;&nbsp;<input type="button" id="delete" value="��"></div>');  
    	
    	
    	  
    	  } else {  
    	   alert("����100��");  
    	  }  
    	 });  
    	 $('#delete').live('click',function(){  
    	 $(this).parent().remove();  
    	 i--;  
    	 });  
    	});  
    </script>  

</head>
<body background="">
<p></p> <p></p> 
<input type="button" value="����������Ϣ��" style="color: white;background: #0000FF; width:130px;height:50px;font-size:16px;" />
<input type="button" value="����ӳ�����" style="color: black;background: #ACD6FF; width:110px;height:40px;font-size:16px;" />
<input type="button" value="���ת������" style="color: black;background: #ACD6FF; width:160px;height:40px;font-size:16px;" />


	<div align="left">
		<p class="STYLE1" style="color:white">����������Ϣ��</p>
	</div>
	
	<form id="form1" name="form1" method="post" action="windowServlet?opType=doCreateMainTable">
	<div  align="left" class="STYLE2" style="border:1px solid blue">	
		<div>�� ����<input name="tableName"/><br /><br /></div>
			�ֶ�����<input name="feild1"/>&nbsp;&nbsp;	
			�������ͣ�<select id="feildType1" name="feildType1">
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
</select>
  &nbsp; ����nullֵ <input name="nullValue1" type="checkbox" value=""/>
  &nbsp; ��Ϊ���� <input name="keyValue1" type="checkbox" value=""/>
  &nbsp; <input type="button" id="addAttribute" value="������Թ�ϵ">
 &nbsp; <input type="button" id="delete" value="��">

     
     
        
      <div id="feilds" >   </div>  
         
        <p></p> 
    <input  type="button" id="addFeild" value="����ֶ�"/>  
      <p></p> 
            �������id��Ϊ���� <input type="checkbox" value=""/>
   
	</div>
	 <p>
	<input type="reset" id="reset" value="����" /> <input type="submit" id="submit" value="������" />
	 </p>
	 
	 </form>

</body>
</html>