json.call(room, :id, :address, :description, :fee,
          :image, :host_id)

json.location do
  json.latitude room.latitude
  json.longitude room.longitude
end

json.host do
  json.call(room.host, :id, :email, :username)
end
