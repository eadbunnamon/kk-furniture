class AddCodeToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.string :code
    end
  end
end
