namespace :setup do 

  desc 'do all the setup'
  task :do_all => :environment do
    Rake::Task['players:do_all'].invoke
    Rake::Task['tournaments:do_all'].invoke

    Rake::Task['setup:create_user'].invoke
    Rake::Task['setup:create_pick'].invoke

    Rake::Task['earnings:calculate'].invoke
  end


  desc 'create a new user'
  task :create_user => :environment do
    user = FactoryGirl.build(:user)
    unless User.find_by(email: user.email)
      user.save
      puts "created user - #{user.full_name}"
    end
  end

  desc 'create a pick'
  task :create_pick => :environment do
    user = User.first
    player = Player.find_by(world_rank: 1)
    tournament = Tournament.first
    pick = Pick.find_or_create_by(user: user, player: player, tournament: tournament)
    puts "created a new pick - #{pick.user.full_name}, #{pick.player.last_name}, #{pick.tournament.event_name}"
  end


end