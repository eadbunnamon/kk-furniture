class RemoveRoomIdFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :room_id
  end
end
