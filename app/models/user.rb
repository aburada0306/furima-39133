class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :birth, :chinese_first, :chinese_last, :kana_first, :kana_last, presence: true

  validates :kana_first, :kana_last, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' },allow_blank: true
  validates :chinese_first, :chinese_last, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/, message: 'は全角のひらがな/カナ/漢字で入力してください' },allow_blank: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }

  has_many :items
  has_many :orders
end
