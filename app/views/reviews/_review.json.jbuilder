json.extract! review, :id, :tutor, :semester, :year, :title, :credit, :mandatory, :online, :review, :reading1, :reading2, :reading3, :reading4, :rating, :created_at, :updated_at
json.url review_url(review, format: :json)
