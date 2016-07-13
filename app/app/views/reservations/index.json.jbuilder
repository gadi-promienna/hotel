json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :name, :start, :end, :room_id, :user_id
  json.url reservation_url(reservation, format: :json)
end
