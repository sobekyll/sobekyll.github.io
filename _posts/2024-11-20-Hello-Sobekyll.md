---
layout: post
title:  "Hello Sobekyll"
date:   2024-11-20 10:17:05 +0800
tags: [Jekyll, SoberJS, Material Design]
categories: [Guide]
---

**SobeKyll** is a material design theme for [Jekyll](https://jekyllrb.com/). It's powered by [SoberJS](https://soberjs.com/).

## Installation
### For Github Pages

If you've already have a Github Pages blog, and want to change theme to `Sobekyll`, follow these steps:
1. Clone this [repo](https://github.com/sobekyll/sobekyll.github.io) with `git clone https://github.com/sobekyll/sobekyll.github.io.git` or just download the zip file and unzip;
2. Copy the `sobekyll` folder under `_themes` into your own blog's `_themes` directory. If you don't have a `_themes` directory, create it;
3. Add these configuration to your `_config.yml`:
   
   ```yml
    theme: null
    include:
    - _themes

    theme_dir: _themes
    theme_assets: _themes/sobekyll/assets
    layouts_dir: _themes/sobekyll/_layouts
    includes_dir: _themes/sobekyll/_includes
    sass_dir: _themes/sobekyll/_sass
   ```

If you want to create a new blog and deploy it to **Github Pages**, follow these steps:
1. Clone this [repo](https://github.com/sobekyll/sobekyll.github.io) with `git clone https://github.com/sobekyll/sobekyll.github.io.git` or just download the zip file and unzip;
2. Copy files into your own blog directory;
3. Delete the posts under `_post` directory, and write your own post;
4. Push your blog to your own Github Pages repo;

### For others

```bash
gem install sobekyll
```
or add
```ruby
gem 'sobekyll'
```
then
```bash
bundle install
```

change theme to `sobekyll` at `_config.yml` file.
```yml
theme: sobekyll
```

### Customize
