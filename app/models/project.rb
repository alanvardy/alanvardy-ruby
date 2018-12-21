# frozen_string_literal: true

class Project < ApplicationRecord
  def picture_url
    weburl? ? giturl : weburl
  end

  def weburl?
    weburl != '#' || ''
  end

  def giturl?
    giturl != '#' || ''
  end
end
