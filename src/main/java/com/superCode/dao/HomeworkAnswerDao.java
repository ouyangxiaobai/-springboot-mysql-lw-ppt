/**
 * 
 */
package com.superCode.dao;

import java.util.List;
import java.util.Map;

/**
 * <p>Title: HomeworkAnswerDAO层</p>
 * <p>Description: 增删改查操作接口</p>
 * 
 * 
 * <p>CreateDate:01-13 23:39:53</p>
 * 
 * 
 */
public interface HomeworkAnswerDao {

    /**
     * 通过主键集合批量删除
     * @param answer_ids long[]
     * @return
     */
    public int batchDelete(long[] answer_ids);

    /**
     * 统计
     * @param params Map<String,Object>
     * @return
     */
    public long count(Map<String, Object> params);

    /**
     * 通过主键删除
     * @param answer_id int(11)
     * @return
     */
    public int deleteById(long answer_id);

    /**
     * 通过主键编号获得map对象
     * @param answer_id long
     * @return
     */
    public Map<String,Object> getMapById(long answer_id);

    /**
     * 插入
     * @param params Map<String,Object>
     *  homework_id [ int(11) ] 
     *  user_id [ int(11) ] 
     *  answer_content [ varchar(2048) ] 
     *  answer_commit_datetime [ varchar(20) ] 作业作答提交时间
     *  homework_score [ varchar(20) ] 
     *  homework_remark [ varchar(2048) ] 评语
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
     *  homework_id [ int(11) ] 
     *  user_id [ int(11) ] 
     *  answer_content [ varchar(2048) ] 
     *  answer_commit_datetime [ varchar(20) ] 作业作答提交时间
     *  homework_score [ varchar(20) ] 
     *  homework_remark [ varchar(2048) ] 评语
     * @return int
     */
    public int update(Map<String, Object> params);

}