# frozen_string_literal: true

module ApplicationHelper
  require 'redcarpet'
  require 'rouge'
  require 'rouge/plugins/redcarpet'
  # Custom renderer for Markdown syntax
  class MarkdownRender < Redcarpet::Render::HTML
    def initialize(extensions = {})
      super extensions.merge(link_attributes: { target: '_blank' })
    end
    include Rouge::Plugins::Redcarpet
  end

  def date(sequence)
    sequence.strftime('%F')
  end
end
