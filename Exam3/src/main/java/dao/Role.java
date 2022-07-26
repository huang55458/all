package entity;
/*
    角色类
 */
public class Role {
    private int id;
    private String role_name;
    private String descr;

    public Role() {
    }

    public Role(int id, String role_name, String descr) {
        this.id = id;
        this.role_name = role_name;
        this.descr = descr;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", role_name='" + role_name + '\'' +
                ", descr='" + descr + '\'' +
                '}';
    }
}
