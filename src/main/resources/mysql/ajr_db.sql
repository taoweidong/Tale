/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50162
Source Host           : localhost:3306
Source Database       : ajr_db

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2019-03-17 20:37:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_attach
-- ----------------------------
DROP TABLE IF EXISTS `t_attach`;
CREATE TABLE `t_attach` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL DEFAULT '',
  `ftype` varchar(50) DEFAULT '',
  `fkey` varchar(100) NOT NULL DEFAULT '',
  `author_id` int(10) DEFAULT NULL,
  `created` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_attach
-- ----------------------------
INSERT INTO `t_attach` VALUES ('3', 'I01031516.jpg', 'image', '/upload/2019/03/voj5r021eghfpo250om3olbbrl.jpg', '1', '1552147552');
INSERT INTO `t_attach` VALUES ('5', '3cb6b907ab71e54459b042aad082b76c.jpg', 'image', 'http://pod0uhivg.bkt.clouddn.com/3cb6b907ab71e54459b042aad082b76c.jpg?FoQrpYvNvJYnhbhtSmudMiyljDzL', '1', '1552576484');

-- ----------------------------
-- Table structure for t_comments
-- ----------------------------
DROP TABLE IF EXISTS `t_comments`;
CREATE TABLE `t_comments` (
  `coid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned DEFAULT '0',
  `created` int(10) unsigned DEFAULT '0',
  `author` varchar(200) DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT '0',
  `owner_id` int(10) unsigned DEFAULT '0',
  `mail` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `agent` varchar(200) DEFAULT NULL,
  `content` text,
  `type` varchar(16) DEFAULT 'comment',
  `status` varchar(16) DEFAULT 'approved',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`coid`),
  KEY `cid` (`cid`),
  KEY `created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comments
-- ----------------------------
INSERT INTO `t_comments` VALUES ('1', '1', '1551969094', '测试', '0', '1', '34535345@qq.com', 'http://www.baidu.com', '127.0.0.1', null, '测试一下喽', 'comment', 'approved', '0');
INSERT INTO `t_comments` VALUES ('2', '5', '1552145898', '34535', '0', '1', '34535@qq.com', '', '127.0.0.1', null, '345355', 'comment', 'approved', '0');
INSERT INTO `t_comments` VALUES ('3', '4', '1552146857', '34535', '0', '1', '34535@qq.com', '', '127.0.0.1', null, '54646546', 'comment', 'approved', '0');

-- ----------------------------
-- Table structure for t_contents
-- ----------------------------
DROP TABLE IF EXISTS `t_contents`;
CREATE TABLE `t_contents` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `created` int(10) unsigned DEFAULT '0',
  `modified` int(10) unsigned DEFAULT '0',
  `content` text COMMENT '内容文字',
  `author_id` int(10) unsigned DEFAULT '0',
  `type` varchar(16) DEFAULT 'post',
  `status` varchar(16) DEFAULT 'publish',
  `tags` varchar(200) DEFAULT NULL,
  `categories` varchar(200) DEFAULT NULL,
  `hits` int(10) unsigned DEFAULT '0',
  `comments_num` int(10) unsigned DEFAULT '0',
  `allow_comment` tinyint(1) DEFAULT '1',
  `allow_ping` tinyint(1) DEFAULT '1',
  `allow_feed` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `slug` (`slug`),
  KEY `created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_contents
-- ----------------------------
INSERT INTO `t_contents` VALUES ('1', 'about my blog', 'about', '1487853610', '1552137232', '### Hello World\r\n\r\ntest\r\n# asdjsakld\r\n## asdhakjd \r\n### ashdakjd \r\n\r\n### ...\r\n\r\n...', '1', 'page', 'publish', null, null, '13', '1', '1', '1', '1');
INSERT INTO `t_contents` VALUES ('2', 'Hello My Blog', null, '1487861184', '1487872798', '## Hello  World.\r\n\r\n> ...\r\n\r\n----------\r\n\r\n\r\n<!--more-->\r\n\r\n```java\r\npublic static void main(String[] args){\r\n    System.out.println(\"Hello 13 Blog.\");\r\n}\r\n```', '1', 'post', 'publish', '', 'default', '34', '0', '1', '1', '1');
INSERT INTO `t_contents` VALUES ('3', '测试一下', 'test001', '1526138269', '1552148029', '# SpringCloud微服务学习笔记\r\n\r\n项目地址： [https://github.com/taoweidong/Micro-service-learning](https://github.com/taoweidong/Micro-service-learning)\r\n\r\n## 单体架构(Monolithic架构)\r\n\r\n![da3c1cfa82374878969ce0baa9ece8b4.png](en-resource://database/2068:2)\r\n\r\n\r\n**Monolithic比较适合小项目**\r\n\r\n### 单体架构优点：\r\n\r\n- 开发简单直接，集中式管理,     基本不会重复开发功能都在本地，没有分布式的管理开销和调用开销。 \r\n\r\n### 单体架构缺点：\r\n\r\n- 开发效率低：所有的开发在一个项目改代码，递交代码相互等待，代码冲突不断\r\n- 代码维护难：代码功能耦合在一起，新人不知道何从下手44\r\n- 部署不灵活：构建时间长，任何小修改必须重新构建整个项目，这个过程往往很长\r\n- 稳定性不高：一个微不足道的小问题，可以导致整个应用挂掉\r\n- 扩展性不够：无法满足高并发情况下的业务需求\r\n\r\n## 微服务架构 \r\n\r\n​       微服务是指开发一个单个小型的但有业务功能的服务，每个服务都有自己的处理和轻量通讯机制，可以部署在单个或多个服务器上。微服务也指一种种松耦合的、有一定的有界上下文的面向服务架构。也就是说，如果每个服务都要同时修改，那么它们就不是微服务，因为它们紧耦合在一起；如果你需要掌握一个服务太多的上下文场景使用条件，那么它就是一个有上下文边界的服务，这个定义来自DDD领域驱动设计。\r\n\r\n​       微服务架构模式（MicroservicesArchitecture Pattern）的目的是将大型的、复杂的、长期运行的应用程序构建为一组相互配合的服务，每个服务都可以很容易得局部改良。Micro这个词意味着每个服务都应该足够小，但是，这里的小不能用代码量来比较，而应该是从业务逻辑上比较——符合SRP原则的才叫微服务。\r\n\r\n![da3c1cfa82374878969ce0baa9ece8b4.png](en-resource://database/2068:2)\r\n\r\n\r\n相对于单体架构和SOA，它的主要特点是组件化、松耦合、自治、去中心化，体现在以下几个方面：\r\n\r\n- 一组小的服务 \r\n        服务粒度要小，而每个服务是针对一个单一职责的业务能力的封装，专注做好一件事情。\r\n- 独立部署运行和扩展 \r\n            每个服务能够独立被部署并运行在一个进程内。这种运行和部署方式能够赋予系统灵活的代码组织方式和发布节奏，使得快速交付和应对变化成为可能。\r\n- 独立开发和演化 \r\n       技术选型灵活，不受遗留系统技术约束。合适的业务问题选择合适的技术可以独立演化。服务与服务之间采取与语言无关的API进行集成。相对单体架构，微服务架构是更面向业务创新的一种架构模式。\r\n- 独立团队和自治 \r\n            团队对服务的整个生命周期负责，工作在独立的上下文中，自己决策自己治理，而不需要统一的指挥中心。团队和团队之间通过松散的社区部落进行衔接。\r\n\r\n​       我们可以看到整个微服务的思想就如我们现在面对信息爆炸、知识爆炸是一样的：通过解耦我们所做的事情，分而治之以减少不必要的损耗，使得整个复杂的系统和组织能够快速的应对变化。\r\n\r\n \r\n\r\n### 微服务优点\r\n\r\n- 每个微服务都很小，这样能聚焦一个指定的业务功能或业务需求。 \r\n- 微服务能够被小团队单独开发，这个小团队是2到5人的开发人员组成。     \r\n- 微服务是松耦合的，是有功能意义的服务，无论是在开发阶段或部署阶段都是独立的。     \r\n- 微服务能使用不同的语言开发。 \r\n- 微服务允许容易且灵活的方式集成自动部署，通过持续集成工具，如Jenkins,     bamboo 。 \r\n- 一个团队的新成员能够更快投入生产。 \r\n- 微服务易于被一个开发人员理解，修改和维护，这样小团队能够更关注自己的工作成果。无需通过合作才能体现价值。     \r\n- 微服务允许你利用融合最新技术。 \r\n- 微服务只是业务逻辑的代码，不会和HTML,CSS     或其他界面组件混合。 \r\n- 微服务能够即时被要求扩展。 \r\n- 微服务能部署中低端配置的服务器上。 \r\n- 易于和第三方集成。 \r\n- 每个微服务都有自己的存储能力，可以有自己的数据库。也可以有统一数据库。     \r\n\r\n### 微服务架构的缺点\r\n\r\n- 微服务架构可能带来过多的操作。 \r\n- 需要DevOps技巧 (<http://en.wikipedia.org/wiki/DevOps>). \r\n- 可能双倍的努力。 \r\n- 分布式系统可能复杂难以管理。 \r\n- 因为分布部署跟踪问题难。 \r\n- 当服务数量增加，管理复杂性增加。 \r\n\r\n### CAP定理\r\n分布式系统的最大难点，就是各个节点的状态如何同步。CAP 定理是这方面的基本定理，也是理解分布式系统的起点。\r\n\r\n***分布式系统的三个指标***\r\n\r\n![48fd29a0646c889ce18a1e60e6cd1592.png](en-resource://database/2058:1)\r\n\r\n1998年，加州大学的计算机科学家 Eric Brewer 提出，分布式系统有三个指标。\r\n* Consistency ：         一致性，写操作之后的读操作，必须返回该值\r\n* Availability ：          可用性，只要收到用户的请求，服务器就必须给出回应\r\n* Partition tolerance ：分区容错，区间通信可能失败\r\n\r\n它们的第一个字母分别是 C、A、P。Eric Brewer 说，这三个指标不可能同时做到。这个结论就叫做 CAP 定理。\r\n\r\n参考：[http://www.ruanyifeng.com/blog/2018/07/cap.html](http://www.ruanyifeng.com/blog/2018/07/cap.html)\r\n\r\n\r\n## 技术介绍\r\n\r\n### 服务注册中心：Eureka\r\n\r\n> Eureka是Spring Cloud Netflix微服务套件中的一部分，可以与Springboot构建的微服务很容易的整合起来。\r\n>\r\n> > Eureka包含了服务器端和客户端组件。\r\n> >\r\n> > 服务器端，也被称作是服务注册中心，用于提供服务的注册与发现。Eureka支持高可用的配置，当集群中有分片出现故障时，Eureka就会转入自动保护模式，它允许分片故障期间继续提供服务的发现和注册，当故障分片恢复正常时，集群中其他分片会把他们的状态再次同步回来。\r\n> >\r\n> > 客户端组件包含服务消费者与服务生产者。在应用程序运行时，Eureka客户端向注册中心注册自身提供的服务并周期性的发送心跳来更新它的服务租约。同时也可以从服务端查询当前注册的服务信息并把他们缓存到本地并周期性的刷新服务状态。\r\n\r\n![1. 服务注册于发现.png](https://upload-images.jianshu.io/upload_images/3269064-d827649210f22655.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n参考：\r\n[https://www.cnblogs.com/demodashi/p/8509931.html](https://www.cnblogs.com/demodashi/p/8509931.html)\r\n[https://www.cnblogs.com/snowjeblog/p/8821325.html](https://www.cnblogs.com/snowjeblog/p/8821325.html)\r\n\r\n\r\n### 声明式客户端访问：Fegin\r\n\r\n​	Feign是一个声明式的伪Http客户端，它使得写Http客户端变得更简单。使用Feign，只需要创建一个接口并用注解的方式来配置它，即可完成对服务提供方的接口绑定，简化了在使用Ribbon时自行封装服务调用客户端的开发量。\r\n\r\n​	Feign具有可插拔的注解特性，包括Feign 注解和JAX-RS注解，同时也扩展了对SpringMVC的注解支持。Feign支持可插拔的编码器和解码器，默认集成了Ribbon，并和Eureka结合，默认实现了负载均衡的效果。\r\n\r\n主要功能：简化服务消费者调用服务提供者接口\r\n\r\n\r\n\r\n参考：[https://www.cnblogs.com/senlinyang/p/8595489.html](https://www.cnblogs.com/senlinyang/p/8595489.html)\r\n\r\n\r\n\r\n### 客户端负载均衡：Ribbon\r\n\r\n​	Ribbon是Netflix发布的负载均衡器，它有助于控制HTTP和TCP的客户端的行为。为Ribbon配置服务提供者地址后，Ribbon就可基于某种负载均衡算法，自动地帮助服务消费者去请求。Ribbon默认为我们提供了很多负载均衡算法，例如轮询、随机等。当然，我们也可为Ribbon实现自定义的负载均衡算法。\r\n\r\n​	在Spring Cloud中，当Ribbon与Eureka配合使用时，Ribbon可自动从Eureka Server获取服务提供者地址列表，并基于负载均衡算法，请求其中一个服务提供者实例。展示了Ribbon与Eureka配合使用时的架构。\r\n\r\n![826b9d89d1ad9c7cd665c8d80eb1be2f.png](en-resource://database/2037:1)\r\n\r\n\r\n参考：[https://blog.csdn.net/chengqiuming/article/details/80711168](https://blog.csdn.net/chengqiuming/article/details/80711168)\r\n\r\n### 服务断路器：Hystrix\r\n\r\n所谓的熔断机制和日常生活中见到电路保险丝是非常相似的，当出现了问题之后，保险丝会自动烧断，以保护我们的电器， 那么如果换到了程序之中呢？\r\n\r\n当现在服务的提供方出现了问题之后整个的程序将出现错误的信息显示，而这个时候如果不想出现这样的错误信息，而希望替换为一个错误时的内容。\r\n\r\n![f178da41da0e2433bb27c5626564080e.png](en-resource://database/2066:1)\r\n\r\n**一个服务挂了后续的服务跟着不能用了，这就是雪崩效应**\r\n\r\n 对于熔断技术的实现需要考虑以下几种情况：\r\n\r\n- 出现错误之后可以 fallback 错误的处理信息；\r\n\r\n-  如果要结合 Feign 一起使用的时候还需要在 Feign（客户端）进行熔断的配置。\r\n\r\n**Hystrix如何解决依赖隔离**\r\n\r\n- Hystrix使用命令模式HystrixCommand(Command)包装依赖调用逻辑，每个命令在单独线程中/信号授权下执行。\r\n- 可配置依赖调用超时时间,超时时间一般设为比99.5%平均时间略高即可.当调用超时时，直接返回或执行fallback逻辑。\r\n- 为每个依赖提供一个小的线程池（或信号），如果线程池已满调用将被立即拒绝，默认不采用排队.加速失败判定时间。\r\n- 依赖调用结果分:成功，失败（抛出异常），超时，线程拒绝，短路。 请求失败(异常，拒绝，超时，短路)时执行fallback(降级)逻辑。\r\n- 提供熔断器组件,可以自动运行或手动调用,停止当前依赖一段时间(10秒)，熔断器默认错误率阈值为50%,超过将自动运行。\r\n- 提供近实时依赖的统计和监控\r\n\r\nHystrix依赖的隔离架构,如下图:\r\n\r\n![img](http://dl2.iteye.com/upload/attachment/0103/1043/8db93de3-db14-355f-ac70-16d06481b020.png)\r\n\r\n参考：\r\n[https://www.cnblogs.com/leeSmall/p/8847652.html](https://www.cnblogs.com/leeSmall/p/8847652.html)\r\n[https://www.cnblogs.com/yepei/p/7169127.html](https://www.cnblogs.com/yepei/p/7169127.html)\r\n\r\n\r\n\r\n### 断路器聚合监控：Hystrix Turbine\r\n\r\n​	看单个的Hystrix Dashboard的数据并没有什么多大的价值，要想看这个系统的Hystrix Dashboard数据就需要用到Hystrix Turbine。Hystrix Turbine将每个服务Hystrix Dashboard数据进行了整合。Hystrix Turbine的使用非常简单，只需要引入相应的依赖和加上注解和配置就可以了。\r\n\r\n![0b407ed2113797a8d6aa7805cc0cb9c7.png](en-resource://database/2070:1)\r\n\r\n![cd8d387c30153b6ec1b9f30cdf9acd7c.png](en-resource://database/2072:1)\r\n\r\n\r\n\r\n\r\n参考：\r\n[https://www.cnblogs.com/allalongx/p/8383757.html](https://www.cnblogs.com/allalongx/p/8383757.html)\r\n\r\n\r\n\r\n### 微服务网关：Zuul\r\n\r\nzuul 是netflix开源的一个API Gateway 服务器, 本质上是一个web servlet应用。\r\n\r\nZuul 在云平台上提供动态路由，监控，弹性，安全等边缘服务的框架。Zuul 相当于是设备和 Netflix 流应用的 Web 网站后端所有请求的前门。\r\n\r\n**zuul的工作原理**\r\n\r\nzuul的核心是一系列的**filters**, 其作用可以类比Servlet框架的Filter，或者AOP。\r\n\r\nzuul把Request route到 用户处理逻辑 的过程中，这些filter参与一些过滤处理，比如Authentication，Load Shedding等。 \r\n\r\n![06b983e45d45493ba85a05ad9a34476b.png](en-resource://database/2074:1)\r\n\r\n\r\n**Zuul提供了一个框架，可以对过滤器进行动态的加载，编译，运行。**\r\n\r\nZuul的过滤器之间没有直接的相互通信，他们之间通过一个RequestContext的静态类来进行数据传递的。RequestContext类中有ThreadLocal变量来记录每个Request所需要传递的数据。\r\n\r\nZuul的过滤器是由Groovy写成，这些过滤器文件被放在Zuul Server上的特定目录下面，Zuul会定期轮询这些目录，修改过的过滤器会动态的加载到Zuul Server中以便过滤请求使用。\r\n\r\n下面有几种标准的过滤器类型：\r\n\r\nZuul大部分功能都是通过过滤器来实现的。Zuul中定义了四种标准过滤器类型，这些过滤器类型对应于请求的典型生命周期。\r\n\r\n(1) PRE：这种过滤器在请求被路由之前调用。我们可利用这种过滤器实现身份验证、在集群中选择请求的微服务、记录调试信息等。\r\n\r\n(2) ROUTING：这种过滤器将请求路由到微服务。这种过滤器用于构建发送给微服务的请求，并使用Apache HttpClient或Netfilx Ribbon请求微服务。\r\n\r\n(3) POST：这种过滤器在路由到微服务以后执行。这种过滤器可用来为响应添加标准的HTTP Header、收集统计信息和指标、将响应从微服务发送给客户端等。\r\n\r\n(4) ERROR：在其他阶段发生错误时执行该过滤器。\r\n\r\n\r\n\r\n参考：\r\n[https://www.cnblogs.com/lexiaofei/p/7080257.html](https://www.cnblogs.com/lexiaofei/p/7080257.html)\r\n[https://www.cnblogs.com/xd03122049/p/6036318.html](https://www.cnblogs.com/xd03122049/p/6036318.html)\r\n\r\n\r\n\r\n### 配置中心：Spring Cloud Config\r\n\r\n​	Spring Cloud Config为分布式系统中的外部配置提供服务器和客户端支持。使用Config Server，您可以为所有环境中的应用程序管理其外部属性。它非常适合spring应用，也可以使用在其他语言的应用上。随着应用程序通过从开发到测试和生产的部署流程，您可以管理这些环境之间的配置，并确定应用程序具有迁移时需要运行的一切。服务器存储后端的默认实现使用git，因此它轻松支持标签版本的配置环境，以及可以访问用于管理内容的各种工具。\r\n\r\nSpring Cloud Config服务端特性\r\n\r\n- HTTP，为外部配置提供基于资源的API（键值对，或者等价的YAML内容）\r\n- 属性值的加密和解密（对称加密和非对称加密）\r\n- 通过使用@EnableConfigServer在Spring boot应用中非常简单的嵌入。\r\n\r\nConfig客户端的特性（特指Spring应用）\r\n\r\n- 绑定Config服务端，并使用远程的属性源初始化Spring环境。\r\n- 属性值的加密和解密（对称加密和非对称加密）\r\n\r\n参考：\r\n[https://www.cnblogs.com/boboooo/p/8796636.html?utm_source=debugrun&utm_medium=referral](https://www.cnblogs.com/boboooo/p/8796636.html?utm_source=debugrun&utm_medium=referral)\r\n\r\n\r\n\r\n### 服务总线：spring cloud bus\r\n\r\n​	我们如果要去更新所有微服务的配置，在不重启的情况下去更新配置，只能依靠spring cloud config了，但是，是我们要一个服务一个服务的发送post请求，\r\n\r\n​	我们能受的了吗？这比之前的没配置中心好多了，那么我们如何继续避免挨个挨个的向服务发送Post请求来告知服务，你的配置信息改变了，需要及时修改内存中的配置信息。\r\n\r\n​	这时候我们就不要忘记消息队列的发布订阅模型。让所有为服务来订阅这个事件，当这个事件发生改变了，就可以通知所有微服务去更新它们的内存中的配置信息。这时Bus消息总线就能解决，你只需要在springcloud  Config Server端发出refresh，就可以触发所有微服务更新了。\r\n\r\n架构图：\r\n\r\n![bc28c9b5fc27aa94dfc9f062e0d9b292.png](en-resource://database/2062:1)\r\n\r\n原理：\r\n\r\n![69cda39b65cbbba77110aba8d2d54606.png](en-resource://database/2060:1)\r\n\r\n\r\n参考：[https://www.cnblogs.com/huangjuncong/p/9077099.html](https://www.cnblogs.com/huangjuncong/p/9077099.html)\r\n[https://www.cnblogs.com/songxh-scse/p/7833963.html](https://www.cnblogs.com/songxh-scse/p/7833963.html)\r\n\r\n\r\n\r\n\r\n\r\n### 构建异构平台的服务注册与通信：sidecar\r\n\r\n​	Spring Cloud是目前非常流行的微服务化解决方案，它将Spring Boot的便捷开发和Netflix OSS的丰富解决方案结合起来。如我们所知，Spring Cloud不同于Dubbo，使用的是基于HTTP(s)的Rest服务来构建整个服务体系。\r\n 	那么有没有可能使用一些非JVM语言，例如我们所熟悉的Node.js来开发一些Rest服务呢？当然是可以的。但是如果只有Rest服务，还不能接入Spring Cloud系统。我们还想使用起Spring Cloud提供的Eureka进行服务发现，使用Config Server做配置管理，使用Ribbon做客户端负载均衡。这个时候Spring sidecar就可以大显身手了。\r\n 	Sidecar起源于Netflix Prana。他提供一个可以获取既定服务所有实例的信息(例如host，端口等)的http api。你也可以通过一个嵌入的Zuul，代理服务到从Eureka获取的相关路由节点。Spring Cloud Config Server可以直接通过主机查找或通过代理Zuul进行访问。\r\n\r\n​	需要注意的是你所开发的Node.js应用，必须去实现一个健康检查接口，来让Sidecar可以把这个服务实例的健康状况报告给Eureka。\r\n\r\n理解：简单来说sidecar就是可以让非java开发的微服务也可以在SpringCloud组建中使用，利用Eureka，Config等功能。\r\n\r\n\r\n\r\n参考：https://blog.csdn.net/shenzhen_zsw/article/details/81009238\r\n\r\nhttps://www.jianshu.com/p/2788b7220407\r\n\r\n\r\n\r\n### 微服务链路跟踪：Zipkin\r\n\r\n​	Zipkin是一款开源的分布式实时数据追踪系统（Distributed Tracking System），基于 Google Dapper的论文设计而来，由 Twitter 公司开发贡献。其主要功能是聚集来自各个异构系统的实时监控数据。分布式跟踪系统还有其他比较成熟的实现，例如：Naver的Pinpoint、Apache的HTrace、阿里的鹰眼Tracing、京东的Hydra、新浪的Watchman，美团点评的CAT，skywalking等。\r\n\r\n\r\n\r\n如图，在复杂的调用链路中假设存在一条调用链路响应缓慢，如何定位其中延迟高的服务呢？\r\n\r\n- 日志： 通过分析调用链路上的每个服务日志得到结果\r\n- zipkin：使用`zipkin`的`web  UI`可以一眼看出延迟高的服务\r\n\r\n![2462b163f1a39a69cd39c201d0c463ea.png](en-resource://database/2064:1)\r\n\r\n\r\n参考：https://blog.csdn.net/qq924862077/article/details/80285536\r\n\r\n\r\n\r\n## 项目实际测试\r\n\r\n### 测试：基本微服务测试\r\n\r\n- 启动微服务注册中心Eureka：microservice-discovery-eureka  账户：admin  密码：admin123\r\n\r\n  访问注册中心地址：http://127.0.0.1:8761/\r\n\r\n- 启动服务提供者：microservice-provider-user  \r\n\r\n- 启动服务消费者：microservice-consume-movie\r\n\r\n- 打开注册中心检查服务是否注册\r\n\r\n- 访问消费者接口1：http://127.0.0.1:9100/say   此时没有进行服务间的调用，只是单纯的访问服务消费者\r\n\r\n- 访问消费者接口2：http://127.0.0.1:9100/say2  此时消费者调用提供者，进行服务间的通讯，此时服务请求没有参数并且返回数据为字符串\r\n\r\n- 访问消费者接口3：http://127.0.0.1:9100/getUserInfo/1  此时进行服务间通讯，并且请求带有参数返回数据为对象\r\n\r\n- 对应脚本：microservice-test01.bat\r\n\r\n### 测试：客户端负载均衡服务测试\r\n\r\n- 启动微服务注册中心Eureka：microservice-discovery-eureka  账户：admin  密码：admin123\r\n\r\n  访问注册中心地址：http://127.0.0.1:8761/\r\n\r\n- 启动服务提供者：microservice-provider-user1 \r\n\r\n- 启动服务提供者：microservice-provider-user2  \r\n\r\n- 启动服务消费者：microservice-consume-movie-feign\r\n\r\n- 对应脚本：microservice-test02.bat\r\n\r\n\r\n\r\n### 测试：Hystrix熔断机制\r\n\r\n- 启动Eureka注册中心：microservice-discovery-eureka\r\n- 启动服务提供者：microservice-provider-user\r\n- 启动服务消费者： microservice-consume-movie-feign-hystrix  其中包括Hystrix熔断机制的方法回退\r\n\r\n\r\n\r\n### 测试：Hystrix熔断控制面板\r\n\r\n- 启动Eureka注册中心：microservice-discovery-eureka\r\n- 启动服务提供者：microservice-provider-user\r\n- 启动服务消费者： microservice-consume-movie-feign-hystrix  其中包括Hystrix熔断机制的方法回退\r\n  注意：此项目必须要确保被监控的服务打开了Actuator（依赖spring-boot-starter-actuator），\r\n  启动程序开启了断路器（@EnableCircuitBreaker注解）。\r\n- 启动Hystrix DashBoard监控项目： microservice-hystrix-dashboard  \r\n  注意：此项目无需注册到Eureka中\r\n- 访问注册中心： http://127.0.0.1:8761/  检查服务是否启动\r\n- 访问服务消费者： http://127.0.0.1:9103/say2\r\n- 访问监控面板： http://127.0.0.1:9090/hystrix\r\n   填写相应参数:http://127.0.0.1:9103/hystrix.stream\r\n\r\n### 测试：路由规则\r\n\r\n\r\n- 启动服务注册中心项目：microservice-discovery-eureka\r\n- 启动服务提供者项目：microservice-provider-user\r\n- 启动服务消费者项目：microservice-consume-movie-ribbon\r\n- 启动路由网关项目： microservice-getway-zuul\r\n- 访问：http://127.0.0.1:8761/  检查服务是否启动成功\r\n- 访问：http://127.0.0.1:8040/microservice-consume-movie-ribbon/say2   检查服务是否成功\r\n- 访问：http://127.0.0.1:8040/microservice-provider-user/getUser   检查服务是否成功\r\n\r\n**Zuul路由规则：http://ZUUL_HOST:ZUUL_PORT/微服务在Eureka上的serviceId/**会被转发到serviceId对应的微服务上**\r\n\r\n![67ca8c8a88323d0406adaa832da65b70.png](en-resource://database/2039:1)\r\n\r\n\r\n### 测试：负载均衡功能\r\n\r\n- 启动服务注册中心：microservice-discovery-eureka\r\n- 启动多个服务提供者：microservice-provider-user(端口不同)\r\n- 启动路由网关项目：microservice-getway-zuul\r\n- 访问：http://127.0.0.1:8761/  检查服务是否启动成功\r\n\r\n\r\n多次访问192.168.224.1:8040/microservice-provider-user/hello，会发现两个服务提供者循环显示，说明Zuul可以使用Ribbon达到负载均衡的效果\r\n\r\n### 测试：Hystrix容错与监控功能\r\n1. 启动服务注册中心项目：microservice-discovery-eureka\r\n2. 启动服务提供者项目：microservice-provider-user\r\n3. 启动服务消费者项目：microservice-consume-movie-ribbon\r\n4. 启动路由网关项目： microservice-getway-zuul\r\n5. 启动服务监控项目： microservice-hystrix-dashboard\r\n6. 访问：http://127.0.0.1:8761/  检查服务是否启动成功\r\n7. 访问：192.168.224.1:8040/microservice-consume-movie-feign-hystrix3/say2 获得预期效果\r\n8. 访问服务监控：http://127.0.0.1:9090/hystrix  输入：http://192.168.224.1:8040/hystrix.stream(网关地址)，结果显示', '1', 'page', 'publish', null, null, '3', '0', null, null, null);
INSERT INTO `t_contents` VALUES ('4', '测试一下', null, '1526138330', '1526138330', ' 1. sadhjakd\r\nasdjaklda \r\n\r\n# asdadjasldjakdjal\r\n', '1', 'post', 'publish', 'java,SPringBoot', 'default', '45', '1', '1', '1', '1');
INSERT INTO `t_contents` VALUES ('5', '友链', '', '1551875475', '1551875475', '# 测试一下', '1', 'post', 'publish', '234', 'default', '30', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for t_logs
-- ----------------------------
DROP TABLE IF EXISTS `t_logs`;
CREATE TABLE `t_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(100) DEFAULT NULL,
  `data` varchar(2000) DEFAULT NULL,
  `author_id` int(10) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `created` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_logs
-- ----------------------------
INSERT INTO `t_logs` VALUES ('1', '登录后台', null, '1', '127.0.0.1', '1526137277');
INSERT INTO `t_logs` VALUES ('2', '保存系统设置', '{\"site_record\":\"京备809090909\",\"site_description\":\"半度微凉\",\"site_title\":\"http://127.0.0.1:8080,半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1526137313');
INSERT INTO `t_logs` VALUES ('3', '保存系统设置', '{\"site_record\":\"京备809090909\",\"site_description\":\"我的博客、我自己开发。\",\"site_title\":\"http://127.0.0.1:8080,半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1526137343');
INSERT INTO `t_logs` VALUES ('4', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_description\":\"我的博客、我自己开发。\",\"site_title\":\"http://127.0.0.1:8080,半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1526137363');
INSERT INTO `t_logs` VALUES ('5', '系统备份', null, '1', '127.0.0.1', '1526137380');
INSERT INTO `t_logs` VALUES ('6', '系统备份', null, '1', '127.0.0.1', '1526137385');
INSERT INTO `t_logs` VALUES ('7', '系统备份', null, '1', '127.0.0.1', '1526137387');
INSERT INTO `t_logs` VALUES ('8', '系统备份', null, '1', '127.0.0.1', '1526137390');
INSERT INTO `t_logs` VALUES ('9', '系统备份', null, '1', '127.0.0.1', '1526137401');
INSERT INTO `t_logs` VALUES ('10', '系统备份', null, '1', '127.0.0.1', '1526137462');
INSERT INTO `t_logs` VALUES ('11', '登录后台', null, '1', '127.0.0.1', '1526137781');
INSERT INTO `t_logs` VALUES ('12', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_description\":\"我的博客、我自己开发。\",\"site_title\":\"http://127.0.0.1:8080,半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1526138162');
INSERT INTO `t_logs` VALUES ('13', '修改个人信息', '{\"uid\":1,\"email\":\"taowd@outlook.com\",\"screenName\":\"admin\"}', '1', '127.0.0.1', '1526138224');
INSERT INTO `t_logs` VALUES ('14', '登录后台', null, '1', '127.0.0.1', '1530079325');
INSERT INTO `t_logs` VALUES ('15', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_description\":\"我的博客、我自己开发11。\",\"site_title\":\"半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1530079380');
INSERT INTO `t_logs` VALUES ('16', '登录后台', null, '1', '127.0.0.1', '1551713663');
INSERT INTO `t_logs` VALUES ('17', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_description\":\"我的博客、我自己开发11。\",\"site_title\":\"http://127.0.0.1:9000,半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1551713724');
INSERT INTO `t_logs` VALUES ('18', '登录后台', null, '1', '127.0.0.1', '1551714437');
INSERT INTO `t_logs` VALUES ('19', '登录后台', null, '1', '127.0.0.1', '1551796866');
INSERT INTO `t_logs` VALUES ('20', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_description\":\"我的博客、我自己开发11。\",\"site_title\":\"http://127.0.0.1:9000,http://127.0.0.1:9000,半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1551796875');
INSERT INTO `t_logs` VALUES ('21', '登录后台', null, '1', '127.0.0.1', '1551875434');
INSERT INTO `t_logs` VALUES ('22', '登录后台', null, '1', '127.0.0.1', '1551969147');
INSERT INTO `t_logs` VALUES ('23', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_description\":\"我的博客、我自己开发11。\",\"site_title\":\"http://127.0.0.1:8080,http://127.0.0.1:9000,http://127.0.0.1:9000,半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1551969188');
INSERT INTO `t_logs` VALUES ('24', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_description\":\"我的博客、我自己开发11。\",\"site_title\":\"http://127.0.0.1:9000,半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1551969251');
INSERT INTO `t_logs` VALUES ('25', '登录后台', null, '1', '127.0.0.1', '1551969952');
INSERT INTO `t_logs` VALUES ('26', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_description\":\"我的博客、我自己开发11。\",\"site_title\":\"http://127.0.0.1:9000,http://127.0.0.1:9000,半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1551969974');
INSERT INTO `t_logs` VALUES ('27', '登录后台', null, '1', '127.0.0.1', '1551970550');
INSERT INTO `t_logs` VALUES ('28', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_description\":\"我的博客、我自己开发11。\",\"site_title\":\"http://127.0.0.1:9000,http://127.0.0.1:9000,http://127.0.0.1:9000,半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1551970628');
INSERT INTO `t_logs` VALUES ('29', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_description\":\"我的博客、我自己开发11。\",\"site_title\":\"http://127.0.0.1:9000,http://127.0.0.1:9000,http://127.0.0.1:9000,半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1551970653');
INSERT INTO `t_logs` VALUES ('30', '登录后台', null, '1', '127.0.0.1', '1551971059');
INSERT INTO `t_logs` VALUES ('31', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_url\":\"http://127.0.0.1:8080\",\"site_description\":\"我的博客、我自己开发11。\",\"site_title\":\"半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1551971081');
INSERT INTO `t_logs` VALUES ('32', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_url\":\"http://127.0.0.1:9000\",\"site_description\":\"我的博客、我自己开发11。\",\"site_title\":\"半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1551971112');
INSERT INTO `t_logs` VALUES ('33', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_url\":\"http://127.0.0.1:9000\",\"site_description\":\"我的博客、我自己开发。\",\"site_title\":\"半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1551971124');
INSERT INTO `t_logs` VALUES ('34', '保存系统设置', '{\"social_zhihu\":\"https://www.zhihu.com/signup?next\\u003d%2F#signin\",\"social_github\":\"https://github.com/taoweidong\",\"social_twitter\":\"https://github.com/taoweidong\",\"social_weibo\":\"weibo\"}', '1', '127.0.0.1', '1551971212');
INSERT INTO `t_logs` VALUES ('35', '保存系统设置', '{\"social_zhihu\":\"https://www.zhihu.com/people/taowd/activities\",\"social_github\":\"https://github.com/taoweidong\",\"social_twitter\":\"https://github.com/taoweidong\",\"social_weibo\":\"weibo\"}', '1', '127.0.0.1', '1551971253');
INSERT INTO `t_logs` VALUES ('36', '登录后台', null, '1', '127.0.0.1', '1551971588');
INSERT INTO `t_logs` VALUES ('37', '登录后台', null, '1', '127.0.0.1', '1551971938');
INSERT INTO `t_logs` VALUES ('38', '登录后台', null, '1', '127.0.0.1', '1552137177');
INSERT INTO `t_logs` VALUES ('39', '登录后台', null, '1', '127.0.0.1', '1552137434');
INSERT INTO `t_logs` VALUES ('40', '登录后台', null, '1', '127.0.0.1', '1552146405');
INSERT INTO `t_logs` VALUES ('41', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_url\":\"http://127.0.0.1:9000\",\"site_description\":\"我的博客、我自己开发。234244\",\"site_title\":\"半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1552146418');
INSERT INTO `t_logs` VALUES ('42', '删除文章', '/upload/2019/03/vfo02hvu1mhvvrue9kq7jcnvml.png', '1', '127.0.0.1', '1552147390');
INSERT INTO `t_logs` VALUES ('43', '删除文章', '/upload/2019/03/77lemaqs7qj7mpqh26da2kqfgn.jpg', '1', '127.0.0.1', '1552147547');
INSERT INTO `t_logs` VALUES ('44', '登录后台', null, '1', '127.0.0.1', '1552209125');
INSERT INTO `t_logs` VALUES ('45', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_url\":\"http://127.0.0.1:9000\",\"site_description\":\"我的博客、我自己开发。234244\",\"site_title\":\"半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1552209132');
INSERT INTO `t_logs` VALUES ('46', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_url\":\"http://127.0.0.1:9000\",\"site_description\":\"我的博客、我自己开发。234244\",\"site_title\":\"半度微凉\",\"site_theme\":\"nice\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1552209226');
INSERT INTO `t_logs` VALUES ('47', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_url\":\"http://127.0.0.1:9000\",\"site_description\":\"我的博客、我自己开发.\",\"site_title\":\"半度微凉\",\"site_theme\":\"nice\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1552209287');
INSERT INTO `t_logs` VALUES ('48', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_url\":\"http://127.0.0.1:9000\",\"site_description\":\"我的博客、我自己开发.\",\"site_title\":\"半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1552209297');
INSERT INTO `t_logs` VALUES ('49', '登录后台', null, '1', '111.18.36.167', '1552321316');
INSERT INTO `t_logs` VALUES ('50', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_url\":\"http://123.206.74.225:9012\",\"site_description\":\"我的博客、我自己开发.\",\"site_title\":\"半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '111.18.36.167', '1552321331');
INSERT INTO `t_logs` VALUES ('51', '登录后台', null, '1', '127.0.0.1', '1552574798');
INSERT INTO `t_logs` VALUES ('52', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_url\":\"http://123.206.74.225:9012\",\"site_description\":\"我的博客、我自己开发.\",\"site_title\":\"半度微凉\",\"site_theme\":\"nice\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1552574806');
INSERT INTO `t_logs` VALUES ('53', '登录后台', null, '1', '127.0.0.1', '1552575902');
INSERT INTO `t_logs` VALUES ('54', '登录后台', null, '1', '127.0.0.1', '1552576356');
INSERT INTO `t_logs` VALUES ('55', '登录后台', null, '1', '127.0.0.1', '1552576732');
INSERT INTO `t_logs` VALUES ('56', '删除文章', '/upload/2019/03/qip7cajetaj21qjocppteb94v4.jpg', '1', '127.0.0.1', '1552576758');
INSERT INTO `t_logs` VALUES ('57', '保存系统设置', '{\"site_record\":\"琼ICP备17002905号\",\"site_url\":\"http://123.206.74.225:9012\",\"site_description\":\"我的博客、我自己开发.\",\"site_title\":\"半度微凉\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '1', '127.0.0.1', '1552576791');

-- ----------------------------
-- Table structure for t_metas
-- ----------------------------
DROP TABLE IF EXISTS `t_metas`;
CREATE TABLE `t_metas` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `type` varchar(32) NOT NULL DEFAULT '',
  `description` varchar(200) DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_metas
-- ----------------------------
INSERT INTO `t_metas` VALUES ('1', 'default', null, 'category', null, '0', '0');
INSERT INTO `t_metas` VALUES ('6', 'my github', 'https://github.com/ZHENFENG13', 'link', null, '0', '0');
INSERT INTO `t_metas` VALUES ('7', 'java', 'java', 'tag', null, '0', '0');
INSERT INTO `t_metas` VALUES ('8', 'SPringBoot', 'SPringBoot', 'tag', null, '0', '0');
INSERT INTO `t_metas` VALUES ('9', '234', '234', 'tag', null, '0', '0');

-- ----------------------------
-- Table structure for t_options
-- ----------------------------
DROP TABLE IF EXISTS `t_options`;
CREATE TABLE `t_options` (
  `name` varchar(32) NOT NULL DEFAULT '',
  `value` varchar(1000) DEFAULT '',
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_options
-- ----------------------------
INSERT INTO `t_options` VALUES ('allow_install', '', null);
INSERT INTO `t_options` VALUES ('site_description', '我的博客、我自己开发.', null);
INSERT INTO `t_options` VALUES ('site_keywords', '半度微凉', null);
INSERT INTO `t_options` VALUES ('site_record', '琼ICP备17002905号', '备案号');
INSERT INTO `t_options` VALUES ('site_theme', 'default', 'default,nice');
INSERT INTO `t_options` VALUES ('site_title', '半度微凉', '');
INSERT INTO `t_options` VALUES ('site_url', 'http://123.206.74.225:9012', null);
INSERT INTO `t_options` VALUES ('social_github', 'https://github.com/taoweidong', null);
INSERT INTO `t_options` VALUES ('social_twitter', 'https://github.com/taoweidong', null);
INSERT INTO `t_options` VALUES ('social_weibo', 'weibo', null);
INSERT INTO `t_options` VALUES ('social_zhihu', 'https://www.zhihu.com/people/taowd/activities', null);

-- ----------------------------
-- Table structure for t_relationships
-- ----------------------------
DROP TABLE IF EXISTS `t_relationships`;
CREATE TABLE `t_relationships` (
  `cid` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cid`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_relationships
-- ----------------------------
INSERT INTO `t_relationships` VALUES ('2', '1');
INSERT INTO `t_relationships` VALUES ('4', '1');
INSERT INTO `t_relationships` VALUES ('4', '7');
INSERT INTO `t_relationships` VALUES ('4', '8');
INSERT INTO `t_relationships` VALUES ('5', '1');
INSERT INTO `t_relationships` VALUES ('5', '9');

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `home_url` varchar(200) DEFAULT NULL,
  `screen_name` varchar(32) DEFAULT NULL,
  `created` int(10) unsigned DEFAULT '0',
  `activated` int(10) unsigned DEFAULT '0',
  `logged` int(10) unsigned DEFAULT '0',
  `group_name` varchar(16) DEFAULT 'visitor',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`username`),
  UNIQUE KEY `mail` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES ('1', 'taoweidong', '223d34353259f175a6e21e47861acc9e', 'taowd@outlook.com', null, 'admin', '1490756162', '0', '0', 'visitor');
