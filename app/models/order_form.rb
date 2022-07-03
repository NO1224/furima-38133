class OrderForm
  include ActiveModel::Model
  #orderテーブルとdestinationテーブルの情報(トークン添付)
  attr_accessor :user_id,
                :item_id,
                :post_code,
                :prefecture_id,
                :municipality,
                :address,
                :building_name,
                :phone_number,
                :token #JavaScriptから添付

  VALID_POSTCODE_REGEX = /\A\d{3}-\d{4}\z/
  VALID_PHONENUMBER_REGEX = /\A\d{10,11}\z/

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { allow_blank: true,
                                    with:  VALID_POSTCODE_REGEX, 
                                    message: 'is invalid. It may not be include hyphen(-), not current-format or not integer'}
    validates :municipality
    validates :address
    validates :phone_number, format: { allow_blank: true,
                                       with:  VALID_PHONENUMBER_REGEX, 
                                       message: 'is invalid. It may be include hyphen(-), not minimum-digits(10) or not integer'}
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 }
 
  # 各テーブルにデータを保存する処理
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(order_id: order.id,
                       post_code: post_code,
                       prefecture_id: prefecture_id,
                       municipality: municipality,
                       address: address,
                       building_name: building_name,
                       phone_number: phone_number)
  end

end