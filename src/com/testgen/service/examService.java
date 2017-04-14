package com.testgen.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.json.JSONException;
import org.json.JSONObject;
import org.jdom2.output.XMLOutputter;
import org.springframework.stereotype.Service;

import com.testgen.controller.ExamController;
import com.testgen.entity.Accuracy;
import com.testgen.entity.CorrectAndTestNum;

import junit.framework.Test;
import oracle.net.aso.f;

@Service
public class examService {
	private static String readAll(Reader rd) throws IOException{
		StringBuilder sb = new StringBuilder();
		int cp;
		while((cp = rd.read())!= -1 ){
			sb.append((char)cp);
		}
		return sb.toString();
	}
	
	
	public JSONObject readJsonFromUrl(String url) throws IOException, JSONException{
		InputStream iStream = new URL(url).openStream();
		try {
			BufferedReader rd = new BufferedReader(new InputStreamReader(iStream, Charset.forName("UTF-8")));
			String jsonText  = readAll(rd);
			JSONObject jsonObject = new JSONObject(jsonText);
			return jsonObject;
		}
		finally{
			iStream.close();
		}
	}
	
	public void WriteXML(Map<Long, Integer> map){
		/*Document document = null;
		Element root = new Element("ACCURACY");
		Document Doc = new Document(root);
		for(long l : map.keySet()){
			Element element = new Element("question");
			element.setAttribute("id",String.valueOf(l));
			element.addContent(new Element("correct").setText(String.valueOf(map.get(l).getCorrectNum())));
			element.addContent(new Element("num").setText(String.valueOf(map.get(l).getTestNum())));
			root.addContent(element);
		}
		
		XMLOutputter xmlOutputter = new XMLOutputter();
		try {
			xmlOutputter.output(Doc, new FileOutputStream("E://test.xml"));
		} catch (Exception e) {
			// TODO: handle exception
		}*/
		System.out.println("here write");
		SAXBuilder builder = new SAXBuilder();
		try {
			String path = System.getProperty("project.root")+File.separator+"data.xml";
			
			Document document = builder.build(new File(path));
			Element root = document.getRootElement();
			System.out.println("path:"+path);
			List<Element> list = root.getChildren();
			List<Long> list2 = new ArrayList<Long>();
			for(Element element : list){
				list2.add(Long.parseLong(element.getAttributeValue("id")));
			}
			for(Long long1 : map.keySet()){
				if(list2.contains(long1)){//如果对应题目id的题目已在xml中
					int index = list2.indexOf(long1);
					Element element = list.get(index);
					if(map.get(long1)==0){//如果map的value为0，说明没答对，那么只给总题数加
						Element element2 = element.getChild("num");
						element2.setText(String.valueOf(Integer.parseInt(element2.getText())+1));
					}else{
						Element element2 = element.getChild("num");
						Element element3 = element.getChild("correct");
						element2.setText(String.valueOf(Integer.parseInt(element2.getText())+1));
						element3.setText(String.valueOf(Integer.parseInt(element3.getText())+1));
					}
				}else{//题目第一次加到xml
					Element element = new Element("question");
					element.setAttribute("id",String.valueOf(long1));
					if(map.get(long1)==0){//没答对，那么correct为0，num为1
						element.addContent(new Element("correct").setText(String.valueOf(0)));
						element.addContent(new Element("num").setText(String.valueOf(1)));
					}else{//答对了，那么correct为1，num为1
						element.addContent(new Element("correct").setText(String.valueOf(1)));
						element.addContent(new Element("num").setText(String.valueOf(1)));
					}
					root.addContent(element);
				}	
			}
			XMLOutputter outputter = new XMLOutputter();
			outputter.output(document, new FileOutputStream("E://test.xml"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	public List<Accuracy> readXML(){
		SAXBuilder builder = new SAXBuilder();
		List<Accuracy> l1 = new ArrayList<Accuracy>();
		try {
			String path = System.getProperty("project.root")+File.separator+"data.xml";
			Document document = builder.build(new File(path));
			Element root = document.getRootElement();
			List<Element> list = root.getChildren();
			for(Element element : list){
				long l = Long.parseLong( element.getAttributeValue("id"));
				double b = Double.parseDouble(element.getChildText("correct"))/Double.parseDouble(element.getChildText("num"));
				System.out.println("B:"+b);
				DecimalFormat df = new DecimalFormat("###0.000");
				l1.add(new Accuracy(l, df.format(b)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return l1;
	}
	
}
