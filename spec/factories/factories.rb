Factory.define :bid_item do |f|
  f.title           "iPhone 4G"
  f.body            "The coolest phone ever"
  f.starting_price  0
  f.end_time        10.days.from_now
  f.next_bid_delta  20
  f.user { |u| u.association(:user) }
end

Factory.define :user do |f|
  f.sequence :email do |n|
    "user#{n}@example.com"
  end
  f.password  "secret"
  f.roles { |u| [u.association(:role)] }
end

Factory.define :role do |f|
  f.title "buyer"
end

Factory.define :tag do |f|
  f.title "tag"
  f.bid_items { |b| [b.association(:bid_item)] }
end

Factory.define :bid_item_comment do |f|
  f.body  "Cool post"
  f.user { |u| u.association(:user) }
  f.bid_item { |b| b.association(:bid_item) }
end

Factory.define :bid do |f|
  f.bid_amount    100
  f.bid_item      { |b| b.association(:bid_item) }
end

Factory.define :message do |f|
  f.unread        true
  f.from_user     { |u| u.association(:user) }
  f.to_user       { |u| u.association(:user) }
  f.message       "Foo"
end

Factory.define :auto_inc_request do |f|
  f.user          { |u| u.association(:user) }
  f.bid_item      { |u| u.association(:bid_item) }
  f.maximum_amount 100
end