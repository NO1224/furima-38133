class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
         
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  VALID_NAMEKANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
 
  validates :password, format: { allow_blank: true,
    with: VALID_PASSWORD_REGEX,
    message: 'include both letters and numbers'}
  with_options presence: true do
    validates :nickname
    validates :last_name, format: { allow_blank: true,
                                    with: VALID_NAME_REGEX, 
                                    message: 'full-width kanji, hiragana and katakana characters'}
    validates :first_name, format: { allow_blank: true,
                                     with: VALID_NAME_REGEX,
                                     message: 'full-width kanji, hiragana and katakana characters'}
    validates :last_name_kana, format: { allow_blank: true,
                                         with: VALID_NAMEKANA_REGEX,
                                         message: 'full-width katakana characters'}
    validates :first_name_kana, format: { allow_blank: true, 
                                          with: VALID_NAMEKANA_REGEX, 
                                          message: 'full-width katakana characters'}
    validates :birthday
  end
end
