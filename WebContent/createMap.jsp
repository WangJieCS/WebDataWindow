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
<input type="button" value="����ӳ�����" style="color: white;background: #0000FF; width:110px;height:50px;font-size:16px;" />
<input type="button" value="���ת������" style="color: black;background: #ACD6FF; width:160px;height:40px;font-size:16px;" />


	<div align="left">
		<p class="STYLE1" style="color:white">����ӳ�����</p>
	</div>
	
	<form id="form1" name="form1" method="post" action="OntologyServlet?opType=doInsertOntology">
	<div>	
	                     
			������Ϣ������
			<select id="valueStyle" name="valueStyle">
			<option value="varchar(50)">book</option>
		
</select>
 
<br /><br />

   &nbsp; &nbsp; &nbsp;&nbsp;   ��վ����
			<select id="valueStyle" name="valueStyle">
			<option value="varchar(50)">������</option>
		
</select>
 
 <br /><br />

     �����ؼ��֣�
			<select id="valueStyle" name="valueStyle">
			<option value="varchar(50)">�����</option>
		
</select>
 
 
 
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="button" id="delete2" value="��ѯ">
     
        
      
         
        <p></p> 
      
            
   <div  align="left" class="STYLE2" style="border:1px solid blue">
   
   <table border="0">
   <td>
   
   <table border="1px" bordercolor="#000000" cellspacing="0px"> 
 
  <tr>
    <td>�����ֶ���</td>
    <td>��Ӧ��������</td>
    
  </tr>
  <tr>
    <td>bookName</td>
    <td><input name="concept" value="1 2 3"/></td>
  </tr>
  <tr>
    <td>author</td>
    <td><input name="concept" value="16"/></td>
  </tr>
  <tr>
    <td>price</td>
    <td><input name="concept" value="5"/></td>
  </tr>
  <tr>
    <td>publishCompany</td>
    <td><input name="concept" value="21"/></td>
  </tr>
  <tr>
    <td>publishTime
    </td>
    <td><input name="concept" value="20"/></td>
  </tr>
  <tr>
   
    
<p class="STYLE3">������֮���ÿո����</p>
  </tr>
</table>
   
   </td>
   
   
   <th width="200">
   <table border="0" align="center" cellpadding="10px">
   <tr>
   <td><input type="button" id="delete2" value="�鿴���ݼ�¼���νṹ"></td>
   
   </tr>
   <tr>
   <td><input type="button" id="delete2" value="�鿴Դ��ҳ����"></td>
   
   </tr>
   </table>
   
   </th>
 
   
   
   <td>
   
   <table border="1px" bordercolor="#000000" cellspacing="0px"> 
  <tr>
    <td>���</td>
    <td>�ڵ��ı�</td>
    <td>class����ֵ</td>
  </tr>
  <tr>
    <td>1</td>
    <td>�����</td>
    <td>skcolor_ljg</td>
  </tr>
 <tr>
    <td>2</td>
    <td>�Ļ�����</td>
    <td></td>
  </tr>
  
   <tr>
    <td>3</td>
    <td>��</td>
    <td></td>
  </tr>
   <tr>
   <tr>
    <td>4</td>
    <td>32.30</td>
    <td>search_now_price</td>
  </tr>
   <tr>
    <td>5</td>
    <td>����</td>
    <td>search_discount</td>
  </tr>
  <tr>
    <td>6</td>
    <td>��</td>
    <td></td>
  </tr>
  <tr>
    <td>7</td>
    <td>38.00</td>
    <td>search_pre_price</td>
  </tr>
  <tr>
    <td>8</td>
    <td>(8.5��)</td>
    <td>search_discount</td>
  </tr>
    <tr>
    <td>9</td>
    <td>������</td>
    <td></td>
  </tr>
  <tr>
    <td>10</td>
    <td>��</td>
    <td></td>
  </tr>
  <tr>
    <td>11</td>
    <td>31.72</td>
    <td></td>
  </tr>
    <tr>
    <td>12</td>
    <td>������Ӫ</td>
    <td>new_lable1</td>
  </tr>
  
  <tr>
    <td>13</td>
    <td>5������</td>
    <td>search_comment_num</td>
  </tr>
  <tr>
    <td>14</td>
    <td>���£����׾�</td>
    <td>search_book_author</td>
  </tr>
  <tr>
    <td>15</td>
    <td>����</td>
    <td></td>
  </tr>
  
  <tr>
    <td>16</td>
    <td>2015-03-01</td>
    <td></td>
  </tr>
  <tr>
    <td>17</td>
    <td>����ͨ������</td>
    <td></td>
  </tr>
  <tr>
    <td>18</td>
    <td>���빺�ﳵ</td>
    <td>search_btn_cart</td>
  </tr>
  <tr>
    <td>19</td>
    <td>���������</td>
    <td>search_btn_cart</td>
  </tr>
  <tr>
    <td>20</td>
    <td>�ղ�</td>
    <td>search_btn_collect</td>
  </tr>
</table>
   
   
   </td>
   
   
   
   
   </table>
   
   
   
   





	</div>
	 
	
	
	</div>
	 <p>
	<input type="reset" id="reset" value="����" /> <input type="submit" id="submit" value="�ύ" />
	 </p>
	 
	 </form>

</body>
</html>