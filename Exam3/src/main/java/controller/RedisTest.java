package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author chumeng
 * @date 2022/10/8 16:35
 */
@Controller
public class RedisTest {
    private RedisTemplate<String,String> redisTemplate;

    @Autowired
    public void setRedisTemplate(RedisTemplate<String, String> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    @ResponseBody
    @GetMapping("redis.form")
    public String test(){
        ValueOperations<String, String> ops = redisTemplate.opsForValue();
        System.out.println(redisTemplate);
        ops.set("key","key");
        ops.set("exam","exam-------?");
        System.out.println(ops.get("key"));
        return ops.get("key");
    }
}
