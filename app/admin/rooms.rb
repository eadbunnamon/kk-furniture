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
  
  filter :name
end
