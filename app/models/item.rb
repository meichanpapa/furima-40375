class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_many_attached :images
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_responsibility
  belongs_to :prefecture
  belongs_to :days_until_shipping

  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :category_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :condition_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :shipping_fee_responsibility_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :days_until_shipping_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :sell_price, presence: true,
                         numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true, message: "は300以上9999999以下の数値にしてください"}
end
