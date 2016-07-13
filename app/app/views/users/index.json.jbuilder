json.array!(@users) do |user|
  json.extract! user, :id, :login, :name_and_surname, :password
  json.url user_url(user, format: :json)
end
