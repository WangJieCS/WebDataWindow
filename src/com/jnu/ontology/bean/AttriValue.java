package com.jnu.ontology.bean;

public class AttriValue {
	int v_id;
	int a_id;
	String attriValue;

	public AttriValue(int a_id, String attriValue) {
		super();
		this.a_id = a_id;
		this.attriValue = attriValue;
	}

	public int getV_id() {
		return v_id;
	}

	public void setV_id(int v_id) {
		this.v_id = v_id;
	}

	public int getA_id() {
		return a_id;
	}

	public void setA_id(int a_id) {
		this.a_id = a_id;
	}

	public String getAttriValue() {
		return attriValue;
	}

	public void setAttriValue(String attriValue) {
		this.attriValue = attriValue;
	}

	@Override
	public String toString() {
		return "AttriValue [v_id=" + v_id + ", a_id=" + a_id + ", attriValue=" + attriValue + "]";
	}

}
