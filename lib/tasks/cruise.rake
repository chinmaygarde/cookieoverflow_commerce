require 'rubygems'
require 'rake'
require 'fileutils'
require "bundler"

desc "Task for cruise Control"
task :cruise do
  RAILS_ENV = ENV['RAILS_ENV'] = 'test'

#  sh "bundle install"
  `bundle install`
  Bundler.setup(:default, :test)

  #Step 1 - Drop and recreate your database
  CruiseControl::invoke_rake_task 'db:test:purge'
  #necessary to reconnect, as purge drops database (and w mysql the conn)
  CruiseControl::reconnect
  CruiseControl::invoke_rake_task 'db:schema:load'
#  CruiseControl::invoke_rake_task 'test'



  #Step 2 - Rcov
  # source: http://deadprogrammersociety.blogspot.com/2007/06/cruisecontrolrb-and-rcov-are-so-good.html
  out = ENV['CC_BUILD_ARTIFACTS']
  mkdir_p out unless File.directory? out if out

  ENV['SHOW_ONLY'] = 'models,lib,helpers'
  Rake::Task["test:units:rcov"].invoke
  mv 'coverage/units', "#{out}/unit test coverage" if out

  ENV['SHOW_ONLY'] = 'controllers'
  Rake::Task["test:functionals:rcov"].invoke
  mv 'coverage/functionals', "#{out}/functional test coverage" if out

  Rake::Task["test:integration"].invoke

end
