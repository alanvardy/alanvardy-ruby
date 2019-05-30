# frozen_string_literal: true

class Technology < ApplicationRecord
  has_many :projects, through: :project_technologies
end
