class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_responsibility
  belongs_to :prefecture
  belongs_to :days_until_shipping

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_responsibility_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :days_until_shipping_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :sell_price, presence: true,
                         numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
end
