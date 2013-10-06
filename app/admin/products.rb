# encoding: UTF-8
ActiveAdmin.register Product do
  # form :partial => "form"
  config.per_page = 25

  index do                            
    column :name                     
    column :price              
    column :detail              
    column :best_seller              
    column :category_id
    column :room_id              
    default_actions                   
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :best_seller
      f.input :detail
      f.input :description
      f.input :category_id, label: 'Category', as: :select, prompt: "เลือก", collection: Category.all.map{|c| ["#{c.name}", c.id]}
      f.input :room_id, label: 'Room', as: :select, prompt: "เลือก", collection: Room.all.map{|r| ["#{r.name}", r.id]}
    end
  end

end
