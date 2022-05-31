/**
 * 
 */
package com.superCode.dao;

import java.util.List;
import java.util.Map;

/**
 * <p>Title: ExamResultDAO层</p>
 * <p>Description: 增删改查操作接口</p>
 * 
 * 
 * <p>CreateDate:01-16 12:07:11</p>
 * 
 * <p>Version:1.0</p>
 */
public interface ExamResultDao {

    /**
     * 通过主键集合批量删除
     * @param result_ids long[]
     * @return
     */
    public int batchDelete(long[] result_ids);

    /**
     * 统计
     * @param params Map<String,Object>
     * @return
     */
    public long count(Map<String, Object> params);

    /**
     * 通过主键删除
     * @param result_id int(11)
     * @return
     */
    public int deleteById(long result_id);

    /**
     * 通过主键编号获得map对象
     * @param result_id long
     * @return
     */
    public Map<String,Object> getMapById(long result_id);

    /**
     * 插入
     * @param params Map<String,Object>
     *  exam_id [ int(11) ] 
     *  user_id [ int(11) ] 
     *  result_content [ text ] 
     *  result_commit_datetime [ varchar(20) ] 
     *  result_score [ int(11) ] 
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
     *  exam_id [ int(11) ] 
     *  user_id [ int(11) ] 
     *  result_content [ text ] 
     *  result_commit_datetime [ varchar(20) ] 
     *  result_score [ int(11) ] 
     * @return int
     */
    public int update(Map<String, Object> params);

}