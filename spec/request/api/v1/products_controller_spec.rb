require 'rails_helper'

class ProductsControllerTest < ActionController::TestCase
	tests Api::V1::ProductsController
end

RSpec.describe "ProductsControllerTest", type: :request do
	
	# Initialize data
	let!(:products) { create_list(:product , 10) }
	let(:product_id) { products.first.id }

	
	describe "GET /api/v1/products" do
		before { get '/api/v1/products', as: :json }

		it 'returns products' do
			expect(json).not_to be_empty
			expect(json['data'].size).to eq(10)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end
end
