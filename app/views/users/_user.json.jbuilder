json.extract! user, :id, :email, :password, :matricula, :created_at, :updated_at
json.url user_url(user, format: :json)
