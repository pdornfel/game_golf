namespace :daily do 
  
  desc "Tasks that need to be run daily"
  task :do_all => :environment do
    Rake::Task['players:populate_rankings'].invoke
    Rake::Task['tournaments:update_leaderboards'].invoke
    Rake::Task['earnings:calculate'].invoke
  end
end