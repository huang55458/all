package com.chumeng.springboot.entity;

import lombok.*;
import org.hibernate.Hibernate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

/**
 * @author chumeng
 * @date 2022/7/29 10:44
 */
@Getter
@Setter
@ToString
@AllArgsConstructor
@RequiredArgsConstructor
@Entity
public class Uses {
    @Id
    @GeneratedValue
    private int id;
    private String name;

    @NotNull(message = "age is null")
    @Min(value = 18,message = "未成年禁止注册")
    private int age;

    public Uses(String name, int age) {
        this.name = name;
        this.age = age;
    }

    //    private double money;

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) {
            return false;
        }
        Uses uses = (Uses) o;
        return false;
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}
