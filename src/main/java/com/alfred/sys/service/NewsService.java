package com.alfred.sys.service;

import com.alfred.sys.domain.News;
import com.alfred.sys.utils.DataGridView;
import com.alfred.sys.vo.NewsVo;

/**
 * 公告管理服务接口
 * @author Alfred
 * @date 2020/2/17 13:55
 */
public interface NewsService {

    /**
     * 查询所有公告
     * @param newsVo
     * @return
     */
    DataGridView queryAllNews(NewsVo newsVo);

    /**
     * 添加公告
     * @param newsVo
     */
    void addNews(NewsVo newsVo);
    /**
     * 修改公告
     * @param newsVo
     */
    void updateNews(NewsVo newsVo);

    /**
     * 根据id删除公告
     * @param newsid
     */
     void deleteNews(Integer newsid);

    /**
     * 批量删除公告
     * @param ids
     */
    void deleteBatchNews(Integer[] ids);

    /**
     *根据id查询公告
     * */
    News queryNewsById(Integer id);
}
