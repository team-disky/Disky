class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :registration_addresses
  has_many :cart_products

  accepts_nested_attributes_for :registration_addresses

  def full_name
  	last_name + first_name
  end

end