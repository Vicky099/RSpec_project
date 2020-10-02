class Api::V1::ProductsController < Api::V1::BaseController

	before_action :find_product, only: [:show, :edit, :update, :destroy]
	
	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.save
	end

	def show
		
	end

	def edit
	
	end

	def update
		@product.update(product_params)
	end

	def destroy
		if @product.destroy
			render json: {status: "success", code: 200, message: ['Product deleted successfully'], data: [] }, status: :ok
		end
	end

	private
	def find_product
		@product = Product.find_by_id(params[:id])
		unless @product.present?
			render json: {status: 'error', code: 404, message: ['Product not found'], data: []}, status: :unprocessable_entity and return
		end
	end

	def product_params
		params.require(:product).permit(:name, :description, :cost, :expiry_date, :made_in, :mfg_date)
	end
end
