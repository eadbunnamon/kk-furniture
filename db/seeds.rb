#administrator

admin = FactoryGirl.create(:user, email: 'admin@example.com', password: 'password', password_confirmation: 'password')

active_admin = AdminUser.create(:user, email: 'admin@example.com', password: 'password', password_confirmation: 'password')