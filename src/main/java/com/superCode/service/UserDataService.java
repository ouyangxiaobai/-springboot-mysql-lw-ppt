/**
 * Copyright ,Inc.All rights reserved.
 */
package com.superCode.service;


import com.superCode.dao.UserDataDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * <p>Title: UserData业务层</p>
 * <p>Description: 增删改查业务</p>
 * 
 * <p>Company:WEB</p>
 * <p>CreateDate:01-04 17:15:24</p>
 * <p>Author:WEB</p>

 */
@Service
public class UserDataService {

    @Autowired
    private UserDataDao userDataDao;

    /**
     * 添加
     * 添加方法备注
     * @param params
     * @return
     */
    @Transactional(rollbackFor=Exception.class)
    public int add(Map<String,Object> params) throws Exception{
        return userDataDao.insert(params);
    }

    /**
     * 批量删除
     * 通过一组主键进行批量删除
     * @param long[] user_ids
     * @return
     */
    @Transactional(rollbackFor=Exception.class)
    public int batchDelete(long[] user_ids) throws Exception{
        return userDataDao.batchDelete(user_ids);
    }

    /**
     * 统计
     * 查询分页统计方法
     * @param params
     * @return
     */
    public long count(Map<String,Object> params) {
        return userDataDao.count(params);
    }

    /**
     * 通过主键删除对象
     * 通过单一主键进行删除
     * @param long
     * @return
     */
    @Transactional(rollbackFor=Exception.class)
    public int deleteById(long user_id)throws Exception{
        return userDataDao.deleteById(user_id);
    }

    /**
     * 获取对象
     * 通过主键获取map
     * @param long
     * @return
     */
    public Map<String,Object> getMapById(long user_id){
        return userDataDao.getMapById(user_id);
    }

    /**
     * 插入
     * 添加方法备注
     * @param params
     * @return
     */
    public int insert(Map<String,Object> params) {
        return userDataDao.insert(params);
    }

    /**
     * 查询列表
     * 查询列表方法
     * @param params
     * @return
     */
    public List<Map<String,Object>> queryList(Map<String,Object> params){
        return userDataDao.queryList(params);
    }

    /**
     * 查询分页列表
     * 查询分页列表方法
     * @param params
     * @return
     */
    public List<Map<String,Object>> queryPageList(Map<String,Object> params){
        return userDataDao.queryPageList(params);
    }

    /**
     * 更新
     * 编辑方法备注
     * @param params
     * @return
     */
    @Transactional(rollbackFor=Exception.class)
    public int update(Map<String,Object> params)throws Exception{
        return userDataDao.update(params);
    }
    /**
     * 更新分数
     * @param params
     * @return
     */
    @Transactional(rollbackFor=Exception.class)
    public int updatescore(Map<String,Object> params)throws Exception{
    	return userDataDao.updatescore(params);
    }
    
    /**
     * 更新头像
     * 编辑方法备注
     * @param params
     * @return
     */
    @Transactional(rollbackFor=Exception.class)
    public int updateHead(Map<String,Object> params)throws Exception{
        return userDataDao.updateHead(params);
    }

}