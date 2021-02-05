class Room < ApplicationRecord
  belongs_to :host, class_name: 'User'

  validates_presence_of :host_id
  validates_presence_of :address
  validates_presence_of :fee
  validates_presence_of :latitude
  validates_presence_of :longitude

  def self.paginate_with_users(page = 1, per_page = 20)
    rooms = Room.order(created_at: :desc)
      .eager_load(:host).to_a
    paginated_rooms = Kaminari.paginate_array(rooms)
    paginated_rooms.page(page).per(per_page)
  end
end
