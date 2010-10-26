Factory.define :bid_item do |b|
  b.title           "iPhone 4G"
  b.body            "The coolest phone ever"
  b.starting_price  0
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

Factory.define :tag do |t|
  t.title "tag"
  t.bid_items { |b| [b.association(:bid_item)] }
end

Factory.define :bid_item_comment do |c|
  c.body  "Cool post"
  c.user { |u| u.association(:user) }
  c.bid_item { |b| b.association(:bid_item) }
end