namespace :setup do 

  desc 'do all the setup'
  task :do_all => :environment do
    Rake::Task['players:do_all'].invoke
    Rake::Task['tournaments:do_all'].invoke

    Rake::Task['setup:create_user'].invoke
    Rake::Task['setup:create_pick'].invoke
  end

  desc 'create a new user'
  task :create_user => :environment do
    user = User.find_or_create_by(
      name: 'Paul Dornfeld',
      email: 'pdornfel@gmail.com',
      phone_number: '617-504-8901'
    )
    puts "created user - #{user.name}"
  end

  desc 'create a pick'
  task :create_pick => :environment do
    user = User.first
    player = Player.find_by(world_rank: 1)
    tournament = Tournament.first
    Pick.destroy_all
    pick = Pick.create(user: user, player: player, tournament: tournament)
    puts "created a new pick - #{pick.user.name}, #{pick.player.first_name} #{pick.player.last_name}, #{pick.tournament.event_name}"
  end


end