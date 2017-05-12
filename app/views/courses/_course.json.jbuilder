json.extract! course, :id, :code, :name, :department, :created_at, :updated_at
json.url course_url(course, format: :json)
