require "rake/testtask"


Rake::TestTask.new(:test => "db:test:prepare") do |t|
	t.libs << "test"
	t.pattern = "test/**/*_test.rb"
end

task :defalt => :test


# task :test_units do

#   RAILS_ENV = 'test' # Force the environment to test

#   puts "Recreate the test database"
#   Rake::Task['db:test:prepare'].invoke

#   puts "Seed the database with fixtures"
#   Rake::Task['db:fixtures:load'].invoke

#   # puts "Executing Unit Tests"
#   # Rake::Task['test:models'].prerequisites.clear 
#   # Rake::Task['test:models'].invoke
# end