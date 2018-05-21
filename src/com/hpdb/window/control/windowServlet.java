package com.hpdb.window.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dom4j.Element;

import com.hpdb.window.database.MainTableDao;
import com.hpdb.window.pageAnalysis.*;
import com.hpdb.window.view.xmltree.*;
import com.jnu.ontology.bean.AttriValue;
import com.jnu.ontology.bean.Attribute;
import com.jnu.ontology.bean.Concept;
import com.jnu.ontology.bean.Relation;
import com.jnu.ontology.dao.convertOntologyDao;
import com.jnu.ontology.dao.insertOntologyDao;

public class windowServlet extends HttpServlet {
	PrintWriter out;
	HttpSession session;
	insertOntologyDao insertDao;
	convertOntologyDao convertDao;
	
	private HtmlToXml htmltoxml = null;
	
	private BrowserHtml browserHtml = null;
	
	private GetCandidateDataRegions getcandidatedataregions = null;

	private CreateCandidateDRsXml createcandidateDRsXml = null;
	
	private CreateDataRegion createdataregion = null;

	private XMLViewer xmlviewer = null;

	private GetDataRecords getdatarecords = null;
	
	private GetLeafNode getLeafnode = null;

	private ExtractDataItem extractdataitem = null;

	private AlignDataItemShow aligndataitemshow = null;

	private AlignDataItem aligndataitem=null;
	
	private String path = null;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    path = getServletContext().getRealPath("/");
		
		session = request.getSession();
		response.setCharacterEncoding("gb2312");
		request.setCharacterEncoding("gb2312");
		out = response.getWriter();
		insertDao = new insertOntologyDao();
		convertDao = new convertOntologyDao();
		String opType = request.getParameter("opType");
		switch(opType){
		  case "doExtractHtml":
			  doExtractHtml(request, response);
			  break;
		  case "doCreateMainTable":
			  doCreateMainTable(request,response);
			  break;
		}
		
		if (opType.equals("doInsertOntology")) {
			doInsertOntology(request, response);
		} else if (opType.equals("doConvertOntology")) {
			doConvertOntology(request, response);
		}
	}

	private void doExtractHtml(HttpServletRequest request, HttpServletResponse response){
		String url = request.getParameter("urlString");
		try {
			htmltoxml = new HtmlToXml(url,path);
			htmltoxml.genXmlFile();
			getcandidatedataregions = new GetCandidateDataRegions();
			getcandidatedataregions.getRoot();
			createcandidateDRsXml = new CreateCandidateDRsXml();
			createcandidateDRsXml.writeXML(getcandidatedataregions.getCandidateDataRegions());

			xmlviewer = new XMLViewer();
			xmlviewer.makeFrame(System.getProperty("user.dir") + "\\" + "CandidateDataRegions.xml");

	
			getdatarecords = new GetDataRecords();
			getdatarecords.openFile();
			
			//新增类：CreateDataRegion。产生数据区域xml文档
			createdataregion = new CreateDataRegion();
			createdataregion.writeXML(getdatarecords.getRecords());
			xmlviewer.makeFrame(System.getProperty("user.dir") + "\\" + "DataRegion.xml");
			
			//新增类：GetLeafNode。获取数据区域中的含有叶子节点最多的一条数据记录
			getLeafnode = new GetLeafNode();
			getLeafnode.setDataRecords(getdatarecords.getRecords());
			getLeafnode.extractLeafNode();
			ArrayList<Element> leafNodes = getLeafnode.getMaxLeafNodesRecord();
			
			
			extractdataitem = new ExtractDataItem();
			extractdataitem.setDataRecords(getdatarecords.getRecords());
			extractdataitem.extractDataItem();
		//    extractdataitem.printDataItem();
            
			aligndataitem = new AlignDataItem(extractdataitem.getAllItemParents());
			aligndataitem.valueToArray();//此处Array是数组的意思
			//aligndataitemshow= new AlignDataItemShow(extractdataitem.getAllItemParents());
			aligndataitemshow = new AlignDataItemShow(aligndataitem.getNewDataItems(),aligndataitem.getNodeParents());
		
			showLeafNodes(request,response,leafNodes);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void showLeafNodes(HttpServletRequest request, HttpServletResponse response,ArrayList<Element> leafNodes){
		for(Element e : leafNodes){
			if(!e.getTextTrim().equals("")){
				System.out.print(e.getTextTrim()+"  ");
			//	System.out.print(e.getPath()+"  ");
				System.out.println(e.asXML()+"  ");
				System.out.println(e.attributeValue("class"));
			}
		}
		
		session.setAttribute("leafNodes", leafNodes);
		try {
			response.sendRedirect("createMap.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void doCreateMainTable(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		String tableName = request.getParameter("tableName");
		int i = 1;
		ArrayList<String> feilds = new ArrayList<String>();
		ArrayList<String> feildTypes = new ArrayList<String>();
		String feild;
		while((feild=request.getParameter("feild" + i + "")) != null){
			feilds.add(feild);
			feildTypes.add(request.getParameter("feildType" + i + ""));
			System.out.println(feild);
			i++;
		}
		boolean isCreate = MainTableDao.createTable(tableName,feilds,feildTypes);
	}
	
	private void doInsertOntology(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String concept = request.getParameter("concept");
		String valueStyle = request.getParameter("valueStyle");
		int i = 1;
		while (request.getParameter("attribute" + i + "") != null) {
			i++;
		}
		int attriNum = i - 1;
		int c_id = 0;
		if (concept != null && valueStyle != null) {
			Concept cpt = new Concept(concept, valueStyle, attriNum);
			c_id = insertDao.insertConcept(cpt);
		}

		int a_id = 0;
		for (int j = 1; j < attriNum + 1; j++) {
			String attribute = request.getParameter("attribute" + j + "");
			String attriStyle = request.getParameter("attriStyle" + j + "");
			if (attribute != null && attriStyle != null) {
				Attribute atb = new Attribute(c_id, attribute, attriStyle);
				a_id = insertDao.insertAttribute(atb);
			}

			String attriValue = request.getParameter("attriValue" + j + "");
			if (attriValue != null) {
				// 如果有多个值，就用空格分开取值
				if (attriValue.contains(" ")) {
					String[] attriValueArray = attriValue.split(" ");
					AttriValue[] avls = new AttriValue[attriValueArray.length];
					for (int k = 0; k < avls.length; k++) {
						AttriValue avl = new AttriValue(a_id, attriValueArray[k]);
						avls[k] = avl;
					}
					insertDao.insertAttriValue(avls);
				} else { // 一个值
					AttriValue avl = new AttriValue(a_id, attriValue);
					AttriValue[] avls = new AttriValue[] { avl };
					insertDao.insertAttriValue(avls);
				}
			}

			String relation = request.getParameter("relation" + j + "");
			if (relation != null) {
			/*	float relationValue1 = 0;
				String attriValue1 = "";
				float relationValue2 = 0;
				String attriValue2 = "";*/
				float relationValue = 0;
				float[] relationValues = new float[2];
				String[] attriValues = new String[2];
				boolean relationHaveValue = false;
				if (relation.contains(" ")) {// 如果有多个值，就用空格分开取值
					String[] relationArray = relation.split(" ");
					Relation[] relas = new Relation[relationArray.length];
					for (int l = 0; l < relationArray.length; l++) {
						relationHaveValue=false;
						String[] extractArray = relationArray[l].split("=");
						for (int a = 0; a < extractArray.length; a++) {
							Pattern p2 = Pattern.compile("([0-9]{1,20}[\\.][0-9]{1,20})"); // 小数
							Matcher matcher2 = p2.matcher(extractArray[a]);
							if (matcher2.find()) { // 因为在extractArray[a]中符合group(0)的只有一个，所以用if而不用while
								relationValues[a]=Float.parseFloat(matcher2.group(0));
								attriValues[a]= extractArray[a].replace(matcher2.group(0), "");// 去除数字部分
								relationValue = relationValues[a];
								relationHaveValue=true;
								/*relationValue2 = Float.parseFloat(matcher2.group(0));
								attriValue2 = extractArray[a].replace(matcher2.group(0), "");// 去除数字部分
								relationValue = relationValue2;*/
							} else {
								Pattern p1 = Pattern.compile("([0-9]{1,20})");// 整数
								Matcher matcher1 = p1.matcher(extractArray[a]);
								if (matcher1.find()) {// 因为在extractArray[a]中符合group(0)的只有一个，所以用if而不用while
									relationValues[a] = Float.parseFloat(matcher1.group(0));
									attriValues[a] = extractArray[a].replace(matcher1.group(0), "");
									if(!relationHaveValue){
										relationValue = relationValues[a];
									}
									/*relationValue1 = Float.parseFloat(matcher1.group(0));
									attriValue1 = extractArray[a].replace(matcher1.group(0), "");*/
								}
							}
						}
						Relation rela = new Relation(a_id, relationValues[0], attriValues[0], relationValues[1], attriValues[1],
								relationValue);
						/*Relation rela = new Relation(a_id, relationValue1, attriValue1, relationValue2, attriValue2,
								relationValue);*/
						relas[l] = rela;
					}
					int influence = insertDao.insertRelation(relas);
					if (influence == relas.length)
						System.out.println("Success!");
					else
						System.out.println("Error!");
				} else { // 一个值
					String[] extractArray = relation.split("=");
					for (int a = 0; a < extractArray.length; a++) {
						Pattern p2 = Pattern.compile("([0-9]{1,20}[\\.][0-9]{1,20})"); // 小数
						Matcher matcher2 = p2.matcher(extractArray[a]);
						if (matcher2.find()) {
							relationValues[a]=Float.parseFloat(matcher2.group(0));
							attriValues[a]= extractArray[a].replace(matcher2.group(0), "");// 去除数字部分
							relationValue = relationValues[a];
							relationHaveValue=true;
							/*relationValue2 = Float.parseFloat(matcher2.group(0));
							attriValue2 = extractArray[a].replace(matcher2.group(0), "");// 去除数字部分
							relationValue = relationValue2;*/
						} else {
							Pattern p1 = Pattern.compile("([0-9]{1,20})");// 整数
							Matcher matcher1 = p1.matcher(extractArray[a]);
							if (matcher1.find()) {
								relationValues[a] = Float.parseFloat(matcher1.group(0));
								attriValues[a] = extractArray[a].replace(matcher1.group(0), "");
								if(!relationHaveValue){
									relationValue = relationValues[a];
								}
								/*relationValue1 = Float.parseFloat(matcher1.group(0));
								attriValue1 = extractArray[a].replace(matcher1.group(0), "");*/
							}
						}

					}
					Relation rela = new Relation(a_id, relationValues[0], attriValues[0], relationValues[1], attriValues[1],
							relationValue);
					/*Relation rela = new Relation(a_id, relationValue1, attriValue1, relationValue2, attriValue2,
							relationValue);*/
					Relation[] relas = new Relation[] { rela };
					int influence = insertDao.insertRelation(relas);
					if (influence == relas.length)
						System.out.println("Success!");
					else
						System.out.println("Error!");
				}
			}

		}

	}

	private void doConvertOntology(HttpServletRequest request, HttpServletResponse response) {
		String concept = request.getParameter("concept");
		String currentValue = request.getParameter("currentValue");
		String currentAttriValues = request.getParameter("currentAttriValues");
		String goalAttriValues = request.getParameter("goalAttriValues");
		Concept cpt=convertDao.queryConcept(concept);
		float currentFloatValue = 0;// 把当前值由String转为通常值类型
		if (cpt.getValueStyle().equals("float") || cpt.getValueStyle().equals("int")) {
			currentFloatValue = Float.parseFloat(currentValue);
		}

		String[] currentAttriValueArray = currentAttriValues.split(" ");
		String[] goalAttriValueArray = goalAttriValues.split(" ");
		// attriList.size()==currentAttriValueArray.length==goalAttriValueArray.length
		// 因为属性的个数和属性值个数总是相等的
		ArrayList<Attribute> attriList = convertDao.queryAttribute(cpt.getC_id());
		float temporValue = 0;
		float goalValue = 0;
		if (currentFloatValue != 0) {
			for (int i = 0; i < attriList.size(); i++) {
				// 如果属性值是int或者是float类型，则没有保存值之间的关系，直接计算就好。反之，需要查询关系表。
				if (!attriList.get(i).getAttriStyle().equals("int")
						&& !attriList.get(i).getAttriStyle().equals("float")) {
					Relation rela = convertDao.queryRelation(attriList.get(i).getA_id(), currentAttriValueArray[i],goalAttriValueArray[i]);
					if (rela.isCurrent_1ToGoal_2()) {
						if (temporValue == 0) {
							temporValue = (currentFloatValue * rela.getRelationValue2()) / rela.getRelationValue1();
						} else {
							temporValue = (temporValue * rela.getRelationValue2()) / rela.getRelationValue1();
						}
					} else {
						if (temporValue == 0) {
							temporValue = (currentFloatValue * rela.getRelationValue1()) / rela.getRelationValue2();
						} else {
							temporValue = (temporValue * rela.getRelationValue1()) / rela.getRelationValue2();
						}
					}
					System.out.println(temporValue);
				} else {
					float currentFloatAttriValue = Float.parseFloat(currentAttriValueArray[i]);
					float goalFloatAttriValueArray = Float.parseFloat(goalAttriValueArray[i]);
					if (temporValue == 0) {
						temporValue = (currentFloatAttriValue / goalFloatAttriValueArray) * currentFloatValue;
					} else {
						temporValue = (currentFloatAttriValue / goalFloatAttriValueArray) * temporValue;
					}
					System.out.println(temporValue);
				}
			}
			goalValue = temporValue;
			System.out.println("goalValue: "+goalValue);
		} else {
			System.out.println("0=0");
		}
	}

}
