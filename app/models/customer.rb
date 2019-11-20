class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name,:first_name, :last_name_read, :first_name_read, :phone_number, :postal_code, :address,  presence: true
  has_many :orders
  has_many :registration_addresses
  has_many :cart_products

  #論理削除テスト
  def active_for_authentication?
	 super && self.active?
  end

  def fullname
    last_name + first_name
  end

end