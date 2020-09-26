class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  KANA_KANJI_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  KANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/

  validates_format_of :password ,with: PASSWORD_REGEX, message: 'は英語と数字の両方を含めてください。'

  with_options presence: true do
    validates :nickname
    validates :birth_date
    validates :first_name,format: { with: KANA_KANJI_REGEX, message: 'は全角で入力してください。' }
    validates :last_name,format: { with: KANA_KANJI_REGEX, message: 'は全角で入力してください。' }
    validates :first_name_kana, format: { with: KANA_REGEX, message: 'は全角カタカナで入力してください。' } 
    validates :last_name_kana, format: { with: KANA_REGEX, message: 'は全角カタカナで入力してください。' } 
  end

  has_many :items
  has_many :deals
end
