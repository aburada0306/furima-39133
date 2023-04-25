class Item < ApplicationRecord
  validates :title, :price, :content, presence: true
  validates :image, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  validates :category_id, :status_id, :postage_id, :prefecture_id, :delivery_id,
            numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :delivery
  belongs_to :category
  belongs_to :status
end
