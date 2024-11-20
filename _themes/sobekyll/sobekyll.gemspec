Gem::Specification.new do |s|
  s.name        = "sobekyll" # 你的主题名称
  s.version     = "0.1.3"    # 版本号
  s.summary     = "A material design style Jekyll theme based on Sober." # 简短描述
  s.description = "A material design style Jekyll theme based on Sober." # 详细描述
  s.authors     = ["boybeak"]
  s.email       = "boybeak@gmail.com"
  s.license     = "MIT"
  s.files       = `git ls-files`.split("\n").reject do |file|
    file.start_with?("_site/") || file.start_with?("_posts/") || file == "Gemfile.lock"
  end
  s.homepage    = "https://github.com/boybeak/sobekyll"
  s.required_ruby_version = ">= 2.5.0"
  s.add_runtime_dependency "jekyll", "~> 3.10.0"
end
