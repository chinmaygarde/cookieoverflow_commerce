Factory.define :bid_item do |b|
  b.title "iPhone 4G"
  b.body  "The coolest phone ever"
  b.user { |u| u.association(:user) }
end

Factory.define :user do |u|
  u.email     "anonymous@example.com"
  u.password  "secret"
end