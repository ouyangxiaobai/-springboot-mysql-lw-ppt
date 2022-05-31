/**
 * 
 */
package com.superCode.controller;

import club.codeapes.common.date.DateUtil;
import club.codeapes.web.core.annotation.MethodInfo;
import club.codeapes.web.core.annotation.ModuleInfo;
import club.codeapes.web.core.controller.BaseController;
import com.superCode.service.HomeworkAnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * <p>
 * Title: 作业提交内容控制层
 * </p>
 * <p>
 * Description: 主要控制增删改查操作
 * </p>
 * 
 * 
 * <p>
 * CreateDate:01-13 23:39:54
 * </p>
 * 
 * 
 */
@ModuleInfo(name = "作业提交内容")
@Controller
@SessionAttributes("user_id")
@RequestMapping("/homework/answer")
public class HomeworkAnswerController extends BaseController {

	@Autowired
	private HomeworkAnswerService homeworkAnswerService;

	@MethodInfo(name = "作业提交内容 - 新建", log = true, logContent = "新建操作：")
	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	public @ResponseBody
    Map<String, Object> add(HttpServletRequest request, @ModelAttribute("user_id") Integer user_id) throws Exception {
		Map<String, Object> params = getParams(request);
		params.put("answer_commit_datetime", DateUtil.getNow());
		params.put("user_id", user_id);
		homeworkAnswerService.add(params);
		params.put("success", true);
		params.put("msg", "操作成功");
		return params;
	}

	/*
	 * @MethodInfo(name = "作业提交内容 - 新建页面")
	 * 
	 * @RequestMapping(value = "/add") public String addPage(HttpServletRequest
	 * request,ModelMap params)throws Exception { resetModel(params,request);
	 * return "homework/answer/add"; }
	 */
	@MethodInfo(name = "作业提交内容 - 删除", log = true, logContent = "删除数据：编号[ {id} ] 名称[ {name} ]")
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public @ResponseBody
    Map<String, Object> delete(HttpServletRequest request, long id, String name) throws Exception {
		Map<String, Object> params = getParams(request);
		homeworkAnswerService.deleteById(id);
		params.put("success", true);
		params.put("msg", "操作成功");
		return params;
	}

	/*
	 * @MethodInfo(name = "作业提交内容 - 详情页面")
	 * 
	 * @RequestMapping(value = "/detail") public String
	 * detailPage(HttpServletRequest request,ModelMap params,long id)throws
	 * Exception { params.put("detail", homeworkAnswerService.getMapById(id));
	 * return "homework/answer/detail"; }
	 */
	@MethodInfo(name = "作业提交内容 - 编辑", log = true, logContent = "编辑对象：")
	@RequestMapping(value = "/edit.do", method = RequestMethod.POST)
	public @ResponseBody
    Map<String, Object> edit(HttpServletRequest request) throws Exception {
		Map<String, Object> params = getParams(request);
		homeworkAnswerService.update(params);
		params.put("success", true);
		params.put("msg", "操作成功");
		return params;
	}

	@MethodInfo(name = "作业提交内容 - 编辑页面")
	@RequestMapping(value = "/edit")
	public String editPage(HttpServletRequest request, ModelMap params, long id) throws Exception {
		params.put("detail", homeworkAnswerService.getMapById(id));
		return "admin/homework_answer_edit";
	}

	@MethodInfo(name = "作业提交内容 - 首页")
	@RequestMapping(value = "/index")
	public String indexPage(HttpServletRequest request, ModelMap params) throws Exception {
		resetModel(params, request);
		return "admin/homework_answer_index";
	}

	@MethodInfo(name = "作业提交内容 - 查询列表")
	@RequestMapping(value = "/queryList.do", method = RequestMethod.POST)
	public @ResponseBody
    Map<String, Object> queryList(HttpServletRequest request) throws Exception {
		Map<String, Object> result = getParams(request);
		result.put("data", homeworkAnswerService.queryList(result));
		result.put("success", true);
		return result;
	}

	@MethodInfo(name = "作业提交内容 - 查询分页列表")
	@RequestMapping(value = "/queryPageList.do", method = RequestMethod.POST)
	public @ResponseBody
    Map<String, Object> queryPageList(HttpServletRequest request) throws Exception {
		Map<String, Object> result = getParams(request);
		result.put("start", Integer.valueOf(String.valueOf(result.get("start"))) - 1);
		Integer limit = Integer.valueOf(String.valueOf(result.get("limit")));
		result.put("start", Integer.valueOf(String.valueOf(result.get("start"))) * limit);
		result.put("data", homeworkAnswerService.queryPageList(result));
		result.put("code", 0);
		result.put("count", homeworkAnswerService.count(result));
		result.put("success", true);
		return result;
	}

}