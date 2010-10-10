Role.create(:title => "admin")
Role.create(:title => "buyer")
Role.create(:title => "seller")

u = User.create(:email => "admin@admin.com", :password => "password")
u.update_roles("admin")
