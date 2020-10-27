package com.multi.animalhospital;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.animalhospitalDAO.MemberDAO;

@Controller
public class MemberController {
	MemberDAO dao = new MemberDAO();
	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member() {
		System.out.println("회원가입 화면 이동");
		return "member";
	}
	
	
	@RequestMapping(value="/member", method = RequestMethod.POST)
	public String member(
			@RequestParam(value = "name") String name,
			@RequestParam(value = "id") String id,
			@RequestParam(value = "password") String pw,
			HttpServletRequest request)
	{	
		System.out.println(id);
		boolean result = dao.insertMember(id, name, pw);
		if(result == true) 
		{
			HttpSession session = request.getSession();
			session.setAttribute("loginid", id);
			return "home";
		}
		return "member";
	}
}