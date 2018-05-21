package com.hpdb.window.util;
import java.sql.*;
import java.io.*;
import java.util.*;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

public class ConnDB
{
	public Connection conn=null;
	public Statement stmt=null;
	public ResultSet rs=null;
	private static String dbDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String dbUrl="jdbc:sqlserver://localhost:1433;databaseName=WebData";
	private static String dbUser="sa";
	private static String dbPwd="123";

	//打开数据库连接
	public static Connection getConnection()
	{
		Connection conn=null;
		
		try
		{
			Class.forName(dbDriver);
			conn=DriverManager.getConnection(dbUrl,dbUser,dbPwd);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
    	if (conn == null) 
    	{
      		System.err.println("警告:数据库连接失败!");
    	}	// else System.out.println("数据库连接成功！ 王洁");	
		return conn;
	}
	//读取结果集
	public ResultSet doQuery(String sql)
	{
		try
		{
			conn=ConnDB.getConnection();
			stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=stmt.executeQuery(sql);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return rs;
	}
	//更新数据
	public int doUpdate(String sql)
	{ 
		int result=0;
		try
		{
			conn=ConnDB.getConnection();
			stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			result=stmt.executeUpdate(sql);
		}
		catch(SQLException e)
		{
			result=0;
		}
		return result;  //执行更新，返回影响记录的条数
	}
	
	
	//关闭数据库连接
	public void closeConnection()
	{
		try
		{
			if (rs!=null)
				rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		try
		{
			if (stmt!=null)
				stmt.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		try
		{
			if (conn!=null)
				conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	//返回预编译对象，安全、速度快
	public PreparedStatement getPSMT(String sql){
		conn=this.getConnection();
		PreparedStatement psmt=null;
		try {
			psmt=conn.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return psmt;
	}
	
	public static void main(String[] args) {
		new ConnDB().getConnection();
	}
	
}
