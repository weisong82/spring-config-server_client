# server配置
 spring.cloud.config.server.git.uri 指定git配置的路径；
 spring.cloud.config.server.git.username password - git权限指定
 
# client 配置
1. bootstrap.properties 指定application的名字，对应到git上读取的文件
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

where application is injected as the spring.config.name in the SpringApplication (what is normally application in a regular Spring Boot app),

profile is an active profile (or comma-separated list of properties), 

and label is an optional git label (defaults to master.)

The default strategy for locating property sources is to clone a git repository (at spring.cloud.config.server.git.uri) and use it to initialize a mini SpringApplication. The mini-application’s Environment is used to enumerate property sources and publish them at a JSON endpoint.

The HTTP service has resources in the following form:

/{application}/{profile}[/{label}]

/{application}-{profile}.yml

/{label}/{application}-{profile}.yml

/{application}-{profile}.properties

/{label}/{application}-{profile}.properties

# 其他
JDBC Backend
Spring Cloud Config Server supports JDBC (relational database) as a backend for configuration properties. You can enable this feature by adding spring-jdbc to the classpath and using the jdbc profile or by adding a bean of type JdbcEnvironmentRepository. If you include the right dependencies on the classpath (see the user guide for more details on that), Spring Boot configures a data source.

The database needs to have a table called PROPERTIES with columns called APPLICATION, PROFILE, and LABEL (with the usual Environment meaning), plus KEY and VALUE for the key and value pairs in Properties style. All fields are of type String in Java, so you can make them VARCHAR of whatever length you need. Property values behave in the same way as they would if they came from Spring Boot properties files named {application}-{profile}.properties, including all the encryption and decryption, which will be applied as post-processing steps (that is, not in the repository implementation directly).
