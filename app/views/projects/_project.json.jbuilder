json.extract! project, :id, :title, :description, :weburl, :giturl, :image, :more, :created_at, :updated_at
json.url project_url(project, format: :json)
