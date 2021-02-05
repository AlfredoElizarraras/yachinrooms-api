json.rooms do |json|
  json.array! @rooms, partial: 'rooms/room', as: :room
end

json.rooms_count @rooms.size

json.current_page @page.to_i
