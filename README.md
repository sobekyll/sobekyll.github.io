## Sobekyll

## Showcases
[boybeak.github.io](https://boybeak.github.io/)
[sobekyll.github.io](https://sobekyll.github.io/)

**SobeKyll** is a Material Design-inspired [Jekyll](https://jekyllrb.com/) theme developed based on [SoberJS](https://soberjs.com/).

## Installation
### Using with GitHub Pages

> Since GitHub Pages supports only a limited set of Jekyll libraries and versions, additional configuration is required to use Sobekyll with GitHub Pages. For more details, refer to: [Dependency versions](https://pages.github.com/versions/)

In the root directory of your blog, create a `.github/workflows/jekyll.yml` action configuration file and add the following code:

```yml
name: Build and Deploy Jekyll

on:
  push:
    branches:
      - main  # Or your default branch

permissions:
  contents: write  # Allows write access to the repository

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout Code
      uses: actions/checkout@v3

    - name: Setup Ruby
      uses: ruby/setup-ruby@v1
      with:
        ruby-version: '3.1' # Ensure compatibility with Jekyll

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

> Note the branch name `main`. For older repositories, change it to `master` if necessary, depending on your primary branch.

```yml
on:
  push:
    branches:
      - master  # Use master for older projects
```

In your `Gemfile`, add `gem 'sobekyll'` and run `bundle install`. Then configure the theme in the `_config.yml` file:

```yml
theme: sobekyll
```

After setting it up, push the changes to GitHub and go to **Settings -> Pages** in your repository. Set **Build and deployment** to **Deploy from a branch** and select the `gh-pages` branch. Allow some time for the changes to take effect.

## Theme Customization

### Sidebar
Set author information:
```yml
author: 
  name: boybeak
  avatar: 'https://avatars.githubusercontent.com/u/6696502?v=4'
```

Configure the sidebar menu:
```yml
menus:
  - title: Contact Me
    items:
      - title: Github
        icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512"><!--! Font Awesome Free 6.6.0 by @fontawesome --><path d="..."/></svg>'
        url: https://github.com/boybeak
      - title: X
        icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Free 6.6.0 --><path d="..."/></svg>'
        url: https://x.com/BeakInAir
      - title: Email
        icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Free 6.6.0 --><path d="..."/></svg>'
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
        icon: '<svg stroke-width="0" viewBox="0 0 24 24" class="inline-block text-primary" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="..."/></svg>'
        url: https://1kafei.com/user/payment/new/boybeak/069DN2BH0I7/?referrer=/boybeak/
      - title: About
        icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960"><path d="..."/></svg>'
```

Use `icon` to set SVG code and `img` to set the image path or URL.