package com.superCode;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


/*
@SpringBootApplication
@MapperScan( "com.superCode.mapper" )
*/


/**
 * 指定所扫的包，会自动扫描指定包下的全部标有@Component的类，并注册成bean，
 * 当然包括@Component下的子注解@Service,@Repository,@Controller。
 */
@SpringBootApplication
@MapperScan(basePackages = {"com.superCode.dao"})


public class platformApplication {

	public static void main(String[] args) {
		SpringApplication.run(platformApplication.class, args);
	}
//	//这里配置静态资源文件的路径导包都是默认的直接导入就可以
//	@Override
//	protected void addResourceHandlers(ResourceHandlerRegistry registry) {
//		registry.addResourceHandler("/static/**").addResourceLocations(ResourceUtils.CLASSPATH_URL_PREFIX + "/static/");
//		super.addResourceHandlers(registry);
//	}

}
