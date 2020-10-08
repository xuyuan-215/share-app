package com.soft1851.contentcenter.domain.dto;

import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author tengf
 * @Description:
 * @date: 2020/10/7 9:38
 */
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
@ApiModel("投稿")
public class ShareContributeDto {
    private Integer userId;

    private String title;

    private Boolean isOriginal;

    private String author;

    private String cover;

    private String summary;

    private Integer price;

    private String downloadUrl;
}
