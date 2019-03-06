package com.spweb.rctrl;


import java.awt.List;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spweb.beans.Rbean;

@RestController  //����Ʈ���񽺸� ���� ��Ʈ�ѷ�
@RequestMapping("/basic")
public class Rcontroller {

	@RequestMapping(value="/string",produces="text/plain; charset=UTF-8")
	public String makeString(){
		return "������";
	}
	
	//�ڹٺ��ΰ��

	@RequestMapping("/bean")
	public Rbean makeRbean(){
		return new Rbean("ȫ�浿",27); 
	}
	
	//����Ʈ�ΰ��
	@RequestMapping("/list")
	public java.util.List<String> makeList(){
		return Arrays.asList("��Ż�ĺ�11","����4","���");
	}
	
	//���ΰ�� (key,value)
	@RequestMapping("/map")
	public HashMap<String,String>makeMap(){
		return new HashMap<String,String>() {{
			put("������","������");
			put("��������","���ϴ�");
			put("������ �׳�","��ȿ��");
			
		}};
	}
	
	//set,Map�� ������: �ߺ��Ǵ� �Ͱ� �ȵǴ°� 
	@RequestMapping("/set")
	public HashSet<String>makeSet(){
		return new HashSet<String>(Arrays.asList("īǮ","4�� �������","ī��"));
			
		
	}
	
	
}


