class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :name,:chinese_first,:chinese_last,:kana_first,:kana_last,:birth, presence: true

   validates :kana_first,:kana_last,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
   validates :chinese_first,:chinese_last,format: { with: /\A[一-龥]+\z/}
   


end
