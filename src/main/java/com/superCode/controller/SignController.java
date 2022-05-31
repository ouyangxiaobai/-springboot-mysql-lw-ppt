/**
 *
 */
package com.superCode.controller;


import club.codeapes.common.date.DateUtil;
import club.codeapes.web.core.annotation.MethodInfo;
import club.codeapes.web.core.annotation.ModuleInfo;
import club.codeapes.web.core.controller.BaseController;
import com.superCode.service.SignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;


/**
 * <p>Title: 用户签到控制层</p>
 * <p>Description: 主要控制增删改查操作</p>
 *
 *
 * <p>CreateDate:01-12 20:23:55</p>
 *
 *
 */
@ModuleInfo(name = "用户签到")
@Controller
@SessionAttributes("user_id")
@RequestMapping("/sign")
public class SignController extends BaseController {

    @Autowired
    private SignService signService;

    @MethodInfo(name = "用户签到 - 新建", log = true, logContent = "新建操作：")
    @RequestMapping(value = "/add.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> add(HttpServletRequest request, @ModelAttribute("user_id") Integer user_id) throws Exception {
        Map<String, Object> params = getParams(request);
        params.put("user_id", user_id);
        params.put("sign_datetime", DateUtil.getNow());
        signService.add(params);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    @MethodInfo(name = "用户签到 - 删除", log = true, logContent = "删除数据：编号[ {id} ] 名称[ {name} ]")
    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> delete(HttpServletRequest request, long id, String name) throws Exception {
        Map<String, Object> params = getParams(request);
        signService.deleteById(id);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    @MethodInfo(name = "用户签到 - 详情页面")
    @RequestMapping(value = "/detail")
    public String detailPage(HttpServletRequest request, ModelMap params, long id) throws Exception {
        params.put("detail", signService.getMapById(id));
        return "/sign/detail";
    }

    @MethodInfo(name = "用户签到 - 今天是否签到", log = true, logContent = "签到状态：")
    @RequestMapping(value = "/getSignStateToday.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> getSignStateToday(HttpServletRequest request, @ModelAttribute("user_id") Integer user_id) throws Exception {
        Map<String, Object> params = getParams(request);


        if (user_id != null) {
            params.put("user_id", user_id);
            params.put("sign_datetime_like", DateUtil.getNow(DateUtil.FORMAT_YMD));
            if (signService.count(params) > 0) {
                params.put("success", true);
                params.put("msg", "今日已签到");
            } else {
                params.put("success", false);
                params.put("msg", "点我签个到？");
            }

        } else {
            params.put("success", false);
            params.put("msg", "点我签个到？");
        }


        return params;
    }

    @MethodInfo(name = "用户签到 - 编辑", log = true, logContent = "编辑对象：")
    @RequestMapping(value = "/edit.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> edit(HttpServletRequest request) throws Exception {
        Map<String, Object> params = getParams(request);
        signService.update(params);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    @MethodInfo(name = "用户签到 - 首页")
    @RequestMapping(value = "/index")
    public String indexPage(HttpServletRequest request, ModelMap params) throws Exception {
        resetModel(params, request);
        return "/sign/index";
    }

    @MethodInfo(name = "用户签到 - 查询列表")
    @RequestMapping(value = "/queryList.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> queryList(HttpServletRequest request) throws Exception {
        Map<String, Object> result = getParams(request);
        result.put("data", signService.queryList(result));
        result.put("code", 0);
        result.put("success", true);
        return result;
    }

    @MethodInfo(name = "用户签到 - 查询分页列表")
    @RequestMapping(value = "/queryPageList.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> queryPageList(HttpServletRequest request) throws Exception {
        Map<String, Object> result = getParams(request);
        result.put("start", Integer.valueOf(String.valueOf(result.get("start"))) - 1);
        Integer limit = Integer.valueOf(String.valueOf(result.get("limit")));
        result.put("start", Integer.valueOf(String.valueOf(result.get("start"))) * limit);
        result.put("data", signService.queryPageList(result));
        result.put("code", 0);
        result.put("count", signService.count(result));
        result.put("success", true);
        return result;
    }

}