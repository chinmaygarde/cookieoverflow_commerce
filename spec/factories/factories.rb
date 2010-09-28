Factory.define :bid_item do |b|
  b.title "iPhone 4G"
  b.body  "The coolest phone ever"
end

Factory.define :user do |u|
  u.email     "anonymous@example.com"
  u.password  "secret"
end