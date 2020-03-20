package indi.huahua.mp.config;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author :huayanjun
 * @date :2020/3/15 20:53
 */
@Configuration
@MapperScan("indi.huahua.mp.mapper")
public class MybatisPlusConfig {
    /**
     * 分页插件
     * @return 分页拦截器
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }

}
