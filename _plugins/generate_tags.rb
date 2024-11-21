require 'fileutils'

module Jekyll
  class TagPageGenerator < Generator
    safe true

    def generate(site)
      tags_dir = File.join(site.source, 'tags')
      FileUtils.mkdir_p(tags_dir)

      site.tags.each do |tag, posts|
        tag_slug = tag.downcase.strip.gsub(' ', '-')
        File.open(File.join(tags_dir, "#{tag_slug}.html"), "w") do |file|
          file.write("---\nlayout: tag\ntag: #{tag}\ntitle: \"标签: #{tag}\"\n---\n")
        end
      end
    end
  end
end
