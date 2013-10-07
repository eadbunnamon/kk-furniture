class CreateProductsRooms < ActiveRecord::Migration
  def change
    create_table :products_rooms do |t|
      t.belongs_to :product
      t.belongs_to :room
    end
  end
end
