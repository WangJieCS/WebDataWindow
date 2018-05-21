package com.jnu.ontology.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hpdb.window.util.ConnDB;
import com.jnu.ontology.bean.Attribute;
import com.jnu.ontology.bean.Concept;
import com.jnu.ontology.bean.Relation;

public class convertOntologyDao {
	ConnDB db = new ConnDB();

	public Concept queryConcept(String concept) {
		String sql = "select * from Concepts where concept='" + concept + "'";
		ResultSet rs = db.doQuery(sql);
		Concept cpt = null;
		try {
			if (rs.next()) {
				cpt =new Concept();
				cpt.setC_id(rs.getInt("c_id"));
				cpt.setConcept(concept);
				cpt.setValueStyle(rs.getString("valueStyle"));
				cpt.setAttriNum(rs.getInt("attriNum"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cpt;
	}

	public ArrayList<Attribute> queryAttribute(int c_id) {
		// TODO Auto-generated method stub
		String sql = "select * from Attributes where c_id=" + c_id;
		ResultSet rs = db.doQuery(sql);
		Attribute abt = null;
		ArrayList<Attribute> attriList = new ArrayList();
		try {
			while (rs.next()) {
				abt = new Attribute();
				abt.setA_id(rs.getInt("a_id"));
				abt.setC_id(c_id);
				abt.setAttribute(rs.getString("attribute"));
				abt.setAttriStyle(rs.getString("attriStyle"));
				attriList.add(abt);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return attriList;
	}

	public Relation queryRelation(int a_id, String currentAttriValue, String goalAttriValue) {
		Relation rela=null;
		String sql = "select * from Relations where a_id=" + a_id + " and attriValue1='" + currentAttriValue + "'"
				+ " and attriValue2='" + goalAttriValue + "'";
		ResultSet rs = db.doQuery(sql);
		
		try {
			if (rs.next()) {
				rela =new Relation();
			 rela.setR_id(rs.getInt("r_id"));
			 rela.setA_id(a_id);
			 rela.setRelationValue1(rs.getFloat("relationValue1"));
			 rela.setAttriValue1(rs.getString("attriValue1"));
			 rela.setRelationValue2(rs.getFloat("relationValue2"));
			 rela.setAttriValue2(rs.getString("attriValue2"));
			 rela.setRelation(rs.getFloat("relation"));
			 rela.setCurrent_1ToGoal_2(true);
			}else{
				String sql2 = "select * from Relations where a_id=" + a_id + " and attriValue1='" + goalAttriValue + "'"
						+ " and attriValue2='" + currentAttriValue + "'";
				ResultSet rs2 = db.doQuery(sql2);
				if (rs2.next()) {
					rela =new Relation();
					 rela.setR_id(rs2.getInt("r_id"));
					 rela.setA_id(a_id);
					 rela.setRelationValue1(rs2.getFloat("relationValue1"));
					 rela.setAttriValue1(rs2.getString("attriValue1"));
					 rela.setRelationValue2(rs2.getFloat("relationValue2"));
					 rela.setAttriValue2(rs2.getString("attriValue2"));
					 rela.setRelation(rs2.getFloat("relation"));
					 rela.setCurrent_1ToGoal_2(false);
					}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rela;
	}
	
}
