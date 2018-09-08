json.extract! user, :id, :name, :position, :salary, :office, :start_date, :extn, :created_at, :updated_at
json.url user_url(user, format: :json)
