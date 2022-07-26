package entity;

import java.util.List;

public class PageInfo<T> {
    private List<T> list;     //用户列表
    private int totalCount;   //用户数
    private int size;         //每页显示用户数
    private int totalPage;    //总页数
    private int currentPage;  //当前页

    public int getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }
    public List<T> getList() {
        return list;
    }
    public void setList(List<T> list) {
        this.list = list;
    }
    public int getSize() {
        return size;
    }
    public void setSize(int size) {
        this.size = size;
    }
    public int getTotalPage() {
        return totalPage;
    }
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getCurrentPage() {
        return currentPage;
    }
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
    @Override
    public String toString() {
        return "PageInfo{" +
                "list=" + list +
                ", size=" + size +
                ", totalPage=" + totalPage +
                ", currentPage=" + currentPage +
                '}';
    }
}






