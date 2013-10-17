class CreatePromotions < ActiveRecord::Migration
  def up
    create_table :promotions do |t|
      t.string :name
      t.datetime :starts_at
      t.datetime :ends_at
      t.timestamps
    end
  end
end
