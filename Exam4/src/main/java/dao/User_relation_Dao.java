package dao;

import entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface User_relation_Dao {
    /**
    *好友列表
    * @param
    * @return
    * @date 2022/7/16 8:51
    */
    List<User> findAllMyFriend(@Param("userId") int userId);
    /**
    *添加好友申请
    * @param
    * @return
    * @date 2022/7/16 8:51
    */
    void addFriendApply(@Param("userId")int userId,@Param("friendId")int friendId);
    /**
    *同意好友申请
    * @param
    * @return
    * @date 2022/7/16 8:52
    */
    void agreeApply(@Param("applicant_id")int applicant_id,@Param("beiApp_id")int beiApp_id);
    /**
    *拒绝好友申请
    * @param
    * @return
    * @date 2022/7/16 8:52
    */
    void refuseApply(@Param("applicant_id")int applicant_id,@Param("beiApp_id")int beiApp_id);
    /**
    *删除好友
    * @param
    * @return
    * @date 2022/7/16 8:52
    */
    void deleteFriend(@Param("applicant_id")int applicant_id,@Param("beiApp_id")int beiApp_id);
    /**
    *拉黑好友
    * @param
    * @return
    * @date 2022/7/16 8:53
    */
    void banFriend(@Param("userId")int userId,@Param("friendId")int friendId);

    /**
    *判断对方被我拉黑
    * @param
    * @return
    * @date 2022/7/21 15:47
    */
    List<Integer> selectBan(@Param("userId")int userId);

    /**
     *判断我被拉黑
     * @param
     * @return
     * @date 2022/7/21 15:47
     */
    List<Integer> selectBaned(@Param("friendId")int friendId);

    /**
     *判断已发送申请
     * @param
     * @return
     * @date 2022/7/21 15:47
     */
    List<Integer> selecttwo(@Param("userId")int userId);
    /**
    *返回给我发消息的好友
    * @param
    * @return
    * @date 2022/7/21 17:53
    */
    List<User> selectMessage(@Param("userId")int userId);

    /**
    *查看黑名单
    * @param
    * @return
    * @date 2022/7/23 20:24
    */
    List<User> allMyBan(@Param("userId")int userId);

    /**
    *取消拉黑
    * @param
    * @return
    * @date 2022/7/23 20:52
    */
    void cancelBan(@Param("applicant_id")int applicant_id,@Param("beiApp_id")int beiApp_id);


    /**
    *用户关闭浏览器
    * @param
    * @return
    * @date 2022/7/23 22:12
    */
    void logout(@Param("userId")int userId);
}
