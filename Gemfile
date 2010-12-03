source :gemcutter

gem "bundler"

# Well, duh..
gem "rails",				"2.3.8"

# Authentication
gem "devise",				"1.0.8"

# Role Management
gem "cancan",       		"1.4.0"

# Databases
gem "mysql",				"2.8.1"

# Background Jobs
gem "resque", 				"1.10.0"

# Delayed and recurring jobs
gem "resque-scheduler", 	"1.9.6"

# Full text search
gem "thinking-sphinx",		"1.3.11",	:require => "thinking_sphinx"

# Attachments
gem "paperclip", 			"2.3.4"

group :development, :test do
	# Database: Switch to mysql as soon as possible
	gem "sqlite3-ruby",				:require => "sqlite3"
	
	# RSpec
	gem "rspec",			"1.3.0"
	gem "rspec-rails",		"1.3.2"
	
	# Factory Replacement
	gem "factory_girl",		"1.3.2"
	
	# Continuous Testing
	gem "ZenTest",			"4.4.0"
	
	# Test Coverage Reporting
	gem "rcov",				"0.9.9"
	
	# Rake Replacement
	gem "thor",       "0.14.2"
end
