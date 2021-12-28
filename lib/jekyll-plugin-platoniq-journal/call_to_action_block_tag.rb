# frozen_string_literal: true

module Jekyll
  class CallToActionBlockTag < Liquid::Block
    def initialize(tag_name, input, tokens)
      super
      @input = input
    end

    def render(context)
      text = super

      jdata = if !@input.nil? && !@input.empty?
                JSON.parse(@input)
              else
                JSON.parse({ :example => "123" })
              end

      output = []

      output << %(<div class="px-4 py-5 my-5 text-center">)
      output << Kramdown::Document.new(text).to_html if text
      output << <<~CTA
        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
          <a href="#{jdata["url"]}" class="btn btn-primary btn-lg px-4 gap-3">
            #{jdata["label"]}
          </a>
        </div>
      CTA
      output << %(</div>)

      output.join
    end
  end
end

Liquid::Template.register_tag("cta", Jekyll::CallToActionBlockTag)
