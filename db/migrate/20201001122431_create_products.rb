class CreateProducts < ActiveRecord::Migration[6.0]
  	def change
    	create_table :products do |t|
    		t.string :name
    		t.string :description
    		t.integer :cost
    		t.date :expiry_date
    		t.string :made_in
    		t.date :mfg_date
      		t.timestamps
    	end
  	end
end
