package cn.linter.learning.course.service.impl;

import cn.linter.learning.course.dao.SectionDao;
import cn.linter.learning.course.entity.Section;
import cn.linter.learning.course.service.SectionService;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 章节服务实现类
 *
 */
@Service
public class SectionServiceImpl implements SectionService {

    private final SectionDao sectionDao;

    public SectionServiceImpl(SectionDao sectionDao) {
        this.sectionDao = sectionDao;
    }

    @Override
    public Section queryById(Long id) {
        return sectionDao.selectById(id);
    }

    @Override
    public List<Section> list() {
        return sectionDao.list();
    }

    @Override
    public List<Section> listByCourseId(Long courseId) {
        return sectionDao.listByCourseId(courseId);
    }

    @Override
    public List<Section> listInfoByCourseId(Long courseId) {
        return sectionDao.listInfoByCourseId(courseId);
    }

    @Override
    public Section create(Section section) {
        LocalDateTime now = LocalDateTime.now();
        section.setUpdateTime(now);
        section.setCreateTime(now);
        sectionDao.insert(section);
        return section;
    }

    @Override
    public Section update(Section section) {
        section.setUpdateTime(LocalDateTime.now());
        sectionDao.update(section);
        return sectionDao.selectById(section.getId());
    }

    @Override
    public boolean delete(Long id) {
        return sectionDao.delete(id) > 0;
    }


}