package com.testgen.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sun.org.apache.xalan.internal.xsltc.compiler.util.ErrorMessages_pt_BR;
import com.testgen.entity.Accuracy;
import com.testgen.entity.CorrectAndTestNum;
import com.testgen.entity.ErrorAnswer;
import com.testgen.entity.Question;
import com.testgen.service.examService;

@RestController
@RequestMapping("/exam")
@Scope("prototype")
public class ExamController {
	
	@Autowired
	private examService examService;
	public void setExamService(examService examService) {
		this.examService = examService;
	}
	
	private static Map<Long, List<Question>> map = new HashMap<Long, List<Question>>();
	private static Map<Long, List<ErrorAnswer>> errorMap = new HashMap<Long, List<ErrorAnswer>>();
	
	@RequestMapping("/start")
	public Object getPaper(@RequestParam (value="position")String position,@RequestParam(value="tech")String tech,@RequestParam(value="userId")Long userId){
		
		String url = "http://112.74.62.114:8080/Entity/U1ff54ed338bfc/testgen/Question/";
		JSONObject jsonObject = null;
		System.out.println("position:"+position);
		System.out.println("tech:"+tech);
		System.out.println("userId"+userId);
		try {
			jsonObject = examService.readJsonFromUrl(url);
		} catch (IOException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		} catch (JSONException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		JSONArray jsonArray = null;
		try {
			jsonArray = jsonObject.getJSONArray("Question");
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		int level1 = 5;
		int level2 = 5;
		int level3 = 5;
		int level4 = 5;
		List<Question> l1 = new ArrayList<Question>();
		Set<Integer> solo = new HashSet<Integer>();
		try {
			while(!(level1==0&&level2==0&&level3==0&&level4==0)){
				int i = (int)(Math.random()*jsonArray.length());
				
				if(!solo.add(i))
					continue;
				System.out.println("i:"+i);
				JSONObject jsonObject2 = jsonArray.getJSONObject(i);
				String string = jsonObject2.getString("category");
				System.out.println("string:"+string);
				boolean flag = false;
				if(string.contains(position))
				{
					System.out.println("here");
					String[] strings = tech.split(",");
					for(String s : strings){
						if(string.contains(s))
						{
							flag = true;
							System.out.println("s:"+s);
							break;
						}
					}
				}
				if(flag == true){
					switch (jsonObject2.getInt("level")) {
					case 1:
						if(level1>0){
							Question question = new Question(jsonObject2.getLong("id"), jsonObject2.getString("content"), jsonObject2.getString("answer"), jsonObject2.getString("option1"), jsonObject2.getString("option2"), jsonObject2.getString("option3"), jsonObject2.getString("option4"), jsonObject2.getInt("level"));
							l1.add(question);
							level1--;
						}
						break;
					case 2:
						if(level2>0){
							Question question = new Question(jsonObject2.getLong("id"), jsonObject2.getString("content"), jsonObject2.getString("answer"), jsonObject2.getString("option1"), jsonObject2.getString("option2"), jsonObject2.getString("option3"), jsonObject2.getString("option4"), jsonObject2.getInt("level"));
							l1.add(question);
							level2--;
						}
						break;
					case 3:
						if(level3>0){
							Question question = new Question(jsonObject2.getLong("id"), jsonObject2.getString("content"), jsonObject2.getString("answer"), jsonObject2.getString("option1"), jsonObject2.getString("option2"), jsonObject2.getString("option3"), jsonObject2.getString("option4"), jsonObject2.getInt("level"));
							l1.add(question);
							level3--;
						}
						break;
					case 4:
						if(level4>0){
							Question question = new Question(jsonObject2.getLong("id"), jsonObject2.getString("content"), jsonObject2.getString("answer"), jsonObject2.getString("option1"), jsonObject2.getString("option2"), jsonObject2.getString("option3"), jsonObject2.getString("option4"), jsonObject2.getInt("level"));
							l1.add(question);
							level4--;
						}
						break;
					}		
				}
			}
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.put(userId, l1);
		
		return l1;	
	}
	
	
	@RequestMapping(value="/finish" , method = RequestMethod.POST)
	@ResponseBody
	public int Marking(@RequestBody String data){
		System.out.println("data:"+data);
		
		Map<Long, Integer> IdToCorrectNum = new HashMap<Long, Integer>();
		List<ErrorAnswer> eList = new ArrayList<ErrorAnswer>();
		int count = 0;
		try {
			JSONObject jObject = new JSONObject(data);
			JSONArray jsonArray = jObject.getJSONArray("qa");
			System.out.println(jsonArray.get(0));
			long userId = jsonArray.getJSONObject(jsonArray.length()-1).getLong("userid");
			System.out.println("userId:"+userId);
			for(int i= 0;i<jsonArray.length()-1;i++){
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				for(Question question : map.get(userId)){
					if(jsonObject.getLong("questid")==question.getId())
					{
						
						//只要答了这道题就将其记录在IdToCorrectNum的testNUm中
						IdToCorrectNum.put(question.getId(), 0);
						
						if(question.getAnswer().equals(jsonObject.get("ans")))
						{
							System.out.println("level:"+question.getLevel());
							count = count+question.getLevel()*2;
							//答对了就将其记录在correctNum中
							IdToCorrectNum.put(question.getId(), 1);
							break;
						}
						eList.add(new ErrorAnswer(question.getContent(),question.getAnswer() ));
					}
					else {
						continue;
					}
				}
			}
			errorMap.put(userId, eList);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		examService.WriteXML(IdToCorrectNum);
		System.out.println(count);
		return count;
	}
	
	@RequestMapping("/statistic")
	public List<Accuracy> getQuesAccuracy(){
		
		return examService.readXML();
		
	} 
	
	@RequestMapping("/quizInfo")
	public List<ErrorAnswer> getQuizInfo(@RequestParam(value="userid")long userId){
		
		return errorMap.get(userId);
		
	}
}
