package entity;



import java.io.Serializable;

/**
 * (Perms)实体类
 *
 * @author zhoupiyao
 * @since 2021-10-08 16:31:47
 */

public class Perms implements Serializable {
    private static final long serialVersionUID = -89133138611310758L;

    private Integer id;

    private Integer role_id;

    private String pre;
    /**
    * 权限说明
    */
    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRole_id() {
        return role_id;
    }

    public void setRole_id(Integer role_id) {
        this.role_id = role_id;
    }


    public String getPre() {
        return pre;
    }

    public void setPre(String pre) {
        this.pre = pre;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Perms{" +
                "id=" + id +
                ", role_id=" + role_id +
                ", per='" + pre + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
