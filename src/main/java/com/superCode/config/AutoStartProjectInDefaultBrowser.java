package com.superCode.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringBootConfiguration;

/**
 * springboot项目启动之后自动启动默认浏览器
 * SpringBoot有自带的监听任务,只需实现对应的接口,调用cmd启动浏览器即可
 *
 * @author Levi
 */
@SpringBootConfiguration
public class AutoStartProjectInDefaultBrowser implements CommandLineRunner {
    //注入项目的端口号
    @Value("${server.port}")
    private String port;

    //注入项目的名称
    @Value("${server.servlet.context-path}")
    private String context_path;

    /**
     * springboot自带的监听任务
     *
     * @param args
     * @throws Exception
     */
    @Override
    public void run(String... args) throws Exception {
        try {
            Runtime.getRuntime().exec("cmd /c start http://localhost:" + port +  context_path);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}