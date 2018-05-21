package com.hpdb.window.pageAnalysis;

import java.util.ArrayList;
import java.util.List;

import org.dom4j.Attribute;
import org.dom4j.Element;

public class GetLeafNode {
	ArrayList<ArrayList<Element>> AllLeafNodes = new ArrayList<>(); // 定义保存所有数据项的父节点
	ArrayList<Element> DataRecords = new ArrayList<>();
	int maxLeafNodes = 0;
	int maxLeafNodesIndex = 0;
	ArrayList<Element> maxLeafNodeRecord = new ArrayList<>(); //最终结果：包含最多叶子节点的数据记录中的所有叶子节点
	
	public void setDataRecords(ArrayList<Element> dataRecords) { // 获得数据记录
		DataRecords = dataRecords;
	}

	public void extractLeafNode() {
		for (Element records : DataRecords) {
			ArrayList<Element> leafNodes = new ArrayList<>();
			getLeafNode(records, leafNodes);
			AllLeafNodes.add(leafNodes);
		}
	}
	
   //获取包含叶子节点最多的数据记录的下标和叶子节点个数
	public ArrayList<Element> getMaxLeafNodesRecord(){
		    int i=0;
			for(ArrayList<Element> list:AllLeafNodes){
				if(list.size()>maxLeafNodes){
					maxLeafNodes = list.size();
					maxLeafNodesIndex = i;
				}
				i++;
			}
			
			maxLeafNodeRecord = AllLeafNodes.get(maxLeafNodesIndex);
		/*	for(Element e : maxLeafNodeRecord){
				System.out.println(e.getPath());
				System.out.println(e.getTextTrim());
			}*/
			
			return maxLeafNodeRecord;
	}
	
	
	
	
	// 对数据记录的DOM子树进行深度遍历。如果节点含有文本值，就将它作为一个数据项，其值就是该文本。
	// 否则，若节点不含文本值，则对每一个孩子节点继续进行深度遍历。
	private void getLeafNode(Element node, ArrayList<Element> leafNodes) {
		// TODO Auto-generated method stub
		List<Element> listElement = node.elements();
		if (listElement.size()==0) {
			leafNodes.add(node);
		} else {
			for (Element e : listElement) {
				if (!leafNodes.contains(e.getParent())) {
					this.getLeafNode(e, leafNodes);
				}
			}
		}
	}


}
