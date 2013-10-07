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

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :best_seller
      f.input :detail
      f.input :description
      f.input :category_id, label: 'Category', as: :select, prompt: "เลือก", collection: Category.all.map{|c| ["#{c.name}", c.id]}
      f.actions
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
      row :category_id    
    end
  end

end
