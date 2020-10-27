package com.multi.animalhospital;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.multi.animalhospitalVO.BoardVO;

@Controller
public class SitemapController {
	@RequestMapping("/sitemap")
	public void sitemap() {}	
	
	@RequestMapping(value ="sitemap/insert", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<BoardVO> insert(String date, String title, String text,HttpServletRequest request) {
		ArrayList<BoardVO> list; 
		HttpSession session = request.getSession();
		if(session.getAttribute("list")==null) {
			session.setAttribute("list", new ArrayList<String>());
		}
		list=(ArrayList<BoardVO>) session.getAttribute("list");
		list.add(new BoardVO(date, title, text));
		session.setAttribute("list", list);
		return list;
	}
	@RequestMapping(value ="sitemap/delete", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<BoardVO> delete(int seq,HttpServletRequest request) {
		ArrayList<BoardVO> list = null; 
		HttpSession session = request.getSession();
		if(session.getAttribute("list")==null) {
			return list;
		}
		list=(ArrayList<BoardVO>) session.getAttribute("list");
		list.remove(seq);
		session.setAttribute("list", list);
		return list;
	}
	@RequestMapping(value ="sitemap/show", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<BoardVO> show(HttpServletRequest request) {
		ArrayList<BoardVO> list = null; 
		HttpSession session = request.getSession();
		if(session.getAttribute("list")==null) {
			return list;
		}
		list=(ArrayList<BoardVO>) session.getAttribute("list");
		return list;
	}
}
