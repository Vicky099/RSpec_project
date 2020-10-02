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


	describe "GET /api/v1/products/new" do
		before { get '/api/v1/products/new', as: :json }

		it 'returns Initialize products object' do
			expect(json).not_to be_empty
			expect(json['data']['id']).to eq(nil)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end


	describe "POST /api/v1/products" do
		
		let(:valid_attributes) { { name: 'product name', description: 'product description', cost: 12345, mfg_date: '2020-10-02 17:47:36 +0530', expiry_date: '2020-10-02 17:47:36 +0530', made_in: 'INDIA' } }

		context 'when the request is valid' do

			before { post '/api/v1/products', params: valid_attributes,  as: :json }
			
			it 'creates a product' do
				expect(json['data']['name']).to eq('product name')
				expect(json['data']['description']).to eq('product description')
				expect(json['data']['cost']).to eq(12345)
				expect(json['data']['made_in']).to eq('INDIA')
			end

			it 'returns status code 201' do
				expect(json['code']).to eq(201)
			end

		end

		let(:invalid_attributes) { { name: '', description: 'product description', cost: nil, mfg_date: '2020-10-02 17:47:36 +0530', expiry_date: '2020-10-02 17:47:36 +0530', made_in: '' } }

		context 'when the request in invalid' do
			before { post '/api/v1/products', params: invalid_attributes,  as: :json }
		
			it 'returns status code 422' do
				expect(json['code']).to eq(422)
			end

			it 'returns a validation failure message' do
				expect(json['message']).to include("Name can't be blank", "Cost can't be blank", "Cost is not a number", "Made in can't be blank")
			end
		end
	end

	describe "GET /api/v1/products/:id" do
		before{ get "/api/v1/products/#{product_id}", as: :json}

		context "when the record exists" do
			it "return products record" do
				expect(json).not_to be_empty
				expect(json['data']['id']).to eq(product_id)
			end

			it "returns status code 200" do
				expect(json['code']).to eq(200)
			end
		end

		context "when the record doen not exists" do
			let(:product_id) { 100 }


			it "returns status code 404" do
				expect(json['code']).to eq(404)
			end

			it "returns a not found message" do
				expect(json['message']).to include("Product not found")
			end
		end
	end

	describe "GET /api/v1/products/:id/edit" do
		before{ get "/api/v1/products/#{product_id}/edit", as: :json}

		context "when the record exists" do
			it "return products record" do
				expect(json).not_to be_empty
				expect(json['data']['id']).to eq(product_id)
			end

			it "returns status code 200" do
				expect(json['code']).to eq(200)
			end
		end

		context "when the record doen not exists" do
			let(:product_id) { 100 }


			it "returns status code 404" do
				expect(json['code']).to eq(404)
			end

			it "returns a not found message" do
				expect(json['message']).to include("Product not found")
			end
		end
	end 


	describe "PUT /api/v1/products/:id" do

		let(:valid_attributes) {{name: 'Vikram', description: 'Vikram Panmand', cost: 300, mfg_date: "2020-10-02", expiry_date: "2020-10-02", made_in: "INDIA"}}

		context "when the record exist for update" do
			before { put "/api/v1/products/#{product_id}", params: valid_attributes, as: :json}

			it "update product record" do
				expect(json).not_to be_empty
				expect(json['data']['name']).to eq('Vikram')
			end

			it "return status code 200" do
				expect(json['code']).to eq(200)
			end
		end
	end

	describe "DELETE /api/v1/products/:id" do

		before { delete "/api/v1/products/#{product_id}", as: :json }
		
		it "returns status code 200" do
			expect(json['code']).to eq(200)
		end
	end

end
