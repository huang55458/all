package entity;
/*
    用户角色中间表
 */

public class User_Role {
    private Integer id;
    private Integer user_id;
    private Integer role_id;

    public User_Role() {
    }

    public User_Role(Integer user_id, Integer role_id) {
        this.user_id = user_id;
        this.role_id = role_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getRole_id() {
        return role_id;
    }

    public void setRole_id(Integer role_id) {
        this.role_id = role_id;
    }

    @Override
    public String toString() {
        return "User_Role{" +
                "id=" + id +
                ", user_id=" + user_id +
                ", role_id=" + role_id +
                '}';
    }
}
