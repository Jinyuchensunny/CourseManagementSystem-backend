# Learning

## 环境要求

JDK 1.8+

Maven 3.6.0+

Docker 20.10.0+

------

## 数据库

安装MySQL8，创建新数据库：learning，导入SQL文件：learning.sql

修改learning-course、learning-user、learning-trade模块application.yml中的数据库配置

------

## Nacos

服务发现

```dockerfile
wget https://github.com/alibaba/nacos/releases/download/2.0.1/nacos-server-2.0.1.tar.gz
tar -zxvf nacos-server-2.0.1.tar.gz
cd nacos
// Linux启动服务
./bin/startup.sh -m standalone
// Windows启动服务
./bin/startup.cmd -m standalone
```

------

## Minio

用户存储课程封面图片、课程内容视频、用户头像

```dockerfile
docker pull minio/minio
docker run -p 9000:9000 --name minio -v /mydata/minio/data:/data -d minio/minio server /data
```

可视化文件管理页面：[http://localhost:9000](http://localhost:9000/)

默认账号密码：minioadmin

------

## Elasticsearch

**搜索课程**

```dockerfile
docker pull elasticsearch:7.9.3
docker run -p 9200:9200 -p 9300:9300 --name elasticsearch -e "discovery.type=single-node" -e "cluster.name=elasticsearch" \
-v /mydata/elasticsearch/plugins:/usr/share/elasticsearch/plugins -v /mydata/elasticsearch/data:/usr/share/elasticsearch/data \
-d elasticsearch:7.9.3
```

**安装中文分词插件**

```dockerfile
docker exec -it elasticsearch /bin/bash
elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.9.3/elasticsearch-analysis-ik-7.9.3.zip
docker restart elasticsearch
```