//= require active_admin/base
//= require jquery.validate

ActiveAdmin = {
  init: function(){
    $("form").removeAttr("novalidate");
    $("form").validate();
  }
};

$(ActiveAdmin.init);