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