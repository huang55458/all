package entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * @author chumeng
 * @date 2022/7/19 9:48
 */
public class ExamHistory {
    private int id;
    private String username;
    private int userid;
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date time;
    private int score;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "ExamHistory{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", userid=" + userid +
                ", date=" + time +
                ", score=" + score +
                '}';
    }
}
