package cn.linter.learning.course.service;

import cn.linter.learning.course.entity.Section;

import java.util.List;

/**
 * 章节服务接口
 *
 */
public interface SectionService {

    /**
     * 通过ID查询单个章节
     *
     * @param id 章节ID
     * @return 单个章节
     */
    Section queryById(Long id);

    /**
     * 查询所有章节
     *
     * @return 章节列表
     */
    List<Section> list();

    /**
     * 通过课程ID查询所有章节
     *
     * @param courseId 课程ID
     * @return 章节列表
     */
    List<Section> listByCourseId(Long courseId);

    /**
     * 通过课程ID查询所有章节信息
     *
     * @param courseId 课程ID
     * @return 章节列表
     */
    List<Section> listInfoByCourseId(Long courseId);

    /**
     * 新增章节
     *
     * @param section 章节实例
     * @return 章节实例
     */
    Section create(Section section);

    /**
     * 更新章节
     *
     * @param section 章节实例
     * @return 章节实例
     */
    Section update(Section section);

    /**
     * 删除章节
     *
     * @param id 章节ID
     * @return 是否成功
     */
    boolean delete(Long id);

}
