package com.jnu.ontology.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.hpdb.window.util.ConnDB;
import com.jnu.ontology.bean.AttriValue;
import com.jnu.ontology.bean.Attribute;
import com.jnu.ontology.bean.Concept;
import com.jnu.ontology.bean.Relation;

public class insertOntologyDao {
	ConnDB db = new ConnDB();

	/**
	 * 返回当前插入concept的c_id
	 */
	public int insertConcept(Concept cpt) {
		String sql = "insert into Concepts values('" + cpt.getConcept() + "','" + cpt.getValueStyle() + "',"
				+ cpt.getAttriNum() + ")";
		db.doUpdate(sql);
		String sql2 = "select top 1 c_id from Concepts order by c_id desc";
		ResultSet rs = db.doQuery(sql2);
		int c_id = 0;
		try {
			if (rs.next())
				c_id = rs.getInt("c_id");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c_id;
	}

	public int insertAttribute(Attribute atb) {
		String sql = "insert into Attributes values(" + atb.getC_id() + ",'" + atb.getAttribute() + "','"
				+ atb.getAttriStyle() + "')";
		db.doUpdate(sql);
		String sql2 = "select top 1 a_id from Attributes order by a_id desc";
		ResultSet rs = db.doQuery(sql2);
		int a_id = 0;
		try {
			if (rs.next())
				a_id = rs.getInt("a_id");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a_id;
	}

	public void insertAttriValue(AttriValue[] avls) {
		for (int k = 0; k < avls.length; k++) {
			String sql = "insert into AttriValues values(" + avls[k].getA_id() + ",'" + avls[k].getAttriValue() + "')";
			db.doUpdate(sql);
		}
	}

	public int insertRelation(Relation[] relas) {
		int influence=0;//返回影响记录条数
		for (int k = 0; k < relas.length; k++) {
			String sql = "insert into Relations values(" + relas[k].getA_id() + "," + relas[k].getRelationValue1()
					+ ",'" + relas[k].getAttriValue1() + "'," + relas[k].getRelationValue2() + ",'"
					+ relas[k].getAttriValue2() + "'," + relas[k].getRelation() + ")";
			influence+=db.doUpdate(sql);
		}
		return influence;
	}
}
