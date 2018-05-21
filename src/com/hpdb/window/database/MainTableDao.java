package com.hpdb.window.database;

import java.util.ArrayList;

import com.hpdb.window.util.ConnDB;


public class MainTableDao {
	static ConnDB db = new ConnDB();
	public static boolean createTable(String tableName,ArrayList<String> feilds, ArrayList<String> feildTypes) {
		// TODO Auto-generated method stub
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

}
