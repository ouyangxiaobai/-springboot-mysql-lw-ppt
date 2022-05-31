/**
 * 
 */
package com.superCode.service;


import com.superCode.dao.SectionDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * <p>Title: Section业务层</p>
 * <p>Description: 增删改查业务</p>
 * 
 * 
 * <p>CreateDate:01-13 15:22:14</p>
 * 
 * 
 */
@Service
public class SectionService {

    @Autowired
    private SectionDao sectionDao;

    /**
     * 添加
     * 添加方法备注
     * @param params
     * @return
     */
    @Transactional(rollbackFor=Exception.class)
    public int add(Map<String,Object> params) throws Exception{
        return sectionDao.insert(params);
    }

    /**
     * 批量删除
     * 通过一组主键进行批量删除
     * @param long[] section_ids
     * @return
     */
    @Transactional(rollbackFor=Exception.class)
    public int batchDelete(long[] section_ids) throws Exception{
        return sectionDao.batchDelete(section_ids);
    }

    /**
     * 统计
     * 查询分页统计方法
     * @param params
     * @return
     */
    public long count(Map<String,Object> params) {
        return sectionDao.count(params);
    }

    /**
     * 通过主键删除对象
     * 通过单一主键进行删除
     * @param long
     * @return
     */
    @Transactional(rollbackFor=Exception.class)
    public int deleteById(long section_id)throws Exception{
        return sectionDao.deleteById(section_id);
    }

    /**
     * 获取对象
     * 通过主键获取map
     * @param long
     * @return
     */
    public Map<String,Object> getMapById(long section_id){
        return sectionDao.getMapById(section_id);
    }

    /**
     * 插入
     * 添加方法备注
     * @param params
     * @return
     */
    public int insert(Map<String,Object> params) {
        return sectionDao.insert(params);
    }

    /**
     * 查询列表
     * 查询列表方法
     * @param params
     * @return
     */
    public List<Map<String,Object>> queryList(Map<String,Object> params){
        return sectionDao.queryList(params);
    }

    /**
     * 查询分页列表
     * 查询分页列表方法
     * @param params
     * @return
     */
    public List<Map<String,Object>> queryPageList(Map<String,Object> params){
        return sectionDao.queryPageList(params);
    }

    /**
     * 更新
     * 编辑方法备注
     * @param params
     * @return
     */
    @Transactional(rollbackFor=Exception.class)
    public int update(Map<String,Object> params)throws Exception{
        return sectionDao.update(params);
    }

}