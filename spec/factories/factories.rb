Factory.define :bid_item do |b|
  b.title "iPhone 4G"
  b.body  "The coolest phone ever"
  b.user { |u| u.association(:user) }
end

Factory.define :user do |u|
  u.sequence :email do |n|
    "user#{n}@example.com"
  end
  u.password  "secret"
  u.roles { |u| [u.association(:role)] }
end

Factory.define :role do |r|
  r.title "buyer"
end