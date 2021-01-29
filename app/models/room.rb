class Room < ApplicationRecord
  has_many :room_users # こちらを先に書かないといけない
  has_many :users, through: :room_users

  validates :name, presence: true
end
