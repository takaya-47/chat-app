class Message < ApplicationRecord
  belongs_to :user # アソシエーションでbelongs_toを指定した場合は、外部キー（今回はuser_id）が存在するというバリデーションは不要
  belongs_to :room
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached? # メソッドがfalse（画像がない場合）のときはvalidatesが発動する

  def was_attached?
    self.image.attached?
  end
end
