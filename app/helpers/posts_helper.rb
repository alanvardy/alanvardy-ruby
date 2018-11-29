# frozen_string_literal: true

module PostsHelper

  require 'redcarpet'
  require 'rouge'
  require 'rouge/plugins/redcarpet'
  # Custom renderer for Markdown syntax
  class BlogRender < Redcarpet::Render::HTML
    def initialize(extensions = {})
      super extensions.merge(link_attributes: { target: '_blank' })
    end
    include Rouge::Plugins::Redcarpet
  end
  
  def markdown_text(text)
    Redcarpet::Markdown.new(BlogRender, fenced_code_blocks: true).render(text).html_safe
  end
end
