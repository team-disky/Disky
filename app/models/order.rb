class Order < ApplicationRecord
	belongs_to :customer
	has_many :purchased_products

	enum status: {受付: 0,商品準備中: 1,出荷済み: 2}
	enum payment_method: {クレジットカード: 0,銀行振込: 1,代引き: 2}

end
