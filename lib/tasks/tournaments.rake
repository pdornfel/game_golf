namespace :tournaments do 

  desc 'Do All'
  task :do_all => :environment do
    Rake::Task['tournaments:populate_tournaments'].invoke
    Rake::Task['tournaments:update_leaderboards'].invoke
  end

  desc 'populate tournaments'
  task :populate_tournaments => :environment do
    tournaments = Sportsdata.golf.tournament_schedule
    sleep(1)

    tournaments.each_with_index do |tournament, index|

      unless tournament[:course_info].kind_of?(Array)
        course_options = {}
        course_options[:uid] = tournament[:course_info]["id"]
        course_options[:course_name] = tournament[:course_info]["name"]
        course_options[:city] = tournament[:city]
        course_options[:state] = tournament[:state]
        course_options[:country] = tournament[:country]
        course_options[:description] = tournament[:course_info]["description"]
        course_options[:par] = tournament[:course_info]["par"]
        course_options[:yardage] = tournament[:course_info]["yardage"]
        course = Course.find_or_create_by(course_options)

        tournament[:course_info]["holes"]["hole"].each do |hole|
          hole_options = {}
          hole_options[:course_id] = course.id
          hole_options[:hole_number] = hole["number"]
          hole_options[:hole_yardage] = hole["yardage"]
          hole_options[:par] = hole["par"]
          Hole.find_or_create_by(hole_options)
        end

        tournament_options = {}
        tournament_options[:uid] = tournament[:event_id]
        tournament_options[:event_name] = tournament[:event_name]
        tournament_options[:venue_name] = tournament[:venue_name]
        tournament_options[:city] = tournament[:city]
        tournament_options[:state] = tournament[:state]
        tournament_options[:country] = tournament[:country]
        tournament_options[:purse] = tournament[:purse]
        tournament_options[:tournament_start] = tournament[:event_start_date]
        tournament_options[:tournament_end] = tournament[:event_end_date]
        tournament_options[:course_id] = course.id
        tour = Tournament.find_or_create_by(tournament_options)
        puts tour.event_name
      
      end
    end
  end

  desc 'update leaderboards'
  task :update_leaderboards => :environment do
    tournaments = Tournament.all
    tournaments.each do |tournament|
      uid = tournament[:uid]
      options = {uid: uid}
      response = Sportsdata.golf.tournament_leaderboard(options)
      sleep(1)

      if response['tournament']['status'] == 'closed'
      
        leaderboard = response['tournament']['leaderboard'].try(:[], 'player')

        if leaderboard
          leaderboard.each do |player|
            player_obj = Player.find_by(uid: player['id'])
            options = {
              player: player_obj,
              tournament: tournament,
              position: player['position'],
              money: player['money'],
              score: player['score'],
              strokes: player['strokes']
            }
            result = Result.find_or_create_by(options)
            puts "#{result.tournament.event_name} - #{result.player.first_name} #{result.player.last_name} - #{result.position}"
          end
        end
      end
    end
  end
end

