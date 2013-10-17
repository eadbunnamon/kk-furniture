class AddFileToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :file, :string
  end
end
