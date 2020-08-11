class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys

  with_options presence: true do
    VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i.freeze
    CAPITAL_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    CAPITAL_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    VALID_PASSWORD_MIX_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates :nickname
    validates :family_name, format: { with: CAPITAL_NAME_REGEX, message: 'は全角で入力してください。' }
    validates :first_name, format: { with: CAPITAL_NAME_REGEX, message: 'は全角で入力してください。' }
    validates :family_name_kana, format: { with: CAPITAL_NAME_KANA_REGEX, message: 'は全角カタカナで入力して下さい。' }
    validates :first_name_kana, format: { with: CAPITAL_NAME_KANA_REGEX, message: 'は全角カタカナで入力して下さい。' }
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数で入力してください。' }
    validates :password, format: { with: VALID_PASSWORD_MIX_REGEX, message: 'は半角英数混合で入力してください。' }
  end
end
