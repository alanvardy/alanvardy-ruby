# frozen_string_literal: true

require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'
# Custom renderer for Markdown syntax
class BlogRender < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end
