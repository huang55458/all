package com.chumeng.springboot.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author chumeng
 * @date 2022/8/1 17:26
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class StatusCodeAndMessage<C>{
    private int code;
    private String msg;
    private C data;
}
