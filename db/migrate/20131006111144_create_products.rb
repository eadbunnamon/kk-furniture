class CreateProducts < ActiveRecord::Migration
  def change
  	create_table :products do |t|
  		t.string 	:name	
  		t.integer	:price
  		t.text		:detail	
  		t.text		:description
  		t.boolean	:best_seller, default: false
  		t.integer	:category_id
  		t.integer	:room_id
  		t.timestamps
  	end
  end
end
