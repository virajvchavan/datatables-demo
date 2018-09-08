json.extract! person, :id, :first_name, :last_name, :salary, :country, :birth_date, :pincode, :created_at, :updated_at
json.url person_url(person, format: :json)
