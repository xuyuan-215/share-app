package com.soft1851.contentcenter.domain.dto;

import com.soft1851.contentcenter.domain.enums.AuditStatusEnum;
import lombok.Data;

/**
 * @author tengf
 * @Description:
 * @date: 2020/9/29 19:01
 */
@Data
public class ShareAuditDTO {
    /**
     * 审核状态
     */
    private AuditStatusEnum auditStatusEnum;
    /**
     * 原因
     */
    private String reason;
}
