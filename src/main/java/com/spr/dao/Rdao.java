package com.spr.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Component;

import commons.DB;

@Component
public class Rdao {
	public ArrayList<HashMap<String, String>> select(){
		return DB.selectListMap("SELECT * FROM spr_test2 ORDER BY s_num ASC");
	}
	
}