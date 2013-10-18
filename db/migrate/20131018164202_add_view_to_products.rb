class AddViewToProducts < ActiveRecord::Migration
  def change
  	change_table :products do |t|
  		t.integer	:view, default: 0
  	end
  end
end
