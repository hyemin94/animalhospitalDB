package com.multi.animalhospital;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.animalhospitalDAO.HospitalDAO;
import com.multi.animalhospitalVO.Medical;



@Controller
public class HospitalController {
	@Autowired
	HospitalDAO dao;
	
	@RequestMapping("/hospital")
	public void hospital() {}	
	
	@RequestMapping(value ="hospital/message", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<Medical> message(String a1, String a2) {
		ArrayList<Medical> list; 
		list=dao.searchAddress(a1, a2);
		for(Medical m: list) {
			System.out.println(m.getX());
		}
		return list;
	}
	
	@RequestMapping(value ="hospital/county", method = RequestMethod.POST,produces = "application/json; charset=utf8")
	@ResponseBody
	public ArrayList<String> county(String a1) {
		ArrayList<String> list; 
		list=dao.searchCounty(a1);
		System.out.println(list.get(0));
		return list;
	}

}
