require "yaml"

Role.create(:title => "admin")
Role.create(:title => "buyer")
Role.create(:title => "seller")

u = User.create(:email => "admin@admin.com", :password => "password")
u.update_roles("admin")


User.create(:email => "chinmaygarde@gmail.com", :password => "password")
User.create(:email => "maneeshmohan25@gmail.com", :password => "password")
User.create(:email => "apoorv.dutta88@gmail.com", :password => "password")
User.create(:email => "buzzy@buzzyand.me", :password => "password")
User.create(:email => "osprey@buzzyand.me", :password => "password")

random_comments = ["I like this product +1", "I hate this", "This is so random", "I know.", "The seed values should be better"]

def random_user
  User.find(rand(User.count) + 1)
end

b = u.bid_items.new(:title => "foo", :body => "Bar", :picture => File.new('/Users/Buzzy/Desktop/pic.jpg'), :end_time => 10.days.from_now, :next_bid_delta => 10, :starting_price => 10)

seeds = YAML.load_file('public/seeds/seed_values.yml')

seeds.each do |seed|
  item = random_user.bid_items.create(:title => seed["title"], :body => seed["body"], :picture => File.new("public/seeds/images/#{seed["picture"]}"), :end_time => (rand(25) + 10).days.from_now, :next_bid_delta => rand(50) + 1, :starting_price => rand(250) + 1)
  rand(25).times do
    random_user.bids.create(:bid_amount => item.minimum_bidding_price + rand(25), :bid_item => item)
  end
  rand(25).times do
    random_user.bid_item_comments.create(:body => random_comments[rand(random_comments.size)], :bid_item => item)
  end
end