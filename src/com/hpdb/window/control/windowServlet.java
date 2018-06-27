package com.hpdb.window.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dom4j.Element;

import com.hpdb.window.ExpAnalysis.ExpressionEvaluator;
import com.hpdb.window.ExpAnalysis.ExpressionNode;
import com.hpdb.window.bean.DataItem;

import com.hpdb.window.database.AttributeTableDao;
import com.hpdb.window.database.ConverseTableDao;
import com.hpdb.window.database.MainTableDao;
import com.hpdb.window.database.MapTableDao;
import com.hpdb.window.database.RelationTableDao;
import com.hpdb.window.pageAnalysis.*;
import com.hpdb.window.view.xmltree.*;

public class windowServlet extends HttpServlet {
	PrintWriter out;
	HttpSession session;
	
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
	
	private String heterogeneousFeild = null;
	
	private ArrayList<DataItem> dataItemInfors = null;
	
	private String tableName = null;
	
	private ArrayList<String> feilds = null;
	
	private MainTableDao mainTableDao = new MainTableDao();
	
	private AttributeTableDao attributeTableDao= new AttributeTableDao();
	
	private RelationTableDao relationTableDao = new RelationTableDao();
	
	private ArrayList<ArrayList<Element>> DataItems = null;
	
	private ArrayList<String> attributes = null;
	
	private ArrayList<String> attributesDefaultValue = null;
	
	private ExpressionEvaluator expressionEvaluator = null;
	
	private String function = null;
	
	private List<ExpressionNode> RPN = null;
	
	private String theAttribute = null;
	
	private ArrayList<ArrayList<String>> relationList = null;
	
	private ArrayList<String> functionList = null;
	
	private String formatFeild = null;
	
	private String sourceFormat = null;
	
	private String targetFormat = null;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    path = getServletContext().getRealPath("/");
		
		session = request.getSession();
		response.setCharacterEncoding("gb2312");
		request.setCharacterEncoding("gb2312");
		out = response.getWriter();
		String opType = request.getParameter("opType");
		switch(opType){
		  case "doExtractHtml":
			  doExtractHtml(request, response);
			  break;
		  case "doCreateMainTable":
			  doCreateMainTable(request,response);
			  break;
		  case "doCreateAttribute":
			  doCreateAttribute(request,response);
			  break;
		  case  "doCreateAttributeTable":
			  doCreateAttributeTable(request,response);
			  break;
		  case  "showCreateMapPage":
			  showCreateMapPage(request,response);
			  break;
		  case  "doCreateMapTable":
			  doCreateMapTable(request,response);
			  break;
		  case  "showCreateFunctionPage":
			  showCreateFunctionPage(request,response);
			  break;	  
		  case  "doCreateFunction":
			  doCreateFunction(request,response);
			  break;
		  case  "showRelationPage":
			  showRelationPage(request,response);
			  break;
		  case  "doCreateRelation":
			  doCreateRelation(request,response);
			  break;
		  case  "showConvertPage":
			  showConvertPage(request,response);
			  break;
		  case  "doConvert":
			  doConvert(request,response);
			  break;
		  case  "showCreateFormatPage":
			  showCreateFormatPage(request,response);
			  break;
		  case  "doCreateFormat":
			  doCreateFormat(request,response);
			  break;
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
	//		createdataregion = new CreateDataRegion();
	//		createdataregion.writeXML(getdatarecords.getRecords());
	//		xmlviewer.makeFrame(System.getProperty("user.dir") + "\\" + "DataRegion.xml");
			
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
		
		//	showLeafNodes(request,response,leafNodes);
			
			showMaxDataItem(aligndataitem.getNewDataItems(),aligndataitem.getMaxNum(),aligndataitem.getMaxItems(),response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void showMaxDataItem(ArrayList<ArrayList<Element>> DataItems,int maxNum,int maxItems,HttpServletResponse response) throws IOException
	{
		 this.DataItems = DataItems;
		
		 dataItemInfors = new ArrayList<DataItem>();
		for(Element e:DataItems.get(maxNum)){
			DataItem d = new DataItem();
			//System.out.println(e.attributeValue("class"));
			d.setClassAtri(e.attributeValue("class"));
			if(e.elements().size()==0){
			//	System.out.println(e.getTextTrim());
				d.setText(e.getTextTrim());
			}else {
				StringBuffer str = new StringBuffer();
				str = getTreeText(e,str);
			//	System.out.println(str);
				d.setText(str.toString());
			}
			dataItemInfors.add(d);
		}
		
		//用链接触发，现在页面没做出来，先在此处调用该方法
		//showCreateMapPage(null,response);
	}
	
	private void showCreateMapPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub

		for (String f : feilds) {
			System.out.println("feildName: " + f);
		}
		for (DataItem d : dataItemInfors) {
			System.out.println("d.text: " + d.text);
			System.out.println("d.classAtri: " + d.classAtri);
		}
		session.setAttribute("feilds", feilds);
		session.setAttribute("dataItemInfors", dataItemInfors);
		session.setAttribute("tableName", tableName);
		response.sendRedirect("createMap.jsp");

	}
	
	private void doCreateMapTable(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		 ArrayList<Integer> dataPath = new ArrayList<Integer>();
		for(String f : feilds){  // 获取主体信息表所有字段所对应数据项的编号
			String mapNum= request.getParameter(f);
			dataPath.add(Integer.parseInt(mapNum));
		}
		MapTableDao.createTable(tableName);
		
		MapTableDao.insertData(feilds,dataPath,heterogeneousFeild);
		
		doCreateData(dataPath,feilds); //将数据存入到主体信息表中
	}
	
    private void doCreateData(ArrayList<Integer> dataPath,ArrayList<String> feilds){
    
    	mainTableDao.insertData(DataItems,dataPath,heterogeneousFeild,feilds,attributes,formatFeild,sourceFormat,targetFormat);
	}
	
	private StringBuffer getTreeText(Element node, StringBuffer value) {
		// TODO Auto-generated method stub
		value.append(node.getTextTrim());
		List<Element> listElement = node.elements();
		for (Element e : listElement) {
			this.getTreeText(e, value);

		}
		return value;
	}
	private void showLeafNodes(HttpServletRequest request, HttpServletResponse response,ArrayList<Element> leafNodes){
	/*	ArrayList<LeafNodeInformation> leafnodesInfor = new ArrayList<LeafNodeInformation>();
		for(Element e : leafNodes){
			if(!e.getTextTrim().equals("")){
				LeafNodeInformation leafnodeInfor = new LeafNodeInformation();
				System.out.print(e.getTextTrim()+"  ");
				leafnodeInfor.setText(e.getTextTrim());
			//	System.out.print(e.getPath()+"  ");
				System.out.println(e.asXML()+"  ");
				leafnodeInfor.setXml(e.asXML());
				System.out.println(e.attributeValue("class"));
				leafnodeInfor.setClassAtri(e.attributeValue("class"));
				leafnodesInfor.add(leafnodeInfor);
			}
		}
		
		session.setAttribute("leafnodesInfor", leafnodesInfor);
		try {
			response.sendRedirect("createMapActively.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
	
	private void doCreateMainTable(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		tableName = request.getParameter("tableName");
		int i = 1;
		feilds = new ArrayList<String>();
		ArrayList<String> feildTypes = new ArrayList<String>();
		String feild;
		while ((feild = request.getParameter("feild" + i + "")) != null) {
			feilds.add(feild);
			feildTypes.add(request.getParameter("feildType" + i + ""));
			System.out.println(feild);
			System.out.println(feildTypes);
			i++;
		}
		boolean isCreate = mainTableDao.createTable(tableName, feilds, feildTypes);
	}
	
	private void doCreateAttribute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		/*heterogeneousFeild = request.getParameter("feild");
		session.setAttribute("feild", heterogeneousFeild);
		response.sendRedirect("createAttribute.jsp");*/
		
	}
	private void doCreateAttributeTable(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		// TODO Auto-generated method stub
		heterogeneousFeild = request.getParameter("feild");
		int i = 1;
	    attributes = new ArrayList<String>();
	    attributesDefaultValue = new ArrayList<String>();
		String attribute;
		String attributeDefaultValue;
		while((attribute=request.getParameter("attribute" + i + "")) != null){
			attributes.add(attribute);
			System.out.println(attribute);
			attributeDefaultValue=request.getParameter("attributeDefaultValue" + i + "");
			attributesDefaultValue.add(attributeDefaultValue);
			i++;
		}
		
        attributeTableDao.createTable(heterogeneousFeild,attributes,attributesDefaultValue);
		
		//response.sendRedirect("createMainTable.jsp");
	}
	
	private void showCreateFunctionPage(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		session.setAttribute("tableName", tableName);
		session.setAttribute("heterogeneousFeild", heterogeneousFeild);
		session.setAttribute("attributes", attributes);
		try {
			response.sendRedirect("createFunction.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void doCreateFunction(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		theAttribute = request.getParameter("attributeName");  //添加转换函数表达式的属性名
		expressionEvaluator = new ExpressionEvaluator();
		function = request.getParameter("function");
		RPN = expressionEvaluator.parse(function);  //将输入的function函数表达式转换为逆波兰式
		
		ConverseTableDao.createTable();
		ConverseTableDao.insertData(heterogeneousFeild, theAttribute, function,RPN);
		
		//将function解析出来，供用户输入属性值关系
		//showRelationPage(request,response);
	}
	
	private void showRelationPage(HttpServletRequest request, HttpServletResponse response){
		//解析function
		ArrayList<String> functionLabelList = new ArrayList<String>();
		functionLabelList.add("目标属性值");
		functionLabelList.add("=");
	    functionList = new ArrayList<String>();
		functionList.add("y");
		functionList.add("=");
		
		if (null != function) {
			for(int i=0;i<function.length();i++){
				String s = function.substring(i, i+1);
				functionList.add(s);
				if(s.equals("x")){
					functionLabelList.add("源属性值");
				}else if(isXiShu(s)){
					functionLabelList.add("系数");
				}else if(isOperater(s)){
					functionLabelList.add(s);
				}
			}
		}
		session.setAttribute("functionLabelList", functionLabelList);
		session.setAttribute("functionList", functionList);
		
		session.setAttribute("tableName", tableName);
		session.setAttribute("heterogeneousFeild", heterogeneousFeild);
		session.setAttribute("theAttribute", theAttribute);
		
		try {
			response.sendRedirect("createRelation.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void doCreateRelation(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	    relationList = new ArrayList<ArrayList<String>>();
		String y; //y为目标属性值
		int i = 1;
		while ((y = request.getParameter("y" + i + "")) != null) {
			ArrayList<String> relation = new ArrayList<String>();
			relation.add(y); 
			relation.add(request.getParameter("x" + i + ""));
			relation.add(request.getParameter("A" + i + ""));
			String B; //如果表达式中有两个系数
			if((B = request.getParameter("B" + i + "")) != null){
				relation.add(B); 
			}
			String C; //如果表达式中有三个系数
			if((C = request.getParameter("C" + i + "")) != null){
				relation.add(C); 
			}
			relationList.add(relation);
			i++;
		}
		relationTableDao.createTable(theAttribute,relationList);
		relationTableDao.insertData(relationList);
	}
	private void showCreateFormatPage(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		session.setAttribute("tableName", tableName);
		session.setAttribute("feilds", feilds);
		try {
			response.sendRedirect("createFormat.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void doCreateFormat(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		 formatFeild = request.getParameter("formatFeild");
		sourceFormat = request.getParameter("sourceFormat");
		targetFormat = request.getParameter("targetFormat");
		
	}
	
	private void showConvertPage(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		session.setAttribute("tableName", tableName);
		session.setAttribute("heterogeneousFeild", heterogeneousFeild);
		session.setAttribute("theAttribute", theAttribute);
		try {
			response.sendRedirect("convert.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void doConvert(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String goalAttriValue = request.getParameter("goalAttriValue");
		//先找到对应的属性信息表，和对应的属性,在将表中所有的该属性的属性值转换为目标属性值
		attributeTableDao.convert(heterogeneousFeild,theAttribute,goalAttriValue,functionList); 
	}
	
	private boolean isXiShu(String s){
		//用正则表达式判断是否是大写字母，则为系数
		 return s.matches("[A-Z]");  
	}
	private boolean isOperater(String s){
		//用正则表达式判断是否是+-*/，则为操作符
		 return s.matches("[+|-|*|/]");  
	}
}
