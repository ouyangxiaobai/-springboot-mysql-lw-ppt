/**
 * 
 */
package com.superCode.dao;

import java.util.List;
import java.util.Map;

/**
 * <p>Title: QuestionDAO层</p>
 * <p>Description: 增删改查操作接口</p>
 * 
 * 
 * <p>CreateDate:01-11 11:31:05</p>
 * 
 * 
 */
public interface QuestionDao {

    /**
     * 通过主键集合批量删除
     * @param question_ids long[]
     * @return
     */
    public int batchDelete(long[] question_ids);

    /**
     * 统计
     * @param params Map<String,Object>
     * @return
     */
    public long count(Map<String, Object> params);

    /**
     * 通过主键删除
     * @param question_id int(11)
     * @return
     */
    public int deleteById(long question_id);

    /**
     * 通过主键编号获得map对象
     * @param question_id long
     * @return
     */
    public Map<String,Object> getMapById(long question_id);

    /**
     * 插入
     * @param params Map<String,Object>
     *  user_id [ int(11) ] 
     *  section_id [ int(11) ] 
     *  question_ask [ varchar(2048) ] 
     *  question_ask_datetime [ varchar(20) ] 
     *  question_answer [ varchar(2048) ] 
     *  question_answer_datetime [ varchar(20) ] 
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
     *  user_id [ int(11) ] 
     *  section_id [ int(11) ] 
     *  question_ask [ varchar(2048) ] 
     *  question_ask_datetime [ varchar(20) ] 
     *  question_answer [ varchar(2048) ] 
     *  question_answer_datetime [ varchar(20) ] 
     * @return int
     */
    public int update(Map<String, Object> params);

}