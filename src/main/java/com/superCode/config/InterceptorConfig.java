package com.superCode.config;

import com.superCode.interceptor.WebLoginInterceptor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


//拦截器

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
    /**
     * 通过@Bean注解，将我们定义的拦截器注册到Spring容器
     *
     * @return
     */
 /*   @Bean
    public HandlerInterceptor loginInterceptor(){
        return new WebLoginInterceptor();
    }
*/
    //注入项目的名称
    @Value("${server.servlet.context-path}")
    private String context_path;

    /**
     * 重写接口中的addInterceptors方法，添加自定义拦截器
     *
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        //System.out.println(context_path);


        //M do后辍
        //WEB action后辍


        //先将静态资源排除
        //后台访问拦截器
      /*  registry.addInterceptor(new AdminLoginInterceptor())
                .excludePathPatterns(
                        "/assets/**"
                        , "/upfiles/**"
                        , "/admin/login/login.action"
                        , "/admin/login/users/getById.action"
                )//排除的连接
                .addPathPatterns("/admin/**")//未登录所有连接不可以访问

        ;


        //前台访问拦截器  普通 用户
        registry.addInterceptor(new WebLoginInterceptor())
                .excludePathPatterns(
                        "/web/**"
                )//排除的连接
                .addPathPatterns(
                        "/web/cancel.action"
                        , "/web/prePwd.action"
                        , "/web/editpwd.action"
                        , "/web/editinfo.action"
                        , "/web/preInfo.action"
                )//未登录所有连接不可以访问

        ;*/

    }
}