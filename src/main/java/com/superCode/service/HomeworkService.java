/**
 * 
 */
package com.superCode.service;


import com.superCode.dao.HomeworkDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * <p>Title: Homework业务层</p>
 * <p>Description: 增删改查业务</p>
 * 
 * 
 * <p>CreateDate:01-13 23:38:23</p>
 * 
 * 
 */
@Service
public class HomeworkService {

    @Autowired
    private HomeworkDao homeworkDao;

    /**
     * 添加
     * 添加方法备注
     * @param params
     * @return
     */
    @Transactional(rollbackFor=Exception.class)
    public int add(Map<String,Object> params) throws Exception{
        return homeworkDao.insert(params);
    }

    /**
     * 批量删除
     * 通过一组主键进行批量删除
     * @param long[] homework_ids
     * @return
     */
    @Transactional(rollbackFor=Exception.class)
    public int batchDelete(long[] homework_ids) throws Exception{
        return homeworkDao.batchDelete(homework_ids);
    }

    /**
     * 统计
     * 查询分页统计方法
     * @param params
     * @return
     */
    public long count(Map<String,Object> params) {
        return homeworkDao.count(params);
    }

    /**
     * 通过主键删除对象
     * 通过单一主键进行删除
     * @param long
     * @return
     */
    @Transactional(rollbackFor=Exception.class)
    public int deleteById(long homework_id)throws Exception{
        return homeworkDao.deleteById(homework_id);
    }

    /**
     * 获取对象
     * 通过主键获取map
     * @param long
     * @return
     */
    public Map<String,Object> getMapById(long homework_id){
        return homeworkDao.getMapById(homework_id);
    }

    /**
     * 插入
     * 添加方法备注
     * @param params
     * @return
     */
    public int insert(Map<String,Object> params) {
        return homeworkDao.insert(params);
    }

    /**
     * 查询列表
     * 查询列表方法
     * @param params
     * @return
     */
    public List<Map<String,Object>> queryList(Map<String,Object> params){
        return homeworkDao.queryList(params);
    }
    
    /**
     * 查询个人作业列表（包含所有未提交和已提交的） 
     * 查询个人作业列表（包含所有未提交和已提交的） 方法
     * @param params
     * @return
     */
    public List<Map<String,Object>> querySelfList(Map<String,Object> params){
    	return homeworkDao.querySelfList(params);
    }

    /**
     * 查询分页列表
     * 查询分页列表方法
     * @param params
     * @return
     */
    public List<Map<String,Object>> queryPageList(Map<String,Object> params){
        return homeworkDao.queryPageList(params);
    }

    /**
     * 更新
     * 编辑方法备注
     * @param params
     * @return
     */
    @Transactional(rollbackFor=Exception.class)
    public int update(Map<String,Object> params)throws Exception{
        return homeworkDao.update(params);
    }

}