package com.superCode.controller;


import club.codeapes.common.date.DateUtil;
import club.codeapes.common.file.FileUtil;
import club.codeapes.web.core.annotation.MethodInfo;
import club.codeapes.web.core.controller.BaseController;
import com.superCode.service.UserDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/file")
public class FileController extends BaseController{
    
	   @Autowired
	    private UserDataService userDataService;
	   
    
    @RequestMapping(value = "/upload.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> add(HttpServletRequest request, @RequestParam(value = "img", required = false) MultipartFile img)throws Exception {
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	Map<String, Object> result = getParams(request);

		String log = null;// msg描述

		try {
			String iconPath = "";

			if (img != null) {
				String fileName = new Date().getTime()+".jpg";
				String decPath = request.getSession().getServletContext().getRealPath("/assets/file");
				File newFolderCreate = new File(decPath);
				newFolderCreate.mkdirs();
				// 保存
				try {
					try {
						byte[] bytes;
						bytes = img.getBytes();
						FileOutputStream fos = new FileOutputStream(decPath + "/" + fileName);
						fos.write(bytes);
						fos.close();
					} catch (Exception e1) {
						e1.printStackTrace();
					}
					iconPath = fileName;
				} catch (Exception e) {
					e.printStackTrace();
					log = "文件处理有误";
					map.put("msg", log);
					map.put("success", false);
					return map;
				}
				if (result.get("user_id")!=null) {
					result.put("user_head", "assets/file/"+iconPath);
					userDataService.updateHead(result);
				}
				
				
				map.put("msg", "assets/file/"+iconPath);
				map.put("success", true);
				return map;
			}else{
				log = "文件为空";
			}
		} catch (Exception e) {
			log = "上传文件异常！";
		}
		map.put("msg", log);
		map.put("success", false);
		return map;
    }
    @RequestMapping(value = "/uploadFile.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String,Object> addFile(HttpServletRequest request, @RequestParam(value = "file", required = false) MultipartFile file)throws Exception {
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	Map<String, Object> result = getParams(request);
    	
    	String log = null;// msg描述
    	
    	try {
    		String iconPath = "";
    		
    		if (file != null) {
    			String fileName = file.getOriginalFilename();
    			String decPath = request.getSession().getServletContext().getRealPath("/assets/file");
    			File newFolderCreate = new File(decPath);
    			newFolderCreate.mkdirs();
    			// 保存
    			try {
    				try {
    					byte[] bytes;
    					bytes = file.getBytes();
    					FileOutputStream fos = new FileOutputStream(decPath + "/" + fileName);
    					fos.write(bytes);
    					fos.close();
    				} catch (Exception e1) {
    					e1.printStackTrace();
    				}
    				iconPath = fileName;
    			} catch (Exception e) {
    				e.printStackTrace();
    				log = "文件处理有误";
    				map.put("msg", log);
    				map.put("success", false);
    				return map;
    			}
    			
    			map.put("msg", "assets/file/"+iconPath);
    			map.put("path", "assets/file/"+iconPath);
    			map.put("size", FileUtil.formatFileSize(new File(decPath + "/" + fileName).length()));
    			map.put("datetime", DateUtil.getNow());
    			map.put("success", true);
    			return map;
    		}else{
    			log = "文件为空";
    		}
    	} catch (Exception e) {
    		log = "上传文件异常！";
    	}
    	map.put("msg", log);
    	map.put("success", false);
    	return map;
    }
    
    @MethodInfo(name = "文件 - 下载")
    @RequestMapping(value = "/download.do", method = RequestMethod.GET)
    public void download(HttpServletRequest request, HttpServletResponse response, String path)throws Exception {
        String Realpath = request.getSession().getServletContext().getRealPath("/"+path);  
        //获取输入流  
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(Realpath)));
        //转码，免得文件名中文乱码  
        Realpath = URLEncoder.encode(Realpath,"UTF-8");  
        //设置文件下载头  
        response.addHeader("Content-Disposition", "attachment;filename=" + path.substring(path.lastIndexOf("/")+1,path.length()));    
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型    
        response.setContentType("multipart/form-data");   
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
        
        int len = 0;                                                                                                //读取字节数
        byte buf[] = new byte[1024];                                                                 //缓冲区
        while((len = bis.read(buf)) != -1)
        {
        	out.write(buf,0,len);   
        	out.flush();  
        }   
        out.close();  
        bis.close();
    }

}