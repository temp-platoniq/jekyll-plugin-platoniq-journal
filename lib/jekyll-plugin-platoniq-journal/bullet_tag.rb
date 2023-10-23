# frozen_string_literal: true

module Jekyll
  class BulletTag < JekyllPluginPlatoniqJournal::ExternalTemplateTag
    def tag_name
      "bullet"
    end
  end
end

Liquid::Template.register_tag("bullet", Jekyll::BulletTag)
