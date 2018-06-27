package com.hpdb.window.database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Element;

import com.hpdb.window.bean.DataItem;
import com.hpdb.window.util.ConnDB;


public class MainTableDao {
	
	static ConnDB db = new ConnDB();
	
	static String tableName;
	
	 ArrayList<String> heteDatas = null;
	 
	
	AttributeTableDao attributeTableDao = null;
	
	public  boolean createTable(String tableName,ArrayList<String> feilds, ArrayList<String> feildTypes) {
		// TODO Auto-generated method stub
		this.tableName = tableName;
		StringBuilder createTableSql = new StringBuilder();
		createTableSql.append( "create table "+tableName+"(");
		for(int i=0;i<feilds.size();i++){
			createTableSql.append(feilds.get(i)+" "+feildTypes.get(i)+",");
		}
		createTableSql.replace(createTableSql.length()-1, createTableSql.length(), ")");
		System.out.println(createTableSql);
		db.doUpdate(createTableSql.toString());
		return false;
	}
	public  void insertData(ArrayList<ArrayList<Element>> DataItems,ArrayList<Integer> dataPath,
			String heterogeneousFeild,ArrayList<String> feilds, ArrayList<String> attributes, String formatFeild, String sourceFormat, String targetFormat){
		//获取表中异构字段的目前最大编号
		int curHeteNum = 0;
		if (heterogeneousFeild != null) {
			curHeteNum = getMaxCurHeteNum(heterogeneousFeild);
			heteDatas = new ArrayList<>();
		}
		
		int feildNum = dataPath.size();
		StringBuilder sql=  new StringBuilder();
				sql.append("insert into "+tableName+" values(");
		for(int n=0;n<feildNum;n++){
			sql.append("?,");
		}
		sql.replace(sql.length()-1, sql.length(), ")");
		
		PreparedStatement psmt=db.getPSMT(sql.toString());
		
		for(int i=0;i<DataItems.size();i++){  //由于第一行数据是空的，i从1取值
			ArrayList<Element> curDataItem = DataItems.get(i); 
			String[] feildData = new String[DataItems.get(1).size()+1];
			for(int j=0;j<curDataItem.size();j++){
				if(!dataPath.contains(j+1)) 
					continue;
				
				if(curDataItem.get(j)==null){
					feildData[j] = "";
					continue;
				}
				 if(curDataItem.get(j).elements().size()==0){
					feildData[j] = curDataItem.get(j).getTextTrim();
				}else {
					StringBuffer str = new StringBuffer();
					str = getTreeText(curDataItem.get(j),str);
					feildData[j] = str.toString();
				}
			}
			
			try {
				for (int k = 0; k < feildNum; k++) {
					
					if(null!=heterogeneousFeild && heterogeneousFeild.equals(feilds.get(k))){ //异构字段存编号
					
						psmt.setInt(k+1, curHeteNum+i);
						
						if(null != heteDatas){
							heteDatas.add(feildData[dataPath.get(k) - 1]); //异构数据项数据值存入heteDatas
						}
					}else if(null!=formatFeild && formatFeild.equals(feilds.get(k))){ //格式差异字段编号，需要调整格式，写死为日期
						String formatData = feildData[dataPath.get(k) - 1];
						if(formatData.length()>0 && formatData.substring(0, 1).equals("/")){
							formatData = formatData.substring(1);
						}
						if(!sourceFormat.equals(targetFormat)){
							
							for(int q=0;q<sourceFormat.length(); q++){
								//当源格式与目标格式的字符不相等时，就要转换数据值内容
							  if(!sourceFormat.substring(q, q+1).equals(targetFormat.substring(q, q+1))){
								  formatData = formatData.replaceFirst(sourceFormat.substring(q, q+1), targetFormat.substring(q, q+1));
								}
							}
							if(-1!=formatData.indexOf("年")){
								  formatData+=targetFormat.substring(targetFormat.length()-1,targetFormat.length());
							  }
						}
						psmt.setString(k+1, formatData);
					}
					else{
						psmt.setString(k+1, feildData[dataPath.get(k) - 1]);
					}
				}
				psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//将异构数据项数据值传入到对应属性表中
		if (null != heteDatas && null != attributes) {
			attributeTableDao = new AttributeTableDao();
			attributeTableDao.insertData(heterogeneousFeild,heteDatas,attributes,curHeteNum);
		}
	}
	
	private int getMaxCurHeteNum(String heterogeneousFeild){
		//获取表中异构字段的目前最大编号
		String sql2 = "select top 1 "+heterogeneousFeild+" from "+tableName+" order by "+heterogeneousFeild+" desc";
		ResultSet rs = db.doQuery(sql2);
		int curHeteNum = 0;
		try {
			if (rs.next())
				curHeteNum = rs.getInt(heterogeneousFeild);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return curHeteNum;
	}
	
	private  StringBuffer getTreeText(Element node, StringBuffer value) {
		// TODO Auto-generated method stub
		value.append(node.getTextTrim());
		List<Element> listElement = node.elements();
		for (Element e : listElement) {
			this.getTreeText(e, value);

		}
		return value;
	}
	
	
}
