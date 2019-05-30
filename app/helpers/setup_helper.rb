# frozen_string_literal: true

include ApplicationHelper

module SetupHelper
  def markdown_file(filename)
    path = Rails.root.join('app', 'assets', 'markdowns', filename)
    text = File.read(path)
    Redcarpet::Markdown.new(MarkdownRender, fenced_code_blocks: true).render(text).html_safe
  end
end
