/**
 *
 */
package com.superCode.controller;


import club.codeapes.web.core.annotation.MethodInfo;
import club.codeapes.web.core.annotation.ModuleInfo;
import club.codeapes.web.core.controller.BaseController;
import com.superCode.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;


/**
 * <p>Title: 课程控制层</p>
 * <p>Description: 主要控制增删改查操作</p>
 *
 *
 * <p>CreateDate:01-13 15:21:43</p>
 *
 *
 */
@ModuleInfo(name = "课程")
@Controller
@RequestMapping("/course")
public class CourseController extends BaseController {

    @Autowired
    private CourseService courseService;

    @MethodInfo(name = "课程 - 新建", log = true, logContent = "新建操作：")
    @RequestMapping(value = "/add.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> add(HttpServletRequest request) throws Exception {
        Map<String, Object> params = getParams(request);
        courseService.add(params);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    @MethodInfo(name = "课程 - 新建页面")
    @RequestMapping(value = "/add")
    public String addPage(HttpServletRequest request, ModelMap params) throws Exception {
        resetModel(params, request);
        return "admin/course_add";
    }

    @MethodInfo(name = "课程 - 删除", log = true, logContent = "删除数据：编号[ {id} ] 名称[ {name} ]")
    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> delete(HttpServletRequest request, long id, String name) throws Exception {
        Map<String, Object> params = getParams(request);
        courseService.deleteById(id);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    @MethodInfo(name = "课程 - 详情页面")
    @RequestMapping(value = "/detail")
    public String detailPage(HttpServletRequest request, ModelMap params, long course_id) throws Exception {
        params.put("detail", courseService.getMapById(course_id));
        return "course_detail";
    }
    
    /*@MethodInfo(name = "课程 - 节列表页面")
    @RequestMapping(value = "/section_list")
    public String sectionListPage(HttpServletRequest request,ModelMap params,long id)throws Exception {
        params.put("detail", courseService.getMapById(id));
        return "admin/course_section_index";
    }*/

    @MethodInfo(name = "课程 - 编辑", log = true, logContent = "编辑对象：")
    @RequestMapping(value = "/edit.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> edit(HttpServletRequest request) throws Exception {
        Map<String, Object> params = getParams(request);
        courseService.update(params);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    @MethodInfo(name = "课程 - 编辑页面")
    @RequestMapping(value = "/edit")
    public String editPage(HttpServletRequest request, ModelMap params, long id) throws Exception {
        params.put("detail", courseService.getMapById(id));
        return "admin/course_edit";
    }

    @MethodInfo(name = "课程 - 首页")
    @RequestMapping(value = "/index")
    public String indexPage(HttpServletRequest request, ModelMap params) throws Exception {
        resetModel(params, request);
        return "course/index";
    }


    @MethodInfo(name = "课程 - 查询列表")
    @RequestMapping(value = "/queryList.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> queryList(HttpServletRequest request) throws Exception {

        //首页ajax调用
        Map<String, Object> result = getParams(request);
        result.put("data", courseService.queryList(result));
        result.put("code", 0);
        result.put("success", true);
        return result;
    }


    @MethodInfo(name = "课程 - 前台表单查询列表")
    @RequestMapping(value = "/queryWebList.do")
    public String queryWebList(HttpServletRequest request, ModelMap params) throws Exception {

        Map<String, Object> result = getParams(request);


        String aaaa=result.get("course_name_like").toString();
        //aaaa = new String(aaaa.getBytes("iso-8859-1"),"utf-8");//乱码转换
        result.remove("course_name_like");//移除原始值
        result.put("course_name_like",aaaa);//将乱码处理后的值,写入参数

        List<Map<String, Object>> datalist = courseService.queryList(result);
        params.put("data", datalist);
        params.put("aaaa", aaaa);//搜索的关键字

        return "course_search";


    }

    @MethodInfo(name = "课程 - 查询分页列表")
    @RequestMapping(value = "/queryPageList.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> queryPageList(HttpServletRequest request) throws Exception {
        Map<String, Object> result = getParams(request);
        result.put("start", Integer.valueOf(String.valueOf(result.get("start"))) - 1);
        Integer limit = Integer.valueOf(String.valueOf(result.get("limit")));
        result.put("start", Integer.valueOf(String.valueOf(result.get("start"))) * limit);
        result.put("data", courseService.queryPageList(result));
        result.put("code", 0);
        result.put("count", courseService.count(result));
        result.put("success", true);
        return result;
    }

}