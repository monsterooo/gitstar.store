# gitstar.store

主要功能：
1. 对你Github Star的项目进行一个自定义的备注, 方便以后查询
2. Github Trending 的镜像

![gitstar.store](https://user-images.githubusercontent.com/18432680/59833263-4b49d800-9378-11e9-81b1-dd607f1b57fe.png)


## Feature

* Trending ✔️
* Sync user star x
* Star A repo x

## Install

* 安装`redis`
* 安装`psql`, 并且创建对应环境的数据
* 重命令`config/application.yml.back`为`config/application.yml`，然后填入对应的配置文件
* `bundle install`
* `rails s`
* `bin/webpack-dev-server` # 可选

## DDL(rails)

* rails g migration AddColumnsToUsers provider uid # github auth
* rails g migration AddAccessTokenToUsers access_token # access_token
