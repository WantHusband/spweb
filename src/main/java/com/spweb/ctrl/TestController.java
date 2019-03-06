package com.spweb.ctrl;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/test")
public class TestController {
	@RequestMapping(value = "/proc_number/{bno}", method = RequestMethod.GET)
	public String procNumber(@PathVariable Integer bno, Model mo) {
		return "test/proc_number";
	}
	
	@RequestMapping(value = "/yamma", method=RequestMethod.GET)
	public String procNumber() {
		return "test/yamma";
	}
}
