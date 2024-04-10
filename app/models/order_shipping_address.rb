class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: { message: '' } do
    validates :token,        presence: { message: "(クレジットカード情報)を正しく再入力してください" }
    validates :postal_code,  presence: { message: "(郵便番号)を入力してください" },
              format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: '(郵便番号)はハイフン(-)を含めた半角数字を入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: "(都道府県)を選択してください" }
    validates :city,         presence: { message: "(市区町村)を入力してください" }
    validates :house_number, presence: { message: "(番地)を入力してください" }
    validates :phone_number, presence: { message: "(電話番号)を入力してください" },
              format: { with: /\A\d{10,11}\z/, message: '(電話番号)は10桁から11桁の半角数字を入力してください' }
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id:, item_id:)
    ShippingAddress.create(postal_code:, prefecture_id:, city:, house_number:,
                           building_name:, phone_number:, order_id: order.id)
  end
end
