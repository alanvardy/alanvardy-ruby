# typed: false
# frozen_string_literal: true

module ApplicationHelper
  require 'redcarpet'
  require 'rouge'
  require 'rouge/plugins/redcarpet'
  # Custom renderer for Markdown syntax
  class MarkdownRender < Redcarpet::Render::HTML
    def initialize(extensions = {})
      super extensions.merge(link_attributes: { target: 'blank' })
    end
    include Rouge::Plugins::Redcarpet
  end

  def date(sequence)
    sequence.strftime('%F')
  end

  def active_nav(pages, title)
    if pages.include?(title)
      'nav-item nav-link active'
    else
      'nav-item nav-link'
    end
  end

  def admin?
    session[:current_user]
  end
end
