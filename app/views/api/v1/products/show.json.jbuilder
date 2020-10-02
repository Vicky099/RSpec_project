if @product.present?
	json.status "success"
	json.code 200
	json.message "Products details"
	json.data do
		json.partial! "/api/v1/products/common", product: @product
	end
end

