json.room do |json|
  json.partial! 'rooms/room', room: @room
end
