class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
   validates :name,:birth,:chinese_first,:chinese_last,:kana_first,:kana_last, presence: true

   validates :kana_first,:kana_last,format: {with: /\A[ァ-ヶー－]+\z/, message: "Input full-width katakana characters"},allow_blank:true
   validates :chinese_first,:chinese_last,format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Input full-width characters"},allow_blank:true
   validates :password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}


end
