package tw.FunBar.config;

import java.util.ArrayList;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.http.MediaType;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Configuration
@EnableWebMvc
@ComponentScan("tw.FunBar")
public class WebAppConfig extends WebMvcConfigurerAdapter {
	@Bean
	public ViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/views/css/");
		
		registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/views/images/");
		
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/views/js/");
		
		registry.addResourceHandler("/fonts/**").addResourceLocations("/WEB-INF/views/fonts/");
		
		registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/views/images/");
		
		registry.addResourceHandler("/ProductImages/**").addResourceLocations("/WEB-INF/views/ProductImages/");
		
		registry.addResourceHandler("/includes/**").addResourceLocations("/WEB-INF/views/includes/");
		
		registry.addResourceHandler("/vendor/**").addResourceLocations("/WEB-INF/views/vendor/");
		
		registry.addResourceHandler("/ad_vendor/**").addResourceLocations("/WEB-INF/views/ad_vendor/");
		
		registry.addResourceHandler("/ad_css/**").addResourceLocations("/WEB-INF/views/ad_css/");
		
		registry.addResourceHandler("/ad_js/**").addResourceLocations("/WEB-INF/views/ad_js/");
		
		registry.addResourceHandler("/ad_scss/**").addResourceLocations("/WEB-INF/views/ad_scss/");
		
		registry.addResourceHandler("/imgUpload/**").addResourceLocations("file:C:\\FunBar\\imgUpload\\");
	
		registry.addResourceHandler("/activityimages/**").addResourceLocations("/WEB-INF/views/activityimages/");
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(81920000);
		return resolver;
	}
	
	@Bean
	public MappingJackson2JsonView jsonView() {
		MappingJackson2JsonView view = new MappingJackson2JsonView();
		view.setPrettyPrint(true);
		return view;
	}
	
	@Bean
	public ViewResolver contentNegotiatingViewResolver(ContentNegotiationManager manager) {
	    ContentNegotiatingViewResolver resolver = new ContentNegotiatingViewResolver();
	    resolver.setContentNegotiationManager(manager);
	    ArrayList<View> views = new ArrayList<>();
	    views.add(jsonView());
	    resolver.setDefaultViews(views);
	   
	    return resolver;
	}
	
	@Override
	public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
		configurer.defaultContentType(MediaType.APPLICATION_JSON);
	}
}
