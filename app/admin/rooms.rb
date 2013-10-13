ActiveAdmin.register Room do
  config.per_page = 25

  index do                            
    column :name                     
    column :description              
    default_actions                   
  end 

  show do |room|
    attributes_table do
      row :name
      row :description
    end

    render "categories"
  end

  member_action :delete_product, :method => :delete do
    room = Room.find(params[:room_id])
    product = room.products.find(params[:product_id])
pp product    
    room.products.delete(product)

    redirect_to admin_room_path(room)
  end
  
  filter :name
end
