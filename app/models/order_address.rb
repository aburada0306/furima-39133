class OrderAddress
 include ActiveModel::Model
 attr_accessor :post_code, :prefecture_id, :city, :street, :building,:phone_number,:user_id,:item_id,:token
 
 with_options presence: true do
  validates :user_id,:item_id,:token
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は(-)を含む入力にしてください"}
  validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "は無効です"}
  validates :city,:street
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "を入力してください"}

  
 
  def save
     order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street: street, building: building,phone_number: phone_number,order_id: order.id,)
  end

end 
