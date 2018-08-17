# frozen_string_literal: true

class Product < ActiveRecord::Base
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews, -> { order 'created_at desc' }

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def sold_out?
    quantity <= 0
  end
end
