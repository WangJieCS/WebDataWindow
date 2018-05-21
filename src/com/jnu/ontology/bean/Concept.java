package com.jnu.ontology.bean;

public class Concept {
	int c_id;
	String concept;
	String valueStyle;
	int attriNum;

	public Concept(String concept, String valueStyle, int attriNum) {
		super();
		this.concept = concept;
		this.valueStyle = valueStyle;
		this.attriNum = attriNum;
	}

	public Concept() {
		super();
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	
	public String getConcept() {
		return concept;
	}

	public void setConcept(String concept) {
		this.concept = concept;
	}

	public String getValueStyle() {
		return valueStyle;
	}

	public void setValueStyle(String valueStyle) {
		this.valueStyle = valueStyle;
	}

	public int getAttriNum() {
		return attriNum;
	}

	public void setAttriNum(int attriNum) {
		this.attriNum = attriNum;
	}

	@Override
	public String toString() {
		return "Concept [c_id=" + c_id + ", concept=" + concept + ", valueStyle=" + valueStyle + ", attriNum="
				+ attriNum + "]";
	}
}
