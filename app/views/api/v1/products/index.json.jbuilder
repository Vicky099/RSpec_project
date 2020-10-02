if @products.present?
	json.status "success"
	json.code 200
	json.message "Products details"
	json.data @products do |product|
	 	json.partial! "/api/v1/products/common", product: product
	end
else
	json.status "error"
	json.code 204
	json.message "You dont have products yet."
	json.data []
end

