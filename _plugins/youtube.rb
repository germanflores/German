# Jekyll - Easy Youtube Embed
# Modified from Katie Harron - https://github.com/pibby to be amp compatible https://www.ampproject.org/docs/reference/components/amp-youtube
module Jekyll
  class Youtube < Liquid::Tag
    @url = nil

    VIDEO_URL = /(\S+)/i

    def initialize(tag_name, markup, tokens)
      super

      if markup =~ VIDEO_URL
        @url = $1
      end
    end

    def render(context)
      source = "<amp-youtube" " "
      source += "data-videoid=\"#{@url}\"" " "
      source += "layout=\"responsive\" "
      source += "width=\"480\" height=\"270\">"
      source += "</amp-youtube>"
    end
  end
end

Liquid::Template.register_tag('youtube', Jekyll::Youtube)