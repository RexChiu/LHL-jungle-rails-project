class Review < ActiveRecord::Base
  belongs_to :product

  validates :product_id, presence: true
  validates :user_id, presence: true
end
