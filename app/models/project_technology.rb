# frozen_string_literal: true

class ProjectTechnology < ApplicationRecord
  belongs_to :project
  belongs_to :technology
end
