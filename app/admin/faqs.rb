ActiveAdmin.register Faq do
  config.per_page = 10

  index do                            
    column :question                     
    column :answer              
    default_actions                   
  end 
end
