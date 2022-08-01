package com.chumeng.springboot.filter;

import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * @author chumeng
 * @date 2022/7/30 9:27
 */
@WebFilter("/")
@Component
public class TestFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("filter ... ");
        filterChain.doFilter(servletRequest,servletResponse);
    }
}
