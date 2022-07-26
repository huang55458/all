package entity;

public class user_relation {
    private int id;
    private int applicant_id;
    private int beiApp_id;
    private int relation_status;//0表示拉黑，1表示好友，2表示正在申请

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getApplicant_id() {
        return applicant_id;
    }

    public void setApplicant_id(int applicant_id) {
        this.applicant_id = applicant_id;
    }

    public int getBeiApp_id() {
        return beiApp_id;
    }

    public void setBeiApp_id(int beiApp_id) {
        this.beiApp_id = beiApp_id;
    }

    public int getRelation_status() {
        return relation_status;
    }

    public void setRelation_status(int relation_status) {
        this.relation_status = relation_status;
    }
}
