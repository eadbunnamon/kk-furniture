# encoding: UTF-8
ActiveAdmin.register Promotion do
  form :partial => "form"
  config.per_page = 25

  action_item :only => :show do
    link_to('New Promotion', new_admin_promotion_path)
  end

  form :html => { :enctype => "multipart/form-data" } do |f|  
    f.inputs "Promotion" do
      f.input :name
      f.input :file, :as => :file
      f.input :starts_at, :as => :datepicker
      f.input :ends_at, :as => :datepicker
    end
    f.buttons
  end

  index do                            
    column :name
    column :file do |promotion|
      (link_to "Download", promotion.file.url, target: "_blank").html_safe
    end               
    default_actions                   
  end

  show do |promotion|
    attributes_table do
      row :name
      row :price do |promotion|
        (link_to "Download", promotion.file.url, target: "_blank").html_safe
      end
    end
  end

  # member_action :upload_photo, :method => :put do
  #   product = Product.find(params[:product_id])
  #   photo = Photo.new
  #   photo.photo = params[:photo][:photo]
  #   photo.product = product
  #   photo.save

  #   redirect_to admin_product_path(product, anchor: 'photo_panel')
  # end

  # member_action :delete_photo, :method => :delete do
  #   photo = Photo.find(params[:photo_id])
  #   product = photo.product
  #   photo.destroy

  #   redirect_to admin_product_path(product, anchor: 'photo_panel')
  # end
end
