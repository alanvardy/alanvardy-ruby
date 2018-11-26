# frozen_string_literal: true

module ApplicationHelper
  require 'redcarpet'
  require 'rouge'
  require 'rouge/plugins/redcarpet'
  # Custom renderer for Markdown syntax
  class BlogRender < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

  def markdown(filename)
    path = Rails.root.join('app', 'assets', 'markdowns', filename)
    text = File.read(path)
    Redcarpet::Markdown.new(BlogRender, fenced_code_blocks: true).render(text).html_safe
  end
end
