package com.jnu.ontology.bean;

public class Attribute {
	int a_id;
	int c_id;
	String attribute;
	String attriStyle;

	public Attribute(int c_id, String attribute, String attriStyle) {
		super();
		this.c_id = c_id;
		this.attribute = attribute;
		this.attriStyle = attriStyle;
	}

	public Attribute() {
		super();
	}

	public void setA_id(int a_id) {
		this.a_id = a_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public int getA_id() {
		return a_id;
	}

	public int getC_id() {
		return c_id;
	}

	public String getAttribute() {
		return attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}

	public String getAttriStyle() {
		return attriStyle;
	}

	public void setAttriStyle(String attriStyle) {
		this.attriStyle = attriStyle;
	}

	@Override
	public String toString() {
		return "Attribute [a_id=" + a_id + ", c_id=" + c_id + ", attribute=" + attribute + ", attriStyle=" + attriStyle
				+ "]";
	}

}
