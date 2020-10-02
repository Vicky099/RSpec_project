require 'rails_helper'

class ProductsControllerTest < ActionController::TestCase
	tests Api::V1::ProductsController
end

RSpec.describe "ProductsControllerTest", type: :request do
	
	# Initialize data
	let!(:products) { create_list(:product , 10) }
	let(:product_id) { products.first.id }

	
	describe "GET /products" do
		before { get '/products.json' }

		it 'returns articles' do
      		# Note `json` is a custom helper to parse JSON responses
      		expect(json).not_to be_empty
      		expect(json.size).to eq(10)
    	end

    	it 'returns status code 200' do
      		expect(response).to have_http_status(200)
    	end
	end
end
