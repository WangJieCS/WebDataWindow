package com.hpdb.window.pageAnalysis;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.XMLWriter;

public class CreateDataRegion {
	int deep = 1;
	int currentDeep = 1;
	
	ArrayList<Element> DataRegion = new ArrayList<>();

	public void writeXML(ArrayList<Element> DataRegion) {
		DataRegion = DataRegion;

		Element root = DocumentHelper.createElement("UL");
		Document document = DocumentHelper.createDocument(root);
		int i = 1;
	
			for (Element cdr : DataRegion) {
				
				if (cdr.getParent().getParent() != null) {
					
					Element parent = cdr.getParent(); // 之所以添加父节点是因为出现了数据记录漏掉的情况，理论上是不需要添加父节点的！！！
					parent.getParent().remove(parent); // 节点有父节点的情况下，不可以再被其他节点add，所以，先让候选区域节点的父节点删除自己
					if(!parent.getName().equals("UL"))
					root.add(parent);
				} else {
					
					cdr.getParent().remove(cdr);
					if(!cdr.getName().equals("UL"))
					root.add(cdr);

				}
			}

		


		try {
			Writer osWrite = new OutputStreamWriter(
					new FileOutputStream(System.getProperty("user.dir") + "\\" + "DataRegion.xml"));
			XMLWriter writer = new XMLWriter(osWrite);
			writer.write(document);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
