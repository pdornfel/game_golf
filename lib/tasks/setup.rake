namespace :setup do 

  desc 'do all the setup'
  task :do_all => :environment do
    Rake::Task['players:do_all'].invoke
    Rake::Task['setup:create_user'].invoke
    Rake::Task['setup:create_pick'].invoke
  end

  desc 'create a new user'
  task :create_user => :environment do
    User.destroy_all
    User.create(
      name: 'Paul Dornfeld',
      email: 'pdornfel@gmail.com',
      phone_number: '617-504-8901'
    )
  end

  desc 'create a pick'
  task :create_pick => :environment do
    Pick.destroy_all
    paul = User.first
    rory = Player.find_by(world_rank: 1)
    Pick.create(user: paul, player: rory)
  end


end