/**
 * 
 */
package com.superCode.controller;


import club.codeapes.common.date.DateUtil;
import club.codeapes.web.core.annotation.MethodInfo;
import club.codeapes.web.core.annotation.ModuleInfo;
import club.codeapes.web.core.controller.BaseController;
import com.superCode.service.ChapterService;
import com.superCode.service.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;


/**
 * <p>Title: 考试控制层</p>
 * <p>Description: 主要控制增删改查操作</p>
 * 
 * 
 * <p>CreateDate:01-16 12:06:54</p>
 * 
 * <p>Version:1.0</p>
 */
@ModuleInfo(name="考试")
@Controller
@SessionAttributes("user_id")
@RequestMapping("/exam")
public class ExamController extends BaseController{

    @Autowired
    private ExamService examService;
    
    @Autowired
    private ChapterService chapterService;

    @MethodInfo(name = "考试 - 新建",log=true,logContent="新建操作：")
    @RequestMapping(value = "/add.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> add(HttpServletRequest request)throws Exception {
        Map<String,Object> params = getParams(request);
        params.put("exam_publish_datetime", DateUtil.getNow());
        examService.add(params);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    @MethodInfo(name = "考试 - 新建页面")
    @RequestMapping(value = "/add")
    public String addPage(HttpServletRequest request, ModelMap params)throws Exception {
        resetModel(params,request);
        return "admin/exam_add";
    }

    @MethodInfo(name = "考试 - 删除",log=true,logContent="删除数据：编号[ {id} ] 名称[ {name} ]")
    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> delete(HttpServletRequest request, long id, String name)throws Exception {
        Map<String,Object> params = getParams(request);
        examService.deleteById(id);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    @MethodInfo(name = "考试 - 详情页面")
    @RequestMapping(value = "/detail")
    public String detailPage(HttpServletRequest request, ModelMap params, long id)throws Exception {
        params.put("detail", examService.getMapById(id));
        return "exam_detail";
    }

    @MethodInfo(name = "考试 - 编辑",log=true,logContent="编辑对象：")
    @RequestMapping(value = "/edit.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> edit(HttpServletRequest request)throws Exception {
        Map<String,Object> params = getParams(request);
        examService.update(params);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    @MethodInfo(name = "考试 - 编辑页面")
    @RequestMapping(value = "/edit")
    public String editPage(HttpServletRequest request, ModelMap params, long id)throws Exception {
        params.put("detail", examService.getMapById(id));
        return "admin/exam_edit";
    }

    @MethodInfo(name = "考试 - 首页")
    @RequestMapping(value = "/index")
    public String indexPage(HttpServletRequest request, ModelMap params)throws Exception {
        resetModel(params,request);
        params.put("detail", chapterService.getMapById(Long.valueOf(params.get("chapter_id").toString())));
        return "exam";
    }

    @MethodInfo(name = "考试 - 查询列表")
    @RequestMapping(value = "/queryList.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> queryList(HttpServletRequest request)throws Exception {
        Map<String,Object> result = getParams(request);
        result.put("code", 0);
        result.put("data", examService.queryList(result));
        result.put("success", true);
        return result;
    }
    
    @MethodInfo(name = "作业 - 查询个人考试列表")
    @RequestMapping(value = "/querySelfList.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> querySelfList(HttpServletRequest request, @ModelAttribute("user_id") Integer user_id)throws Exception {
    	Map<String,Object> result = getParams(request);
    	result.put("user_id", user_id);
    	result.put("data", examService.querySelfList(result));
    	result.put("success", true);
    	return result;
    }

    @MethodInfo(name = "考试 - 查询分页列表")
    @RequestMapping(value = "/queryPageList.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> queryPageList(HttpServletRequest request)throws Exception {
        Map<String,Object> result = getParams(request);
        result.put("start", Integer.valueOf(String.valueOf(result.get("start")))-1);
    	Integer limit = Integer.valueOf(String.valueOf(result.get("limit")));
    	result.put("start", Integer.valueOf(String.valueOf(result.get("start")))*limit);
        result.put("data", examService.queryPageList(result));
        result.put("code", 0);
        result.put("count", examService.count(result));
        result.put("success", true);
        return result;
    }

}