/**
 * 
 */
package com.superCode.controller;


import club.codeapes.common.date.DateUtil;
import club.codeapes.web.core.annotation.MethodInfo;
import club.codeapes.web.core.annotation.ModuleInfo;
import club.codeapes.web.core.controller.BaseController;
import com.superCode.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;


/**
 * <p>Title: 问题提交内容控制层</p>
 * <p>Description: 主要控制增删改查操作</p>
 * 
 * 
 * <p>CreateDate:01-11 11:31:06</p>
 * 
 * 
 */
@ModuleInfo(name="问题提交内容")
@Controller
@SessionAttributes("user_id")
@RequestMapping("/question")
public class QuestionController extends BaseController{

    @Autowired
    private QuestionService questionService;

    @MethodInfo(name = "问题提交内容 - 新建",log=true,logContent="新建操作：")
    @RequestMapping(value = "/add.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> add(HttpServletRequest request, @ModelAttribute("user_id") Integer user_id)throws Exception {
        Map<String,Object> params = getParams(request);
        params.put("user_id", user_id);
        params.put("question_ask_datetime", DateUtil.getNow());
        questionService.add(params);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    /*
    @MethodInfo(name = "问题提交内容 - 新建页面")
    @RequestMapping(value = "/add")
    public String addPage(HttpServletRequest request,ModelMap params)throws Exception {
        resetModel(params,request);
        return "question/add";
    }
*/
    @MethodInfo(name = "问题提交内容 - 删除",log=true,logContent="删除数据：编号[ {id} ] 名称[ {name} ]")
    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> delete(HttpServletRequest request, long id, String name)throws Exception {
        Map<String,Object> params = getParams(request);
        questionService.deleteById(id);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    
    /*
    @MethodInfo(name = "问题提交内容 - 详情页面")
    @RequestMapping(value = "/detail")
    public String detailPage(HttpServletRequest request,ModelMap params,long id)throws Exception {
        params.put("detail", questionService.getMapById(id));
        return "question/detail";
    }
*/
    @MethodInfo(name = "问题提交内容 - 编辑",log=true,logContent="编辑对象：")
    @RequestMapping(value = "/edit.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> edit(HttpServletRequest request)throws Exception {
        Map<String,Object> params = getParams(request);
        params.put("question_answer_datetime", DateUtil.getNow());
        questionService.update(params);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }
    
    
    @MethodInfo(name = "问题 - 回复页面")
    @RequestMapping(value = "/reback")
    public String rebackPage(HttpServletRequest request, ModelMap params, long id)throws Exception {
    	params.put("detail", questionService.getMapById(id));
    	return "admin/question_reback";
    }

    
    
    /*
    @MethodInfo(name = "问题提交内容 - 编辑页面")
    @RequestMapping(value = "/edit")
    public String editPage(HttpServletRequest request,ModelMap params,long id)throws Exception {
        params.put("detail", questionService.getMapById(id));
        return "question/edit";
    }

    @MethodInfo(name = "问题提交内容 - 首页")
    @RequestMapping(value = "/index")
    public String indexPage(HttpServletRequest request,ModelMap params)throws Exception {
        resetModel(params,request);
        return "question/index";
    }*/

    @MethodInfo(name = "问题提交内容 - 查询列表")
    @RequestMapping(value = "/queryList.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> queryList(HttpServletRequest request)throws Exception {
        Map<String,Object> result = getParams(request);
        result.put("data", questionService.queryList(result));
        result.put("success", true);
        return result;
    }

    @MethodInfo(name = "问题提交内容 - 查询分页列表")
    @RequestMapping(value = "/queryPageList.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> queryPageList(HttpServletRequest request)throws Exception {
        Map<String,Object> result = getParams(request);
        result.put("start", Integer.valueOf(String.valueOf(result.get("start")))-1);
    	Integer limit = Integer.valueOf(String.valueOf(result.get("limit")));
    	result.put("start", Integer.valueOf(String.valueOf(result.get("start")))*limit);
        result.put("data", questionService.queryPageList(result));
        result.put("code", 0);
        result.put("count", questionService.count(result));
        result.put("success", true);
        return result;
    }

}