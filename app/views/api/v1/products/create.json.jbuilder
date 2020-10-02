if @product.errors.empty?
	json.status "success"
	json.code 201
	json.message "Products created successfully"
	json.data do
		json.partial! "/api/v1/products/common", product: @product
	end
else
	json.status "error"
	json.code 422
	json.message @product.errors.full_messages
	json.data []
end

