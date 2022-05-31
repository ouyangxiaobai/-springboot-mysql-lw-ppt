/**
 * 
 */
package com.superCode.dao;

import java.util.List;
import java.util.Map;

/**
 * <p>Title: HomeworkDAO层</p>
 * <p>Description: 增删改查操作接口</p>
 * 
 * 
 * <p>CreateDate:01-13 23:38:22</p>
 * 
 * 
 */
public interface HomeworkDao {

    /**
     * 通过主键集合批量删除
     * @param homework_ids long[]
     * @return
     */
    public int batchDelete(long[] homework_ids);

    /**
     * 统计
     * @param params Map<String,Object>
     * @return
     */
    public long count(Map<String, Object> params);

    /**
     * 通过主键删除
     * @param homework_id int(11)
     * @return
     */
    public int deleteById(long homework_id);

    /**
     * 通过主键编号获得map对象
     * @param homework_id long
     * @return
     */
    public Map<String,Object> getMapById(long homework_id);

    /**
     * 插入
     * @param params Map<String,Object>
     *  section_id [ int(11) ] 
     *  homework_publish_datetime [ varchar(20) ] 
     *  homework_title [ varchar(255) ] 
     *  homework_content [ varchar(2048) ] 
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
     * 查询个人作业列表（包含所有未提交和已提交的） 
     * @param params Map<String,Object>
     * @return
     */
    public List<Map<String,Object>> querySelfList(Map<String, Object> params);

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
     *  section_id [ int(11) ] 
     *  homework_publish_datetime [ varchar(20) ] 
     *  homework_title [ varchar(255) ] 
     *  homework_content [ varchar(2048) ] 
     * @return int
     */
    public int update(Map<String, Object> params);

}