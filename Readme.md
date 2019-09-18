# server配置
 spring.cloud.config.server.git.uri 指定git
 spring.cloud.config.server.git.username password - git权限指定
 
# client 配置
1. bootstrap.properties 指定application
2. bootstrap.properties 指定需要读取的配置server url

# run 带profile参数启动：
 c.e.c.ConfigurationClientApplication     : The following profiles are active: development

两个接口都可以获取到属性-配置有继承
message
message2 

# run 不带profile启动:
 c.c.c.ConfigServicePropertySourceLocator : Located environment: name=samplebackendservice, profiles=[default], label=null, version=bb51f4173258ae3481c61b95b503c13862ccfba7, state=null

message 接口是读不到数据的
message2 可以读取到数据
# doc 配置文件查找思路：

https://cloud.spring.io/spring-cloud-config/reference/html/#_quick_start

The default strategy for locating property sources is to clone a git repository (at spring.cloud.config.server.git.uri) and use it to initialize a mini SpringApplication. The mini-application’s Environment is used to enumerate property sources and publish them at a JSON endpoint.

The HTTP service has resources in the following form:

/{application}/{profile}[/{label}]
/{application}-{profile}.yml
/{label}/{application}-{profile}.yml
/{application}-{profile}.properties
/{label}/{application}-{profile}.properties

