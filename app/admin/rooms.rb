ActiveAdmin.register Room do
  config.per_page = 25

  index do                            
    column :name                     
    column :description              
    default_actions                   
  end 
  
  filter :name
end
