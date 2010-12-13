source :gemcutter

# Well, duh..
gem "rails",				"3.0.3"

# Authentication
gem "devise"

# Role Management
gem "cancan"

# Databases
gem "mysql"

# Background Jobs
gem "resque"

# Delayed and recurring jobs
gem "resque-scheduler"

# Full text search
gem "thinking-sphinx", :require => "thinking_sphinx"

# Attachments
gem "paperclip"

group :development, :test do
	# Database: Switch to mysql as soon as possible
	gem "sqlite3-ruby",				:require => "sqlite3"
	
	# RSpec
	gem "rspec"
	gem "rspec-rails"
	
	# Factory Replacement
	gem "factory_girl_rails"
	
	# Continuous Testing
	gem "ZenTest"
	
	# Test Coverage Reporting
	gem "rcov"
	
	# Rake Replacement
	gem "thor"
end
