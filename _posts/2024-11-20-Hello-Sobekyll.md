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

Due to limited Jekyll dependencies and versions supported by Github Pages by default. reference: [Dependency versions](https://pages.github.com/versions/)

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

> The `jekyll-archives` plugin is not in default Github Pages supported dependencies. So in `tags` and `categories` is not available.

### Use action
In your root directory, create `.github/workflows/jekyll.yml`, and add this code:
```yml
name: Build and Deploy Jekyll

on:
  push:
    branches:
      - main  # 或者你的默认分支\

permissions:
  contents: write  # 允许对仓库内容进行写操作

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout Code
      uses: actions/checkout@v3

    - name: Setup Ruby
      uses: ruby/setup-ruby@v1
      with:
        ruby-version: '3.1' # 确保版本兼容 Jekyll

    - name: Install Dependencies
      run: |
        gem install bundler
        bundle install

    - name: Build Site
      run: bundle exec jekyll build

    - name: Deploy to GitHub Pages
      uses: peaceiris/actions-gh-pages@v4
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./_site
```
Then, in your repo's **Settings -> Pages**, change **Build and deployment** to **Deploy from a branch**, and choose branch to 'gh-pages'.

If you choose use github action to build and deploy blog. You can Use `Sobekyll` directly as a dependencies as below decribed.

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

## Customize

### Sidebar
Setup author info:
```yml
author: 
  name: boybeak
  avatar: 'https://avatars.githubusercontent.com/u/6696502?v=4'
```
Setup menu:
```yml
menus:
  - title: Contact Me
    items:
      - title: Github
        icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M165.9 397.4c0 2-2.3 3.6-5.2 3.6-3.3 .3-5.6-1.3-5.6-3.6 0-2 2.3-3.6 5.2-3.6 3-.3 5.6 1.3 5.6 3.6zm-31.1-4.5c-.7 2 1.3 4.3 4.3 4.9 2.6 1 5.6 0 6.2-2s-1.3-4.3-4.3-5.2c-2.6-.7-5.5 .3-6.2 2.3zm44.2-1.7c-2.9 .7-4.9 2.6-4.6 4.9 .3 2 2.9 3.3 5.9 2.6 2.9-.7 4.9-2.6 4.6-4.6-.3-1.9-3-3.2-5.9-2.9zM244.8 8C106.1 8 0 113.3 0 252c0 110.9 69.8 205.8 169.5 239.2 12.8 2.3 17.3-5.6 17.3-12.1 0-6.2-.3-40.4-.3-61.4 0 0-70 15-84.7-29.8 0 0-11.4-29.1-27.8-36.6 0 0-22.9-15.7 1.6-15.4 0 0 24.9 2 38.6 25.8 21.9 38.6 58.6 27.5 72.9 20.9 2.3-16 8.8-27.1 16-33.7-55.9-6.2-112.3-14.3-112.3-110.5 0-27.5 7.6-41.3 23.6-58.9-2.6-6.5-11.1-33.3 2.6-67.9 20.9-6.5 69 27 69 27 20-5.6 41.5-8.5 62.8-8.5s42.8 2.9 62.8 8.5c0 0 48.1-33.6 69-27 13.7 34.7 5.2 61.4 2.6 67.9 16 17.7 25.8 31.5 25.8 58.9 0 96.5-58.9 104.2-114.8 110.5 9.2 7.9 17 22.9 17 46.4 0 33.7-.3 75.4-.3 83.6 0 6.5 4.6 14.4 17.3 12.1C428.2 457.8 496 362.9 496 252 496 113.3 383.5 8 244.8 8zM97.2 352.9c-1.3 1-1 3.3 .7 5.2 1.6 1.6 3.9 2.3 5.2 1 1.3-1 1-3.3-.7-5.2-1.6-1.6-3.9-2.3-5.2-1zm-10.8-8.1c-.7 1.3 .3 2.9 2.3 3.9 1.6 1 3.6 .7 4.3-.7 .7-1.3-.3-2.9-2.3-3.9-2-.6-3.6-.3-4.3 .7zm32.4 35.6c-1.6 1.3-1 4.3 1.3 6.2 2.3 2.3 5.2 2.6 6.5 1 1.3-1.3 .7-4.3-1.3-6.2-2.2-2.3-5.2-2.6-6.5-1zm-11.4-14.7c-1.6 1-1.6 3.6 0 5.9 1.6 2.3 4.3 3.3 5.6 2.3 1.6-1.3 1.6-3.9 0-6.2-1.4-2.3-4-3.3-5.6-2z"/></svg>'
        url: https://github.com/boybeak
      - title: X
        icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M389.2 48h70.6L305.6 224.2 487 464H345L233.7 318.6 106.5 464H35.8L200.7 275.5 26.8 48H172.4L272.9 180.9 389.2 48zM364.4 421.8h39.1L151.1 88h-42L364.4 421.8z"/></svg>'
        url: https://x.com/BeakInAir
      - title: Email
        icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0L492.8 150.4c12.1-9.1 19.2-23.3 19.2-38.4c0-26.5-21.5-48-48-48L48 64zM0 176L0 384c0 35.3 28.7 64 64 64l384 0c35.3 0 64-28.7 64-64l0-208L294.4 339.2c-22.8 17.1-54 17.1-76.8 0L0 176z"/></svg>'
        url: mailto:boybeak@gmail.com
  - title: My Apps
    items:
      - title: AOD Volume
        img: /assets/images/AODVolume.png
      - title: JustTodo
        img: /assets/images/JustTodo.png
        url: https://github.com/boybeak/JustTodo
      - title: DeskNote
        img: /assets/images/DeskNote.png
        url: https://github.com/boybeak/DeskNote
      - title: Translator
        img: /assets/images/Translator.png
        url: https://github.com/boybeak/TranslatorDocs
  - items:
      - title: Donate Me
        icon: '<svg stroke-width="0" viewBox="0 0 24 24" class="inline-block text-primary" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg" style="font-size: 30px;"><path d="M7 22h10a1 1 0 0 0 .99-.858L19.867 8H21V6h-1.382l-1.724-3.447A.998.998 0 0 0 17 2H7c-.379 0-.725.214-.895.553L4.382 6H3v2h1.133L6.01 21.142A1 1 0 0 0 7 22zm10.418-11H6.582l-.429-3h11.693l-.428 3zm-9.551 9-.429-3h9.123l-.429 3H7.867zM7.618 4h8.764l1 2H6.618l1-2z"></path></svg>'
        url: https://1kafei.com/user/payment/new/boybeak/069DN2BH0I7/?referrer=/boybeak/
      - title: About
        icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960"><path d="M440-280h80v-240h-80v240Zm40-320q17 0 28.5-11.5T520-640q0-17-11.5-28.5T480-680q-17 0-28.5 11.5T440-640q0 17 11.5 28.5T480-600Zm0 520q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z"></path></svg>'
```
`icon` for svg code, and `img` for a image's directory or url.