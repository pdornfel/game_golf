namespace :players do

  desc "populate players table"
  task :seed => :environment do
    Player.destroy_all
    players = Sportsdata.golf.players
    players.each_with_index do |player, index|
      options = {}
      options[:uid] = player.id
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

end