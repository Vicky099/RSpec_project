require 'rails_helper'

RSpec.describe Product, type: :model do
	describe 'Validations' do
		it {should validate_presence_of(:name)}
		it {should validate_presence_of(:cost)}
		it {should validate_numericality_of(:cost)}
		it {should validate_presence_of(:mfg_date)}
		it {should validate_presence_of(:expiry_date)}
		it {should validate_presence_of(:made_in)}
	end

	# For validation, we can also call various shoulda-matchers methods such as, validate_numericality_of, validate_uniqueness_of, allow_value, allow_blank, ensure_inclusion_of, ensure_length_of, validate_acceptance_of (for boolean values), validate_confirmation_of (matches two values), etc.

	# context 'associations' do
	# 	it { should belong_to(:industry) }
	# 	it { should have_many(:sub_sectors).dependent(:restrict_with_exception) }
	# end

	

end
