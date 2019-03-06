package com.spr.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spr.dao.Rdao;
@Service
public class Rservice {

	@Autowired
	Rdao rdao;
	
	public ArrayList<HashMap<String, String>> select(){
		return rdao.select();
	}
}
