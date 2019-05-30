# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :technologies, through: :project_technologies

  def picture_url
    if !more.empty?
      self
    elsif weburl?
      weburl
    else
      giturl
    end
  end

  def weburl?
    !weburl.empty?
  end

  def giturl?
    !giturl.empty?
  end
end
