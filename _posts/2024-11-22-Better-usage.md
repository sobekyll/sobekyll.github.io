---
layout: post
title:  "Better Usage"
date:   2024-11-22 10:17:05 +0800
tags: [Mermaid]
categories: [Guide]
---

Sobekyll搭配一些插件会有更好的使用体验，下面介绍若干插件，后续遇到更好的插件，会不断补充。

## jekyll-paginate
这是一个用于分页的插件，避免首页一次性展示所有的文章造成加载时间过长。Sobekyll对此插件已经做了支持。接入方式如下：
在**Gemfile**中添加如下代码并执行`bundle install`。
```ruby
gem "jekyll-paginate", "~> 1.1.0"
```
在**_config.yml**文件中，启用并配置该插件。
```yml
plugins:
  - jekyll-paginate

paginate: 5   # 每页显示的文章数量
paginate_path: "/page:num/"  # 分页路径，:num 会被页码替换
```
更多使用配置请参考: [jekyll-paginate](https://github.com/jekyll/jekyll-paginate)

## jekyll-archives
这是用于自动生成tag/category页面的插件，Jekyll默认不会按照tag/category生成页面，也就是说，如果你想点击某个tag/category，查看对应的文章列表，会自动跳转到404页面。为了解决这个问题，接入此插件：
在**Gemfile**中添加如下代码并执行`bundle install`。
```ruby
gem 'jekyll-archives'
```
在**_config.yml**文件中，启用并配置该插件。
```yml
plugins:
  - jekyll-archives
jekyll-archives:
  enabled: 
    - tags
    - categories
  layout: archive
  permalinks:
    year: '/:year/'
    month: '/:year/:month/'
    day: '/:year/:month/:day/'
    tag: '/tag/:name/'
    category: '/category/:name/'
```
更多使用配置请参考: [jekyll-archives](https://github.com/jekyll/jekyll-archives)

## jekyll-sitemap
该插件用于自动生成`sitemap.xml`，提交给相关搜索引擎的控制平台后，该搜索引擎就会知道你的目录结构，方便被搜索引擎索引到。接入方式如下：
在**Gemfile**中添加如下代码并执行`bundle install`。
```ruby
gem 'jekyll-sitemap'
```
在**_config.yml**文件中，启用该插件。
```yml
plugins:
  - jekyll-sitemap
```
更多使用配置请参考: [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap)

## jekyll-seo-tag
该插件用于自动生成一些页面头信息，方便搜索引擎检索。插件安装方式如下：
在**Gemfile**中添加如下代码并执行`bundle install`。
```ruby
gem 'jekyll-seo-tag'
```
在**_config.yml**文件中，启用并配置该插件。
```yml
plugins:
  - jekyll-seo-tag
```
更多使用配置请参考: [jekyll-seo-tag](https://github.com/jekyll/jekyll-seo-tag)

## jekyll-mermaid
该插件用于解析以**mermaid**方式添加到图表。插件安装方式如下：
在**Gemfile**中添加如下代码并执行`bundle install`。
```ruby
gem 'jekyll-mermaid'
```
在**_config.yml**文件中，启用并配置该插件。
```yml
plugins:
  - jekyll-mermaid

mermaid:
  src: 'https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js'
```

使用方式如下：
```mermaid
{% mermaid %}
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
{% endmermaid %}
```

效果如下：
{% mermaid %}
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
{% endmermaid %}

更多使用配置请参考: [jekyll-mermaid](https://github.com/jasonbellamy/jekyll-mermaid)