/**
 *
 */
package com.superCode.dao;

import java.util.List;
import java.util.Map;

/**
 * <p>Title: AdminDAO层</p>
 * <p>Description: 增删改查操作接口</p>
 *
 *
 * <p>CreateDate:12-09 16:05:29</p>
 *
 *
 */
public interface AdminDao {

    /**
     * 通过主键集合批量删除
     * @param admin_names String[]
     * @return
     */
    public int batchDelete(String[] admin_names);

    /**
     * 统计
     * @param params Map<String,Object>
     * @return
     */
    public long count(Map<String, Object> params);

    /**
     * 通过主键删除
     * @param admin_name varchar(20)
     * @return
     */
    public int deleteById(String admin_name);

    /**
     * 通过主键编号获得map对象
     * @param admin_name string
     * @return
     */
    public Map<String, Object> getMapById(String admin_name);

    /**
     * 插入
     * @param params Map<String,Object>
     *  admin_name [ varchar(20) ] 
     *  admin_password [ varchar(50) ] 
     *  admin_issystem [ int(11) ] 
     * @return int
     */
    public int insert(Map<String, Object> params);

    /**
     * 查询列表
     * @param params Map<String,Object>
     * @return
     */
    public List<Map<String, Object>> queryList(Map<String, Object> params);

    /**
     * 获得分页列表
     * @param params Map<String,Object>
     *  *start long/int
     *  *limit long/int
     * @return
     */
    public List<Map<String, Object>> queryPageList(Map<String, Object> params);

    /**
     * 更新
     * @param params Map<String,Object>
     *  admin_name [ varchar(20) ] 
     *  admin_password [ varchar(50) ] 
     *  admin_issystem [ int(11) ] 
     * @return int
     */
    public int update(Map<String, Object> params);

}