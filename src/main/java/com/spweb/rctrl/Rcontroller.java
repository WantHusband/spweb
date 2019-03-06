package com.spweb.rctrl;


import java.awt.List;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spweb.beans.Rbean;

@RestController  //레스트서비스를 위한 컨트롤러
@RequestMapping("/basic")
public class Rcontroller {

	@RequestMapping(value="/string",produces="text/plain; charset=UTF-8")
	public String makeString(){
		return "뷁이직";
	}
	
	//자바빈인경우

	@RequestMapping("/bean")
	public Rbean makeRbean(){
		return new Rbean("홍길동",27); 
	}
	
	//리스트인경우
	@RequestMapping("/list")
	public java.util.List<String> makeList(){
		return Arrays.asList("모탈컴벳11","피파4","배그");
	}
	
	//맵인경우 (key,value)
	@RequestMapping("/map")
	public HashMap<String,String>makeMap(){
		return new HashMap<String,String>() {{
			put("말모이","엄유나");
			put("극한직업","이하늬");
			put("내안의 그놈","강효진");
			
		}};
	}
	
	//set,Map의 차이점: 중복되는 것과 안되는것 
	@RequestMapping("/set")
	public HashSet<String>makeSet(){
		return new HashSet<String>(Arrays.asList("카풀","4차 산업혁명","카택"));
			
		
	}
	
	
}


