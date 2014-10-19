namespace :daily do 
  
  desc "Tasks that need to be run daily"
  task :do_all => :environment do
    Rake::Task['earnings:calculate'].invoke
    Rake::Task['tournaments:update_leaderboards'].invoke
  end
end