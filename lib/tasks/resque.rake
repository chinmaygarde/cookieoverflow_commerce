task "resque:setup" => :environment
require 'resque/tasks'
require 'resque_scheduler/tasks'
