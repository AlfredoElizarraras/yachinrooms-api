class Room < ApplicationRecord
  belongs_to :host, class_name: 'User'

  validates_presence_of :host_id
  validates_presence_of :address
  validates_presence_of :fee
  validates_presence_of :latitude
  validates_presence_of :longitude
end
