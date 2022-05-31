package com.superCode.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 首页Controller  默认打开的页面
 *
 * @author Administrator
 *
 */
@Controller
public class DefaultController {

	@RequestMapping("/")
	public String root(){
		return "redirect:/index.jsp";
	}
}
