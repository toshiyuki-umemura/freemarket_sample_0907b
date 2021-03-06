class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_one :personal_information, dependent: :destroy
  has_one :guide, dependent: :destroy
  has_one :credit_card, dependent: :destroy
  has_one :dealed_comment, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :points, dependent: :destroy
  has_many :notices, dependent: :destroy
  has_many :to_does, dependent: :destroy
  has_many :balances, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :exhibits, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :evaluations, dependent: :destroy

  # step1入力項目
  validates :nickname,                presence: true, length: {maximum: 20}
  validates :email,                   presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password,                presence: true, length: {minimum: 7, maximum: 128}, on: :create
  validates :password,                presence: true, length: {minimum: 7, maximum: 128}, on: :update, allow_blank: true
  validates :password_confirmation,   presence: true, length: {minimum: 7, maximum: 128}, on: :create
  validates :password_confirmation,   presence: true, length: {minimum: 7, maximum: 128}, on: :update, allow_blank: true
  validates :last_name,               presence: true
  validates :first_name,              presence: true
  validates :last_name_kana,          presence: true
  validates :first_name_kana,         presence: true
  validates :birth_year,              presence: true
  validates :birth_month,             presence: true
  validates :birth_day,               presence: true

  # step2入力項目
  validates :phone_number,            presence: true, uniqueness: true, length: {minimum: 10, maximum: 11}, format: { with: /\A\d{10,11}\z/ }, on: :validates_step2

  def get_full_name
    self.last_name + ' ' + self.first_name
  end

  has_many :sns_credentials, dependent: :destroy

  # protected
  def self.find_for_oauth(auth)
    oauth_user = SnsCredential.find_for_oauth_user(auth)
    
    if oauth_user
      user = oauth_user.user
    else
      if auth.info.email
        user = User.new(email: auth.info.email, password: Devise.friendly_token[0, 20])
      else
        user = User.new(email: "#{auth.provider}_#{auth.uid}@example.com", password: Devise.friendly_token[0, 20])
      end
    end
    user
  end
end
