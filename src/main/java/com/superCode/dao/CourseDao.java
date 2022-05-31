/**
 * 
 */
package com.superCode.dao;

import java.util.List;
import java.util.Map;

/**
 * <p>Title: CourseDAO层</p>
 * <p>Description: 增删改查操作接口</p>
 * 
 * 
 * <p>CreateDate:01-13 15:21:42</p>
 * 
 * 
 */
public interface CourseDao {

    /**
     * 通过主键集合批量删除
     * @param course_ids long[]
     * @return
     */
    public int batchDelete(long[] course_ids);

    /**
     * 统计
     * @param params Map<String,Object>
     * @return
     */
    public long count(Map<String, Object> params);

    /**
     * 通过主键删除
     * @param course_id int(11)
     * @return
     */
    public int deleteById(long course_id);

    /**
     * 通过主键编号获得map对象
     * @param course_id long
     * @return
     */
    public Map<String,Object> getMapById(long course_id);

    /**
     * 插入
     * @param params Map<String,Object>
     *  course_id [ int(11) ] 
     *  course_name [ varchar(255) ] 
     *  course_head [ varchar(2048) ] 
     * @return int
     */
    public int insert(Map<String, Object> params);

    /**
     * 查询列表
     * @param params Map<String,Object>
     * @return
     */
    public List<Map<String,Object>> queryList(Map<String, Object> params);

    /**
     * 获得分页列表
     * @param params Map<String,Object>
     *  *start long/int
     *  *limit long/int
     * @return
     */
    public List<Map<String,Object>> queryPageList(Map<String, Object> params);

    /**
     * 更新
     * @param params Map<String,Object>
     *  course_id [ int(11) ] 
     *  course_name [ varchar(255) ] 
     *  course_head [ varchar(2048) ] 
     * @return int
     */
    public int update(Map<String, Object> params);

}