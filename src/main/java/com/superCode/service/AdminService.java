/**
 * 
 */
package com.superCode.service;


import com.superCode.dao.AdminDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * <p>Title: Admin业务层</p>
 * <p>Description: 增删改查业务</p>
 * 
 * 
 * <p>CreateDate:12-09 16:05:29</p>
 * 
 * 
 */
@Service
public class AdminService {

    @Autowired
    private AdminDao adminDao;

    /**
     * 添加
     * 添加方法备注
     * @param params
     * @return
     */
    @Transactional(rollbackFor=Exception.class)
    public int add(Map<String,Object> params) throws Exception{
        return adminDao.insert(params);
    }

    /**
     * 批量删除
     * 通过一组主键进行批量删除
     * @param String[] admin_names
     * @return
     */
    @Transactional(rollbackFor=Exception.class)
    public int batchDelete(String[] admin_names) throws Exception{
        return adminDao.batchDelete(admin_names);
    }

    /**
     * 统计
     * 查询分页统计方法
     * @param params
     * @return
     */
    public long count(Map<String,Object> params) {
        return adminDao.count(params);
    }

    /**
     * 通过主键删除对象
     * 通过单一主键进行删除
     * @param string
     * @return
     */
    @Transactional(rollbackFor=Exception.class)
    public int deleteById(String admin_name)throws Exception{
        return adminDao.deleteById(admin_name);
    }

    /**
     * 获取对象
     * 通过主键获取map
     * @param string
     * @return
     */
    public Map<String,Object> getMapById(String admin_name){
        return adminDao.getMapById(admin_name);
    }

    /**
     * 插入
     * 添加方法备注
     * @param params
     * @return
     */
    public int insert(Map<String,Object> params) {
        return adminDao.insert(params);
    }

    /**
     * 查询列表
     * 查询列表方法
     * @param params
     * @return
     */
    public List<Map<String,Object>> queryList(Map<String,Object> params){
        return adminDao.queryList(params);
    }

    /**
     * 查询分页列表
     * 查询分页列表方法
     * @param params
     * @return
     */
    public List<Map<String,Object>> queryPageList(Map<String,Object> params){
        return adminDao.queryPageList(params);
    }

    /**
     * 更新
     * 编辑方法备注
     * @param params
     * @return
     */
    @Transactional(rollbackFor=Exception.class)
    public int update(Map<String,Object> params)throws Exception{
        return adminDao.update(params);
    }

}