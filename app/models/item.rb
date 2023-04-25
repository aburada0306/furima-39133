class Item < ApplicationRecord


  validates :title,:price, :content,:image, presence: true
  validates_inclusion_of :price, in:300..9999999,message: 'is out of setting range',allow_blank:true
  validates :price, numericality:{ with: /\A[0-9]+\z/, message: 'should be half-width numbers' }
  validates :category_id,:status_id,:postage_id,:prefecture_id,:delivery_id, numericality: { other_than: 1 , message: "can't be blank"}

  
  belongs_to :user
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :postage
  belongs_to :prefecture 
  belongs_to :delivery
  belongs_to :category
  belongs_to :status


end
