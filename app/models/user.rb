class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
   validates :name,:birth,:chinese_first,:chinese_last,:kana_first,:kana_last, presence: true

   validates :kana_first,:kana_last,format: {with: /\A[ァ-ヶー－]+\z/, message: "Input full-width katakana characters"},allow_blank:true
   validates :chinese_first,:chinese_last,format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]/, message: "Input full-width characters"},allow_blank:true
  
   VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
   validates :password, format: {with: VALID_PASSWORD_REGEX, message: "is invalid. Include both letters and numbers",}


end
