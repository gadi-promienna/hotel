json.array!(@rooms) do |room|
  json.extract! room, :id, :number, :floor, :places, :standard
  json.url room_url(room, format: :json)
end
