package com.chumeng.springboot.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * @author chumeng
 * @date 2022/8/1 16:22
 */
@Aspect
@Component
public class HttpAspect {
    private static final Logger LOG = LoggerFactory.getLogger(HttpAspect.class);

    @Pointcut("execution(public * com.chumeng.springboot.controller.UsesController.*(..))")
    public void log() {
    }

    @Before("log()")
    public void doBefore(JoinPoint joinPoint){
        LOG.info(" ---- before ----------  ");
        ServletRequestAttributes a = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = a.getRequest();

        LOG.info("url = {} ",request.getRequestURL());
        LOG.info("method = {} ",request.getMethod());
        LOG.info("ip = {} ",request.getRemoteAddr());
        LOG.info("class_method = {} ",joinPoint.getSignature().getDeclaringTypeName() + "." +joinPoint.getSignature().getName());
        LOG.info("args = {} ",joinPoint.getArgs());
        LOG.info(" -------- before end ------------ ");
    }

    @After("log()")
    public void doAfter(){
        LOG.warn(" ----- After ---------------");
    }

    @AfterReturning(returning = "object",pointcut = "log()")
    public void doAfterReturn(Object object) {
        LOG.warn(" ----- AfterReturning begin ---------------");
        LOG.info("response = {}",object.toString());
        LOG.warn(" ----- AfterReturning end ---------------");
    }

    @Around("log()")
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {
        LOG.warn(" ----- around begin ---------------");
        String classname = pjp.getTarget().getClass().getName();
        String method = pjp.getSignature().getName();
        System.out.println(classname + "." + method);

        Object object = pjp.proceed();
        LOG.warn(" ----- around end ---------------");
        return object;
    }

    @AfterThrowing(value = "log()",throwing = "e")
    public void doAfterThrowing(Exception e){
        LOG.warn(" ----- AfterThrowing begin ---------------");
        System.out.println(e.getStackTrace()[0].toString());
        LOG.warn(" ----- AfterThrowing end ---------------");
    }

}
