package entity;
/*
    角色-权限中间表
 */
public class Role_Permission {
    private Integer role_id;  //角色ID
    private Integer per_id;   //权限ID

    public Role_Permission() {
    }

    public Role_Permission(Integer role_id, Integer per_id) {
        this.role_id = role_id;
        this.per_id = per_id;
    }

    public Integer getRole_id() {
        return role_id;
    }

    public void setRole_id(Integer role_id) {
        this.role_id = role_id;
    }

    public Integer getPer_id() {
        return per_id;
    }

    public void setPer_id(Integer per_id) {
        this.per_id = per_id;
    }

    @Override
    public String toString() {
        return "Role_Permission{" +
                "role_id=" + role_id +
                ", per_id=" + per_id +
                '}';
    }
}
