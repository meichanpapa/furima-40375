class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code,   format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number,
              format: { with: /\A\d{10,11}\z/, message: 'is invalid. Please include 10 to 11 digits without hyphens' }
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id:, item_id:)
    ShippingAddress.create(postal_code:, prefecture_id:, city:, house_number:,
                           building_name:, phone_number:, order_id: order.id)
  end
end
