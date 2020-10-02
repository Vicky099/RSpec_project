require 'rails_helper'

class ProductsControllerTest < ActionController::TestCase
	tests Api::V1::ProductsController

end

RSpec.describe "ProductsControllerTest", type: :controller do
	
	describe "index" do
		before do 
			get :index, format: :json
		end
		it {except(response).to be_success}
	end
end
