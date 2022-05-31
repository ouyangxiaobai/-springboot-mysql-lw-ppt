/**
 * 
 */
package com.superCode.dao;

import java.util.List;
import java.util.Map;

/**
 * <p>Title: SectionDAO层</p>
 * <p>Description: 增删改查操作接口</p>
 * 
 * 
 * <p>CreateDate:01-13 15:22:13</p>
 * 
 * 
 */
public interface SectionDao {

    /**
     * 通过主键集合批量删除
     * @param section_ids long[]
     * @return
     */
    public int batchDelete(long[] section_ids);

    /**
     * 统计
     * @param params Map<String,Object>
     * @return
     */
    public long count(Map<String, Object> params);

    /**
     * 通过主键删除
     * @param section_id int(11)
     * @return
     */
    public int deleteById(long section_id);

    /**
     * 通过主键编号获得map对象
     * @param section_id long
     * @return
     */
    public Map<String,Object> getMapById(long section_id);

    /**
     * 插入
     * @param params Map<String,Object>
     *  course_id [ int(11) ] 
     *  chapter_id [ int(11) ] 
     *  section_name [ varchar(255) ] 
     *  section_info [ varchar(2048) ] 
     *  section_video_path [ varchar(2048) ] 
     *  section_files [ text ] 
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
     *  chapter_id [ int(11) ] 
     *  section_name [ varchar(255) ] 
     *  section_info [ varchar(2048) ] 
     *  section_video_path [ varchar(2048) ] 
     *  section_files [ text ] 
     * @return int
     */
    public int update(Map<String, Object> params);

}