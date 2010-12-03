class OASP < Thor
  include Thor::Actions
  namespace :env
  
  desc "check", "Checks to see if your environment is properly configured to run this Rails application"
  def check
    
    go = true
    
    # Check ruby version
    say "Checking Ruby version", :yellow
    ruby = run('ruby -v')
    if ruby =~ /1.8.7/
      say "You have the recommended version of ruby", :green
    else
      say "You don't have the recommended version of ruby (1.8.7)", :red
      go = false
    end  
    
    # Check database.yml
    say "Checking for database.yml", :yellow
    if File.exist?("config/database.yml")
      say "database.yml present", :green
    else
      say "database.yml absent", :red
      if yes?("Would you like me to copy over an example database.yml file for you (y/n)? ")
        run('cp config/database.yml.example config/database.yml')
        say('I copied over the file. You may have to modify it first though.', :green)
        say('REMEMBER: Sphinx can\'t reindex contents of an sqlite3 database.', :green)
      else
        go = false
      end
    end
    
    # Check redis
    say "Checking for Redis server", :yellow
    if run('which redis-server') == ""
      say "No redis server found", :red
      go = false
    else
      say "Redis server found", :green
    end
    
    # Check Bundler Run
    say "Checking if dependencies are resolved", :yellow
    bundler = run('bundle check')
    if bundler =~ /dependencies are satisfied/
      say "Bundler dependencies are satisfied", :green
    else
      say "Bundler dependencies are not satisfied", :red
      go = false
    end
    
    # Check Sphinx installation
    say "Looking for Sphinx", :yellow
    sphinx = run('which searchd')
    if sphinx == ""
      say "No installation of sphinx found on your system", :red
      go = false
    else
      say "Sphinx was found on your system. Don't forget to reindex though.", :green
    end
    
    if go
      say '-----------------------------------------', :green
      say '-------------All Checks Passed-----------', :green
      say '-----------------------------------------', :green
      say 'You are ready to start the application. Please run the following commands: \n', :green
      say 'rake db:migrate', :yellow
      say 'rake db:seed (For admin account | email: admin@admin.com | password: password)'
      say 'redis-server', :yellow
      say 'QUEUE=* COUNT=5 rake environment resque:workers', :yellow
      say 'rake resque:scheduler', :yellow
      say 'rake ts:rebuild', :yellow
      say 'rake ts:start', :yellow
      say '(OPTIONAL) resque-web -p 3001 config/initializers/load_resque.rb', :yellow
    else
      say '-----------------------------------------', :red
      say '-------------Some Checks Failed----------', :red
      say '-----------------------------------------', :red
    end
  end
end