package cn.linter.learning.course.controller;

import cn.linter.learning.common.entity.Result;
import cn.linter.learning.common.entity.ResultStatus;
import cn.linter.learning.common.utils.JwtUtil;
import cn.linter.learning.course.entity.Chapter;
import cn.linter.learning.course.entity.Course;
import cn.linter.learning.course.entity.Section;
import cn.linter.learning.course.service.ChapterService;
import cn.linter.learning.course.service.SectionService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 *
 *章节控制器
 */
@RestController
@RequestMapping("sections")
public class SectionController {

    private final SectionService sectionService;
    private final ChapterService chapterService;

    public SectionController(SectionService sectionService,ChapterService chapterService) {
        this.sectionService = sectionService;
        this.chapterService = chapterService;
    }

    @GetMapping("{id}")
    public Result<Section> queryChapter(@PathVariable("id") Long id) {
        return Result.of(ResultStatus.SUCCESS, sectionService.queryById(id));
    }

    @GetMapping
    public Result<List<Section>> listChapter() {
        return Result.of(ResultStatus.SUCCESS, sectionService.list());
    }

    @PostMapping
    public Result<Section> createChapter(@RequestBody Section section) {
        return Result.of(ResultStatus.SUCCESS, sectionService.create(section));
    }

    @PutMapping
    public Result<Section> updateChapter(@RequestBody Section section) {
        return Result.of(ResultStatus.SUCCESS, sectionService.update(section));
    }


    @GetMapping("{id}/chapters")
    public Result<List<Chapter>> listChaptersOfSection(@PathVariable("id") Long id) {
        List<Chapter> chapters = chapterService.listBySectionId(id);
        return Result.of(ResultStatus.SUCCESS, chapters);
    }

    @DeleteMapping("{id}")
    public ResultStatus deleteChapter(@PathVariable("id") Long id) {
        sectionService.delete(id);
        return ResultStatus.SUCCESS;
    }
}
