package com.spr.rctrl;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spr.dao.Rdao;
import com.spr.service.Rservice;

import commons.DB;

@org.springframework.web.bind.annotation.RestController
@RequestMapping("/spr_t")
public class RestController {
	@Autowired
	Rservice rs;
	
	@RequestMapping("/sel_spr")
	public ArrayList<HashMap<String, String>> select() {
		return rs.select();
	}
}
