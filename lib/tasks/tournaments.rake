namespace :tournaments do 

  desc 'populate tournaments'
  task :do_all => :environment do
    tournaments = Sportsdata.golf.tournament_schedule

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
end