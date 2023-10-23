# frozen_string_literal: true

module Jekyll
  class ImageTag < JekyllPluginPlatoniqJournal::ExternalTemplateTag
    def tag_name
      "image"
    end
  end
end

Liquid::Template.register_tag("image", Jekyll::ImageTag)
