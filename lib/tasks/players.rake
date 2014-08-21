namespace :players do

  desc "seed players table"
  task :seed_profiles => :environment do
    Player.destroy_all
    players = Sportsdata.golf.player_profiles
    players.each_with_index do |player, index|
      options = {}
      options[:uid] = player.uid
      options[:first_name] = player.first_name
      options[:last_name] = player.last_name
      options[:height] = player.height
      options[:weight] = player.weight
      options[:birthday] = player.birthday
      options[:country] = player.country
      options[:birth_place] = player.birth_place
      options[:turned_pro] = player.turned_pro
      options[:sports_data_updated_on] = player.updated
      Player.create(options)
      puts "#{player.first_name} #{player.last_name} - #{index + 1}"
    end
  end

  desc "populate rankings in players table"
  task :populate_rankings => :environment do
    stats = Sportsdata.golf.seasonal_stats
    stats.each do |data|
      player = Player.find_by(uid: data.player_uid)
      options = {}
      options[:events_played] = data.events_played
      options[:first_place] = data.first_place
      options[:second_place] = data.second_place
      options[:third_place] = data.third_place
      options[:top_10] = data.top_10
      options[:top_25] = data.top_25
      options[:withdrawals] = data.withdrawals
      options[:earnings] = data.earnings
      options[:earnings_rank] = data.earnings_rank
      options[:drive_avg] = data.drive_avg
      options[:drive_acc] = data.drive_acc
      options[:gir_pct] = data.gir_pct
      unless data.world_rank == 0
        options[:world_rank] = data.world_rank
      end
      options[:scoring_avg] = data.scoring_avg

      player.update(options)
      puts "#{player.first_name} #{player.last_name} updated with world rank of => #{data.world_rank}"
    end
  end

  desc "populate players and seed rankings"
  task :do_all => :environment do
    Rake::Task['players:seed_profiles'].invoke
    Rake::Task['players:populate_rankings'].invoke
  end
end