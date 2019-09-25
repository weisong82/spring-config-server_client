# 运行
含有两个springboots项目：

1. configuration-service  config server端， 先运行起来。
主要的配置在application.properties
增加依赖：
`		<dependency>
 			<groupId>org.springframework.cloud</groupId>
 			<artifactId>spring-cloud-config-server</artifactId>
 		</dependency>
`

2. configuration-client client端，启动后会去config server拉变量配置，
主要的配置在bootstrap.properties这里，
增加依赖：
`		<dependency>
 			<groupId>org.springframework.cloud</groupId>
 			<artifactId>spring-cloud-starter-config</artifactId>
 		</dependency>
`
3. DB初始化脚本，参考properties.sql

# server配置
 spring.cloud.config.server.git.uri 指定git配置的路径；
 spring.cloud.config.server.git.username password - git权限指定
 
  访问可以提取配置属性
 http://localhost:8888/jdbc/samplebackendservice/default
 
# client 配置
1. bootstrap.properties 指定application的名字，对应到git上读取的文件
2. bootstrap.properties 指定需要读取的配置server url


# run 不带profile启动:
 c.c.c.ConfigServicePropertySourceLocator : Located environment: name=samplebackendservice, profiles=[default], label=null, version=bb51f4173258ae3481c61b95b503c13862ccfba7, state=null

message 接口是读不到数据的
message2 可以读取到数据

# run 带profile参数启动：
 c.e.c.ConfigurationClientApplication     : The following profiles are active: development

配置有继承（default active的属性，总是可以被其他active的继承）-两个接口都可以获取到属性-
message
message2 

# doc 配置文件查找思路：-针对git 和文件系统
https://cloud.spring.io/spring-cloud-config/reference/html/#_quick_start

# 其他
JDBC Backend  --修改后sql是可以及时查询到变更的
Spring Cloud Config Server supports JDBC (relational database) as a backend for configuration properties. You can enable this feature by adding spring-jdbc to the classpath and using the jdbc profile or by adding a bean of type JdbcEnvironmentRepository. If you include the right dependencies on the classpath (see the user guide for more details on that), Spring Boot configures a data source.

The database needs to have a table called PROPERTIES with columns called APPLICATION, PROFILE, and LABEL (with the usual Environment meaning), plus KEY and VALUE for the key and value pairs in Properties style. All fields are of type String in Java, so you can make them VARCHAR of whatever length you need. Property values behave in the same way as they would if they came from Spring Boot properties files named {application}-{profile}.properties, including all the encryption and decryption, which will be applied as post-processing steps (that is, not in the repository implementation directly).

DB 属性对null是不太友好的 - 不给label通常也会取不到
http://localhost:8888/jdbc/samplebackendservice/default/master 

id  key    value       application         label profile

1	bar	db-value	samplebackendservice	master	default

# 配置的更新
 Config Server——使用Spring Cloud Bus自动刷新配置
 手动刷新：
  client 侧： post请求 http://localhost:8080/actuator/refresh  （DB侧直接刷，不需要server改造）
  server 侧： get请求 http://localhost:8888/actuator/refresh
  
# server配置获取：
 http://localhost:8888/samplebackendservice/default/master  （db场景下无需刷新，会读取最新值）  