/**
 * Copyright ,Inc.All rights reserved.
 */
package com.superCode.controller;

import club.codeapes.common.date.DateUtil;
import club.codeapes.web.core.controller.BaseController;
//import com.alibaba.fastjson.JSON;
import com.superCode.service.UserDataService;
import com.superCode.service.UserPwdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * Title: 用户信息控制层
 * </p>
 * <p>
 * Description: 主要控制增删改查操作
 * </p>
 *
 * <p>
 * Company:WEB
 * </p>
 * <p>
 * CreateDate:01-04 17:15:24
 * </p>
 * <p>
 * Author:WEB
 * </p>
 */
@Controller
@SessionAttributes("user_id")
@RequestMapping("/user")
public class UserController extends BaseController {

    @Autowired
    private UserDataService userDataService;

    @Autowired
    private UserPwdService userPwdService;

    @RequestMapping(value = "/register.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> add(HttpServletRequest request) throws Exception {
        Map<String, Object> params = getParams(request);
        //System.out.println("Webapp有用户注册:" + JSON.toJSONString(params) + " 时间：" + DateUtil.getNow());
        Object name = params.get("user_name");
        params.put("user_name", null);
        if (userDataService.count(params) > 0) {
            params.put("success", false);
            params.put("msg", "手机号已被注册");
            return params;
        }
        params.put("user_name", name);
        userDataService.add(params);
        userPwdService.add(params);
       // System.out.println(DateUtil.getNow() + " 有用户注册，信息:  " + JSON.toJSONString(params));
        params.put("success", true);
        params.put("msg", "注册成功");
        return params;
    }

    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> login(HttpServletRequest request, ModelMap model) throws Exception {
        Map<String, Object> result = getParams(request);
       // System.out.println("Webapp有用户登录:" + JSON.toJSONString(result) + " 时间：" + DateUtil.getNow());
        if (userDataService.queryList(result).size() > 0) {
            result.putAll(userDataService.queryList(result).get(0));
            if (userPwdService.count(result) > 0) {
                Map<String, Object> map = new HashMap<String, Object>();
                map.putAll(userDataService.queryList(result).get(0));
                result.put("success", true);
                result.put("data", map.get("user_id"));
                model.addAttribute("user_id",
                    String.valueOf(result.get("user_id"))); // ②向ModelMap中添加一个属性

                request.getSession().setAttribute("sessionUser", map);// 登录信息存入session,供JSP用
            } else {
                result.put("success", false);
                result.put("msg", "用户不存在或密码错误");
            }

        } else {
            result.put("success", false);
            result.put("msg", "用户不存在或密码错误");
        }
        return result;
    }

    @RequestMapping(value = "/get.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> get(HttpServletRequest request) throws Exception {
        Map<String, Object> result = getParams(request);

        result.put("success", true);
        result.put("data",
            userDataService.getMapById(Long.valueOf(String.valueOf(result.get("user_id")))));
        if (result.get("data") == null) {
            result.put("data", new HashMap<>());
            result.put("success", false);
            result.put("msg", "无此用户信息");
        }
        return result;
    }

    @RequestMapping(value = "/getSingle.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> getSingle(HttpServletRequest request,
                                  @ModelAttribute("user_id") Integer user_id) throws Exception {
        Map<String, Object> result = getParams(request);

        if (user_id != null) {
            result.put("success", true);
            result.put("data", userDataService.getMapById(user_id));

        } else {
            result.put("success", true);
            result.put("data", 0);
        }

        return result;
    }

    @RequestMapping(value = "/logout.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> logout(HttpServletRequest request, ModelMap model) throws Exception {
        Map<String, Object> result = getParams(request);
        model.addAttribute("user_id", ""); // ②向ModelMap中添加一个属性

        request.getSession().setAttribute("sessionUser", null);// 清空登录信息,供JSP用

        return result;
    }

    @RequestMapping(value = "/changepwd.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> changepwd(HttpServletRequest request) throws Exception {
        Map<String, Object> params = getParams(request);
        int num = userPwdService.update(params);
        if (num > 0) {
            params.put("success", true);
            params.put("msg", "密码修改成功");
        } else {
            params.put("success", false);
            params.put("msg", "原密码错误");
        }

        return params;
    }

    @RequestMapping(value = "/edit.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> edit(HttpServletRequest request) throws Exception {
        Map<String, Object> params = getParams(request);
        userDataService.update(params);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    @RequestMapping(value = "/updatescore.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> updatescore(HttpServletRequest request) throws Exception {
        Map<String, Object> params = getParams(request);
        userDataService.updatescore(params);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    @RequestMapping(value = "/edit")
    public String editPage(HttpServletRequest request, ModelMap params, Integer id,
                           Map<String, Object> sessionMap) throws Exception {
        Integer user_id = null;
        if (sessionMap.get("user_id") == null
            || sessionMap.get("user_id").toString().trim().length() == 0) {
            user_id = id;
        } else {
            user_id = Integer.valueOf(sessionMap.get("user_id").toString());
        }
        params.put("detail", userDataService.getMapById(user_id));
        return "user_edit";
    }

    @RequestMapping(value = "/editpwd")
    public String editpwdPage(HttpServletRequest request, ModelMap params,
                              @ModelAttribute("user_id") Integer user_id) throws Exception {
        params.put("detail", userDataService.getMapById(user_id));
        return "user_editpwd";
    }

    @RequestMapping(value = "/score")
    public String scorePage(HttpServletRequest request, ModelMap params, Integer id)
        throws Exception {
        params.put("detail", userDataService.getMapById(id));
        return "admin/user_score";
    }

    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> delete(HttpServletRequest request, Long id) throws Exception {
        Map<String, Object> params = getParams(request);
        userDataService.deleteById(id);
        userPwdService.deleteById(id);
        params.put("success", true);
        params.put("msg", "操作成功");
        return params;
    }

    @RequestMapping(value = "/queryList.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> queryList(HttpServletRequest request) throws Exception {
        Map<String, Object> result = getParams(request);
        List<Map<String, Object>> datalist = userDataService.queryList(result);
        result.put("data", datalist);
        result.put("success", true);
        result.put("code", 0);
        result.put("msg", "");
        result.put("count", userDataService.count(result));
        return result;
    }

    @RequestMapping(value = "/queryPageList.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> queryPageList(HttpServletRequest request) throws Exception {
        Map<String, Object> result = getParams(request);
        result.put("start", Integer.valueOf(String.valueOf(result.get("start"))) - 1);
        Integer limit = Integer.valueOf(String.valueOf(result.get("limit")));
        result.put("start", Integer.valueOf(String.valueOf(result.get("start"))) * limit);
        List<Map<String, Object>> datalist = userDataService.queryPageList(result);
        result.put("data", datalist);
        result.put("code", 0);
        result.put("msg", "");
        result.put("count", userDataService.count(result));
        result.put("recordsTotal", userDataService.count(result));
        result.put("recordsFiltered", Integer.parseInt(result.get("recordsTotal").toString()));
        result.put("success", true);
        return result;
    }

}