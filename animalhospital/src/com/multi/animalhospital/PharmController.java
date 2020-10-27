package com.multi.animalhospital;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.animalhospitalDAO.PharmacyDAO;
import com.multi.animalhospitalVO.Medical;

@Controller
public class PharmController {
	@Autowired
	PharmacyDAO dao;
	
	@RequestMapping("/pharmacy")
	public void pharmacy() {}	
	
	@RequestMapping(value ="pharmacy/message", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<Medical> message(String a1, String a2) {
		ArrayList<Medical> list; 
		list=dao.searchAddress(a1, a2);
		return list;
	}
	@RequestMapping(value ="pharmacy/county", method = RequestMethod.POST,produces = "application/json; charset=utf8")
	@ResponseBody
	public ArrayList<String> county(String a1) {
		ArrayList<String> list;
		System.out.println(a1);
		list=dao.searchCounty(a1);
		System.out.println(list.get(1));
		return list;
	}
}
