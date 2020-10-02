class Product < ApplicationRecord
	validates :name, presence: true
	validates :cost, presence: true, numericality: { only_integer: true }
	validates :mfg_date, presence: true
	validates :expiry_date, presence: true
	validates :made_in, presence: true

end
