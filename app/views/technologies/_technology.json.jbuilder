# frozen_string_literal: true

json.extract! technology, :id, :name, :image, :description, :created_at, :updated_at
json.url technology_url(technology, format: :json)
