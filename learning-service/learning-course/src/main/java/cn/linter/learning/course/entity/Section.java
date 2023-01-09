package cn.linter.learning.course.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.time.LocalDateTime;
import java.util.List;

@Data
@ToString
@EqualsAndHashCode
public class Section {


    /**
     * 章节ID
     */
    private Long id;
    /**
     * 标题
     */
    private String title;

    /**
     * 排序
     */
    private String sort;

    /**
     * 课程ID
     */
    private Long courseId;
    /**
     * 创建时间
     */
    private LocalDateTime createTime;
    /**
     * 更新时间
     */
    private LocalDateTime updateTime;
    /**
     * 小节内容
     */
    private List<Chapter> chapters;

}
