if @product.present?
	json.status "success"
	json.code 200
	json.message "Products updated successfully"
	json.data do
		json.partial! "/api/v1/products/common", product: @product
	end
else
	json.status "error"
	json.code 204
	json.message @product.errors.full_messages
	json.data []
end

