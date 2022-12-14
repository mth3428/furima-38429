class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  with_options presence: true, format: { with: PASSWORD_REGEX }do
    validates :password
  end


  validates :nickname, presence: true
  validates :family_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  year_month_day = /\A\d{4}-\d{2}-\d{2}\z/
  validates :birthday, presence: true, format: { with: year_month_day }
  
end
