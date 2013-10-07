# encoding: UTF-8
ActiveAdmin.register Product do
  # form :partial => "form"
  config.per_page = 25

  index do                            
    column :name
    column :price do |product|
      div :class => "price" do
        number_to_currency product.price, :unit => "฿"
      end
    end               
    column :detail              
    column :best_seller              
    column :category_id       
    default_actions                   
  end

  form :partial => "form"
  # form :html => { :enctype => "multipart/form-data" } do |f|
  #   f.inputs do
  #     f.input :name
  #     f.input :price
  #     f.input :best_seller
  #     f.input :detail
  #     f.input :description
  #     f.input :category_id, label: 'Category', as: :select, prompt: "เลือก", collection: Category.all.map{|c| ["#{c.name}", c.id]}
  #     f.actions
  #   end
  # end

  controller do
    def create
      product = Product.new(params[:product])
      product.rooms = Room.find(params[:rooms])
      if product.save
        redirect_to admin_product_path(product)
      else
        render('new')
      end
    end

    def update
      product = Product.find(params[:id])
      product.assign_attributes(params[:product])
      product.rooms = Room.find(params[:rooms])
      if product.save
        redirect_to admin_product_path(product)
      else
        render('edit')
      end
    end
  end


  show do |product|
    attributes_table do
      row :name
      row :price do |product|
        div :class => "price" do
          number_to_currency product.price, :unit => "฿"
        end
      end               
      row :detail              
      row :best_seller              
      row :category do |product|
        product.category.present? ? product.category.name : "อื่น ๆ"
      end                
      row :rooms do |product|
        product.rooms.map {|room| link_to room.name, admin_room_path(room) }.join(', ').html_safe
      end  
    end
  end

end
