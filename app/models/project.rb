# frozen_string_literal: true

class Project < ApplicationRecord
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
