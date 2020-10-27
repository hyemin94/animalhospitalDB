package com.multi.animalhospital;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenuController {
	@RequestMapping("/menu/hospital")
	public String hospital() {
		return "redirect:/hospital";
	}
	@RequestMapping("/menu/pharmacy")
	public String pharmacy() {
		return "redirect:/pharmacy";
	}
	@RequestMapping("/menu/sick")
	public String sick() {
		return "redirect:/sick";
	}
	@RequestMapping("/menu/sitemap")
	public String sitemap() {
		return "redirect:/sitemap";
	}
	@RequestMapping("/menu/home")
	public String home() {
		return "redirect:/";
	}
}