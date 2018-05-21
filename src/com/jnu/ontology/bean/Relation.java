package com.jnu.ontology.bean;

public class Relation {
	int r_id;
	int a_id;
	float relationValue1;
	String attriValue1;
	float relationValue2;
	String attriValue2;
	float relation;
	boolean current_1ToGoal_2;

	public Relation() {
		super();
	}

	public Relation(int a_id, float relationValue1, String attriValue1, float relationValue2, String attriValue2,
			float relation) {
		super();
		this.a_id = a_id;
		this.relationValue1 = relationValue1;
		this.attriValue1 = attriValue1;
		this.relationValue2 = relationValue2;
		this.attriValue2 = attriValue2;
		this.relation = relation;
	}

	public Relation(int a_id, float relationValue1, String attriValue1, float relationValue2, String attriValue2,
			float relation, boolean current_1ToGoal_2) {
		super();
		this.a_id = a_id;
		this.relationValue1 = relationValue1;
		this.attriValue1 = attriValue1;
		this.relationValue2 = relationValue2;
		this.attriValue2 = attriValue2;
		this.relation = relation;
		this.current_1ToGoal_2 = current_1ToGoal_2;
	}

	public boolean isCurrent_1ToGoal_2() {
		return current_1ToGoal_2;
	}

	public void setCurrent_1ToGoal_2(boolean current_1ToGoal_2) {
		this.current_1ToGoal_2 = current_1ToGoal_2;
	}

	public int getR_id() {
		return r_id;
	}

	public void setR_id(int r_id) {
		this.r_id = r_id;
	}

	public int getA_id() {
		return a_id;
	}

	public void setA_id(int a_id) {
		this.a_id = a_id;
	}

	public String getAttriValue1() {
		return attriValue1;
	}

	public void setAttriValue1(String attriValue1) {
		this.attriValue1 = attriValue1;
	}

	public float getRelationValue1() {
		return relationValue1;
	}

	public void setRelationValue1(float relationValue1) {
		this.relationValue1 = relationValue1;
	}

	public String getAttriValue2() {
		return attriValue2;
	}

	public void setAttriValue2(String attriValue2) {
		this.attriValue2 = attriValue2;
	}

	public float getRelationValue2() {
		return relationValue2;
	}

	public void setRelationValue2(float relationValue2) {
		this.relationValue2 = relationValue2;
	}

	public float getRelation() {
		return relation;
	}

	public void setRelation(float relation) {
		this.relation = relation;
	}

	@Override
	public String toString() {
		return "Relation [r_id=" + r_id + ", a_id=" + a_id + ", attriValue1=" + attriValue1 + ", relationValue1="
				+ relationValue1 + ", attriValue2=" + attriValue2 + ", relationValue2=" + relationValue2 + ", relation="
				+ relation + "]";
	}

}
