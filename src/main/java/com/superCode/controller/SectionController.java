/**
 * 
 */
package com.superCode.controller;


import club.codeapes.web.core.annotation.MethodInfo;
import club.codeapes.web.core.annotation.ModuleInfo;
import club.codeapes.web.core.controller.BaseController;
import com.superCode.service.SectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;


/**
 * <p>Title: 节控制层</p>
 * <p>Description: 主要控制增删改查操作</p>
 * 
 * 
 * <p>CreateDate:01-13 15:22:14</p>
 * 
 * 
 */
@ModuleInfo(name="节")
@Controller
@RequestMapping("/section")
public class SectionController extends BaseController{

    @Autowired
    private SectionService sectionService;

    @MethodInfo(name = "节 - 新建",log=true,logContent="新建操作：")
    @RequestMapping(value = "/add.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> add(HttpServletRequest request)throws Exception {
        Map<String,Object> params = getParams(request);
        sectionService.add(params);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    @MethodInfo(name = "节 - 新建页面")
    @RequestMapping(value = "/add")
    public String addPage(HttpServletRequest request, ModelMap params)throws Exception {
        resetModel(params,request);
        return "admin/course_section_add";
    }

    @MethodInfo(name = "节 - 删除",log=true,logContent="删除数据：编号[ {id} ] 名称[ {name} ]")
    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> delete(HttpServletRequest request, long id, String name)throws Exception {
        Map<String,Object> params = getParams(request);
        sectionService.deleteById(id);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    @MethodInfo(name = "节 - 详情页面")
    @RequestMapping(value = "/detail")
    public String detailPage(HttpServletRequest request, ModelMap params, long section_id)throws Exception {
        params.put("detail", sectionService.getMapById(section_id));
        return "section_detail";
    }

    @MethodInfo(name = "节 - 编辑",log=true,logContent="编辑对象：")
    @RequestMapping(value = "/edit.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> edit(HttpServletRequest request)throws Exception {
        Map<String,Object> params = getParams(request);
        sectionService.update(params);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    @MethodInfo(name = "节 - 编辑页面")
    @RequestMapping(value = "/edit")
    public String editPage(HttpServletRequest request, ModelMap params, long id)throws Exception {
        params.put("detail", sectionService.getMapById(id));
        return "admin/course_section_edit";
    }

    @MethodInfo(name = "节 - 首页")
    @RequestMapping(value = "/index")
    public String indexPage(HttpServletRequest request, ModelMap params)throws Exception {
        resetModel(params,request);
        return "admin/course_section_index";
    }

    @MethodInfo(name = "节 - 查询列表")
    @RequestMapping(value = "/queryList.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> queryList(HttpServletRequest request)throws Exception {
        Map<String,Object> result = getParams(request);
        result.put("code", 0);
        result.put("data", sectionService.queryList(result));
        result.put("success", true);
        return result;
    }

    @MethodInfo(name = "节 - 查询分页列表")
    @RequestMapping(value = "/queryPageList.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> queryPageList(HttpServletRequest request)throws Exception {
        Map<String,Object> result = getParams(request);
        result.put("start", Integer.valueOf(String.valueOf(result.get("start")))-1);
    	Integer limit = Integer.valueOf(String.valueOf(result.get("limit")));
    	result.put("start", Integer.valueOf(String.valueOf(result.get("start")))*limit);
        result.put("data", sectionService.queryPageList(result));
        result.put("code", 0);
        result.put("count", sectionService.count(result));
        result.put("success", true);
        return result;
    }

}