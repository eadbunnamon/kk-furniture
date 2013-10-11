//= require active_admin/base
//= require jquery.validate

ActiveAdmin = {
  uploadImage: function(){
    
  },
  init: function(){
    $("form").removeAttr("novalidate");
    $("form").validate();

    $("#upload").click(ActiveAdmin.uploadImage);
  }
};

$(ActiveAdmin.init);