---
layout: post
title:  "Better Usage"
date:   2024-11-22 10:17:05 +0800
tags: [Mermaid]
categories: [Guide]
---

Sobekyll works better when combined with some plugins. Below is an introduction to several plugins, and more will be added as new useful plugins are discovered.

## jekyll-paginate
This plugin is used for pagination to prevent loading delays caused by displaying all posts on the homepage at once. Sobekyll supports this plugin. Integration steps are as follows:
Add the following code to the **Gemfile** and run `bundle install`.
```ruby
gem "jekyll-paginate", "~> 1.1.0"
```
Enable and configure the plugin in the **_config.yml** file.
```yml
plugins:
  - jekyll-paginate

paginate: 5   # Number of posts per page
paginate_path: "/page:num/"  # Pagination path, :num will be replaced by the page number
```
For more configuration options, see: [jekyll-paginate](https://github.com/jekyll/jekyll-paginate)

## jekyll-archives
This plugin is used to automatically generate tag/category pages. By default, Jekyll does not create pages for tags/categories. For example, clicking a tag/category would lead to a 404 page. To solve this issue, integrate this plugin:
Add the following code to the **Gemfile** and run `bundle install`.
```ruby
gem 'jekyll-archives'
```
Enable and configure the plugin in the **_config.yml** file.
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
For more configuration options, see: [jekyll-archives](https://github.com/jekyll/jekyll-archives)

## jekyll-sitemap
This plugin is used to automatically generate `sitemap.xml`. After submitting it to the control platform of a search engine, the search engine will understand your directory structure, making your site easier to index. Integration steps are as follows:
Add the following code to the **Gemfile** and run `bundle install`.
```ruby
gem 'jekyll-sitemap'
```
Enable the plugin in the **_config.yml** file.
```yml
plugins:
  - jekyll-sitemap
```
For more configuration options, see: [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap)

## jekyll-seo-tag
This plugin is used to automatically generate some page metadata, facilitating search engine indexing. Integration steps are as follows:
Add the following code to the **Gemfile** and run `bundle install`.
```ruby
gem 'jekyll-seo-tag'
```
Enable and configure the plugin in the **_config.yml** file.
```yml
plugins:
  - jekyll-seo-tag
```
For more configuration options, see: [jekyll-seo-tag](https://github.com/jekyll/jekyll-seo-tag)

## jekyll-mermaid
This plugin is used to render diagrams using **mermaid** syntax. Integration steps are as follows:
Add the following code to the **Gemfile** and run `bundle install`.
```ruby
gem 'jekyll-mermaid'
```
Enable and configure the plugin in the **_config.yml** file.
```yml
plugins:
  - jekyll-mermaid

mermaid:
  src: 'https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js'
```

Usage example:
```mermaid
{% mermaid %}
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
{% endmermaid %}
```

Output example:
{% mermaid %}
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
{% endmermaid %}

For more configuration options, see: [jekyll-mermaid](https://github.com/jasonbellamy/jekyll-mermaid)