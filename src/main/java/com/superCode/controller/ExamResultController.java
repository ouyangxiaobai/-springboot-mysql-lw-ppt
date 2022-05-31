/**
 * 
 */
package com.superCode.controller;


import club.codeapes.common.date.DateUtil;
import club.codeapes.web.core.annotation.MethodInfo;
import club.codeapes.web.core.annotation.ModuleInfo;
import club.codeapes.web.core.controller.BaseController;
import com.superCode.service.ExamResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;


/**
 * <p>Title: 试卷判定控制层</p>
 * <p>Description: 主要控制增删改查操作</p>
 * 
 * 
 * <p>CreateDate:01-16 12:07:12</p>
 * 
 * <p>Version:1.0</p>
 */
@ModuleInfo(name="试卷判定")
@Controller
@SessionAttributes("user_id")
@RequestMapping("/exam/result")
public class ExamResultController extends BaseController{

    @Autowired
    private ExamResultService examResultService;

    @MethodInfo(name = "试卷判定 - 新建",log=true,logContent="新建操作：")
    @RequestMapping(value = "/add.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> add(HttpServletRequest request, @ModelAttribute("user_id") Integer user_id)throws Exception {
        Map<String,Object> params = getParams(request);
        params.put("user_id", user_id);
        params.put("result_commit_datetime", DateUtil.getNow());
        examResultService.add(params);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    @MethodInfo(name = "试卷判定 - 新建页面")
    @RequestMapping(value = "/add")
    public String addPage(HttpServletRequest request, ModelMap params)throws Exception {
        resetModel(params,request);
        return "exam/result/add";
    }

    @MethodInfo(name = "试卷判定 - 删除",log=true,logContent="删除数据：编号[ {id} ] 名称[ {name} ]")
    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> delete(HttpServletRequest request, long id, String name)throws Exception {
        Map<String,Object> params = getParams(request);
        examResultService.deleteById(id);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    @MethodInfo(name = "试卷判定 - 详情页面")
    @RequestMapping(value = "/detail")
    public String detailPage(HttpServletRequest request, ModelMap params, long id)throws Exception {
        params.put("detail", examResultService.getMapById(id));
        return "exam/result/detail";
    }

    @MethodInfo(name = "试卷判定 - 编辑",log=true,logContent="编辑对象：")
    @RequestMapping(value = "/edit.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> edit(HttpServletRequest request)throws Exception {
        Map<String,Object> params = getParams(request);
        examResultService.update(params);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    @MethodInfo(name = "试卷判定 - 编辑页面")
    @RequestMapping(value = "/edit")
    public String editPage(HttpServletRequest request, ModelMap params, long id)throws Exception {
        params.put("detail", examResultService.getMapById(id));
        return "admin/exam_result_edit";
    }

    @MethodInfo(name = "试卷判定 - 首页")
    @RequestMapping(value = "/index")
    public String indexPage(HttpServletRequest request, ModelMap params)throws Exception {
        resetModel(params,request);
        return "admin/exam_result_index";
    }

    @MethodInfo(name = "试卷判定 - 查询列表")
    @RequestMapping(value = "/queryList.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> queryList(HttpServletRequest request)throws Exception {
        Map<String,Object> result = getParams(request);
        result.put("data", examResultService.queryList(result));
        result.put("code", 0);
        result.put("success", true);
        return result;
    }

    @MethodInfo(name = "试卷判定 - 查询分页列表")
    @RequestMapping(value = "/queryPageList.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> queryPageList(HttpServletRequest request)throws Exception {
        Map<String,Object> result = getParams(request);
        result.put("start", Integer.valueOf(String.valueOf(result.get("start")))-1);
    	Integer limit = Integer.valueOf(String.valueOf(result.get("limit")));
    	result.put("start", Integer.valueOf(String.valueOf(result.get("start")))*limit);
        result.put("data", examResultService.queryPageList(result));
        result.put("code", 0);
        result.put("count", examResultService.count(result));
        result.put("success", true);
        return result;
    }

}