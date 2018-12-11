# frozen_string_literal: true
include ApplicationHelper

module PostsHelper
  def markdown_text(text)
    Redcarpet::Markdown.new(MarkdownRender, fenced_code_blocks: true, tables: true).render(text).html_safe
  end
end
