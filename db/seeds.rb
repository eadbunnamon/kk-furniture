# encoding: UTF-8

admin = FactoryGirl.create(:user, email: 'admin@example.com', password: 'password', password_confirmation: 'password')

active_admin = AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

[
	{ name: "ห้องนั่งเล่น" },
	{ name: "ห้องรับประทานอาหาร" },
	{ name: "ห้องนอน" },
	{ name: "ห้องทำงาน" },
	{ name: "ห้องเก็บของ" },
].each do |room|
	Room.create(name: room[:name])
end

[
	{ name: "อุปกรณ์เพิ่มเติม" },
	{ name: "โซฟา" },
	{ name: "เก้าอี้" },
	{ name: "เตียง & ที่นอน" },
	{ name: "ตู้" },
	{ name: "โต๊ะ" }
	
].each do |category|
	Category.create(name: category[:name])
end